CREATE TABLE [dbo].[Pictures] (
    [PicID]       INT             IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Picture]     VARBINARY (MAX) NULL,
    [PictureHex]  VARCHAR (MAX)   NULL,
    [Slot]        INT             NOT NULL,
    [Description] VARCHAR (256)   NULL,
    [IsDeleted]   BIT             NOT NULL,
    [TrxTypeId]   INT             NULL,
    [Width]       INT             NULL
);


GO

ALTER TABLE [dbo].[Pictures]
    ADD CONSTRAINT [DF__Pictures__TrxTyp__51C6A1E0] DEFAULT ((0)) FOR [TrxTypeId];


GO



ALTER TABLE [dbo].[Pictures]
    ADD CONSTRAINT [DF__Pictures__Width__65796029] DEFAULT ((384)) FOR [Width];


GO



ALTER TABLE [dbo].[Pictures]
    ADD CONSTRAINT [DF_Pictures_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Pictures]
    ADD CONSTRAINT [DF_Pictures_Slot] DEFAULT ((0)) FOR [Slot];


GO



ALTER TABLE [dbo].[Pictures]
    ADD CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED ([PicID] ASC) WITH (FILLFACTOR = 90);


GO



