CREATE TABLE [dbo].[BusCustomer] (
    [id]         INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [Name]       NVARCHAR (50) NOT NULL,
    [IDNumber]   NVARCHAR (13) NOT NULL,
    [BusTrxId]   INT           NOT NULL,
    [OldVoucher] INT           NULL
);


GO

ALTER TABLE [dbo].[BusCustomer]
    ADD CONSTRAINT [PK_BusCustomer] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO



