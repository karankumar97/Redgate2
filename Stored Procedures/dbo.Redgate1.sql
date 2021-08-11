SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Redgate1] 
	-- Add the parameters for the stored procedure here
	(@TeacherMainId AS INT)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM TeacherAuthenticationDetails
	WHERE TeacherId > @TeacherMainId
	ORDER BY TeacherId;
END
GO
