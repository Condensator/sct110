CREATE TABLE [dbo].[TrxElectricity] (
    [Id]             BIGINT         IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]          BIGINT         NULL,
    [MeterNum]       VARCHAR (50)   NULL,
    [TrxAmount]      MONEY          NULL,
    [BuildResponse]  VARCHAR (5000) NULL,
    [IsDeleted]      BIT            NOT NULL,
    [TrxTypeId]      INT            NULL,
    [DevId]          INT            NULL,
    [Reference]      VARCHAR (150)  NULL,
    [Date]           DATETIME       NULL,
    [Status]         INT            NULL,
    [TrxId_Reversal] BIGINT         NULL,
    [Printed]        BIT            NULL,
    [NoRevend]       BIT            NULL,
    [BinReason]      VARCHAR (50)   NULL,
    [Kwh]            MONEY          NULL,
    [FbekWh]         REAL           NULL,
    [CreditkWh]      REAL           NULL,
    [Arrears]        REAL           NULL,
    [ModifiedUser]   NVARCHAR (50)  NULL,
    [ModifiedDate]   DATETIME       NULL,
    [Guid]           VARCHAR (20)   NULL,
    [UnitType]       VARCHAR (50)   NULL,
    [dtTimestamp]    ROWVERSION     NOT NULL
);


GO

ALTER TABLE [dbo].[TrxElectricity]
    ADD CONSTRAINT [DF_TrxElectricity__IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxElectricity]
    ADD CONSTRAINT [DF_TrxElectricity__NoRevend] DEFAULT ((0)) FOR [NoRevend];


GO



ALTER TABLE [dbo].[TrxElectricity]
    ADD CONSTRAINT [DF_TrxElectricity__Printed] DEFAULT ((0)) FOR [Printed];


GO



ALTER TABLE [dbo].[TrxElectricity]
    ADD CONSTRAINT [PK_TrxElectricity_Id] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 100);


GO




create TRIGGER [dbo].[trg_BinUpdate] on [dbo].[TrxElectricity] AFTER UPDATE
AS BEGIN

	SET NOCOUNT ON;

  declare @MeterNum varchar(50);
  declare @Amount money;
	declare @Status int;
	declare @Printed int;
	declare @TrxId int;
	declare @TrxTypeId int;
	
	SELECT @Status = Status, 
	       @Printed = Printed, 
	       @MeterNum = MeterNum, 
	       @Amount = TrxAmount, 
	       @TrxId = TrxId, 
	       @TrxTypeId = TrxTypeId 
	FROM inserted;

	if (@Status = 2 and @Amount > 0)
	BEGIN
		delete from TrxElectricityBin where TrxId = @TrxId;
	
		INSERT INTO TrxElectricityBin(MeterNum, Amount, TrxId, TrxTypeId)
		  values (@MeterNum, @Amount, @TrxId, @TrxTypeId);
		
	END 
	
	if (@Printed = 1 and @Amount > 0)
	BEGIN
	
	  update TrxElectricityBin set used = @TrxId, DateOut = current_timestamp where TrxId = @TrxId
		
	END

END
GO





CREATE TRIGGER [dbo].[trg_BinUpdateNew] ON [dbo].[TrxElectricity]
AFTER UPDATE
AS
	 BEGIN

		 SET NOCOUNT ON;

		 DECLARE @MeterNum VARCHAR(50);
		 DECLARE @Amount MONEY;
		 DECLARE @Status INT;
		 DECLARE @Printed INT;
		 DECLARE @TrxId BIGINT;
		 DECLARE @TrxTypeId INT;
		 DECLARE @NoRevend INT;
		 DECLARE @ModifiedUser VARCHAR(50);
		 DECLARE @BinReason VARCHAR(50);

		 SELECT @Status = Status,
				@Printed = Printed,
				@MeterNum = MeterNum,
				@Amount = TrxAmount,
				@TrxId = TrxId,
				@TrxTypeId = TrxTypeId,
				@NoRevend = NoRevend,
				@ModifiedUser = ModifiedUser,
				@BinReason = BinReason
		 FROM inserted;

		 IF(@Status = 2
			AND @Amount > 0
			AND @NoRevend = 0)
			 BEGIN

				 DELETE FROM TrxElectricityBin
				 WHERE TrxId = @TrxId;

				 INSERT INTO TrxElectricityBin
				 (MeterNum,
				  Amount,
				  TrxId,
				  TrxTypeId,
				  ModifiedUser,
				  ModifiedDate,
				  BinReason
				 )
				 VALUES
				 (@MeterNum,
				  @Amount,
				  @TrxId,
				  @TrxTypeId,
				  @ModifiedUser,
				  GETDATE(),
				  @BinReason
				 );

			 END;

		 IF(@Status = 3
			AND @Amount > 0
			AND @NoRevend = 0)
			 BEGIN

				 UPDATE TrxElectricityBin
				   SET
					   used = @TrxId,
					   DateOut = current_timestamp
				 WHERE TrxId = @TrxId;

			 END;

	 END;
GO
DISABLE TRIGGER [dbo].[trg_BinUpdateNew]
    ON [dbo].[TrxElectricity];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxElectricity_Date]
    ON [dbo].[TrxElectricity]([Date] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxElectricity_MeterNumber]
    ON [dbo].[TrxElectricity]([MeterNum] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxElectricity_Status]
    ON [dbo].[TrxElectricity]([Status] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [Idx_TrxElectricity_-TrxId]
    ON [dbo].[TrxElectricity]([TrxId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Idx_TrxElectricity_TrxType]
    ON [dbo].[TrxElectricity]([TrxTypeId] ASC) WITH (FILLFACTOR = 100, ALLOW_PAGE_LOCKS = OFF)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxElectricity_After] ON [dbo].[TrxElectricity]
AFTER DELETE 

AS 

BEGIN 
  SET NOCOUNT ON
  
INSERT INTO AEON_SA_Archive..TrxElectricityArchive 
(Id,TrxId,MeterNum,TrxAmount,BuildResponse,IsDeleted,TrxTypeId,DevId,Reference,Date,Status
,TrxId_Reversal,Printed,NoRevend,Kwh,FbekWh,CreditkWh,Arrears,Guid)  

SELECT 
Id,TrxId,MeterNum,TrxAmount,BuildResponse,IsDeleted,TrxTypeId,DevId,Reference,Date,Status
,TrxId_Reversal,Printed,NoRevend,Kwh,FbekWh,CreditkWh,Arrears,Guid
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

--DELETE FROM TrxElectricityXml 
--WHERE EXISTS(SELECT TrxId FROM deleted WHERE TrxElectricityXml.ActId = deleted.TrxId)


END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_TrxElectricity_After]
    ON [dbo].[TrxElectricity];


GO



