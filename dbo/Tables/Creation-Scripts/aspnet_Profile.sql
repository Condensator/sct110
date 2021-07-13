CREATE TABLE [dbo].[aspnet_Profile] (
    [UserId]               UNIQUEIDENTIFIER NOT NULL,
    [PropertyNames]        NTEXT            NOT NULL,
    [PropertyValuesString] NTEXT            NOT NULL,
    [PropertyValuesBinary] IMAGE            NOT NULL,
    [LastUpdatedDate]      DATETIME         NOT NULL
);


GO

ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__1F63A897] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__2057CCD0] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__214BF109] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__22401542] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__2334397B] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [FK__aspnet_Pr__UserI__24285DB4] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[aspnet_Profile]
    ADD CONSTRAINT [PK__aspnet_Profile__52593CB8] PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (FILLFACTOR = 90);


GO



