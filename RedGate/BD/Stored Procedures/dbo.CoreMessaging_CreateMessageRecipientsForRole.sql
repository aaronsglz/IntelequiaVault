SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[CoreMessaging_CreateMessageRecipientsForRole]
    @MessageID int,         -- message id
    @RoleIDs nvarchar(max), -- comma separated list of RoleIds
	@CreateUpdateUserID INT -- create / update user id
AS
BEGIN    
    ;WITH CTE_RoleIDs(RowNumber, RowValue)
    AS
    (
	SELECT * FROM dbo.ConvertListToTable(',', @RoleIDs)
    ),
	CTE_DistinctUserIDs(UserID)
    AS
    (
  		SELECT DISTINCT UserID
	    FROM dbo.vw_UserRoles ur
        INNER JOIN CTE_RoleIDs cr ON ur.RoleID = cr.RowValue
    )

    INSERT dbo.CoreMessaging_MessageRecipients(
			[MessageID],
			[UserID],
			[Read],
			[Archived],
            [CreatedByUserID],
            [CreatedOnDate],
            [LastModifiedByUserID],
            [LastModifiedOnDate]
            )
			SELECT
			  @MessageID,
			  UserID,
			  0,
			  0,
              @CreateUpdateUserID , -- CreatedBy - int
              GETDATE(), -- CreatedOn - datetime
              @CreateUpdateUserID , -- LastModifiedBy - int
              GETDATE() -- LastModifiedOn - datetime
           FROM CTE_DistinctUserIDs
END
GO
