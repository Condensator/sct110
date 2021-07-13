CREATE TABLE [dbo].[ConsolidatedInvoiceSMS] (
    [Id]                BIGINT        IDENTITY (1, 1) NOT NULL,
    [AccId]             INT           NOT NULL,
    [SendSMS]           BIT           NOT NULL,
    [SMSNumber]         VARCHAR (20)  NOT NULL,
    [SMSMessage]        VARCHAR (180) NOT NULL,
    [AvailableBalance]  MONEY         NOT NULL,
    [IsDeposit]         BIT           NOT NULL,
    [OverdueAmount]     MONEY         NOT NULL,
    [TranAmount]        MONEY         NOT NULL,
    [AccNr]             VARCHAR (20)  NOT NULL,
    [LastDepositAmount] MONEY         NOT NULL,
    [LastDepositDate]   DATETIME      NOT NULL,
    [IsInvoice]         BIT           NOT NULL,
    [SMSSend]           BIT           DEFAULT ((0)) NOT NULL,
    [SentDate]          DATETIME      NULL
);


GO

CREATE NONCLUSTERED INDEX [idx_ConsolidatedInvoiceSMS_AccId]
    ON [dbo].[ConsolidatedInvoiceSMS]([AccId] ASC)
    INCLUDE([SMSSend]);


GO



CREATE NONCLUSTERED INDEX [idx_ConsolidatedInvoiceSMS_SMSSent_SentDate]
    ON [dbo].[ConsolidatedInvoiceSMS]([SendSMS] ASC, [SentDate] ASC);


GO



ALTER TABLE [dbo].[ConsolidatedInvoiceSMS]
    ADD CONSTRAINT [PK_ConsolidatedInvoiceSMS] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



