CREATE TABLE [dbo].[ComSlidingDetails] (
    [ID]                 INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [BottomAmount]       MONEY         NULL,
    [Persentage]         MONEY         NULL,
    [CommDetailsID]      INT           NULL,
    [IsDeleted]          BIT           NULL,
    [Amount]             MONEY         NOT NULL,
    [InvoiceDescription] VARCHAR (100) NULL,
    [CommissionValue]    FLOAT (53)    NULL
);


GO

CREATE NONCLUSTERED INDEX [ndxCommDetailsIDBottomAmount]
    ON [dbo].[ComSlidingDetails]([CommDetailsID] ASC, [BottomAmount] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[ComSlidingDetails]
    ADD CONSTRAINT [DF_ComSlidingDetails_Amount] DEFAULT ((0)) FOR [Amount];


GO



ALTER TABLE [dbo].[ComSlidingDetails]
    ADD CONSTRAINT [DF_ComSlidingDetails_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[ComSlidingDetails]
    ADD CONSTRAINT [FK_ComSlidingDetails_CommissionDetails] FOREIGN KEY ([CommDetailsID]) REFERENCES [dbo].[CommissionDetails] ([ID]);


GO



ALTER TABLE [dbo].[ComSlidingDetails]
    ADD CONSTRAINT [PK_ComSlidingDetails] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



