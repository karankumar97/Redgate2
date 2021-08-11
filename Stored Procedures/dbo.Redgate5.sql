SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Redgate5] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Id AS INT;
	DECLARE @count AS INT;
	SET @Id = 100;
	SET @count = (
	SELECT COUNT(1) FROM dbo.TeacherBasicInformation
	WHERE TeacherId = @Id)
	IF @count > 0
	BEGIN
		PRINT 'Match found';
	END
	ELSE
	BEGIN
		PRINT 'Not found'
	END
END
GO
