CREATE TABLE [dbo].[ICryptoUsers] (
    [UserName]   NVARCHAR (256) NOT NULL,
    [UseICrypto] BIT            NOT NULL
);


GO

ALTER TABLE [dbo].[ICryptoUsers]
    ADD CONSTRAINT [DF_ICryptoUsers_UseICrypto] DEFAULT ((1)) FOR [UseICrypto];


GO



ALTER TABLE [dbo].[ICryptoUsers]
    ADD CONSTRAINT [PK_ICryptoUsers] PRIMARY KEY CLUSTERED ([UserName] ASC);


GO



