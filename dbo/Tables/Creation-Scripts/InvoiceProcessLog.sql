CREATE TABLE [dbo].[InvoiceProcessLog] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [AccId]           INT            NULL,
    [DeviceId]        INT            NULL,
    [MetaGroupId]     INT            NULL,
    [InfoMessage]     VARCHAR (1000) NULL,
    [InvoiceDatetime] DATETIME       NOT NULL
);


GO

ALTER TABLE [dbo].[InvoiceProcessLog]
    ADD CONSTRAINT [DF__InvoicePr__Invoi__4AEA1CFB] DEFAULT (getdate()) FOR [InvoiceDatetime];


GO



ALTER TABLE [dbo].[InvoiceProcessLog]
    ADD CONSTRAINT [PK__InvoiceP__3214EC074901D489] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



