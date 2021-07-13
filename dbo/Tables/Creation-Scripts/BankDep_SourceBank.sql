CREATE TABLE [dbo].[BankDep_SourceBank] (
    [SourceBankId]              INT          IDENTITY (1, 1) NOT NULL,
    [BankName]                  VARCHAR (50) NOT NULL,
    [ProcessPrefix]             VARCHAR (50) NOT NULL,
    [IsDeleted]                 BIT          NOT NULL,
    [CheckMultipleStatement]    BIT          NOT NULL,
    [CheckMultipleNotification] BIT          NOT NULL,
    [CheckMultipleDays]         INT          NOT NULL
);


GO

ALTER TABLE [dbo].[BankDep_SourceBank]
    ADD CONSTRAINT [DF_SourceBank_CheckMultipleDays] DEFAULT ((0)) FOR [CheckMultipleDays];


GO



ALTER TABLE [dbo].[BankDep_SourceBank]
    ADD CONSTRAINT [DF_SourceBank_CheckMultipleNotification] DEFAULT ((0)) FOR [CheckMultipleNotification];


GO



ALTER TABLE [dbo].[BankDep_SourceBank]
    ADD CONSTRAINT [DF_SourceBank_CheckMultipleStatement] DEFAULT ((0)) FOR [CheckMultipleStatement];


GO



ALTER TABLE [dbo].[BankDep_SourceBank]
    ADD CONSTRAINT [PK__BankDep___8C02C4A74B85152B] PRIMARY KEY CLUSTERED ([SourceBankId] ASC) WITH (FILLFACTOR = 90);


GO



