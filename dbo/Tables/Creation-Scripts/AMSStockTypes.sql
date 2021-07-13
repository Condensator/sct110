CREATE TABLE [dbo].[AMSStockTypes] (
    [Id]          INT          NOT NULL,
    [Description] VARCHAR (64) NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [ndxAMSStockTypesId]
    ON [dbo].[AMSStockTypes]([Id] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



