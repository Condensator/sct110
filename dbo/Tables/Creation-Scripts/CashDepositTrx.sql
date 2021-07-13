CREATE TABLE [dbo].[CashDepositTrx] (
    [Id]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [TranReference]      NVARCHAR (55)   NOT NULL,
    [TranDate]           NVARCHAR (14)   NOT NULL,
    [TranType]           INT             NOT NULL,
    [ClientCode]         NVARCHAR (20)   NOT NULL,
    [FlashNr]            INT             NOT NULL,
    [Canister]           NVARCHAR (20)   NOT NULL,
    [SealNr]             NVARCHAR (20)   NOT NULL,
    [CardName]           NVARCHAR (255)  NOT NULL,
    [CardNumber]         BIGINT          NOT NULL,
    [TotalNumberOfNotes] INT             NOT NULL,
    [Amount]             DECIMAL (18, 2) NOT NULL,
    [ExternalReference]  NVARCHAR (40)   NOT NULL,
    [TransIndex]         BIGINT          NOT NULL,
    [Result]             NVARCHAR (20)   NULL,
    [EventDate]          DATETIME        NOT NULL
);


GO

ALTER TABLE [dbo].[CashDepositTrx]
    ADD CONSTRAINT [DF__CashDepos__Event__2000228A] DEFAULT (getdate()) FOR [EventDate];


GO



ALTER TABLE [dbo].[CashDepositTrx]
    ADD CONSTRAINT [PK_CashDepositTrx] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



