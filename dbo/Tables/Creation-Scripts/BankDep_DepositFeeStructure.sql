CREATE TABLE [dbo].[BankDep_DepositFeeStructure] (
    [DepFeeId]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]  VARCHAR (250) NULL,
    [TradeLimit]   MONEY         NULL,
    [IsDeleted]    BIT           NULL,
    [ModifiedUser] NVARCHAR (50) NULL,
    [ModifiedDate] DATETIME      NULL
);


GO

ALTER TABLE [dbo].[BankDep_DepositFeeStructure]
    ADD CONSTRAINT [DF_BankDep_DepositFeeStructure_Description] DEFAULT ('New') FOR [Description];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeStructure]
    ADD CONSTRAINT [DF_BankDep_DepositFeeStructure_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeStructure]
    ADD CONSTRAINT [DF_BankDep_DepositFeeStructure_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeStructure]
    ADD CONSTRAINT [DF_BankDep_DepositFeeStructure_TradeLimit] DEFAULT ((0)) FOR [TradeLimit];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeStructure]
    ADD CONSTRAINT [PK_BankDep_DepositFeeStructure] PRIMARY KEY CLUSTERED ([DepFeeId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



