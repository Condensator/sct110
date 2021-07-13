CREATE TABLE [dbo].[CashDepositFeeProcessStatus] (
    [Id]          INT           NOT NULL,
    [Description] NVARCHAR (50) NULL,
    [IsDeleted]   BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[CashDepositFeeProcessStatus]
    ADD CONSTRAINT [DF__CashDepos__IsDel__371BCBF5] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[CashDepositFeeProcessStatus]
    ADD CONSTRAINT [PK_CashDepositFeeProcessStatus] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



