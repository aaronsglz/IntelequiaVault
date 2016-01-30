SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- updated view to use new function
CREATE VIEW [dbo].[vw_Modules]
AS
    SELECT
        M.PortalID AS [OwnerPortalID],
        T.PortalID,
        TM.TabID,
        TM.TabModuleID,
        M.ModuleID,
        M.ModuleDefID,
        TM.ModuleOrder,
        TM.PaneName,
        TM.ModuleTitle,
        TM.CacheTime,
        TM.CacheMethod,
        TM.Alignment,
        TM.Color,
        TM.Border,
        dbo.FilePath(TM.IconFile) AS IconFile,
        M.AllTabs,
        TM.Visibility,
        TM.IsDeleted,
        TM.Header,
        TM.Footer,
        M.StartDate,
        M.EndDate,
        TM.ContainerSrc,
        TM.DisplayTitle,
        TM.DisplayPrint,
        TM.DisplaySyndicate,
        TM.IsWebSlice,
        TM.WebSliceTitle,
        TM.WebSliceExpiryDate,
        TM.WebSliceTTL,
        M.InheritViewPermissions,
        M.IsShareable,
        M.IsShareableViewOnly,
        MD.DesktopModuleID,
        MD.DefaultCacheTime,
        MC.ModuleControlID,
        DM.BusinessControllerClass,
        DM.IsAdmin,
        DM.SupportedFeatures,
        CI.ContentItemID,
        CI.Content,
        CI.ContentTypeID,
        CI.ContentKey,
        CI.Indexed,
        CI.StateID,
        M.CreatedByUserID,
        M.CreatedOnDate,
        M.LastModifiedByUserID,
        M.LastModifiedOnDate,
        M.LastContentModifiedOnDate,
        TM.UniqueId,
        TM.VersionGuid,
        TM.DefaultLanguageGuid,
        TM.LocalizedVersionGuid,
        TM.CultureCode
    FROM        dbo.ModuleDefinitions AS MD
     INNER JOIN dbo.Modules           AS M  ON MD.ModuleDefID = M.ModuleDefID
     INNER JOIN dbo.ModuleControls    AS MC ON MD.ModuleDefID = MC.ModuleDefID
     INNER JOIN dbo.DesktopModules    AS DM ON MD.DesktopModuleID = DM.DesktopModuleID
     LEFT  JOIN dbo.ContentItems      AS CI ON M.ContentItemID = CI.ContentItemID
     LEFT  JOIN dbo.TabModules        AS TM ON M.ModuleID = TM.ModuleID
     LEFT  JOIN dbo.Tabs              AS T  ON TM.TabID = T.TabID
    WHERE (MC.ControlKey IS NULL)
GO
