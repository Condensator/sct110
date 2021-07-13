CREATE TABLE [dbo].[VASProductRemovedVodacomBundles] (
    [Id]                           INT           IDENTITY (1, 1) NOT NULL,
    [Description]                  VARCHAR (100) NULL,
    [TrxTypeId]                    INT           NOT NULL,
    [ProviderId]                   INT           NOT NULL,
    [IsVerify]                     BIT           NULL,
    [IsFullPayment]                BIT           NULL,
    [AdditionalFields]             INT           NULL,
    [ProductCode]                  VARCHAR (20)  NULL,
    [IsDeleted]                    BIT           NULL,
    [CalculateFromTotalCommission] BIT           NOT NULL,
    [FixedValueFlag]               INT           NULL,
    [FixedValueAmount]             MONEY         NULL,
    [IsCredit]                     BIT           NULL,
    [BillIssuerId]                 INT           NULL,
    [AllowReversal]                BIT           NULL
);


GO

