CREATE TABLE [dbo].[RefundReason] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Code]         NVARCHAR (50)  NULL,
    [Description]  NVARCHAR (200) NULL,
    [IsDeleted]    BIT            NULL,
    [ModifiedUser] NVARCHAR (50)  NULL,
    [ModifiedDate] DATETIME       NULL
);


GO

ALTER TABLE [dbo].[RefundReason]
    ADD CONSTRAINT [DF_RefundReason_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[RefundReason]
    ADD CONSTRAINT [PK_RefundReason] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



