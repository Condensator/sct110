CREATE TABLE [dbo].[DepositRequestType] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[DepositRequestType]
    ADD CONSTRAINT [PK_DepositRequestType] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



