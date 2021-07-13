CREATE TABLE [dbo].[DevTrxTypes_Audit] (
    [DevTrxId]         INT          NOT NULL,
    [DevId]            INT          NULL,
    [TrxTypeId]        INT          NULL,
    [AccId]            INT          NULL,
    [IsDeleted]        BIT          NOT NULL,
    [RebateApplicable] BIT          NOT NULL,
    [CardAcceptorId]   VARCHAR (15) NOT NULL,
    [AuditDataState]   VARCHAR (10) NULL,
    [AuditDMLAction]   VARCHAR (10) NULL,
    [AuditUser]        [sysname]    NULL,
    [AuditDateTime]    DATETIME     NOT NULL,
    [MaxTranAmount]    MONEY        NOT NULL
);


GO

ALTER TABLE [dbo].[DevTrxTypes_Audit]
    ADD CONSTRAINT [DF__DevTrxTyp__MaxTr__406CBC23] DEFAULT ((0)) FOR [MaxTranAmount];


GO



ALTER TABLE [dbo].[DevTrxTypes_Audit]
    ADD CONSTRAINT [DF_DevTrxTypes_Audit_AuditDateTime] DEFAULT (getdate()) FOR [AuditDateTime];


GO



