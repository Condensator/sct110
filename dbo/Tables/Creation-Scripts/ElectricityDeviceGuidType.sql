CREATE TABLE [dbo].[ElectricityDeviceGuidType] (
    [id]   INT          IDENTITY (1, 1) NOT NULL,
    [type] VARCHAR (15) NULL
);


GO

ALTER TABLE [dbo].[ElectricityDeviceGuidType]
    ADD CONSTRAINT [PK__Electric__3213E83F706C26D5] PRIMARY KEY CLUSTERED ([id] ASC);


GO



