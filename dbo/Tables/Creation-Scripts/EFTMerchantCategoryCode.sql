CREATE TABLE [dbo].[EFTMerchantCategoryCode] (
    [Id]         INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Decription] VARCHAR (250) NOT NULL,
    [IsDeleted]  BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[EFTMerchantCategoryCode]
    ADD CONSTRAINT [DF_EFTMerchantCategoryCode_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[EFTMerchantCategoryCode]
    ADD CONSTRAINT [PK_EFTMerchantCategoryCode] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



