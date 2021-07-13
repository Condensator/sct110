CREATE TABLE [dbo].[TrxUpdateException] (
    [TrxID]    BIGINT NOT NULL,
    [InvDetId] INT    NOT NULL,
    [Updated]  BIT    NOT NULL
);


GO

ALTER TABLE [dbo].[TrxUpdateException]
    ADD CONSTRAINT [DF__TrxUpdate__Updat__213B918F] DEFAULT ((0)) FOR [Updated];


GO



ALTER TABLE [dbo].[TrxUpdateException]
    ADD CONSTRAINT [PK__TrxUpdat__BBFBDDD776DAA7A4] PRIMARY KEY CLUSTERED ([TrxID] ASC);


GO



