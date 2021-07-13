CREATE TABLE [dbo].[MerchantGroupParameter] (
    [Id]                       INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MerchantGroupId]          INT           NULL,
    [MerchantGroupParameterId] INT           NULL,
    [Value]                    NVARCHAR (50) NULL,
    [IsDeleted]                BIT           NULL
);


GO

ALTER TABLE [dbo].[MerchantGroupParameter]
    ADD CONSTRAINT [DF_MerchantGroupParameter_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[MerchantGroupParameter]
    ADD CONSTRAINT [FK_MerchantGroupParameter_MerchantGroup] FOREIGN KEY ([MerchantGroupId]) REFERENCES [dbo].[MerchantGroup] ([Id]);


GO
ALTER TABLE [dbo].[MerchantGroupParameter] NOCHECK CONSTRAINT [FK_MerchantGroupParameter_MerchantGroup];


GO



ALTER TABLE [dbo].[MerchantGroupParameter]
    ADD CONSTRAINT [FK_MerchantGroupParameter_MerchantGroupParameterType] FOREIGN KEY ([MerchantGroupParameterId]) REFERENCES [dbo].[MerchantGroupParameterType] ([Id]);


GO
ALTER TABLE [dbo].[MerchantGroupParameter] NOCHECK CONSTRAINT [FK_MerchantGroupParameter_MerchantGroupParameterType];


GO



ALTER TABLE [dbo].[MerchantGroupParameter]
    ADD CONSTRAINT [PK_MerchantGroupParameter] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



