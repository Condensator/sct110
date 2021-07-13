CREATE TABLE [dbo].[BankDep_DepositFeeDetail] (
    [DepFeeDetailId] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DepFeeId]       INT           NOT NULL,
    [FlatPercentage] FLOAT (53)    NULL,
    [IsSliding]      BIT           NULL,
    [MinAmount]      MONEY         NULL,
    [MaxAmount]      MONEY         NULL,
    [IsDeleted]      BIT           NULL,
    [ValidFromDate]  DATETIME      NULL,
    [TrxTypeId]      INT           NULL,
    [ModifiedUser]   NVARCHAR (50) NULL,
    [ModifiedDate]   DATETIME      NULL,
    [FreeDeposits]   INT           NOT NULL
);


GO

ALTER TABLE [dbo].[BankDep_DepositFeeDetail]
    ADD CONSTRAINT [DF__BankDep_D__FreeD__6E0EF902] DEFAULT ((0)) FOR [FreeDeposits];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeDetail]
    ADD CONSTRAINT [DF_BankDep_DepositFeeDetail_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeDetail]
    ADD CONSTRAINT [DF_BankDep_DepositFeeDetail_ValidFromDate] DEFAULT (getdate()) FOR [ValidFromDate];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeDetail]
    ADD CONSTRAINT [PK_BankDep_DepositFeeDetail] PRIMARY KEY CLUSTERED ([DepFeeDetailId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



