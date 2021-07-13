CREATE TABLE [dbo].[TrxTypesGroup] (
    [ID]          INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Description] VARCHAR (250) NULL,
    [IsDeleted]   BIT           NOT NULL,
    [Billable]    INT           NULL
);


GO

ALTER TABLE [dbo].[TrxTypesGroup]
    ADD CONSTRAINT [DF__TrxTypesG__Billa__7FD9E758] DEFAULT ((0)) FOR [Billable];


GO



ALTER TABLE [dbo].[TrxTypesGroup]
    ADD CONSTRAINT [DF_TrxTypesGroup_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[TrxTypesGroup]
    ADD CONSTRAINT [PK_TrxTypesGroup] PRIMARY KEY CLUSTERED ([ID] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxTrxTypesGroupDescription]
    ON [dbo].[TrxTypesGroup]([Description] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



