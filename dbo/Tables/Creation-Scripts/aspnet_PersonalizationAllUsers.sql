CREATE TABLE [dbo].[aspnet_PersonalizationAllUsers] (
    [PathId]          UNIQUEIDENTIFIER NOT NULL,
    [PageSettings]    IMAGE            NOT NULL,
    [LastUpdatedDate] DATETIME         NOT NULL
);


GO

ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__0E391C95] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__0F2D40CE] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__10216507] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__11158940] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__1209AD79] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [FK__aspnet_Pe__PathI__12FDD1B2] FOREIGN KEY ([PathId]) REFERENCES [dbo].[aspnet_Paths] ([PathId]);


GO



ALTER TABLE [dbo].[aspnet_PersonalizationAllUsers]
    ADD CONSTRAINT [PK__aspnet_Personali__4E88ABD4] PRIMARY KEY CLUSTERED ([PathId] ASC) WITH (FILLFACTOR = 90);


GO



