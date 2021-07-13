CREATE TABLE [dbo].[TempTable] (
    [ID]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Value1] VARCHAR (250) NULL,
    [Value2] VARCHAR (250) NULL,
    [Value3] VARCHAR (250) NULL,
    [Value4] VARCHAR (250) NULL,
    [Value5] VARCHAR (250) NULL,
    [Value6] VARCHAR (250) NULL
);


GO

ALTER TABLE [dbo].[TempTable]
    ADD CONSTRAINT [PK_TempTable] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



