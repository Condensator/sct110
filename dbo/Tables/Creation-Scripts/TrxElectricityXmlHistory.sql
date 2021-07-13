CREATE TABLE [dbo].[TrxElectricityXmlHistory] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ActId]       BIGINT        NULL,
    [DevId]       INT           NULL,
    [EventType]   VARCHAR (50)  NULL,
    [MeterNum]    VARCHAR (50)  NULL,
    [XMLData]     VARCHAR (MAX) NULL,
    [ReqDateTime] DATETIME      NULL,
    [InOut]       INT           NULL,
    [ErrorType]   VARCHAR (50)  NULL
) ON [DATA_AUX] TEXTIMAGE_ON [DATA_AUX];


GO

ALTER TABLE [dbo].[TrxElectricityXmlHistory]
    ADD CONSTRAINT [PK_TrxElectricityXml_New] PRIMARY KEY CLUSTERED ([Id] ASC) ON [DATA_AUX];


GO



CREATE NONCLUSTERED INDEX [ndxActIdEventTypeInOutbigint]
    ON [dbo].[TrxElectricityXmlHistory]([ActId] ASC, [EventType] ASC, [InOut] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTEXMeterNewbigint]
    ON [dbo].[TrxElectricityXmlHistory]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxElecAccIdNewbigint]
    ON [dbo].[TrxElectricityXmlHistory]([ActId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO




CREATE TRIGGER [dbo].[xmlRaveReprintNew4] ON [dbo].[TrxElectricityXmlHistory] AFTER Insert
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



