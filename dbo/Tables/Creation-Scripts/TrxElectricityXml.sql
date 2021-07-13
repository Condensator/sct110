CREATE TABLE [dbo].[TrxElectricityXml] (
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

ALTER TABLE [dbo].[TrxElectricityXml]
    ADD CONSTRAINT [PK_TrxElectricityXml_New2] PRIMARY KEY CLUSTERED ([Id] ASC) ON [DATA_AUX];


GO



CREATE NONCLUSTERED INDEX [ndxActIdEventTypeInOutbigint2]
    ON [dbo].[TrxElectricityXml]([ActId] ASC, [EventType] ASC, [InOut] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTEXMeterNewbigint2]
    ON [dbo].[TrxElectricityXml]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxElecAccIdNewbigint2]
    ON [dbo].[TrxElectricityXml]([ActId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE TRIGGER [dbo].[xmlRaveReprintNew5] ON [dbo].[TrxElectricityXml] AFTER Insert
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
DISABLE TRIGGER [dbo].[xmlRaveReprintNew5]
    ON [dbo].[TrxElectricityXml];


GO



