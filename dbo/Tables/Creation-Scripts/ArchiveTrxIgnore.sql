CREATE TABLE [dbo].[ArchiveTrxIgnore] (
    [TrxId] BIGINT NOT NULL
);


GO

ALTER TABLE [dbo].[ArchiveTrxIgnore]
    ADD CONSTRAINT [PK__ArchiveT__BBFBDDB79E6D8ECD] PRIMARY KEY CLUSTERED ([TrxId] ASC);


GO



