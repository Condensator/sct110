CREATE TABLE [dbo].[aspnet_SchemaVersions] (
    [Feature]                 NVARCHAR (128) NOT NULL,
    [CompatibleSchemaVersion] NVARCHAR (128) NOT NULL,
    [IsCurrentVersion]        BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[aspnet_SchemaVersions]
    ADD CONSTRAINT [PK__aspnet_SchemaVer__0CBAE877] PRIMARY KEY CLUSTERED ([Feature] ASC, [CompatibleSchemaVersion] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



