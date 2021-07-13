CREATE TABLE [dbo].[Language] (
    [LanguageID] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Language]   VARCHAR (250) NULL
);


GO

ALTER TABLE [dbo].[Language]
    ADD CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED ([LanguageID] ASC) WITH (FILLFACTOR = 90);


GO



