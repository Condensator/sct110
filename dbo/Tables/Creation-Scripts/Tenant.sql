CREATE TABLE [dbo].[Tenant] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [TenantName] NVARCHAR (100) NULL
);


GO

ALTER TABLE [dbo].[Tenant]
    ADD CONSTRAINT [PK__Tenant__3214EC0713863E5C] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



