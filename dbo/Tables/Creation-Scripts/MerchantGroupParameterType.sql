CREATE TABLE [dbo].[MerchantGroupParameterType] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Code]        NVARCHAR (50)  NULL,
    [Description] NVARCHAR (200) NULL,
    [IsDeleted]   BIT            NULL
);


GO

ALTER TABLE [dbo].[MerchantGroupParameterType]
    ADD CONSTRAINT [DF_MerchantGroupParameterType_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[MerchantGroupParameterType]
    ADD CONSTRAINT [PK_MerchantGroupParameterTypes] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



