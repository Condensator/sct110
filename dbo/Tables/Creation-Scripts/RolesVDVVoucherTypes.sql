CREATE TABLE [dbo].[RolesVDVVoucherTypes] (
    [Id]                   INT              IDENTITY (1, 1) NOT NULL,
    [RoleId]               UNIQUEIDENTIFIER NOT NULL,
    [VDV_DB_VoucherTypeId] INT              NOT NULL
);


GO

ALTER TABLE [dbo].[RolesVDVVoucherTypes]
    ADD CONSTRAINT [IX_RolesVDVVoucherTypes] UNIQUE NONCLUSTERED ([RoleId] ASC, [VDV_DB_VoucherTypeId] ASC);


GO



ALTER TABLE [dbo].[RolesVDVVoucherTypes]
    ADD CONSTRAINT [PK_RolesVDVVoucherTypes] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



