CREATE TABLE [dbo].[TrxTypeDetail] (
    [Id]                                INT   IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]                         INT   NOT NULL,
    [SystemVAT]                         BIT   NOT NULL,
    [VATRate]                           MONEY NOT NULL,
    [CommissionOutletPercentage_MIN]    MONEY NOT NULL,
    [CommissionOutletFlatRate_MIN]      MONEY NOT NULL,
    [CommissionProviderPercentage_MIN]  MONEY NOT NULL,
    [CommissionProviderFlatRate_MIN]    MONEY NOT NULL,
    [CommissionSwitchPercentage_MIN]    MONEY NOT NULL,
    [CommissionSwitchFlatRate_MIN]      MONEY NOT NULL,
    [ConvenienceOutletPercentage_MIN]   MONEY NOT NULL,
    [ConvenienceOutletFlatRate_MIN]     MONEY NOT NULL,
    [ConvenienceProviderPercentage_MIN] MONEY NOT NULL,
    [ConvenienceProviderFlatRate_MIN]   MONEY NOT NULL,
    [ConvenienceSwitchPercentage_MIN]   MONEY NOT NULL,
    [ConvenienceSwitchFlatRate_MIN]     MONEY NOT NULL,
    [RebateCashPercentage_MIN]          MONEY NOT NULL,
    [RebateCashFlatRate_MIN]            MONEY NOT NULL,
    [RebateCardPercentage_MIN]          MONEY NOT NULL,
    [RebateCardFlatRate_MIN]            MONEY NOT NULL,
    [RebateDebitPercentage_MIN]         MONEY NOT NULL,
    [RebateDebitFlatRate_MIN]           MONEY NOT NULL,
    [RebateChequePercentage_MIN]        MONEY NOT NULL,
    [RebateChequeFlatRate_MIN]          MONEY NOT NULL,
    [CommissionOutletPercentage_MAX]    MONEY NOT NULL,
    [CommissionOutletFlatRate_MAX]      MONEY NOT NULL,
    [CommissionProviderPercentage_MAX]  MONEY NOT NULL,
    [CommissionProviderFlatRate_MAX]    MONEY NOT NULL,
    [CommissionSwitchPercentage_MAX]    MONEY NOT NULL,
    [CommissionSwitchFlatRate_MAX]      MONEY NOT NULL,
    [ConvenienceOutletPercentage_MAX]   MONEY NOT NULL,
    [ConvenienceOutletFlatRate_MAX]     MONEY NOT NULL,
    [ConvenienceProviderPercentage_MAX] MONEY NOT NULL,
    [ConvenienceProviderFlatRate_MAX]   MONEY NOT NULL,
    [ConvenienceSwitchPercentage_MAX]   MONEY NOT NULL,
    [ConvenienceSwitchFlatRate_MAX]     MONEY NOT NULL,
    [RebateCashPercentage_MAX]          MONEY NOT NULL,
    [RebateCashFlatRate_MAX]            MONEY NOT NULL,
    [RebateCardPercentage_MAX]          MONEY NOT NULL,
    [RebateCardFlatRate_MAX]            MONEY NOT NULL,
    [RebateDebitPercentage_MAX]         MONEY NOT NULL,
    [RebateDebitFlatRate_MAX]           MONEY NOT NULL,
    [RebateChequePercentage_MAX]        MONEY NOT NULL,
    [RebateChequeFlatRate_MAX]          MONEY NOT NULL
);


GO

ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__1B90E349] DEFAULT ((0)) FOR [CommissionOutletPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__1C850782] DEFAULT ((0)) FOR [CommissionOutletFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__1D792BBB] DEFAULT ((0)) FOR [CommissionProviderPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__1E6D4FF4] DEFAULT ((0)) FOR [CommissionProviderFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__1F61742D] DEFAULT ((0)) FOR [CommissionSwitchPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__20559866] DEFAULT ((0)) FOR [CommissionSwitchFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__2EA3B7BD] DEFAULT ((0)) FOR [CommissionOutletPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__2F97DBF6] DEFAULT ((0)) FOR [CommissionOutletFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__308C002F] DEFAULT ((0)) FOR [CommissionProviderPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__31802468] DEFAULT ((0)) FOR [CommissionProviderFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__327448A1] DEFAULT ((0)) FOR [CommissionSwitchPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Commi__33686CDA] DEFAULT ((0)) FOR [CommissionSwitchFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__2149BC9F] DEFAULT ((0)) FOR [ConvenienceOutletPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__223DE0D8] DEFAULT ((0)) FOR [ConvenienceOutletFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__23320511] DEFAULT ((0)) FOR [ConvenienceProviderPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__2426294A] DEFAULT ((0)) FOR [ConvenienceProviderFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__251A4D83] DEFAULT ((0)) FOR [ConvenienceSwitchPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__260E71BC] DEFAULT ((0)) FOR [ConvenienceSwitchFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__345C9113] DEFAULT ((0)) FOR [ConvenienceOutletPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__3550B54C] DEFAULT ((0)) FOR [ConvenienceOutletFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__3644D985] DEFAULT ((0)) FOR [ConvenienceProviderPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__3738FDBE] DEFAULT ((0)) FOR [ConvenienceProviderFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__382D21F7] DEFAULT ((0)) FOR [ConvenienceSwitchPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Conve__39214630] DEFAULT ((0)) FOR [ConvenienceSwitchFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__270295F5] DEFAULT ((0)) FOR [RebateCashPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__27F6BA2E] DEFAULT ((0)) FOR [RebateCashFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__28EADE67] DEFAULT ((0)) FOR [RebateCardPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__29DF02A0] DEFAULT ((0)) FOR [RebateCardFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__2AD326D9] DEFAULT ((0)) FOR [RebateDebitPercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__2BC74B12] DEFAULT ((0)) FOR [RebateDebitFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__2CBB6F4B] DEFAULT ((0)) FOR [RebateChequePercentage_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__2DAF9384] DEFAULT ((0)) FOR [RebateChequeFlatRate_MIN];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3A156A69] DEFAULT ((0)) FOR [RebateCashPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3B098EA2] DEFAULT ((0)) FOR [RebateCashFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3BFDB2DB] DEFAULT ((0)) FOR [RebateCardPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3CF1D714] DEFAULT ((0)) FOR [RebateCardFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3DE5FB4D] DEFAULT ((0)) FOR [RebateDebitPercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3EDA1F86] DEFAULT ((0)) FOR [RebateDebitFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__3FCE43BF] DEFAULT ((0)) FOR [RebateChequePercentage_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Rebat__40C267F8] DEFAULT ((0)) FOR [RebateChequeFlatRate_MAX];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__Syste__19A89AD7] DEFAULT ((1)) FOR [SystemVAT];


GO



ALTER TABLE [dbo].[TrxTypeDetail]
    ADD CONSTRAINT [DF__TrxTypeDe__VATRa__1A9CBF10] DEFAULT ((0)) FOR [VATRate];


GO



