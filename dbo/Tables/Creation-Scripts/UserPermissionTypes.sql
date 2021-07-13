CREATE TABLE [dbo].[UserPermissionTypes] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (50) NOT NULL
);


GO

ALTER TABLE [dbo].[UserPermissionTypes]
    ADD CONSTRAINT [PK__UserPerm__3214EC07710BD58E] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



