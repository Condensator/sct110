CREATE TABLE [dbo].[DevShiftClearance] (
    [Id]        INT IDENTITY (1, 1) NOT NULL,
    [ShiftId]   INT NOT NULL,
    [MoneyType] INT NOT NULL,
    [Num]       INT NOT NULL,
    [Counter]   INT NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [inxShiftId]
    ON [dbo].[DevShiftClearance]([ShiftId] DESC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[DevShiftClearance]
    ADD CONSTRAINT [PK_DevShiftClearance] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (FILLFACTOR = 90);


GO



