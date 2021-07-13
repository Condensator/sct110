CREATE TABLE [dbo].[PostBankBeneficiary] (
    [RecordId]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [AccountNo]      NVARCHAR (24) NOT NULL,
    [IdNo]           VARCHAR (14)  NOT NULL,
    [InsertDateTime] DATETIME2 (7) NOT NULL,
    [MobileNo]       NVARCHAR (12) NOT NULL,
    [ModifyCount]    INT           NULL,
    [ModifyDateTime] DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([RecordId] ASC)
);


GO

