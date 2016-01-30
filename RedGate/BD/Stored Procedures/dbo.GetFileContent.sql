SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetFileContent]
	@FileId int
AS
BEGIN
	SELECT Content
	FROM dbo.[Files]
	WHERE FileId = @FileId
END
GO