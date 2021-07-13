CREATE TABLE [dbo].[TrxFees] (
    [Id]                   INT    IDENTITY (1, 1) NOT NULL,
    [TrxId]                BIGINT NOT NULL,
    [FeeOutlet]            MONEY  NULL,
    [FeeSwitch]            MONEY  NULL,
    [FeeProvider]          MONEY  NULL,
    [RebateCash]           MONEY  NULL,
    [RebateCard]           MONEY  NULL,
    [RebateDebit]          MONEY  NULL,
    [RebateCheque]         MONEY  NULL,
    [ConvenienceOutlet]    MONEY  NULL,
    [ConvenienceSwitch]    MONEY  NULL,
    [ConvenienceProvider]  MONEY  NULL,
    [TotalCommission]      MONEY  NOT NULL,
    [VASCommissionId]      INT    NULL,
    [VASSlidingId]         INT    NULL,
    [FeeCharge]            MONEY  NULL,
    [ProviderRebateCash]   MONEY  NULL,
    [ProviderRebateCard]   MONEY  NULL,
    [ProviderRebateDebit]  MONEY  NULL,
    [ProviderRebateCheque] MONEY  NULL
);


GO

ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__Conveni__21A1C21B] DEFAULT ((0)) FOR [ConvenienceOutlet];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__Conveni__2295E654] DEFAULT ((0)) FOR [ConvenienceSwitch];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__Conveni__238A0A8D] DEFAULT ((0)) FOR [ConvenienceProvider];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__FeeOutl__1AF4C48C] DEFAULT ((0)) FOR [FeeOutlet];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__FeeProv__1CDD0CFE] DEFAULT ((0)) FOR [FeeProvider];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__FeeSwit__1BE8E8C5] DEFAULT ((0)) FOR [FeeSwitch];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__RebateC__1DD13137] DEFAULT ((0)) FOR [RebateCash];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__RebateC__1EC55570] DEFAULT ((0)) FOR [RebateCard];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__RebateC__20AD9DE2] DEFAULT ((0)) FOR [RebateCheque];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__RebateD__1FB979A9] DEFAULT ((0)) FOR [RebateDebit];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF__TrxFees__TotalCo__1DCC68FE] DEFAULT ((0)) FOR [TotalCommission];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [DF_TrxFees_FeeCharge] DEFAULT ((0)) FOR [FeeCharge];


GO



ALTER TABLE [dbo].[TrxFees]
    ADD CONSTRAINT [PK_TrxFees] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxFeeCharge]
    ON [dbo].[TrxFees]([FeeCharge] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxTrxFeesTrxID]
    ON [dbo].[TrxFees]([TrxId] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxVASSlidingID]
    ON [dbo].[TrxFees]([VASSlidingId] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxFees_After] ON [dbo].[TrxFees]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;

  
SET IDENTITY_INSERT AEON_SA_Archive..trxfeesarchive ON
  
INSERT INTO AEON_SA_Archive..TrxFeesArchive
(Id,TrxId,FeeOutlet,FeeSwitch,FeeProvider,RebateCash,RebateCard,RebateDebit,RebateCheque,ConvenienceOutlet,ConvenienceSwitch
,ConvenienceProvider,TotalCommission,VASCommissionId,VASSlidingId,FeeCharge,ProviderRebateCash,ProviderRebateCard,ProviderRebateDebit,ProviderRebateCheque)
  
SELECT 
	Id,TrxId,FeeOutlet,FeeSwitch,FeeProvider,RebateCash,RebateCard,RebateDebit,RebateCheque,ConvenienceOutlet,ConvenienceSwitch
,ConvenienceProvider,TotalCommission,VASCommissionId,VASSlidingId,FeeCharge,ProviderRebateCash,ProviderRebateCard,ProviderRebateDebit,ProviderRebateCheque
FROM deleted

SET IDENTITY_INSERT AEON_SA_Archive..trxfeesarchive OFF

    
END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxFees_After]
    ON [dbo].[TrxFees];


GO



