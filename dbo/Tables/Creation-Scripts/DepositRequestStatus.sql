CREATE TABLE [dbo].[DepositRequestStatus] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (10) NOT NULL
);


GO

ALTER TABLE [dbo].[DepositRequestStatus]
    ADD CONSTRAINT [PK_DepositRequestStatus] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



