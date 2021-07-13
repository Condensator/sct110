CREATE TABLE [dbo].[User_Shortcut] (
    [ID]          INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (256)    NOT NULL,
    [Path]        VARCHAR (512)    NOT NULL,
    [UserID]      UNIQUEIDENTIFIER NOT NULL
);


GO

ALTER TABLE [dbo].[User_Shortcut]
    ADD CONSTRAINT [FK_User_Shortcut_aspnet_Users] FOREIGN KEY ([UserID]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



ALTER TABLE [dbo].[User_Shortcut]
    ADD CONSTRAINT [PK_User_Shortcut] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



