CREATE TABLE [dbo].[AccType] (
    [AccTypeId]           INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]         VARCHAR (20) NOT NULL,
    [AccPrefix]           CHAR (3)     NOT NULL,
    [AccNextNumber]       INT          NOT NULL,
    [AutoLoad]            BIT          NULL,
    [IsDeleted]           BIT          NOT NULL,
    [AllowDeposits]       BIT          NULL,
    [TransferFromAccount] BIT          NULL,
    [TransferToAccount]   BIT          NULL,
    [TenantId]            INT          NULL
);


GO

ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [DF_AccType_AccNextNumber] DEFAULT ((1)) FOR [AccNextNumber];


GO



ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [DF_AccType_AllowDeposits] DEFAULT ((0)) FOR [AllowDeposits];


GO



ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [DF_AccType_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [DF_AccType_TransferFromAccount] DEFAULT ((0)) FOR [TransferFromAccount];


GO



ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [DF_AccType_TransferToAccount] DEFAULT ((0)) FOR [TransferToAccount];


GO



ALTER TABLE [dbo].[AccType]
    ADD CONSTRAINT [PK_AccType] PRIMARY KEY CLUSTERED ([AccTypeId] ASC) WITH (FILLFACTOR = 90);


GO



