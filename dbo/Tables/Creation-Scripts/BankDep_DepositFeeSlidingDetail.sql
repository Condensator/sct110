CREATE TABLE [dbo].[BankDep_DepositFeeSlidingDetail] (
    [DepFeeSlidingId] INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DepFeeDetailId]  INT           NULL,
    [BottomAmount]    MONEY         NULL,
    [Percentage]      MONEY         NULL,
    [IsDeleted]       BIT           NULL,
    [ModifiedUser]    NVARCHAR (50) NULL,
    [ModifiedDate]    DATETIME      NULL
);


GO

ALTER TABLE [dbo].[BankDep_DepositFeeSlidingDetail]
    ADD CONSTRAINT [DF_BankDep_DepositFeeSlidingDetail_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];


GO



ALTER TABLE [dbo].[BankDep_DepositFeeSlidingDetail]
    ADD CONSTRAINT [FK_BankDep_DepositFeeSlidingDetail_BankDep_DepositFeeDetail] FOREIGN KEY ([DepFeeDetailId]) REFERENCES [dbo].[BankDep_DepositFeeDetail] ([DepFeeDetailId]);


GO



ALTER TABLE [dbo].[BankDep_DepositFeeSlidingDetail]
    ADD CONSTRAINT [PK_BankDep_ComSlidingDetails] PRIMARY KEY CLUSTERED ([DepFeeSlidingId] ASC) WITH (FILLFACTOR = 90);


GO



