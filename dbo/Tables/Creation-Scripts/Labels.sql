CREATE TABLE [dbo].[Labels] (
    [LabelID]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [LabelCode]   VARCHAR (50)  NULL,
    [LanguageID]  INT           NULL,
    [LabelText]   VARCHAR (250) NULL,
    [Description] VARCHAR (250) NULL
);


GO

ALTER TABLE [dbo].[Labels]
    ADD CONSTRAINT [FK_Labels_Language] FOREIGN KEY ([LanguageID]) REFERENCES [dbo].[Language] ([LanguageID]);


GO



ALTER TABLE [dbo].[Labels]
    ADD CONSTRAINT [PK_Labels] PRIMARY KEY CLUSTERED ([LabelID] ASC) WITH (FILLFACTOR = 90);


GO



