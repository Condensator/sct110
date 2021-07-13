CREATE TABLE [dbo].[MerchantToMerchantChargeFee] (
    [Idx]          INT             IDENTITY (1, 1) NOT NULL,
    [EntId]        INT             NOT NULL,
    [ChargeFee]    DECIMAL (18, 2) NOT NULL,
    [ModifiedUser] NVARCHAR (50)   NULL,
    [ModifiedDate] DATETIME        NULL
);


GO

ALTER TABLE [dbo].[MerchantToMerchantChargeFee]
    ADD CONSTRAINT [PK_MerchantToMerchantChargeFee] PRIMARY KEY CLUSTERED ([Idx] ASC);


GO



