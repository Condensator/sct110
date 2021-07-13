CREATE TABLE [dbo].[EFTAccount] (
    [EFTId]                  INT            IDENTITY (1, 1) NOT NULL,
    [EntId]                  INT            NOT NULL,
    [ContactId]              INT            NOT NULL,
    [AddressId]              INT            NOT NULL,
    [MerchantCategoryCodeId] INT            NOT NULL,
    [CreateDate]             DATETIME       NOT NULL,
    [CreateUser]             NVARCHAR (256) NOT NULL,
    [CreditCheckBy]          NVARCHAR (256) NOT NULL,
    [EFTPOSTerminalId]       VARCHAR (50)   NOT NULL,
    [EFTPOSMerchantId]       VARCHAR (50)   NOT NULL,
    [IsDeleted]              BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[EFTAccount]
    ADD CONSTRAINT [DF_Entity_EFTAccount_CreateDate] DEFAULT (getdate()) FOR [CreateDate];


GO



ALTER TABLE [dbo].[EFTAccount]
    ADD CONSTRAINT [DF_Entity_EFTAccount_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



