CREATE TABLE [dbo].[Settings] (
    [SettingID]     INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [SettingCode]   VARCHAR (50)  NULL,
    [SettingValue]  VARCHAR (100) NULL,
    [Description]   VARCHAR (250) NULL,
    [DetailedValue] VARCHAR (MAX) NULL,
    [TenantId]      INT           NULL
);


GO

CREATE CLUSTERED INDEX [ndxSettingsSettingCode]
    ON [dbo].[Settings]([SettingCode] ASC);


GO



CREATE NONCLUSTERED INDEX [NonClusteredIndex-20190201-023518]
    ON [dbo].[Settings]([SettingCode] ASC, [TenantId] ASC)
    INCLUDE([SettingValue]);


GO



