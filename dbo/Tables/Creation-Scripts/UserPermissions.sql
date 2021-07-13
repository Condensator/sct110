CREATE TABLE [dbo].[UserPermissions] (
    [Id]               INT IDENTITY (1, 1) NOT NULL,
    [UserId]           INT NOT NULL,
    [PermissionTypeId] INT NOT NULL
);


GO

ALTER TABLE [dbo].[UserPermissions]
    ADD CONSTRAINT [FK_UserPermissions_DevUser] FOREIGN KEY ([UserId]) REFERENCES [dbo].[DevUser] ([Id]);


GO



ALTER TABLE [dbo].[UserPermissions]
    ADD CONSTRAINT [FK_UserPermissions_UserPermissionTypes] FOREIGN KEY ([PermissionTypeId]) REFERENCES [dbo].[UserPermissionTypes] ([Id]);


GO



ALTER TABLE [dbo].[UserPermissions]
    ADD CONSTRAINT [PK__UserPerm__3214EC0764A5FEA9] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxpermissiontypeid]
    ON [dbo].[UserPermissions]([PermissionTypeId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxUserId]
    ON [dbo].[UserPermissions]([UserId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



