CREATE TABLE [dbo].[Account_Automated_Transaction_Exclusion] (
    [VASProductId] INT NOT NULL
);


GO

ALTER TABLE [dbo].[Account_Automated_Transaction_Exclusion]
    ADD CONSTRAINT [DF_Account_Automated_Transaction_Exclusion_TrxTypeId] UNIQUE NONCLUSTERED ([VASProductId] ASC);


GO



ALTER TABLE [dbo].[Account_Automated_Transaction_Exclusion]
    ADD CONSTRAINT [FK_Account_Automated_Transaction_Exclusion_VASProduct] FOREIGN KEY ([VASProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



