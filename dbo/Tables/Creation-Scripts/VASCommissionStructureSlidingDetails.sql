CREATE TABLE [dbo].[VASCommissionStructureSlidingDetails] (
    [ID]                              INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [VASCommissionStructureDetailsID] INT           NULL,
    [InvoiceDescription]              VARCHAR (100) NULL,
    [BottomAmount]                    MONEY         NULL,
    [FeeOutlet]                       MONEY         NULL,
    [FeeOutletIsPercent]              BIT           NULL,
    [FeeSwitch]                       MONEY         NULL,
    [FeeSwitchIsPercent]              BIT           NULL,
    [FeeProvider]                     MONEY         NULL,
    [FeeProviderIsPercent]            BIT           NULL,
    [IsDeleted]                       BIT           NULL
);


GO

ALTER TABLE [dbo].[VASCommissionStructureSlidingDetails]
    ADD CONSTRAINT [DF_VASCommissionStructureSlidingDetails_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[VASCommissionStructureSlidingDetails]
    ADD CONSTRAINT [PK_VASCommissionStructureSlidingDetails] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxVasCommissionStrBottomAm]
    ON [dbo].[VASCommissionStructureSlidingDetails]([VASCommissionStructureDetailsID] ASC, [BottomAmount] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



