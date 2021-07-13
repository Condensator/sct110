CREATE TABLE [dbo].[Trx] (
    [TrxId]               BIGINT        IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [AccId]               INT           NOT NULL,
    [DevId]               INT           NULL,
    [ShfId]               INT           NOT NULL,
    [DevUsrId]            INT           NULL,
    [FullAmount]          MONEY         NOT NULL,
    [BillAmount]          MONEY         NOT NULL,
    [TransDateTime]       DATETIME      NOT NULL,
    [PaymentTypeId]       INT           NULL,
    [InvDetailId]         INT           NULL,
    [Status]              INT           NULL,
    [CustId]              INT           NULL,
    [ReqDateTime]         DATETIME      NULL,
    [TrxTypeId]           INT           NOT NULL,
    [Reference]           VARCHAR (50)  NULL,
    [IsDeleted]           BIT           NOT NULL,
    [IsCredit]            BIT           NULL,
    [SupplierAccID]       INT           NULL,
    [ReversalId]          BIGINT        NULL,
    [ExtReference]        VARCHAR (100) NULL,
    [VatAmount]           MONEY         NULL,
    [Revend_OriginalID]   BIGINT        NULL,
    [ProductId]           INT           NULL,
    [CRDetailId]          INT           NULL,
    [DeviceClearanceId]   INT           NULL,
    [ReconStatus]         BIT           NULL,
    [SupplierInvDetailId] INT           NULL,
    [SupplierReversal]    BIT           NULL,
    [TransRef]            AS            (CONVERT([int],[trxid]%(1000000000),(0))),
    [dtTimestamp]         ROWVERSION    NOT NULL
);


GO

ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF__Trx__SupplierRev__785D46D4Trx_BigInt_New] DEFAULT ((0)) FOR [SupplierReversal];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF__Trx__VatAmount__66CFD91ATrx_BigInt_New] DEFAULT ((0)) FOR [VatAmount];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF_Trx_DevIdTrx_BigInt_New] DEFAULT ((0)) FOR [DevId];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF_Trx_IsCreditTrx_BigInt_New] DEFAULT ((0)) FOR [IsCredit];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF_Trx_IsDeletedTrx_BigInt_New] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [DF_Trx_TransDateTimeTrx_BigInt_New] DEFAULT (getdate()) FOR [TransDateTime];


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_Devices_BigInt_1] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_Devices_BigInt_New] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_InvoiceDetail_BigInt_1] FOREIGN KEY ([InvDetailId]) REFERENCES [dbo].[InvoiceDetail] ([InvDetailId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_InvoiceDetail_BigInt_New] FOREIGN KEY ([InvDetailId]) REFERENCES [dbo].[InvoiceDetail] ([InvDetailId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_TrxTypes_BigInt_1] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [FK_Trx_TrxTypes_BigInt_New] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[Trx]
    ADD CONSTRAINT [PK_Trx_BigInt_NEW] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



CREATE NONCLUSTERED INDEX [idx_Trx_BigInt__New_ClearanceId]
    ON [dbo].[Trx]([DeviceClearanceId] ASC);


GO



CREATE NONCLUSTERED INDEX [idx_Trx_BigInt__New_TrxTypeId_SupplierAccId_ProductId_SupplierInvDetailId]
    ON [dbo].[Trx]([TrxTypeId] ASC, [SupplierAccID] ASC, [Status] ASC)
    INCLUDE([ProductId], [SupplierInvDetailId]);


GO



CREATE NONCLUSTERED INDEX [Indx_DevIdTrx_BigInt_New]
    ON [dbo].[Trx]([DevId] ASC) WITH (ALLOW_PAGE_LOCKS = OFF);


GO



CREATE NONCLUSTERED INDEX [Indx_ExtReferenceTrx_BigInt_New]
    ON [dbo].[Trx]([ExtReference] ASC) WITH (ALLOW_PAGE_LOCKS = OFF);


GO



CREATE NONCLUSTERED INDEX [Indx_InvDetailIdTrx_BigInt_New]
    ON [dbo].[Trx]([InvDetailId] ASC);


GO



CREATE NONCLUSTERED INDEX [Indx_ReversalIdTrx_BigInt_New]
    ON [dbo].[Trx]([ReversalId] ASC);


GO



CREATE NONCLUSTERED INDEX [Indx_StatusTrx_BigInt_New]
    ON [dbo].[Trx]([Status] ASC) WITH (ALLOW_PAGE_LOCKS = OFF);


GO



CREATE NONCLUSTERED INDEX [Indx_TransDateTimeTrx_BigInt_New]
    ON [dbo].[Trx]([TransDateTime] ASC);


GO



CREATE NONCLUSTERED INDEX [indx_TrxTypeIDTrx_BigInt_New]
    ON [dbo].[Trx]([TrxTypeId] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_Trx_ShfId_Status]
    ON [dbo].[Trx]([ShfId] ASC, [Status] ASC)
    INCLUDE([TrxId], [DevUsrId], [FullAmount], [BillAmount], [TrxTypeId], [Reference], [IsCredit]);


GO



CREATE NONCLUSTERED INDEX [IX_Trx_TransRef]
    ON [dbo].[Trx]([TransRef] ASC);


GO



CREATE NONCLUSTERED INDEX [ndx_AccId_Status_Transdatetime_BigInt_New]
    ON [dbo].[Trx]([AccId] ASC, [Status] ASC, [TransDateTime] ASC)
    INCLUDE([TrxId], [DevId], [BillAmount], [PaymentTypeId], [TrxTypeId], [ProductId], [FullAmount], [Reference]);


GO



CREATE NONCLUSTERED INDEX [ndxAccidReversalidTrx_BigInt_New]
    ON [dbo].[Trx]([AccId] ASC, [ReversalId] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxReferenceTrx_BigInt_New]
    ON [dbo].[Trx]([Reference] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxSupplierReversalTrx_BigInt_New]
    ON [dbo].[Trx]([SupplierReversal] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxTrx_DevidTransDateTimeStatus_BigInt_New]
    ON [dbo].[Trx]([DevId] ASC, [TransDateTime] ASC, [Status] ASC)
    INCLUDE([TrxId]);


GO



CREATE TRIGGER [dbo].[utr_DELETE_Trx_InsteadOf_BigInt_1] ON [dbo].[Trx] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON
  
--IF EXISTS (SELECT TrxId from Reprint where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM Reprint WHERE TrxId IN (SELECT TrxId FROM Deleted)

--IF EXISTS (SELECT TrxId from ReprintQueue where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM ReprintQueue WHERE TrxId IN (SELECT TrxId FROM Deleted)

IF EXISTS (SELECT TrxId from TJRecon where TrxId in (SELECT TrxId from Deleted))
DELETE FROM TJRecon WHERE TrxId IN (SELECT TrxId FROM deleted)

--IF EXISTS (SELECT TrxId from TrxElectricityBin_History where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM TrxElectricityBin_History WHERE TrxId IN (SELECT TrxId FROM deleted)

IF EXISTS (SELECT TrxId from TrxElectricityRecon where TrxId in (SELECT TrxId from Deleted))
DELETE FROM TrxElectricityRecon WHERE TrxId IN (SELECT TrxId FROM deleted)

--IF EXISTS (SELECT TrxId from DeviceClearanceTransaction where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM DeviceClearanceTransaction WHERE TrxId IN (SELECT TrxId FROM deleted)

--IF EXISTS (SELECT TrxId from TrxElectricityBin_Removed where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM TrxElectricityBin_Removed WHERE TrxId IN (SELECT TrxId FROM deleted)

--IF EXISTS (SELECT TrxId from TrxElectricityXmlReference where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM TrxElectricityXmlReference WHERE TrxId IN (SELECT TrxId FROM deleted)

--IF EXISTS (SELECT TrxId from TJReversals where TrxId in (SELECT TrxId from Deleted))
--DELETE FROM TJReversals WHERE TrxId IN (SELECT TrxId FROM deleted)

IF EXISTS (SELECT TrxId from TrxTender_Items where TrxId in (SELECT TrxId from Deleted))
DELETE FROM TrxTender_Items WHERE TrxId IN (SELECT TrxId FROM deleted)

IF EXISTS (SELECT TrxId from TrxFees where TrxId in (SELECT TrxId from Deleted))
DELETE FROM TrxFees WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxArchive
(TrxId, AccId, DevId, ShfId, DevUsrId, FullAmount,  
 BillAmount, TransDateTime, PaymentTypeId, InvDetailId, Status,  
 CustId, ReqDateTime, TrxTypeId, Reference, IsDeleted, IsCredit,  
 SupplierAccID, ReversalId, ExtReference, VatAmount, Revend_OriginalID,CRDetailId,DeviceClearanceId,SupplierReversal,TransRef)  
  
SELECT 
TrxId, AccId, DevId, ShfId, DevUsrId, FullAmount, BillAmount, TransDateTime, PaymentTypeId, 
InvDetailId, Status,CustId, ReqDateTime, TrxTypeId, Reference, IsDeleted, IsCredit, SupplierAccID, 
ReversalId, ExtReference, VatAmount, Revend_OriginalID,CRDetailId,DeviceClearanceId,SupplierReversal,TransRef  
FROM 
Deleted 

--Delete From Trx
DELETE FROM Trx WHERE TrxId IN (SELECT TrxId FROM deleted)  

END
GO
DISABLE TRIGGER [dbo].[utr_DELETE_Trx_InsteadOf_BigInt_1]
    ON [dbo].[Trx];


GO






/****** Object:  Trigger [dbo].[utr_INSERT_Trx_AfterInsert]    Script Date: 2019/07/05 9:58:53 AM ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[utr_INSERT_Trx_AfterInsert]
   ON  [dbo].[Trx]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[TrxInvoiceInterim]([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])
	
		SELECT  [TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef]
		FROM inserted
		WHERE Status IN (7,8,22)

END
GO



/****** Object:  Trigger [dbo].[utr_INSERT_Trx_AfterInsert]    Script Date: 2019/07/05 9:58:53 AM ******/

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[utr_INSERT_Trx_AfterInsert_1]
   ON  [dbo].[Trx]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[TrxInvoiceInterim]([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])
	
		SELECT  [TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef]
		FROM inserted
		WHERE Status IN (7,8,22)

END
GO
DISABLE TRIGGER [dbo].[utr_INSERT_Trx_AfterInsert_1]
    ON [dbo].[Trx];


GO





  
  
  
  
  
-- create trigger to move status 3 transactions from Trx to TrxInvoiceInterim  
  
CREATE TRIGGER [dbo].[utr_INSERT_Trx_AfterUpate]  
ON [dbo].[Trx]  
AFTER UPDATE  
AS  
BEGIN  
SET NOCOUNT ON

IF UPDATE(Status) 
  BEGIN
    IF (SELECT TOP 1 Status FROM inserted) != (SELECT TOP 1 Status FROM deleted)
	  BEGIN

		INSERT INTO [dbo].[TrxInvoiceInterim]([TrxId]  
			   ,[AccId]  
			   ,[DevId]  
			   ,[ShfId]  
			   ,[DevUsrId]  
			   ,[FullAmount]  
			   ,[BillAmount]  
			   ,[TransDateTime]  
			   ,[PaymentTypeId]  
			   ,[InvDetailId]  
			   ,[Status]  
			   ,[CustId]  
			   ,[ReqDateTime]  
			   ,[TrxTypeId]  
			   ,[Reference]  
			   ,[IsDeleted]  
			   ,[IsCredit]  
			   ,[SupplierAccID]  
			   ,[ReversalId]  
			   ,[ExtReference]  
			   ,[VatAmount]  
			   ,[Revend_OriginalID]  
			   ,[ProductId]  
			   ,[CRDetailId]  
			   ,[DeviceClearanceId]  
			   ,[ReconStatus]  
			   ,[SupplierInvDetailId]  
			   ,[SupplierReversal]  
			   ,[TransRef])  
   
	  SELECT  [TrxId]  
			   ,[AccId]  
			   ,[DevId]  
			   ,[ShfId]  
			   ,[DevUsrId]  
			   ,[FullAmount]  
			   ,[BillAmount]  
			   ,[TransDateTime]  
			   ,[PaymentTypeId]  
			   ,[InvDetailId]  
			   ,[Status]  
			   ,[CustId]  
			   ,[ReqDateTime]  
			   ,[TrxTypeId]  
			   ,[Reference]  
			   ,[IsDeleted]  
			   ,[IsCredit]  
			   ,[SupplierAccID]  
			   ,[ReversalId]  
			   ,[ExtReference]  
			   ,[VatAmount]  
			   ,[Revend_OriginalID]  
			   ,[ProductId]  
			   ,[CRDetailId]  
			   ,[DeviceClearanceId]  
			   ,[ReconStatus]  
			   ,[SupplierInvDetailId]  
			   ,[SupplierReversal]  
			   ,[TransRef]  
		  FROM inserted i 
		 WHERE Status IN (3,7,8,22) 
		  AND EXISTS(SELECT d.TrxId
						  FROM deleted d
						 WHERE i.TrxId = d.TrxId
						   AND i.Status != d.Status)
	   END  
    END

  SET NOCOUNT OFF
END
GO



-- create trigger to move status 3 transactions from Trx to TrxInvoiceInterim

CREATE TRIGGER [dbo].[utr_INSERT_Trx_AfterUpate_1]
ON [dbo].[Trx]
AFTER UPDATE
AS
BEGIN

	INSERT INTO [dbo].[TrxInvoiceInterim]([TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef])
	
		SELECT  [TrxId]
           ,[AccId]
           ,[DevId]
           ,[ShfId]
           ,[DevUsrId]
           ,[FullAmount]
           ,[BillAmount]
           ,[TransDateTime]
           ,[PaymentTypeId]
           ,[InvDetailId]
           ,[Status]
           ,[CustId]
           ,[ReqDateTime]
           ,[TrxTypeId]
           ,[Reference]
           ,[IsDeleted]
           ,[IsCredit]
           ,[SupplierAccID]
           ,[ReversalId]
           ,[ExtReference]
           ,[VatAmount]
           ,[Revend_OriginalID]
           ,[ProductId]
           ,[CRDetailId]
           ,[DeviceClearanceId]
           ,[ReconStatus]
           ,[SupplierInvDetailId]
           ,[SupplierReversal]
           ,[TransRef]
		FROM inserted
		WHERE Status IN (3,7,8,22)
	END
GO
DISABLE TRIGGER [dbo].[utr_INSERT_Trx_AfterUpate_1]
    ON [dbo].[Trx];


GO




  
  
  
  
  
-- create trigger to move status 3 transactions from Trx to TrxInvoiceInterim  
  
CREATE TRIGGER [dbo].[utr_INSERT_Trx_AfterUpate_20200218]  
ON [dbo].[Trx]  
AFTER UPDATE  
AS  
BEGIN  

IF UPDATE(Status) 
  BEGIN
  
    INSERT INTO [dbo].[TrxInvoiceInterim]([TrxId]  
           ,[AccId]  
           ,[DevId]  
           ,[ShfId]  
           ,[DevUsrId]  
           ,[FullAmount]  
           ,[BillAmount]  
           ,[TransDateTime]  
           ,[PaymentTypeId]  
           ,[InvDetailId]  
           ,[Status]  
           ,[CustId]  
           ,[ReqDateTime]  
           ,[TrxTypeId]  
           ,[Reference]  
           ,[IsDeleted]  
           ,[IsCredit]  
           ,[SupplierAccID]  
           ,[ReversalId]  
           ,[ExtReference]  
           ,[VatAmount]  
           ,[Revend_OriginalID]  
           ,[ProductId]  
           ,[CRDetailId]  
           ,[DeviceClearanceId]  
           ,[ReconStatus]  
           ,[SupplierInvDetailId]  
           ,[SupplierReversal]  
           ,[TransRef])  
   
  SELECT  [TrxId]  
           ,[AccId]  
           ,[DevId]  
           ,[ShfId]  
           ,[DevUsrId]  
           ,[FullAmount]  
           ,[BillAmount]  
           ,[TransDateTime]  
           ,[PaymentTypeId]  
           ,[InvDetailId]  
           ,[Status]  
           ,[CustId]  
           ,[ReqDateTime]  
           ,[TrxTypeId]  
           ,[Reference]  
           ,[IsDeleted]  
           ,[IsCredit]  
           ,[SupplierAccID]  
           ,[ReversalId]  
           ,[ExtReference]  
           ,[VatAmount]  
           ,[Revend_OriginalID]  
           ,[ProductId]  
           ,[CRDetailId]  
           ,[DeviceClearanceId]  
           ,[ReconStatus]  
           ,[SupplierInvDetailId]  
           ,[SupplierReversal]  
           ,[TransRef]  
      FROM inserted i 
     WHERE Status IN (3,7,8,22) 
	  AND EXISTS(SELECT d.TrxId
	                  FROM deleted d
					 WHERE i.TrxId = d.TrxId
					   AND i.Status != d.Status)
   END  
END
GO
DISABLE TRIGGER [dbo].[utr_INSERT_Trx_AfterUpate_20200218]
    ON [dbo].[Trx];


GO



