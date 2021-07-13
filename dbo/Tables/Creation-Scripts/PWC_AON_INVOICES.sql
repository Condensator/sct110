CREATE TABLE [dbo].[PWC_AON_INVOICES] (
    [AccountNr]         VARCHAR (50)   NULL,
    [InvId]             INT            NOT NULL,
    [EntId]             INT            NOT NULL,
    [TimeStamp]         DATETIME       NOT NULL,
    [Description]       NVARCHAR (255) NOT NULL,
    [AmountExcl]        MONEY          NOT NULL,
    [AmountIncl]        MONEY          NOT NULL,
    [Printed]           INT            NULL,
    [IsDeleted]         BIT            NOT NULL,
    [IsExported]        BIT            NOT NULL,
    [AccTransId]        INT            NULL,
    [ComIssued]         BIT            NULL,
    [IsIntegrated]      BIT            NULL,
    [DeviceId]          INT            NULL,
    [CashbookId]        INT            NULL,
    [CreditNoteId]      INT            NULL,
    [RebateIssued]      BIT            NULL,
    [ConvenienceIssued] BIT            NULL,
    [Paid]              BIT            NULL,
    [ShiftDescription]  NVARCHAR (200) NULL
);


GO

