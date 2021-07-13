CREATE TABLE [dbo].[InvoicePriority] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Level]       INT           NOT NULL,
    [Description] NVARCHAR (20) NOT NULL
);


GO

ALTER TABLE [dbo].[InvoicePriority]
    ADD CONSTRAINT [PK_InvoicePriority] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



