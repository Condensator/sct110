CREATE TABLE [dbo].[RightsPerPage] (
    [ID]           INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Page_Section] VARCHAR (50) NULL,
    [Full]         BIT          NULL,
    [Add]          BIT          NULL,
    [Edit]         BIT          NULL,
    [View]         BIT          NULL,
    [Delete]       BIT          NULL
);


GO

