CREATE TABLE [dbo].[SystemSettings] (
    [AddId]               INT           IDENTITY (1, 1) NOT NULL,
    [CompanyName]         VARCHAR (80)  NULL,
    [PhysicalLine1]       VARCHAR (80)  NULL,
    [PhysicalLine2]       VARCHAR (80)  NULL,
    [PhysicalLine3]       VARCHAR (80)  NULL,
    [PostalLine1]         VARCHAR (80)  NULL,
    [PostalLine2]         VARCHAR (80)  NULL,
    [PostalLine3]         VARCHAR (80)  NULL,
    [TelNumber]           VARCHAR (20)  NULL,
    [FaxNumber]           VARCHAR (20)  NULL,
    [Web]                 VARCHAR (30)  NULL,
    [Email]               VARCHAR (30)  NULL,
    [Directors]           VARCHAR (200) NULL,
    [RegNo]               VARCHAR (20)  NULL,
    [TenantId]            INT           NULL,
    [VatNumber]           VARCHAR (30)  NOT NULL,
    [CompanyAbbreviation] VARCHAR (50)  NULL
);


GO

ALTER TABLE [dbo].[SystemSettings]
    ADD CONSTRAINT [DF__SystemSet__VatNu__156E86CE] DEFAULT ((0)) FOR [VatNumber];


GO



ALTER TABLE [dbo].[SystemSettings]
    ADD CONSTRAINT [PK__SystemSe__A0E1AD8E771DDF1C] PRIMARY KEY CLUSTERED ([AddId] ASC) WITH (FILLFACTOR = 90);


GO



