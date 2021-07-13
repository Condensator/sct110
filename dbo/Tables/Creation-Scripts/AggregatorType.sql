CREATE TABLE [dbo].[AggregatorType] (
    [Id]             INT          NOT NULL,
    [AggregatorType] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[AggregatorType]
    ADD CONSTRAINT [PK__Aggregat__3214EC0765A2B204] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



