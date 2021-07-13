CREATE TABLE [dbo].[AccountBadDebtStatus] (
    [AccId]           INT NOT NULL,
    [BadDebtStatusId] INT NOT NULL
);


GO

CREATE CLUSTERED INDEX [ClusteredIndex-20180801-175044]
    ON [dbo].[AccountBadDebtStatus]([AccId] ASC);


GO



