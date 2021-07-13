CREATE TABLE [dbo].[CommissionStructuresAirtime] (
    [ID]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (250) NULL,
    [IsDeleted]   BIT           NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxCommStructAirtimeId]
    ON [dbo].[CommissionStructuresAirtime]([ID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



