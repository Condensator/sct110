CREATE TABLE [dbo].[RicaUserMapping] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [DevId]          INT           NULL,
    [TerminalUserId] INT           NULL,
    [RicaAgent]      VARCHAR (20)  NULL,
    [RicaPsw]        VARCHAR (128) NULL,
    [IsDeleted]      BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[RicaUserMapping]
    ADD CONSTRAINT [DF__RicaUserM__IsDel__262FD231] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[RicaUserMapping]
    ADD CONSTRAINT [PK__RicaUser__3214EC07244789BF] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



