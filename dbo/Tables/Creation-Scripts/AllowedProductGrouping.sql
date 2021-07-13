CREATE TABLE [dbo].[AllowedProductGrouping] (
    [Id]           INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description]  NVARCHAR (150) NULL,
    [IsDeleted]    BIT            NOT NULL,
    [ModifiedUser] NVARCHAR (50)  NULL,
    [ModifiedDate] DATETIME       NULL
);


GO

ALTER TABLE [dbo].[AllowedProductGrouping]
    ADD CONSTRAINT [DF_AllowedProductGrouping_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[AllowedProductGrouping]
    ADD CONSTRAINT [PK_AllowedProductGrouping] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



