CREATE TABLE [dbo].[TrxBillPaymentDetail] (
    [id]                   INT           IDENTITY (1, 1) NOT NULL,
    [OperationType]        VARCHAR (50)  NULL,
    [TrxId]                BIGINT        NOT NULL,
    [ProviderId]           INT           NOT NULL,
    [ProductId]            INT           NOT NULL,
    [DevId]                INT           NULL,
    [TransDateTime]        DATETIME      NOT NULL,
    [PaymentMethod]        VARCHAR (25)  NULL,
    [AccountNumber]        VARCHAR (128) NULL,
    [BillNumber]           VARCHAR (150) NULL,
    [SubscrberPhoneNumber] VARCHAR (150) NULL,
    [CardNumber]           VARCHAR (150) NULL,
    [ReferenceNumber]      VARCHAR (150) NULL,
    [AgentID]              VARCHAR (150) NULL,
    [AgentName]            VARCHAR (150) NULL,
    [TerminalNumber]       VARCHAR (150) NULL,
    [TrxAmount]            MONEY         NULL,
    [RequestID]            VARCHAR (150) NULL,
    [Param1]               VARCHAR (150) NULL,
    [Param2]               VARCHAR (150) NULL,
    [Param3]               VARCHAR (150) NULL,
    [Status]               INT           NOT NULL
);


GO

ALTER TABLE [dbo].[TrxBillPaymentDetail]
    ADD CONSTRAINT [DF__TrxBillPa__Statu__5DCB0C43] DEFAULT ((0)) FOR [Status];


GO



ALTER TABLE [dbo].[TrxBillPaymentDetail]
    ADD CONSTRAINT [DF__TrxBillPa__Trans__5CD6E80A] DEFAULT (getdate()) FOR [TransDateTime];


GO



ALTER TABLE [dbo].[TrxBillPaymentDetail]
    ADD CONSTRAINT [pk_bpd] PRIMARY KEY CLUSTERED ([id] ASC);


GO



