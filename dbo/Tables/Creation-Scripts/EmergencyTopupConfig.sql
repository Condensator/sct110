CREATE TABLE [dbo].[EmergencyTopupConfig] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [AccId]                         INT           NOT NULL,
    [EmergencyLoanCreditLimit]      MONEY         NULL,
    [EmergencyLoanMaxPaybackPeriod] INT           NULL,
    [EmergencyLoanApplicationCount] INT           NULL,
    [EmergencyLoanLastRequestDate]  DATETIME      NULL,
    [EmergencyLoanIsPercentage]     BIT           NULL,
    [EmergencyLoanAdminFee]         MONEY         NULL,
    [EmergencyLoanApprovalDate]     DATETIME      NULL,
    [EmergencyLoanCreditBalance]    MONEY         NULL,
    [EmergencyLoanMaxCredit]        MONEY         NULL,
    [EmergencyLoanStatus]           INT           NULL,
    [EmergencyLoanQualified]        BIT           NULL,
    [TradingSince]                  DATETIME      NULL,
    [EmergencyLoanStaticLimit]      BIT           NULL,
    [EmergencyLoanDeposit]          INT           NULL,
    [ModifiedUser]                  NVARCHAR (50) NULL,
    [ModifiedDate]                  DATETIME      NULL
);


GO

ALTER TABLE [dbo].[EmergencyTopupConfig]
    ADD CONSTRAINT [DF__Emergency__Emerg__4F10874F] DEFAULT ((3)) FOR [EmergencyLoanMaxPaybackPeriod];


GO



ALTER TABLE [dbo].[EmergencyTopupConfig]
    ADD CONSTRAINT [DF__Emergency__Emerg__5004AB88] DEFAULT ((0)) FOR [EmergencyLoanIsPercentage];


GO



ALTER TABLE [dbo].[EmergencyTopupConfig]
    ADD CONSTRAINT [DF__Emergency__Emerg__50F8CFC1] DEFAULT ((0)) FOR [EmergencyLoanQualified];


GO



ALTER TABLE [dbo].[EmergencyTopupConfig]
    ADD CONSTRAINT [DF_EmergencyTopupConfig_EmergencyLoanDeposit] DEFAULT ((2)) FOR [EmergencyLoanDeposit];


GO



ALTER TABLE [dbo].[EmergencyTopupConfig]
    ADD CONSTRAINT [DF_EmergencyTopupConfig_EmergencyLoanStaticLimit] DEFAULT ((0)) FOR [EmergencyLoanStaticLimit];


GO



CREATE NONCLUSTERED INDEX [ndxAccId]
    ON [dbo].[EmergencyTopupConfig]([AccId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxEmerTopupConfig]
    ON [dbo].[EmergencyTopupConfig]([ID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



