SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetDesktopModules]
AS
	SELECT *
	FROM  dbo.vw_DesktopModules
	ORDER BY FriendlyName
GO
