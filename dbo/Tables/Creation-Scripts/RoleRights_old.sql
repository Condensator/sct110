CREATE TABLE [dbo].[RoleRights_old] (
    [ID]           INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [RoleName]     VARCHAR (250) NOT NULL,
    [Page_Section] VARCHAR (50)  NOT NULL,
    [View]         BIT           NOT NULL,
    [Edit]         BIT           NOT NULL,
    [Delete]       BIT           NOT NULL,
    [Add]          BIT           NOT NULL,
    [Full]         BIT           NOT NULL
);


GO

ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [DF_RoleRights_Add] DEFAULT ((0)) FOR [Add];


GO



ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [DF_RoleRights_Delete] DEFAULT ((0)) FOR [Delete];


GO



ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [DF_RoleRights_Edit] DEFAULT ((0)) FOR [Edit];


GO



ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [DF_RoleRights_Full] DEFAULT ((0)) FOR [Full];


GO



ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [DF_RoleRights_View] DEFAULT ((0)) FOR [View];


GO



ALTER TABLE [dbo].[RoleRights_old]
    ADD CONSTRAINT [PK_RoleRights] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



