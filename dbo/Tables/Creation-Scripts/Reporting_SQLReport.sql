CREATE TABLE [dbo].[Reporting_SQLReport] (
    [ID]                         INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ReportName]                 VARCHAR (256) NOT NULL,
    [Parent]                     VARCHAR (256) NOT NULL,
    [HeaderID]                   INT           NULL,
    [UseHeader]                  BIT           NULL,
    [Title]                      VARCHAR (256) NOT NULL,
    [Query]                      VARCHAR (MAX) NOT NULL,
    [ImageURL]                   VARCHAR (256) NOT NULL,
    [AccessLevel]                INT           NOT NULL,
    [IsPortrait]                 BIT           NOT NULL,
    [IsStoredProc]               BIT           NOT NULL,
    [parDate_Time]               BIT           NOT NULL,
    [parDateRange]               BIT           NOT NULL,
    [parCustomer]                BIT           NOT NULL,
    [parSupplier]                BIT           NOT NULL,
    [parAccount]                 BIT           NOT NULL,
    [parMonth]                   BIT           NOT NULL,
    [parInvoiceID]               BIT           NOT NULL,
    [parCreditNoteID]            BIT           NOT NULL,
    [parTrxType]                 BIT           NOT NULL,
    [parShiftID]                 BIT           NOT NULL,
    [parDeviceID]                BIT           NOT NULL,
    [parSearchValue]             BIT           NOT NULL,
    [parClearanceID]             BIT           NULL,
    [parInvoiceCreditNoteSearch] BIT           NOT NULL,
    [parConsignmentOnly]         BIT           NOT NULL,
    [parCommissionParent]        BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_AccessLevel] DEFAULT ((0)) FOR [AccessLevel];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_IsPortrait] DEFAULT ((0)) FOR [IsPortrait];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_IsStoredProc] DEFAULT ((0)) FOR [IsStoredProc];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parClearenceID] DEFAULT ((0)) FOR [parClearanceID];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parCommissionParent] DEFAULT ((0)) FOR [parCommissionParent];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parConsignmentOnly] DEFAULT ((0)) FOR [parConsignmentOnly];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parCreditNoteID] DEFAULT ((0)) FOR [parCreditNoteID];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parDeviceID] DEFAULT ((0)) FOR [parDeviceID];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parInvoiceCreditNoteSearch] DEFAULT ((0)) FOR [parInvoiceCreditNoteSearch];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parInvoiceID] DEFAULT ((0)) FOR [parInvoiceID];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parMonth] DEFAULT ((0)) FOR [parMonth];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parSearchValue] DEFAULT ((0)) FOR [parSearchValue];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parShiftID] DEFAULT ((0)) FOR [parShiftID];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_parTrxType] DEFAULT ((0)) FOR [parTrxType];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reporting_SQLReport_UseHeader] DEFAULT ((0)) FOR [UseHeader];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_ImageURL] DEFAULT (' ') FOR [ImageURL];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_parAccount] DEFAULT ((0)) FOR [parAccount];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_parCustomer] DEFAULT ((0)) FOR [parCustomer];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_parDate_Time] DEFAULT ((0)) FOR [parDate_Time];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_parDateRange] DEFAULT ((0)) FOR [parDateRange];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_Parent] DEFAULT (' ') FOR [Parent];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [DF_Reports_parSupplier] DEFAULT ((0)) FOR [parSupplier];


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [FK_Reporting_SQLReport_Reporting_AccessLevel] FOREIGN KEY ([AccessLevel]) REFERENCES [dbo].[Reporting_AccessLevel] ([ID]);


GO



ALTER TABLE [dbo].[Reporting_SQLReport]
    ADD CONSTRAINT [PK_Reports] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



