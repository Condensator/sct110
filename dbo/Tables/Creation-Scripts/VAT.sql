CREATE TABLE [dbo].[VAT] (
    [ID]              INT             IDENTITY (1, 1) NOT NULL,
    [Description]     VARCHAR (64)    NOT NULL,
    [Percentage]      DECIMAL (18, 4) NOT NULL,
    [TrxTypeID]       INT             NOT NULL,
    [VAT_StructureID] INT             NOT NULL
);


GO

ALTER TABLE [dbo].[VAT]
    ADD CONSTRAINT [DF_VAT_VAT_StructureID] DEFAULT ((1)) FOR [VAT_StructureID];


GO



ALTER TABLE [dbo].[VAT]
    ADD CONSTRAINT [FK_VAT_TrxTypes] FOREIGN KEY ([TrxTypeID]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[VAT]
    ADD CONSTRAINT [FK_VAT_VAT_Structure] FOREIGN KEY ([VAT_StructureID]) REFERENCES [dbo].[VAT_Structure] ([ID]);


GO



ALTER TABLE [dbo].[VAT]
    ADD CONSTRAINT [PK_VAT] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxTrxTypeId]
    ON [dbo].[VAT]([TrxTypeID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



