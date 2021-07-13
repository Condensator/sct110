CREATE TABLE [dbo].[VASProductRebateCommissionFuture] (
    [Id]                    INT            IDENTITY (1, 1) NOT NULL,
    [FutureDate]            DATETIME       NOT NULL,
    [VASProductId]          INT            NOT NULL,
    [FeeOutlet]             MONEY          NOT NULL,
    [FeeOutletIsPercent]    BIT            NOT NULL,
    [FeeSwitch]             MONEY          NOT NULL,
    [FeeSwitchIsPercent]    BIT            NOT NULL,
    [FeeProvider]           MONEY          NOT NULL,
    [FeeProviderIsPercent]  BIT            NOT NULL,
    [RebateCash]            MONEY          NOT NULL,
    [RebateCashIsPercent]   BIT            NOT NULL,
    [RebateCard]            MONEY          NOT NULL,
    [RebateCardIsPercent]   BIT            NOT NULL,
    [RebateDebit]           MONEY          NOT NULL,
    [RebateDebitIsPercent]  BIT            NOT NULL,
    [RebateCheque]          MONEY          NOT NULL,
    [RebateChequeIsPercent] BIT            NOT NULL,
    [EntityId]              INT            NULL,
    [IsDeleted]             BIT            NOT NULL,
    [FeeCharge]             MONEY          NOT NULL,
    [FeeChargeIsPercent]    BIT            NOT NULL,
    [CommissionTypeId]      INT            NULL,
    [CommissionOnFreeUnits] BIT            NOT NULL,
    [ModifiedUser]          NVARCHAR (50)  NULL,
    [ModifiedDate]          DATETIME       NULL,
    [Comment]               NVARCHAR (200) NULL,
    [IsCommissionable]      BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_CommissionOnFreeUnits] DEFAULT ((0)) FOR [CommissionOnFreeUnits];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeCharge] DEFAULT ((0)) FOR [FeeCharge];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeChargeIsPercentage] DEFAULT ((0)) FOR [FeeChargeIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeOutletIsPercent] DEFAULT ((0)) FOR [FeeOutletIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeProviderIsPercent] DEFAULT ((0)) FOR [FeeProviderIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeSwitch] DEFAULT ((0)) FOR [FeeSwitch];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_FeeSwitchIsPercent] DEFAULT ((0)) FOR [FeeSwitchIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_IsCommissionable] DEFAULT ((1)) FOR [IsCommissionable];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_RebateCardIsPercent] DEFAULT ((0)) FOR [RebateCardIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_RebateCashIsPercent] DEFAULT ((0)) FOR [RebateCashIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_RebateCheque] DEFAULT ((0)) FOR [RebateCheque];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_RebateChequeIsPercent] DEFAULT ((0)) FOR [RebateChequeIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [DF_VASProductRebateCommissionFuture_RebateDebitIsPercent] DEFAULT ((0)) FOR [RebateDebitIsPercent];


GO



ALTER TABLE [dbo].[VASProductRebateCommissionFuture]
    ADD CONSTRAINT [PK_VASProductRebateCommissionFuture] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



