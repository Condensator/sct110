CREATE TABLE [dbo].[z_SharedPhone] (
    [submittedtime] DATETIME NULL,
    [resptime]      DATETIME NULL,
    [transrefnum]   INT      NULL,
    [tid]           INT      NULL,
    [amount]        INT      NULL,
    [networkid]     INT      NULL,
    [status]        INT      NULL,
    [replycode]     INT      NULL
);


GO

ALTER TABLE [dbo].[z_SharedPhone]
    ADD CONSTRAINT [DF_z_SharedPhone_tid] DEFAULT ((0)) FOR [tid];


GO



ALTER TABLE [dbo].[z_SharedPhone]
    ADD CONSTRAINT [DF_z_SharedPhone_transrefnum] DEFAULT ((0)) FOR [transrefnum];


GO



