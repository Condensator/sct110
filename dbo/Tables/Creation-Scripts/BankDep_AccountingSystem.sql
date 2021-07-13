CREATE TABLE [dbo].[BankDep_AccountingSystem] (
    [AccSystemId]          INT          NOT NULL,
    [SystemName]           VARCHAR (50) NOT NULL,
    [CashDepTrxTypeId]     INT          NULL,
    [IsDeleted]            BIT          NOT NULL,
    [DepositAccountPrefix] VARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[BankDep_AccountingSystem]
    ADD CONSTRAINT [PK__BankDep___1C3541F02FDCFAB6] PRIMARY KEY CLUSTERED ([AccSystemId] ASC);


GO



