SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetPermissions]
AS
	SELECT * FROM dbo.Permission
	ORDER BY ViewOrder
GO