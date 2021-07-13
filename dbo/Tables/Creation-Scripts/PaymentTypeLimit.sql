CREATE TABLE [dbo].[PaymentTypeLimit] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (20) NOT NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-174528]
    ON [dbo].[PaymentTypeLimit]([Id] ASC);


GO



