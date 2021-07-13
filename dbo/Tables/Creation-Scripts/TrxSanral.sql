CREATE TABLE [dbo].[TrxSanral] (
    [unqId]                                      INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [msgType]                                    VARCHAR (50) NOT NULL,
    [primaryAccNo]                               VARCHAR (50) NOT NULL,
    [processingCode]                             INT          NULL,
    [amount]                                     MONEY        NULL,
    [systemsTraceAuditNo]                        INT          NULL,
    [merchantType]                               INT          NULL,
    [posEntryMode]                               INT          NULL,
    [posConditionCode]                           INT          NULL,
    [authorizationIdResponseLength]              INT          NULL,
    [acqInstitutionIdCode]                       INT          NULL,
    [track2Data]                                 VARCHAR (50) NULL,
    [retrievalRefNo]                             VARCHAR (50) NULL,
    [authorizationIdResponse]                    VARCHAR (50) NULL,
    [authResponseCode]                           VARCHAR (50) NULL,
    [responseCode]                               VARCHAR (50) NULL,
    [cardAcceptorTerminalId]                     VARCHAR (50) NULL,
    [cardAcceptorIdCode]                         VARCHAR (50) NULL,
    [cardAcceptorNameLoc]                        VARCHAR (50) NULL,
    [currencyCode]                               VARCHAR (50) NULL,
    [pinData]                                    VARCHAR (50) NULL,
    [additionalAmounts]                          VARCHAR (50) NULL,
    [originalDataElements]                       VARCHAR (50) NULL,
    [terminalType]                               VARCHAR (50) NULL,
    [terminalLocation]                           INT          NULL,
    [pinEntryDevice]                             INT          NULL,
    [terminalOperator]                           INT          NULL,
    [pinCaptureCapability]                       VARCHAR (50) NULL,
    [cardCapture]                                INT          NULL,
    [terminalCardHolderAuthenticationCapability] INT          NULL,
    [terminalOutputCapability]                   INT          NULL,
    [TransDate]                                  DATETIME     NULL,
    [LocalTrxTime]                               DATETIME     NULL,
    [LocalTrxDate]                               DATETIME     NULL,
    [ExpiryDate]                                 DATETIME     NULL,
    [TrxId]                                      BIGINT       NULL,
    [UserId]                                     VARCHAR (60) NULL,
    [ProductId]                                  INT          NULL,
    [Reference]                                  VARCHAR (20) NULL
);


GO

ALTER TABLE [dbo].[TrxSanral]
    ADD CONSTRAINT [DF__TrxSanral__Produ__334B6CDB] DEFAULT ((0)) FOR [ProductId];


GO



CREATE NONCLUSTERED INDEX [idx_trxSanral_reference]
    ON [dbo].[TrxSanral]([Reference] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxPrimaryAccNo]
    ON [dbo].[TrxSanral]([primaryAccNo] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxTrxSanral]
    ON [dbo].[TrxSanral]([unqId] ASC)
    INCLUDE([msgType], [primaryAccNo], [processingCode], [amount], [systemsTraceAuditNo], [merchantType], [posEntryMode], [posConditionCode], [authorizationIdResponseLength], [acqInstitutionIdCode], [track2Data], [retrievalRefNo], [authorizationIdResponse], [authResponseCode], [responseCode], [cardAcceptorTerminalId], [cardAcceptorIdCode], [cardAcceptorNameLoc], [currencyCode], [pinData], [additionalAmounts], [originalDataElements], [terminalType], [terminalLocation], [pinEntryDevice], [terminalOperator], [pinCaptureCapability], [cardCapture], [terminalCardHolderAuthenticationCapability], [terminalOutputCapability], [TransDate], [LocalTrxTime], [LocalTrxDate], [ExpiryDate], [TrxId], [UserId], [ProductId], [Reference]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxSanral] ON [dbo].[TrxSanral] 
INSTEAD OF DELETE

AS

BEGIN
  SET NOCOUNT ON;
  
SET IDENTITY_INSERT AEON_SA_Archive..TrxSanralArchive ON

DELETE FROM TrxSanral WHERE TrxId IN (SELECT TrxId FROM deleted)

INSERT INTO AEON_SA_Archive..TrxSanralArchive 
(unqId,msgType,primaryAccNo,processingCode,amount,systemsTraceAuditNo,merchantType,posEntryMode,posConditionCode,authorizationIdResponseLength,acqInstitutionIdCode,track2Data,retrievalRefNo,authorizationIdResponse,authResponseCode,responseCode,cardAcceptorTerminalId,cardAcceptorIdCode,cardAcceptorNameLoc,currencyCode,pinData,additionalAmounts,originalDataElements,terminalType,terminalLocation,pinEntryDevice,terminalOperator,pinCaptureCapability,cardCapture,terminalCardHolderAuthenticationCapability,terminalOutputCapability,TransDate,LocalTrxTime,LocalTrxDate,ExpiryDate,TrxId,UserId,ProductId,Reference)  

SELECT 
unqId,msgType,primaryAccNo,processingCode,amount,systemsTraceAuditNo,merchantType,posEntryMode,posConditionCode,authorizationIdResponseLength,acqInstitutionIdCode,track2Data,retrievalRefNo,authorizationIdResponse,authResponseCode,responseCode,cardAcceptorTerminalId,cardAcceptorIdCode,cardAcceptorNameLoc,currencyCode,pinData,additionalAmounts,originalDataElements,terminalType,terminalLocation,pinEntryDevice,terminalOperator,pinCaptureCapability,cardCapture,terminalCardHolderAuthenticationCapability,terminalOutputCapability,TransDate,LocalTrxTime,LocalTrxDate,ExpiryDate,TrxId,UserId,ProductId,Reference
FROM Deleted

DELETE FROM Trx 
WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)

SET IDENTITY_INSERT AEON_SA_Archive..TrxSanralArchive OFF
END
GO



