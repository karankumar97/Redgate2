SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Redgate] 
	-- Add the parameters for the stored procedure here
	(@TeacherMainId AS int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TeacherAuthenticationDetails
	WHERE TeacherName LIKE 'A%'
	ORDER BY TeacherObjectId;
END
GO
