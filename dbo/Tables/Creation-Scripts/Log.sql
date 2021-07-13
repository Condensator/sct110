CREATE TABLE [dbo].[Log] (
    [ID]            INT              IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DateStamp]     DATETIME         NULL,
    [XMLDataBefore] VARCHAR (MAX)    NULL,
    [XMLDataAfter]  VARCHAR (MAX)    NULL,
    [UserID]        UNIQUEIDENTIFIER NULL,
    [UserName]      VARCHAR (250)    NULL,
    [EntryType]     VARCHAR (250)    NULL
);


GO

CREATE NONCLUSTERED INDEX [index_23114_23113_Log]
    ON [dbo].[Log]([EntryType] ASC, [DateStamp] ASC)
    INCLUDE([XMLDataBefore], [XMLDataAfter], [UserName]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_261_260_Log]
    ON [dbo].[Log]([DateStamp] ASC)
    INCLUDE([ID], [XMLDataBefore], [XMLDataAfter], [UserName], [EntryType]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[Log]
    ADD CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



CREATE TRIGGER [dbo].[Tri_MoveLogs]
   ON [dbo].[Log]
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO AEON_SA_Archive..Log_Archive
		SELECT * FROM deleted

END
GO
DISABLE TRIGGER [dbo].[Tri_MoveLogs]
    ON [dbo].[Log];


GO



