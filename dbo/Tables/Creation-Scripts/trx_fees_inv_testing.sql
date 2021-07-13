CREATE TABLE [dbo].[trx_fees_inv_testing] (
    [Id]                   INT   NOT NULL,
    [TrxId]                INT   NOT NULL,
    [FeeOutlet]            MONEY NULL,
    [FeeSwitch]            MONEY NULL,
    [FeeProvider]          MONEY NULL,
    [RebateCash]           MONEY NULL,
    [RebateCard]           MONEY NULL,
    [RebateDebit]          MONEY NULL,
    [RebateCheque]         MONEY NULL,
    [ConvenienceOutlet]    MONEY NULL,
    [ConvenienceSwitch]    MONEY NULL,
    [ConvenienceProvider]  MONEY NULL,
    [TotalCommission]      MONEY NOT NULL,
    [VASCommissionId]      INT   NULL,
    [VASSlidingId]         INT   NULL,
    [FeeCharge]            MONEY NULL,
    [ProviderRebateCash]   MONEY NULL,
    [ProviderRebateCard]   MONEY NULL,
    [ProviderRebateDebit]  MONEY NULL,
    [ProviderRebateCheque] MONEY NULL
);


GO

