CREATE TABLE [dbo].[Vouchers] (
    [Id]          INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [VoucherCode] VARCHAR (30) NULL,
    [Redeemed]    INT          NULL,
    [IsDeleted]   BIT          NOT NULL
);


GO

ALTER TABLE [dbo].[Vouchers]
    ADD CONSTRAINT [DF_Vouchers_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Vouchers]
    ADD CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxVouchersVoucher]
    ON [dbo].[Vouchers]([VoucherCode] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



