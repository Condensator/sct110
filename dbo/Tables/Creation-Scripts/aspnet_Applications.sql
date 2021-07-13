CREATE TABLE [dbo].[aspnet_Applications] (
    [ApplicationName]        NVARCHAR (256)   NOT NULL,
    [LoweredApplicationName] NVARCHAR (256)   NOT NULL,
    [ApplicationId]          UNIQUEIDENTIFIER NOT NULL,
    [Description]            NVARCHAR (256)   NULL
);


GO

ALTER TABLE [dbo].[aspnet_Applications]
    ADD CONSTRAINT [DF__aspnet_Ap__Appli__367C1819] DEFAULT (newid()) FOR [ApplicationId];


GO



ALTER TABLE [dbo].[aspnet_Applications]
    ADD CONSTRAINT [PK__aspnet_Applicati__29572725] PRIMARY KEY NONCLUSTERED ([ApplicationId] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[aspnet_Applications]
    ADD CONSTRAINT [UQ__aspnet_Applicati__276EDEB3] UNIQUE NONCLUSTERED ([ApplicationName] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[aspnet_Applications]
    ADD CONSTRAINT [UQ__aspnet_Applicati__286302EC] UNIQUE NONCLUSTERED ([LoweredApplicationName] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



