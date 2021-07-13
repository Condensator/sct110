CREATE TABLE [dbo].[EntityRestrictedMunic] (
    [ID]             INT IDENTITY (1, 1) NOT NULL,
    [TrxTypeId]      INT NOT NULL,
    [MunicipalityId] INT NOT NULL,
    [EntId]          INT NOT NULL
);


GO

ALTER TABLE [dbo].[EntityRestrictedMunic]
    ADD CONSTRAINT [PK__EntityRe__3214EC27A8EE8CA9] PRIMARY KEY CLUSTERED ([ID] ASC);


GO



