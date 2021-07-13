CREATE TABLE [dbo].[PaymentType] (
    [Id]          INT          NOT NULL,
    [Description] VARCHAR (20) NOT NULL
);


GO

ALTER TABLE [dbo].[PaymentType]
    ADD CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



