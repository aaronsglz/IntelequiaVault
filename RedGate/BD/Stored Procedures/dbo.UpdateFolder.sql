SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[UpdateFolder]
	@PortalID 				int,
	@VersionGuid 			uniqueidentifier,	
	@FolderID 				int,
	@FolderPath 			nvarchar(300),
	@MappedPath 			nvarchar(300),
	@StorageLocation 		int,
	@IsProtected 			bit,
	@IsCached 				bit,
	@LastUpdated 			datetime,
	@LastModifiedByUserID  	int,
	@FolderMappingID		int,
	@IsVersioned			bit = 0,
	@WorkflowID				int = NULL,
	@ParentID				int = NULL
AS
BEGIN
	UPDATE dbo.[Folders]
	SET
		FolderPath = @FolderPath,
		MappedPath = @MappedPath,
		VersionGuid = @VersionGuid,
		StorageLocation = @StorageLocation,
		IsProtected = @IsProtected,
		IsCached = @IsCached,
		LastUpdated = @LastUpdated,
		LastModifiedByUserID = @LastModifiedByUserID,
		LastModifiedOnDate = getdate(),
		FolderMappingID = @FolderMappingID,
		IsVersioned = @IsVersioned,
		WorkflowID = @WorkflowID,
		ParentID = @ParentID
	WHERE FolderID = @FolderID
END
GO
