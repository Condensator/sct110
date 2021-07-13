CREATE TABLE [dbo].[SystemUserExtendedData] (
    [UserId]                        UNIQUEIDENTIFIER NOT NULL,
    [LoginKey]                      VARCHAR (20)     NULL,
    [LoginKeyExpiry]                DATETIME         NULL,
    [LoginKeyDefaultValidityPeriod] INT              NULL,
    [CellNo]                        NCHAR (15)       NULL
);


GO

ALTER TABLE [dbo].[SystemUserExtendedData]
    ADD CONSTRAINT [DF_LoginKey_LoginKeyDefaultValidityPeriod] DEFAULT ((1)) FOR [LoginKeyDefaultValidityPeriod];


GO



ALTER TABLE [dbo].[SystemUserExtendedData]
    ADD CONSTRAINT [FK_LoginKey_aspnet_Users] FOREIGN KEY ([UserId]) REFERENCES [dbo].[aspnet_Users] ([UserId]);


GO



