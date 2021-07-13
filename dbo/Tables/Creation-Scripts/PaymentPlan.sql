CREATE TABLE [dbo].[PaymentPlan] (
    [Id]                           INT           NOT NULL,
    [Description]                  VARCHAR (100) NULL,
    [PaymentTerms]                 INT           NULL,
    [OverDraftLimit]               MONEY         NULL,
    [Payment]                      MONEY         NULL,
    [Rebate]                       MONEY         NULL,
    [ComId]                        INT           NULL,
    [ComAirtimeId]                 INT           NULL,
    [VASCommissionStructureId]     INT           NULL,
    [VASRebateStructureId]         INT           NULL,
    [VASConvenienceFeeId]          INT           NULL,
    [DailyLimit]                   MONEY         NULL,
    [CreditRating]                 VARCHAR (10)  NULL,
    [CreditScore]                  INT           NULL,
    [RiskScore]                    INT           NULL,
    [MaxCheque]                    MONEY         NULL,
    [SecurityDeposit]              MONEY         NULL,
    [SecurityDepPersentageUsable]  MONEY         NULL,
    [DebitOrderDayOfWeek]          INT           NULL,
    [Send_SMS_on_deposit]          BIT           NULL,
    [Send_SMS_on_Invoice]          BIT           NULL,
    [Send_SMS_on_Other]            BIT           NULL,
    [Send_SMS_on_Commission]       BIT           NULL,
    [InvoiceSchedule]              INT           NULL,
    [CreditSchedule]               INT           NULL,
    [TurnOverTierId]               INT           NULL,
    [DeviceTypeId]                 INT           NULL,
    [DeviceIsEnabled]              BIT           NULL,
    [DeviceIsActive]               BIT           NULL,
    [InvoiceDevice]                BIT           NULL,
    [MachineId]                    INT           NULL,
    [ExternalMerchant]             VARCHAR (50)  NULL,
    [EnableMerchantReceipts]       BIT           NOT NULL,
    [PrintBarCodes]                BIT           NULL,
    [TransactionTypeOption]        INT           NOT NULL,
    [BankDepDepositFeeStructureId] INT           NULL
);


GO

ALTER TABLE [dbo].[PaymentPlan]
    ADD CONSTRAINT [DF__PaymentPl__Enabl__14E76E4C] DEFAULT ((0)) FOR [EnableMerchantReceipts];


GO



ALTER TABLE [dbo].[PaymentPlan]
    ADD CONSTRAINT [DF__PaymentPl__Print__15DB9285] DEFAULT ((0)) FOR [PrintBarCodes];


GO



ALTER TABLE [dbo].[PaymentPlan]
    ADD CONSTRAINT [DF__PaymentPl__Trans__16CFB6BE] DEFAULT ((1)) FOR [TransactionTypeOption];


GO



ALTER TABLE [dbo].[PaymentPlan]
    ADD CONSTRAINT [PK_PaymentPlan] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



