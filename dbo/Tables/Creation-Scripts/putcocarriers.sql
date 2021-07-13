CREATE TABLE [dbo].[putcocarriers] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [Role]             VARCHAR (50)  NULL,
    [CompanyId]        VARCHAR (50)  NULL,
    [parentId]         VARCHAR (50)  NULL,
    [Name]             VARCHAR (50)  NULL,
    [ShortName]        VARCHAR (50)  NULL,
    [Type]             VARCHAR (50)  NULL,
    [ModifiedDateTime] DATETIME2 (7) NULL
);


GO

