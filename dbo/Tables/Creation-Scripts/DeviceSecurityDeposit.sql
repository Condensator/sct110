CREATE TABLE [dbo].[DeviceSecurityDeposit] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [DevId]        INT           NOT NULL,
    [AccId]        INT           NOT NULL,
    [InvId]        INT           NULL,
    [CRId]         INT           NULL,
    [ChargeCount]  INT           NOT NULL,
    [ChargeAmount] MONEY         NOT NULL,
    [ChargeDate]   DATETIME      NULL,
    [ChargeUser]   NVARCHAR (50) NULL,
    [RefundCount]  INT           NOT NULL,
    [RefundDate]   DATETIME      NULL,
    [RefundUser]   NVARCHAR (50) NULL
);


GO

ALTER TABLE [dbo].[DeviceSecurityDeposit]
    ADD CONSTRAINT [DF_DeviceSecurityDeposit_ChargeAmount] DEFAULT ((1000)) FOR [ChargeAmount];


GO



ALTER TABLE [dbo].[DeviceSecurityDeposit]
    ADD CONSTRAINT [DF_DeviceSecurityDeposit_ChargeCount] DEFAULT ((0)) FOR [ChargeCount];


GO



ALTER TABLE [dbo].[DeviceSecurityDeposit]
    ADD CONSTRAINT [DF_DeviceSecurityDeposit_RefundCount] DEFAULT ((0)) FOR [RefundCount];


GO



ALTER TABLE [dbo].[DeviceSecurityDeposit]
    ADD CONSTRAINT [FK_DeviceSecurityDeposit_Devices] FOREIGN KEY ([DevId]) REFERENCES [dbo].[Devices] ([DevId]);


GO



ALTER TABLE [dbo].[DeviceSecurityDeposit]
    ADD CONSTRAINT [PK__DeviceSe__3214EC074CF0FC1A] PRIMARY KEY CLUSTERED ([Id] ASC);


GO



