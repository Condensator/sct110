CREATE TABLE [dbo].[aspnet_PersonalizationPerUser] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [PathId]          UNIQUEIDENTIFIER NULL,
    [UserId]          UNIQUEIDENTIFIER NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL
);


GO

ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [DF__aspnet_Perso__Id__395884C4] DEFAULT (newid()) FOR [Id];


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__13F1F5EB] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__14E61A24] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__15DA3E5D] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__16CE6296] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__17C286CF] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__18B6AB08] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__19AACF41] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__1A9EF37A] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__1B9317B3] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__1C873BEC] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__1D7B6025] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [FK__aspnet_Pe__UserI__1E6F845E] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationPerUser]
    ADD CONSTRAINT [PK__aspnet_Personali__5070F446] PRIMARY KEY NONCLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



