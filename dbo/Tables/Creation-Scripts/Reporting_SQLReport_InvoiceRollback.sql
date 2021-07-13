CREATE TABLE [dbo].[Reporting_SQLReport_InvoiceRollback] (
    [ID]              INT           IDENTITY (1, 1) NOT NULL,
    [ReportName]      VARCHAR (256) NOT NULL,
    [Parent]          VARCHAR (256) NOT NULL,
    [HeaderID]        INT           NULL,
    [UseHeader]       BIT           NULL,
    [Title]           VARCHAR (256) NOT NULL,
    [Query]           VARCHAR (MAX) NOT NULL,
    [ImageURL]        VARCHAR (256) NOT NULL,
    [AccessLevel]     INT           NOT NULL,
    [IsPortrait]      BIT           NOT NULL,
    [IsStoredProc]    BIT           NOT NULL,
    [parDate_Time]    BIT           NOT NULL,
    [parDateRange]    BIT           NOT NULL,
    [parCustomer]     BIT           NOT NULL,
    [parSupplier]     BIT           NOT NULL,
    [parAccount]      BIT           NOT NULL,
    [parMonth]        BIT           NOT NULL,
    [parInvoiceID]    BIT           NOT NULL,
    [parCreditNoteID] BIT           NOT NULL,
    [parTrxType]      BIT           NOT NULL,
    [parShiftID]      BIT           NOT NULL,
    [parDeviceID]     BIT           NOT NULL,
    [parSearchValue]  BIT           NOT NULL,
    [parClearanceID]  BIT           NULL
);


GO

