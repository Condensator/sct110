CREATE TABLE [dbo].[TrxElectricityXmlHistoryArchive] (
    [Id]          BIGINT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ActId]       INT            NULL,
    [DevId]       INT            NULL,
    [EventType]   VARCHAR (50)   NULL,
    [MeterNum]    VARCHAR (50)   NULL,
    [XMLData]     VARCHAR (5000) NULL,
    [ReqDateTime] DATETIME       NULL,
    [InOut]       INT            NULL,
    [ErrorType]   VARCHAR (50)   NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxTrxElecAccIdNew2]
    ON [dbo].[TrxElectricityXmlHistoryArchive]([ActId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE TRIGGER [dbo].[xmlRaveReprintNew2] ON [dbo].[TrxElectricityXmlHistoryArchive] AFTER Insert
AS 
BEGIN
	SET NOCOUNT ON;

	declare @InOut int;
	declare @Event varchar(50);
	
	SELECT @InOut = InOut, @Event = EventType FROM inserted

	if (@InOut = 1) and (@Event = 'GetVoucher')
	BEGIN
		INSERT INTO TrxElectricityXmlReprints([Id]
	,[ActId]
           ,[DevId]
           ,[EventType]
           ,[MeterNum]
           ,[XMLData]
           ,[ReqDateTime]
           ,[InOut])
		  select [Id]
	,[ActId]
           ,[DevId]
           ,[EventType]
           ,[MeterNum]
           ,[XMLData]
           ,[ReqDateTime]
           ,[InOut] FROM inserted
	END
END
GO



