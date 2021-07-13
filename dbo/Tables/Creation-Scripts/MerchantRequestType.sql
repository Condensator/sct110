CREATE TABLE [dbo].[MerchantRequestType] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[MerchantRequestType]
    ADD CONSTRAINT [PK__Merchant__3214EC071D90982A] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



