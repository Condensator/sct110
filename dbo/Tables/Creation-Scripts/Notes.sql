CREATE TABLE [dbo].[Notes] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [AccId]     INT            NOT NULL,
    [Date]      DATETIME       NULL,
    [User]      NVARCHAR (30)  NULL,
    [Message]   NVARCHAR (MAX) NULL,
    [IsDeleted] BIT            NULL
);


GO

ALTER TABLE [dbo].[Notes]
    ADD CONSTRAINT [DF_Notes_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Notes]
    ADD CONSTRAINT [FK_Notes_Accounts] FOREIGN KEY ([AccId]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



CREATE NONCLUSTERED INDEX [IX_Notes_AccId_IsDeleted]
    ON [dbo].[Notes]([AccId] ASC, [IsDeleted] ASC);


GO



ALTER TABLE [dbo].[Notes]
    ADD CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



