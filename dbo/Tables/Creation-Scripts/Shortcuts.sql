CREATE TABLE [dbo].[Shortcuts] (
    [ID]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (256) NOT NULL,
    [Path]        VARCHAR (256) NOT NULL,
    [UserName]    VARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[Shortcuts]
    ADD CONSTRAINT [PK_Users_Shortcuts] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



