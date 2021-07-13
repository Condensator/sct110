CREATE TABLE [dbo].[DeviceVersion] (
    [Id]              INT           IDENTITY (1, 1) NOT NULL,
    [SoftwareVersion] NVARCHAR (50) NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [unq_DeviceVersion_SoftwareVersion]
    ON [dbo].[DeviceVersion]([SoftwareVersion] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DeviceVersion]
    ADD CONSTRAINT [PK_DeviceVersion] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



