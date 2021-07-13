CREATE TABLE [dbo].[TrxElectricityXmlArchive] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ActId]       INT           NULL,
    [DevId]       INT           NULL,
    [EventType]   VARCHAR (50)  NULL,
    [MeterNum]    VARCHAR (50)  NULL,
    [XMLData]     VARCHAR (MAX) NULL,
    [ReqDateTime] DATETIME      NULL,
    [InOut]       INT           NULL,
    [ErrorType]   VARCHAR (50)  NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxActIdEventTypeInOut2]
    ON [dbo].[TrxElectricityXmlArchive]([ActId] ASC, [EventType] ASC, [InOut] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [ndxEXidNew3]
    ON [dbo].[TrxElectricityXmlArchive]([Id] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReqDateTime3]
    ON [dbo].[TrxElectricityXmlArchive]([ReqDateTime] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTEXMeterNew3]
    ON [dbo].[TrxElectricityXmlArchive]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[xmlRaveReprintNew3] ON [dbo].[TrxElectricityXmlArchive] AFTER Insert
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



