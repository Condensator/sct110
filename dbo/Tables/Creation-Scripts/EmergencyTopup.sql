CREATE TABLE [dbo].[EmergencyTopup] (
    [ID]                  INT            IDENTITY (1, 1) NOT NULL,
    [AccId]               INT            NOT NULL,
    [DevId]               INT            NULL,
    [ShiftId]             INT            NOT NULL,
    [DevUserId]           INT            NULL,
    [AvailableBalance]    MONEY          NOT NULL,
    [RequestDate]         DATETIME       NULL,
    [RequestAmount]       MONEY          NULL,
    [PayBackDays]         INT            NULL,
    [PayBackExpiryDate]   DATETIME       NULL,
    [Status]              INT            NULL,
    [ConfirmationMessage] VARCHAR (2500) NULL,
    [Reason]              VARCHAR (50)   NULL
);


GO

CREATE NONCLUSTERED INDEX [index_30938_30937_EmergencyTopup]
    ON [dbo].[EmergencyTopup]([Reason] ASC)
    INCLUDE([AccId]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [index_64611_64610_EmergencyTopup]
    ON [dbo].[EmergencyTopup]([DevId] ASC)
    INCLUDE([ID], [AccId], [ShiftId], [DevUserId], [AvailableBalance], [RequestDate], [RequestAmount], [PayBackDays], [PayBackExpiryDate], [Status], [ConfirmationMessage], [Reason]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_EmergencyTopup_AccId_Status_RequestDate]
    ON [dbo].[EmergencyTopup]([AccId] ASC, [Status] ASC, [RequestDate] ASC)
    INCLUDE([ID], [DevId], [ShiftId], [DevUserId], [AvailableBalance], [RequestAmount], [PayBackDays], [PayBackExpiryDate], [ConfirmationMessage], [Reason]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



