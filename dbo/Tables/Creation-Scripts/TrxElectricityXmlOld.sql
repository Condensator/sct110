CREATE TABLE [dbo].[TrxElectricityXmlOld] (
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

ALTER TABLE [dbo].[TrxElectricityXmlOld]
    ADD CONSTRAINT [PK_TrxElectricityXml] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxActIdEventTypeInOutbigint]
    ON [dbo].[TrxElectricityXmlOld]([ActId] ASC, [EventType] ASC, [InOut] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTEXMeterNewbigint]
    ON [dbo].[TrxElectricityXmlOld]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE TRIGGER [dbo].[xmlRaveReprintNewbigint] ON [dbo].[TrxElectricityXmlOld]
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @InOut INT;
	DECLARE @Event VARCHAR(50);

	SELECT @InOut = InOut,
		@Event = EventType
	FROM inserted

	IF (@InOut = 1)
		AND (@Event = 'GetVoucher')
	BEGIN
		INSERT INTO TrxElectricityXmlReprints (
			[Id],
			[ActId],
			[DevId],
			[EventType],
			[MeterNum],
			[XMLData],
			[ReqDateTime],
			[InOut]
			)
		SELECT [Id],
			[ActId],
			[DevId],
			[EventType],
			[MeterNum],
			[XMLData],
			[ReqDateTime],
			[InOut]
		FROM inserted
	END
END
GO



