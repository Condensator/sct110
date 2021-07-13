CREATE TABLE [dbo].[TrxIpayReversals] (
    [Id]               INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [TrxId]            BIGINT         NOT NULL,
    [VendTime]         DATETIME       NOT NULL,
    [RetryCount]       INT            NULL,
    [BuildResponse]    VARCHAR (5000) NULL,
    [ErrorCode]        INT            NULL,
    [ErrorMsg]         VARCHAR (100)  NULL,
    [Request]          VARCHAR (200)  NOT NULL,
    [Provider]         VARCHAR (50)   NOT NULL,
    [Status]           INT            NOT NULL,
    [TrxElectricityId] BIGINT         NOT NULL
);


GO

ALTER TABLE [dbo].[TrxIpayReversals]
    ADD CONSTRAINT [DF_TrxIpayReversals_RetryCount] DEFAULT ((0)) FOR [RetryCount];


GO



ALTER TABLE [dbo].[TrxIpayReversals]
    ADD CONSTRAINT [PK_TrxIpayReversals] PRIMARY KEY CLUSTERED ([Id] ASC);


GO





CREATE TRIGGER [dbo].[utr_DELETE_TrxIpayReversals_After] ON [dbo].[TrxIpayReversals]
AFTER DELETE 
AS 

BEGIN 
  SET NOCOUNT ON;
  
INSERT INTO AEON_SA_Archive..TrxIpayReversalsArchive
(Id,TrxId,VendTime,RetryCount,BuildResponse,ErrorCode,ErrorMsg,Request,Provider,Status,TrxElectricityId)
  
SELECT 
	Id,TrxId,VendTime,RetryCount,BuildResponse,ErrorCode,ErrorMsg,Request,Provider,Status,TrxElectricityId
FROM deleted

DELETE FROM Trx 
    WHERE EXISTS(SELECT TrxId FROM deleted WHERE Trx.TrxId = deleted.TrxId)
    
END
GO



