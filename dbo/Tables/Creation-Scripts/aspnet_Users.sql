CREATE TABLE [dbo].[aspnet_Users] (
    [ApplicationId]    UNIQUEIDENTIFIER NOT NULL,
    [UserId]           UNIQUEIDENTIFIER NOT NULL,
    [UserName]         NVARCHAR (256)   NOT NULL,
    [LoweredUserName]  NVARCHAR (256)   NOT NULL,
    [MobileAlias]      NVARCHAR (16)    NULL,
    [IsAnonymous]      BIT              NOT NULL,
    [LastActivityDate] DATETIME         NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_aspnet_Users_ApplicationId]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC)
    INCLUDE([UserId]);


GO



CREATE NONCLUSTERED INDEX [IX_aspnet_Users_ApplicationId_LoweredUserName]
    ON [dbo].[aspnet_Users]([ApplicationId] ASC, [LoweredUserName] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_aspnet_Users_LoweredUserName]
    ON [dbo].[aspnet_Users]([LoweredUserName] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_aspnet_Users_UserName]
    ON [dbo].[aspnet_Users]([UserName] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [DF__aspnet_Us__IsAno__3D2915A8] DEFAULT ((0)) FOR [IsAnonymous];


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [DF__aspnet_Us__Mobil__3C34F16F] DEFAULT (NULL) FOR [MobileAlias];


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [DF__aspnet_Us__UserI__3B40CD36] DEFAULT (newid()) FOR [UserId];


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2AD55B43] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2BC97F7C] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2CBDA3B5] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2DB1C7EE] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2EA5EC27] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [FK__aspnet_Us__Appli__2F9A1060] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[aspnet_Applications] ([ApplicationId]);


GO



ALTER TABLE [dbo].[aspnet_Users]
    ADD CONSTRAINT [PK__aspnet_Users__38996AB5] PRIMARY KEY NONCLUSTERED ([UserId] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



