CREATE TABLE [dbo].[Audit] (
    [Id]              INT              IDENTITY (1, 1) NOT NULL,
    [Type]            NCHAR (1)        NOT NULL,
    [TableName]       NVARCHAR (50)    NOT NULL,
    [PrimaryKeyField] NVARCHAR (50)    NOT NULL,
    [PrimaryKeyValue] NVARCHAR (50)    NOT NULL,
    [FieldName]       NVARCHAR (50)    NOT NULL,
    [OldValue]        NVARCHAR (500)   NULL,
    [NewValue]        NVARCHAR (500)   NULL,
    [DBUserName]      NVARCHAR (50)    NOT NULL,
    [AuditId]         UNIQUEIDENTIFIER NULL,
    [ModifiedUser]    NVARCHAR (50)    NULL,
    [ModifiedDate]    DATETIME         NULL
);


GO

CREATE NONCLUSTERED INDEX [IdxMainSelectingIndex]
    ON [dbo].[Audit]([TableName] ASC, [PrimaryKeyField] ASC, [PrimaryKeyValue] ASC, [ModifiedDate] ASC, [AuditId] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Audit_TableName_PrimaryKeyValue_FieldName_Id]
    ON [dbo].[Audit]([TableName] ASC, [PrimaryKeyValue] ASC, [FieldName] ASC, [Id] ASC)
    INCLUDE([OldValue], [NewValue]);


GO



ALTER TABLE [dbo].[Audit]
    ADD CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



