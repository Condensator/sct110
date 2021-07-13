CREATE TABLE [dbo].[VASConvenienceFeeStructureDetail] (
    [Id]                           INT   IDENTITY (1, 1) NOT NULL,
    [VASConvenienceFeeStructureId] INT   NOT NULL,
    [VASProductId]                 INT   NOT NULL,
    [ConvenienceOutlet]            MONEY NULL,
    [ConvenienceOutletIsPercent]   BIT   NULL,
    [ConvenienceSwitch]            MONEY NULL,
    [ConvenienceSwitchIsPercent]   BIT   NULL,
    [ConvenienceProvider]          MONEY NULL,
    [ConvenienceProviderIsPercent] BIT   NULL,
    [IsDeleted]                    BIT   NULL
);


GO

ALTER TABLE [dbo].[VASConvenienceFeeStructureDetail]
    ADD CONSTRAINT [FK_VASConvenienceFeeStructureDetail_VASProduct] FOREIGN KEY ([VASProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO
ALTER TABLE [dbo].[VASConvenienceFeeStructureDetail] NOCHECK CONSTRAINT [FK_VASConvenienceFeeStructureDetail_VASProduct];


GO



ALTER TABLE [dbo].[VASConvenienceFeeStructureDetail]
    ADD CONSTRAINT [PK_VASConvenienceFeeDetail] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



ALTER TABLE [dbo].[VASConvenienceFeeStructureDetail]
    ADD CONSTRAINT [uq_VASConvenienceFeeStructureDetail] UNIQUE NONCLUSTERED ([VASProductId] ASC, [VASConvenienceFeeStructureId] ASC) WITH (FILLFACTOR = 90) ON [AEON_NC_Index_FG];


GO



