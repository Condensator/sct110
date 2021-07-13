CREATE TABLE [dbo].[AirtimeProductMap] (
    [Id]                  SMALLINT     IDENTITY (1, 1) NOT NULL,
    [IntegratedProductId] VARCHAR (30) NULL,
    [AMSStockType]        SMALLINT     NULL,
    [Customer]            VARCHAR (50) NULL,
    [EncryptionType]      VARCHAR (20) NULL,
    [SystemID]            VARCHAR (20) NULL
);


GO

ALTER TABLE [dbo].[AirtimeProductMap]
    ADD CONSTRAINT [PK_AirtimeProductMap] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



