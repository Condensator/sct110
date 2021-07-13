CREATE TABLE [dbo].[AllowedProductGroupingVASProduct] (
    [AllowedProductGroupingId] INT NOT NULL,
    [VASProductId]             INT NOT NULL
);


GO

ALTER TABLE [dbo].[AllowedProductGroupingVASProduct]
    ADD CONSTRAINT [FK_AllowedProductGroupingVASProduct_AllowedProductGrouping] FOREIGN KEY ([AllowedProductGroupingId]) REFERENCES [dbo].[AllowedProductGrouping] ([Id]);


GO



ALTER TABLE [dbo].[AllowedProductGroupingVASProduct]
    ADD CONSTRAINT [FK_AllowedProductGroupingVASProduct_VASProduct] FOREIGN KEY ([VASProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



