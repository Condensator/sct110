CREATE TABLE [dbo].[TrxElectricityXmlHistoryOld] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ActId]       BIGINT        NULL,
    [DevId]       INT           NULL,
    [EventType]   VARCHAR (50)  NULL,
    [MeterNum]    VARCHAR (50)  NULL,
    [XMLData]     VARCHAR (MAX) NULL,
    [ReqDateTime] DATETIME      NULL,
    [InOut]       INT           NULL,
    [ErrorType]   VARCHAR (50)  NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxActIdEventTypeInOutbigint]
    ON [dbo].[TrxElectricityXmlHistoryOld]([ActId] ASC, [EventType] ASC, [InOut] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReqDateTimebigint]
    ON [dbo].[TrxElectricityXmlHistoryOld]([ReqDateTime] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTEXMeterNewbigint]
    ON [dbo].[TrxElectricityXmlHistoryOld]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[xmlRaveReprintNewbigintHistory] ON [dbo].[TrxElectricityXmlHistoryOld] AFTER Insert
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



