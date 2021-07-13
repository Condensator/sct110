CREATE TABLE [dbo].[DebitOrderBankAccount] (
    [id]            INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AccId]         INT            NOT NULL,
    [AccHolderName] NVARCHAR (150) NULL,
    [BankName]      NVARCHAR (50)  NULL,
    [AccNumber]     NVARCHAR (50)  NULL,
    [BranchCode]    NCHAR (20)     NULL,
    [AccType]       NVARCHAR (20)  NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_DebitOrderBankAccount_AccId]
    ON [dbo].[DebitOrderBankAccount]([AccId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DebitOrderBankAccount]
    ADD CONSTRAINT [PK_DebitOrderBankAccount] PRIMARY KEY CLUSTERED ([id] ASC);


GO



