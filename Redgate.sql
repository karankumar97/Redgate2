@@ -0,0 +1,245 @@
-- This script sets up object locking on the server. After you run it, you can lock and unlock objects in all databases on the server.
-- Before you run the script, close any other query windows that use the RedGate database.
-- Object locking should only be used for your development environments, and not your production server.
-- For more information about object locking, including a summary of what this script does, see http://www.red-gate.com/SOC7/object-locking

--//////////////////////////////////////
USE master

IF DB_ID(N'RedGate') IS NULL
    CREATE DATABASE RedGate

ALTER DATABASE RedGate SET RECOVERY SIMPLE
ALTER DATABASE RedGate SET ALLOW_SNAPSHOT_ISOLATION ON
ALTER DATABASE RedGate SET READ_COMMITTED_SNAPSHOT ON
GO

USE [RedGate]

--//////////////////////////////////////
--// SQLSourceControl Schema
--//////////////////////////////////////
IF (SCHEMA_ID('SQLSourceControl') IS NULL)
    EXEC sp_executesql N'CREATE SCHEMA [SQLSourceControl] AUTHORIZATION [dbo]'
GO


--//////////////////////////////////////
--// DDL Trigger
--//////////////////////////////////////
IF EXISTS (SELECT 1 FROM sys.server_triggers WHERE name = 'RG_SQLSourceControl_DDLTrigger')
    DROP TRIGGER RG_SQLSourceControl_DDLTrigger ON ALL SERVER
GO

CREATE TRIGGER [RG_SQLSourceControl_DDLTrigger]
    ON ALL SERVER
    WITH EXECUTE AS SELF
    FOR DDL_DATABASE_LEVEL_EVENTS
AS
    SET NOCOUNT ON
	SET ANSI_PADDING ON

    DECLARE @event_type NVARCHAR(MAX)
    SET @event_type = EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(MAX)')

    DECLARE @db_name NVARCHAR(MAX)
    SET @db_name = EVENTDATA().value('(/EVENT_INSTANCE/DatabaseName)[1]', 'NVARCHAR(MAX)')

    DECLARE @schema_name NVARCHAR(MAX)
    SET @schema_name = EVENTDATA().value('(/EVENT_INSTANCE/SchemaName)[1]', 'NVARCHAR(MAX)')

	DECLARE @object_type NVARCHAR(MAX)
    SET @object_type = upper(EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'NVARCHAR(MAX)'))

    DECLARE @lockable_object_name NVARCHAR(MAX)
	IF @object_type='COLUMN' OR @object_type='INDEX' OR @object_type='TRIGGER' OR @object_type='STATISTICS'
		SET @lockable_object_name = EVENTDATA().value('(/EVENT_INSTANCE/TargetObjectName)[1]', 'NVARCHAR(MAX)')
	ELSE
		SET @lockable_object_name = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(MAX)')

    DECLARE @login_name NVARCHAR(MAX)
    SET @login_name = EVENTDATA().value('(/EVENT_INSTANCE/LoginName)[1]', 'NVARCHAR(MAX)')

    IF OBJECT_ID('[RedGate].[SQLSourceControl].[LockedObjects]') IS NOT NULL
    BEGIN
        IF EXISTS (SELECT 1
                   FROM [RedGate].[SQLSourceControl].[LockedObjects] AS LO
                   WHERE LO.[db_name] = @db_name
                          AND LO.[schema_name] = @schema_name
                          AND LO.[object_name] = @lockable_object_name
                          AND LO.[login_name] != @login_name)
            BEGIN
                DECLARE @locker NVARCHAR(MAX)
                DECLARE @reason NVARCHAR(MAX)

                SELECT @locker = [login_name]
                FROM [RedGate].[SQLSourceControl].[LockedObjects] AS LO
                WHERE LO.[db_name] = @db_name
                        AND LO.[schema_name] = @schema_name
                        AND LO.[object_name] = @lockable_object_name

                DECLARE @NewLine AS CHAR(2) = CHAR(13) + CHAR(10)
                DECLARE @message NVARCHAR(MAX)

                SET @message = @NewLine
                                + 'SQL Source Control' + @NewLine
                                + @NewLine
                                + 'The object [' + @db_name + '].[' + @schema_name + '].[' + @lockable_object_name  + '] is locked by ' + @locker + @NewLine
                                + @NewLine
                                + 'To unlock the object, in SQL Source Control, go to the Object Locking tab.' + @NewLine
                                + @NewLine
                                + 'For more information, see http://www.red-gate.com/SOC7/object-locking' + @NewLine
                RAISERROR (@message, 16, 1)
                ROLLBACK
            END
    END
GO


--//////////////////////////////////////
--// Locked Objects Table
--//////////////////////////////////////
IF OBJECT_ID('[SQLSourceControl].[LockedObjects]') IS NOT NULL
    DROP TABLE [SQLSourceControl].[LockedObjects]
GO

CREATE TABLE [SQLSourceControl].[LockedObjects]
(
    [db_name] [NVARCHAR](128) NOT NULL,
    [schema_name] [NVARCHAR](128) NOT NULL,
    [object_name] [NVARCHAR](128) NOT NULL,
    [object_type] [NVARCHAR](128) NOT NULL,
    [login_name] [NVARCHAR](MAX) NOT NULL,
    [time_locked] [DATETIMEOFFSET] NOT NULL
)
GO

ALTER TABLE [SQLSourceControl].[LockedObjects] ADD CONSTRAINT [PK_LockedObjects] PRIMARY KEY CLUSTERED
(
    [db_name] ASC,
    [schema_name] ASC,
    [object_name] ASC
)
GO

--//////////////////////////////////////
--// LockObject Stored Procedure
--//////////////////////////////////////
IF OBJECT_ID('[SQLSourceControl].[LockObject]') IS NOT NULL
    DROP PROCEDURE [SQLSourceControl].[LockObject]
GO

CREATE PROCEDURE [SQLSourceControl].[LockObject]
    @db_name AS NVARCHAR(128),
    @schema_name AS NVARCHAR(128),
    @object_name AS NVARCHAR(128),
    @object_type AS NVARCHAR(128),
    @login_name AS NVARCHAR(MAX) = NULL
AS
    IF @login_name IS NULL
        SET @login_name = SUSER_SNAME()

    IF upper(@object_type)='COLUMN' OR upper(@object_type)='INDEX' OR upper(@object_type)='TRIGGER' OR upper(@object_type)='STATISTICS'
       BEGIN
            DECLARE @object_type_message NVARCHAR(MAX)
            SET @object_type_message = 'Cannot lock the object [' + @db_name + '].[' + @schema_name + '].[' + @object_name + '] '
                            + 'locking objects of type ' + @object_type + ' is not supported.'
            RAISERROR (@object_type_message, 16, 1)
       END

    IF EXISTS (SELECT 1 FROM [SQLSourceControl].[LockedObjects] AS LO
               WHERE LO.[db_name] = @db_name
               AND LO.[schema_name] = @schema_name
               AND LO.[object_name] = @object_name)
        BEGIN
            DECLARE @existing_locker NVARCHAR(MAX)
            SELECT @existing_locker = [login_name]
            FROM [SQLSourceControl].[LockedObjects] AS LO
            WHERE LO.[db_name] = @db_name
            AND LO.[schema_name] = @schema_name
            AND LO.[object_name] = @object_name

            IF @existing_locker != @login_name
                BEGIN
                    DECLARE @already_locked_message NVARCHAR(MAX)
                    SET @already_locked_message = 'Cannot lock the object [' + @db_name + '].[' + @schema_name + '].[' + @object_name + '] '
                                    + 'as it is already locked by ''' + @existing_locker
                    RAISERROR (@already_locked_message, 16, 1)
                END
        END
    ELSE
        BEGIN
            INSERT [SQLSourceControl].[LockedObjects]
                   ([db_name], [schema_name], [object_name], [object_type], [login_name], [time_locked])
            VALUES (@db_name, @schema_name, @object_name, @object_type, @login_name, SYSDATETIMEOFFSET())
        END
GO


--//////////////////////////////////////
--// UnlockObject Stored Procedure
--//////////////////////////////////////
IF OBJECT_ID('[SQLSourceControl].[UnlockObject]') IS NOT NULL
    DROP PROCEDURE [SQLSourceControl].[UnlockObject]
GO

CREATE PROCEDURE [SQLSourceControl].[UnlockObject]
    @db_name AS NVARCHAR(128),
    @schema_name AS NVARCHAR(128),
    @object_name AS NVARCHAR(128)
AS
    IF EXISTS (SELECT 1 FROM [SQLSourceControl].[LockedObjects] AS LO
               WHERE LO.[db_name] = @db_name
               AND LO.[schema_name] = @schema_name
               AND LO.[object_name] = @object_name)
        BEGIN
            DELETE FROM [SQLSourceControl].[LockedObjects]
            WHERE [db_name] = @db_name
            AND [schema_name] = @schema_name
            AND [object_name] = @object_name
        END
GO


--//////////////////////////////////////
--// GetLockedObjects Function
--//////////////////////////////////////
IF OBJECT_ID('[SQLSourceControl].[GetLockedObjects]') IS NOT NULL
    DROP FUNCTION [SQLSourceControl].[GetLockedObjects]
GO

CREATE FUNCTION [SQLSourceControl].[GetLockedObjects] ()
RETURNS TABLE
AS
RETURN
    (
        SELECT [db_name], [schema_name], [object_name], [object_type], [login_name], [time_locked]
        FROM [SQLSourceControl].[LockedObjects]
    )
GO


--//////////////////////////////////////
--// IsObjectLocked Function
--//////////////////////////////////////
IF OBJECT_ID('[SQLSourceControl].[IsObjectLocked]') IS NOT NULL
    DROP FUNCTION [SQLSourceControl].[IsObjectLocked]
GO

CREATE FUNCTION [SQLSourceControl].[IsObjectLocked]
    (
      @db_name AS NVARCHAR(128),
      @schema_name AS NVARCHAR(128),
      @object_name AS NVARCHAR(128)
    )
RETURNS BIT
AS
    BEGIN
        IF EXISTS (SELECT 1 FROM [SQLSourceControl].[LockedObjects] AS LO
                   WHERE LO.[db_name] = @db_name
                   AND LO.[schema_name] = @schema_name
                   AND LO.[object_name] = @object_name)
            RETURN 1
        RETURN 0
    END
GO
