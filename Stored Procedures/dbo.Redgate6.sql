SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Redgate6] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @Id AS INT;
	SET @ID = 1;
	WHILE @ID <= 5
	BEGIN
	SELECT * FROM dbo.TeacherBasicInformation
	WHERE TeacherId = @Id
	SET @Id = @Id + 1;
	END
END
GO
