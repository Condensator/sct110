CREATE TABLE [dbo].[VasProductCategory] (
    [Id]                  INT           NULL,
    [TrxTypeId]           INT           NULL,
    [ProcessingCode]      INT           NULL,
    [CategoryDescription] NVARCHAR (50) NULL,
    [TopUpProviderID]     INT           NULL,
    [TopUpProductID]      INT           NULL
);


GO

ALTER TABLE [dbo].[VasProductCategory]
    ADD CONSTRAINT [FK_VasProductCategory_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



CREATE CLUSTERED INDEX [ndxVasProductCategoryId]
    ON [dbo].[VasProductCategory]([Id] ASC);


GO



