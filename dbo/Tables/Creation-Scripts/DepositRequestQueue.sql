CREATE TABLE [dbo].[DepositRequestQueue] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [Description]           NVARCHAR (256)  NULL,
    [Reference]             NVARCHAR (256)  NULL,
    [Amount]                DECIMAL (18, 2) NULL,
    [AccId]                 INT             NULL,
    [BankAccId]             INT             NULL,
    [PaymentType]           NVARCHAR (64)   NULL,
    [DebitCredit]           CHAR (1)        NULL,
    [CrmCaseNumber]         NVARCHAR (40)   NULL,
    [RequestUser]           NVARCHAR (250)  NULL,
    [ApprovalUser]          NVARCHAR (250)  NULL,
    [Status]                INT             NULL,
    [Type]                  INT             NULL,
    [CashBookUnallocatedId] INT             NULL,
    [Date]                  DATETIME        NULL,
    [DepositId]             INT             NULL,
    [DepositFeeLevel]       INT             NULL,
    [LastMonthTrade]        MONEY           NULL,
    [AccSys]                VARCHAR (50)    NULL,
    [CashbookId]            INT             NULL
);


GO

ALTER TABLE [dbo].[DepositRequestQueue]
    ADD CONSTRAINT [DF_DepositRequestQueue_Status] DEFAULT ((1)) FOR [Status];


GO



ALTER TABLE [dbo].[DepositRequestQueue]
    ADD CONSTRAINT [FK_DepositRequestQueue_DepositRequestStatus] FOREIGN KEY ([Status]) REFERENCES [dbo].[DepositRequestStatus] ([Id]);


GO



ALTER TABLE [dbo].[DepositRequestQueue]
    ADD CONSTRAINT [FK_DepositRequestQueue_DepositRequestType] FOREIGN KEY ([Type]) REFERENCES [dbo].[DepositRequestType] ([Id]);


GO



ALTER TABLE [dbo].[DepositRequestQueue]
    ADD CONSTRAINT [PK_DepositRequestQueue] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



