CREATE TABLE [dbo].[DepositFeeCharge] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [AccId]          INT           NOT NULL,
    [AccTransTypeId] INT           NOT NULL,
    [Type]           CHAR (1)      NOT NULL,
    [CashBookId]     INT           NOT NULL,
    [Reference]      VARCHAR (255) NOT NULL,
    [Description]    VARCHAR (255) NOT NULL,
    [AmountExcl]     MONEY         NOT NULL,
    [AmountIncl]     MONEY         NOT NULL,
    [TimeStamp]      DATETIME      NOT NULL,
    [ProcessDate]    DATETIME      NULL,
    [ProcessStatus]  INT           NOT NULL,
    [ProcessingUser] VARCHAR (256) NOT NULL
);


GO

ALTER TABLE [dbo].[DepositFeeCharge]
    ADD CONSTRAINT [DF_DepositFeeCharge_ProcessStatus] DEFAULT ((0)) FOR [ProcessStatus];


GO



ALTER TABLE [dbo].[DepositFeeCharge]
    ADD CONSTRAINT [DF_DepositFeeCharge_TimeStamp] DEFAULT (getdate()) FOR [TimeStamp];


GO



ALTER TABLE [dbo].[DepositFeeCharge]
    ADD CONSTRAINT [DF_DepositFeeCharge_Type] DEFAULT ('D') FOR [Type];


GO



ALTER TABLE [dbo].[DepositFeeCharge]
    ADD CONSTRAINT [DF_Table_1_SystemUser] DEFAULT ('System') FOR [ProcessingUser];


GO



