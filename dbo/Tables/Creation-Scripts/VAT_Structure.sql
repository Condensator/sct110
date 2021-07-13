CREATE TABLE [dbo].[VAT_Structure] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[VAT_Structure]
    ADD CONSTRAINT [PK_VAT_Structure] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



