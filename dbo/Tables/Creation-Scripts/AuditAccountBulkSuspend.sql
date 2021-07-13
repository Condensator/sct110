CREATE TABLE [dbo].[AuditAccountBulkSuspend] (
    [id]            INT           IDENTITY (1, 1) NOT NULL,
    [AccId]         INT           NULL,
    [ModifiedUser]  NVARCHAR (50) NULL,
    [ModifiedDate]  DATETIME      NULL,
    [SuspendResult] NVARCHAR (10) NULL,
    [AccountNumber] NVARCHAR (50) NULL,
    [SuspendAction] NVARCHAR (3)  NULL,
    [SuspendMode]   NVARCHAR (9)  NULL
);


GO

ALTER TABLE [dbo].[AuditAccountBulkSuspend]
    ADD CONSTRAINT [PK_AuditAccountBulkSuspend] PRIMARY KEY CLUSTERED ([id] ASC);


GO



