CREATE TABLE [dbo].[PaymentPlanTrxTypeProduct] (
    [PaymentPlanId] INT NOT NULL,
    [TrxTypeId]     INT NOT NULL,
    [VasProductId]  INT NULL
);


GO

ALTER TABLE [dbo].[PaymentPlanTrxTypeProduct]
    ADD CONSTRAINT [FK_PaymentPlanTrxTypeProduct_PaymentPlan] FOREIGN KEY ([PaymentPlanId]) REFERENCES [dbo].[PaymentPlan] ([Id]);


GO



ALTER TABLE [dbo].[PaymentPlanTrxTypeProduct]
    ADD CONSTRAINT [FK_PaymentPlanTrxTypeProduct_TrxTypes] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[PaymentPlanTrxTypeProduct]
    ADD CONSTRAINT [FK_PaymentPlanTrxTypeProduct_TrxTypes1] FOREIGN KEY ([TrxTypeId]) REFERENCES [dbo].[TrxTypes] ([TrxTypeId]);


GO



ALTER TABLE [dbo].[PaymentPlanTrxTypeProduct]
    ADD CONSTRAINT [FK_PaymentPlanTrxTypeProduct_VASProduct] FOREIGN KEY ([VasProductId]) REFERENCES [dbo].[VASProduct] ([Id]);


GO



CREATE UNIQUE NONCLUSTERED INDEX [IX_PaymentPlanTrxTypeProduct]
    ON [dbo].[PaymentPlanTrxTypeProduct]([PaymentPlanId] ASC, [TrxTypeId] ASC, [VasProductId] ASC);


GO



