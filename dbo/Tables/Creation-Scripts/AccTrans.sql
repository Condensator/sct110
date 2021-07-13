CREATE TABLE [dbo].[AccTrans] (
    [TransId]         INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ReferenceNumber] VARCHAR (255)  NOT NULL,
    [Description]     VARCHAR (255)  NULL,
    [Type]            CHAR (1)       NOT NULL,
    [Amount]          MONEY          NOT NULL,
    [OpeningBalance]  MONEY          NULL,
    [ClosingBalance]  MONEY          NULL,
    [TransDateTime]   DATETIME       NOT NULL,
    [AccID]           INT            NULL,
    [BankAccountID]   INT            NULL,
    [PaymentType]     VARCHAR (50)   NULL,
    [AccTransTypeId]  INT            NULL,
    [ProcessingUser]  NVARCHAR (512) NULL
);


GO

CREATE NONCLUSTERED INDEX [index_175_174_AccTrans]
    ON [dbo].[AccTrans]([Description] ASC, [AccID] ASC, [TransDateTime] ASC);


GO



CREATE NONCLUSTERED INDEX [index_26060_26059_AccTrans]
    ON [dbo].[AccTrans]([TransDateTime] ASC)
    INCLUDE([Description], [AccID]);


GO



CREATE NONCLUSTERED INDEX [index_29667_29666_AccTrans]
    ON [dbo].[AccTrans]([Description] ASC, [TransDateTime] ASC)
    INCLUDE([AccID]);


GO



CREATE NONCLUSTERED INDEX [index_4151_4150_AccTrans]
    ON [dbo].[AccTrans]([AccID] ASC)
    INCLUDE([TransId], [Type], [Amount], [TransDateTime]);


GO



CREATE NONCLUSTERED INDEX [index_5199_5198_AccTrans]
    ON [dbo].[AccTrans]([AccID] ASC)
    INCLUDE([TransId], [ReferenceNumber], [Description], [Type], [Amount], [OpeningBalance], [ClosingBalance], [TransDateTime], [BankAccountID], [PaymentType], [AccTransTypeId]);


GO



CREATE NONCLUSTERED INDEX [Indx_TransDateTime]
    ON [dbo].[AccTrans]([TransDateTime] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxAccTrans_AccId_Transdatetime]
    ON [dbo].[AccTrans]([AccID] ASC, [TransDateTime] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxAccTrans_AccID_TransDateTime_Type]
    ON [dbo].[AccTrans]([AccID] ASC, [TransDateTime] ASC, [Type] ASC);


GO



CREATE NONCLUSTERED INDEX [ndxAccTransAccId]
    ON [dbo].[AccTrans]([AccID] ASC) WITH (FILLFACTOR = 90);


GO



CREATE NONCLUSTERED INDEX [ndxAccTransTypeAcciddescTransdate]
    ON [dbo].[AccTrans]([Type] ASC, [AccID] ASC, [Description] ASC, [TransDateTime] ASC)
    INCLUDE([Amount]);


GO



CREATE NONCLUSTERED INDEX [ndxReferenceNumber]
    ON [dbo].[AccTrans]([ReferenceNumber] ASC) WITH (FILLFACTOR = 90);


GO



ALTER TABLE [dbo].[AccTrans]
    ADD CONSTRAINT [DF_AccTrans_TransDateTime] DEFAULT (getdate()) FOR [TransDateTime];


GO



ALTER TABLE [dbo].[AccTrans]
    ADD CONSTRAINT [FK_AccTrans_Accounts] FOREIGN KEY ([AccID]) REFERENCES [dbo].[Accounts] ([AccId]);


GO



ALTER TABLE [dbo].[AccTrans]
    ADD CONSTRAINT [PK_AccTrans] PRIMARY KEY CLUSTERED ([TransId] ASC) WITH (FILLFACTOR = 90);


GO



