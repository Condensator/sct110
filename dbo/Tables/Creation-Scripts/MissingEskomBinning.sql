CREATE TABLE [dbo].[MissingEskomBinning] (
    [MeterNum]      VARCHAR (50)   NULL,
    [Buildresponse] VARCHAR (2000) NULL,
    [id]            INT            IDENTITY (1, 1) NOT NULL,
    [Processed]     BIT            NULL
);


GO

CREATE NONCLUSTERED INDEX [Meternum]
    ON [dbo].[MissingEskomBinning]([MeterNum] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Processed]
    ON [dbo].[MissingEskomBinning]([Processed] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



