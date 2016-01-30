SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[GetTabsByPackageID]
    @PortalId  Int, -- Null for Host menu items
    @PackageId Int, -- Not Null!
    @ForHost   Bit  -- 0: Get pages for a specific portal (or host pages only)
                    -- 1: Get all host pages and portal pages
AS
BEGIN
    SELECT * FROM dbo.[vw_Tabs]
     WHERE (IsNull(PortalId, -1) = IsNull(@PortalId, -1) Or @ForHost = 1)
       AND IsDeleted = 0
       AND TabId IN (SELECT TabId FROM dbo.[vw_Modules] M
                      INNER JOIN dbo.[DesktopModules] DM ON M.DesktopModuleID = DM.DesktopModuleID
                      WHERE DM.PackageID = @PackageId AND M.IsDeleted = 0)
    ORDER BY PortalID, TabName
	OPTION (OPTIMIZE FOR (@PortalId UNKNOWN, @PackageId UNKNOWN, @ForHost UNKNOWN));
END
GO
