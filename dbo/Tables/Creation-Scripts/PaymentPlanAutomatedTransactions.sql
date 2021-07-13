CREATE TABLE [dbo].[PaymentPlanAutomatedTransactions] (
    [PaymentPlanId]             INT           NOT NULL,
    [Account_TransactionTypeID] INT           NOT NULL,
    [IsSliding]                 BIT           NOT NULL,
    [SlidingValue]              MONEY         NOT NULL,
    [AmountBelowSliding]        MONEY         NOT NULL,
    [AmountAboveSliding]        MONEY         NOT NULL,
    [DayToIssue]                VARCHAR (255) NOT NULL,
    [DebitCredit]               CHAR (1)      NULL,
    [VAT]                       BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[PaymentPlanAutomatedTransactions]
    ADD CONSTRAINT [FK_PaymentPlanAutomatedTransactions_Account_TransactionType] FOREIGN KEY ([Account_TransactionTypeID]) REFERENCES [dbo].[Account_TransactionType] ([ID]);


GO



ALTER TABLE [dbo].[PaymentPlanAutomatedTransactions]
    ADD CONSTRAINT [FK_PaymentPlanAutomatedTransactions_PaymentPlan] FOREIGN KEY ([PaymentPlanId]) REFERENCES [dbo].[PaymentPlan] ([Id]);


GO



ALTER TABLE [dbo].[PaymentPlanAutomatedTransactions]
    ADD CONSTRAINT [PK_PaymentPlanAutomatedTransactions] PRIMARY KEY CLUSTERED ([PaymentPlanId] ASC, [Account_TransactionTypeID] ASC);


GO



