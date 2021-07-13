CREATE TABLE [dbo].[UserRights] (
    [UserName]    NVARCHAR (256) NULL,
    [AllowEntity] INT            NULL,
    [AllowReport] INT            NULL
);


GO

CREATE NONCLUSTERED INDEX [index_1255_1254_UserRights]
    ON [dbo].[UserRights]([UserName] ASC, [AllowEntity] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



