CREATE TABLE [dbo].[MerchantToMerchantChargeFeeFuture] (
    [Idx]                           INT             IDENTITY (1, 1) NOT NULL,
    [FutureDate]                    DATETIME        NOT NULL,
    [MerchantToMerchantChargeFeeId] INT             NULL,
    [EntId]                         INT             NOT NULL,
    [ChargeFee]                     DECIMAL (18, 2) NOT NULL,
    [ModifiedUser]                  NVARCHAR (50)   NULL,
    [ModifiedDate]                  DATETIME        NULL,
    [IsDeleted]                     BIT             NOT NULL,
    [Comment]                       NVARCHAR (200)  NULL
);


GO

ALTER TABLE [dbo].[MerchantToMerchantChargeFeeFuture]
    ADD CONSTRAINT [DF_MerchantToMerchantChargeFeeFuture_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[MerchantToMerchantChargeFeeFuture]
    ADD CONSTRAINT [PK_MerchantToMerchantChargeFeeFuture] PRIMARY KEY CLUSTERED ([Idx] ASC);


GO



