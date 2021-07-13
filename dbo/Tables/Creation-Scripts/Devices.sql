CREATE TABLE [dbo].[Devices] (
    [DevId]                    INT          IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [DevTypeId]                INT          NOT NULL,
    [EntId]                    INT          NOT NULL,
    [DeviceName]               VARCHAR (50) NOT NULL,
    [isEnabled]                BIT          NOT NULL,
    [IsActive]                 BIT          NOT NULL,
    [SerialNumber]             VARCHAR (50) NULL,
    [SWVersion]                VARCHAR (20) NOT NULL,
    [MachineId]                INT          NULL,
    [LastSerialNumber]         VARCHAR (50) NULL,
    [AddId]                    INT          NULL,
    [IsDeleted]                BIT          NOT NULL,
    [EnableMerchantReceipts]   BIT          NULL,
    [DeviceLanguage]           INT          NULL,
    [LastActivity]             DATETIME     NULL,
    [IPAddress]                VARCHAR (20) NULL,
    [LastUser]                 INT          NULL,
    [CurrentConnectionID]      INT          NULL,
    [NewConnectionID]          INT          NULL,
    [ExternalPrinter]          BIT          NULL,
    [Encoder]                  BIT          NULL,
    [ExternalMerchant]         VARCHAR (20) NULL,
    [MasterKey]                VARCHAR (50) NULL,
    [ContactID]                INT          NULL,
    [PrintBarCodes]            BIT          NULL,
    [AuthCode]                 VARCHAR (10) NULL,
    [IsPinForTransaction]      BIT          NOT NULL,
    [IsEncriptPin]             BIT          NOT NULL,
    [InvoiceDevice]            BIT          NOT NULL,
    [UseElectGlobalBin]        BIT          NOT NULL,
    [AllowOthDevToSellElect]   BIT          NOT NULL,
    [MultipleVoucherSales]     BIT          NOT NULL,
    [SalesConfirmation]        BIT          NOT NULL,
    [ForceMenuDownload]        BIT          NOT NULL,
    [EnableIthubaConfirmSlip]  BIT          NULL,
    [ForceDownload]            BIT          NOT NULL,
    [DownloadTime]             DATETIME     NOT NULL,
    [AllowedProductGroupingId] INT          NULL,
    [IoTTagEnable]             BIT          NULL,
    [HeartBeatEnable]          BIT          NULL,
    [VendChannelId]            INT          NOT NULL,
    [SSLEnable]                BIT          NULL,
    [UseVoucherGlobalBin]      BIT          DEFAULT ((1)) NOT NULL,
    [AllowOthDevToSellVoucher] BIT          DEFAULT ((1)) NOT NULL
);


GO

ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [Def_VendChannelId] DEFAULT ((2)) FOR [VendChannelId];


GO



CREATE NONCLUSTERED INDEX [bdxDevidVarious]
    ON [dbo].[Devices]([DevTypeId] ASC, [IsActive] ASC, [IsDeleted] ASC, [LastActivity] ASC, [IPAddress] ASC) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_DeviceName]
    ON [dbo].[Devices]([DeviceName] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [Indx_SerialNumber]
    ON [dbo].[Devices]([SerialNumber] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [IX_Devices_DevTypeId]
    ON [dbo].[Devices]([DevTypeId] ASC)
    INCLUDE([DevId], [EntId], [DeviceName], [isEnabled], [IsActive], [SWVersion], [MachineId], [IsDeleted], [LastActivity]);


GO



CREATE NONCLUSTERED INDEX [IX_Devices_EntId_IsDeleted]
    ON [dbo].[Devices]([EntId] ASC, [IsDeleted] ASC);


GO



CREATE NONCLUSTERED INDEX [IX_Devices_InvoiceDevice]
    ON [dbo].[Devices]([InvoiceDevice] ASC)
    INCLUDE([DevId]) WITH (FILLFACTOR = 100)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxContactId]
    ON [dbo].[Devices]([ContactID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDeviceEntId]
    ON [dbo].[Devices]([EntId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevTypeid]
    ON [dbo].[Devices]([DevTypeId] ASC)
    INCLUDE([DevId], [EntId], [DeviceName], [isEnabled], [IsActive], [IsDeleted]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxDevtypeidEntidSerial]
    ON [dbo].[Devices]([DevTypeId] ASC, [EntId] ASC, [SerialNumber] ASC)
    INCLUDE([DevId], [isEnabled], [IsActive]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxExternalMerchant]
    ON [dbo].[Devices]([ExternalMerchant] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE UNIQUE NONCLUSTERED INDEX [ndxIdSerial]
    ON [dbo].[Devices]([DevId] ASC)
    INCLUDE([isEnabled], [IsActive], [SerialNumber], [IsDeleted]) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxInvoiceDevice]
    ON [dbo].[Devices]([DevId] ASC, [InvoiceDevice] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxIsdeletedContactId]
    ON [dbo].[Devices]([IsDeleted] ASC, [ContactID] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



CREATE NONCLUSTERED INDEX [ndxMasterkey]
    ON [dbo].[Devices]([MasterKey] ASC) WITH (FILLFACTOR = 90)
    ON [AEON_NC_Index_FG];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF__Devices__Encoder__52AE4273] DEFAULT ((0)) FOR [Encoder];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF__Devices__Externa__51BA1E3A] DEFAULT ((0)) FOR [ExternalPrinter];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF__Devices__HeartBe__611E78AB] DEFAULT ((0)) FOR [HeartBeatEnable];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF__Devices__IoTTagE__602A5472] DEFAULT ((0)) FOR [IoTTagEnable];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_AllowOthDevToSellElect] DEFAULT ((1)) FOR [AllowOthDevToSellElect];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_DeviceLanguage] DEFAULT ((0)) FOR [DeviceLanguage];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_DownloadTime] DEFAULT (getdate()) FOR [DownloadTime];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_EnableMerchantReceipts] DEFAULT ((0)) FOR [EnableMerchantReceipts];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_EntId] DEFAULT ((0)) FOR [EntId];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_ForceDownload] DEFAULT ((0)) FOR [ForceDownload];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_ForceMenuDownload] DEFAULT ((0)) FOR [ForceMenuDownload];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_InvoiceDevice] DEFAULT ((0)) FOR [InvoiceDevice];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_IsDeleted] DEFAULT ((0)) FOR [IsDeleted];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_IsEncriptPin] DEFAULT ((0)) FOR [IsEncriptPin];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_IsPinForTransaction] DEFAULT ((0)) FOR [IsPinForTransaction];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_MultipleVoucherSales] DEFAULT ((0)) FOR [MultipleVoucherSales];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_PrintBarCodes] DEFAULT ((1)) FOR [PrintBarCodes];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_SalesConfirmation] DEFAULT ((0)) FOR [SalesConfirmation];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_SSLEnable] DEFAULT ((0)) FOR [SSLEnable];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [DF_Devices_UseElectGlobalBin] DEFAULT ((1)) FOR [UseElectGlobalBin];


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Device_VendChannelId] FOREIGN KEY ([VendChannelId]) REFERENCES [dbo].[VendChannel] ([Id]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Devices_Addres] FOREIGN KEY ([AddId]) REFERENCES [dbo].[Addres] ([AddId]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Devices_ConnectionSettings] FOREIGN KEY ([CurrentConnectionID]) REFERENCES [dbo].[ConnectionSettings] ([ConnId]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Devices_ConnectionSettings1] FOREIGN KEY ([NewConnectionID]) REFERENCES [dbo].[ConnectionSettings] ([ConnId]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Devices_DeviceTypes] FOREIGN KEY ([DevTypeId]) REFERENCES [dbo].[DeviceTypes] ([DevTypeId]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [FK_Devices_Entity] FOREIGN KEY ([EntId]) REFERENCES [dbo].[Entity] ([EntId]);


GO



ALTER TABLE [dbo].[Devices]
    ADD CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED ([DevId] ASC) WITH (FILLFACTOR = 90, PAD_INDEX = ON);


GO





CREATE TRIGGER [dbo].[utr_Devices_ChangeTracking] ON [dbo].[Devices]   
FOR INSERT,   
 DELETE,   
 UPDATE   
AS   
SET NOCOUNT ON   
    
DECLARE @bit INT,   
 @field INT,   
 @maxfield INT,   
 @char INT,   
 @fieldname VARCHAR(128),   
 @TableName VARCHAR(128),   
 @PKCols VARCHAR(1000),   
 @sql VARCHAR(2000),   
 @UpdateDate VARCHAR(50),   
 @DBUserName VARCHAR(128),   
 @Type CHAR(1),   
 @PKFieldSelect VARCHAR(1000),   
 @PKValueSelect VARCHAR(1000),   
 @temp1 VARCHAR(1000),   
 @temp2 VARCHAR(1000),   
 @ModifiedUser VARCHAR(50),   
 @AuditId UNIQUEIDENTIFIER   
 
   IF (UPDATE(SWVersion)  AND (ISNULL((SELECT TOP 1 SWVersion FROM inserted), '') != ISNULL((SELECT TOP 1 SWVersion FROM deleted), ''))) OR UPDATE(SerialNumber)
    BEGIN
        --PRINT 'You are fired!!'
              SELECT @TableName = 'Devices'   
                  
              -- date and user   
              SELECT @DBUserName = system_user   
                  
              SET @AuditId = NEWID()   
                  
              -- Action   
              IF EXISTS (   
                SELECT DevId   
                FROM inserted   
                )   
               IF EXISTS (   
                 SELECT DevId   
                 FROM deleted   
                 )   
                SELECT @Type = 'U'   
               ELSE   
                SELECT @Type = 'I'   
              ELSE   
               SELECT @Type = 'D'   
                  
              -- get list of columns   
              SELECT [DevId]
                       ,[DevTypeId]
                       ,[EntId]
                       ,[DeviceName]
                       ,[isEnabled]
                       ,[IsActive]
                       ,[SerialNumber]
                       ,[SWVersion]
                       ,[MachineId]
                       ,[LastSerialNumber]
                       ,[AddId]
                       ,[IsDeleted]
                       ,[EnableMerchantReceipts]
                       ,[DeviceLanguage]
                       ,[LastActivity]
                       ,[IPAddress]
                       ,[LastUser]
                       ,[CurrentConnectionID]
                       ,[NewConnectionID]
                       ,[ExternalPrinter]
                       ,[Encoder]
                       ,[ExternalMerchant]
                       ,[MasterKey]
                       ,[ContactID]
                       ,[PrintBarCodes]
                       ,[AuthCode]
                       ,[IsPinForTransaction]
                       ,[IsEncriptPin]
                       ,[InvoiceDevice]
                       ,[MultipleVoucherSales]
                       ,[SalesConfirmation]
                       ,[ForceMenuDownload]
                       ,[UseElectGlobalBin]
                       ,[AllowOthDevToSellElect]
                       ,[EnableIthubaConfirmSlip]
                       ,[ForceDownload]
                       ,[DownloadTime]
                       ,[AllowedProductGroupingId] 
                       ,[IoTTagEnable]
                       ,[HeartBeatEnable]
                       ,[VendChannelId]
					   ,[SSLEnable]
					   ,[UseVoucherGlobalBin]
					   ,[AllowOthDevToSellVoucher]
              INTO #ins   
              FROM inserted   
 
 
 
 
                 
              --SELECT TOP 1 @ModifiedUser = ModifiedUser   
              --FROM #ins   
                  
              SELECT [DevId]
                       ,[DevTypeId]
                       ,[EntId]
                       ,[DeviceName]
                       ,[isEnabled]
                       ,[IsActive]
                       ,[SerialNumber]
                       ,[SWVersion]
                       ,[MachineId]
                       ,[LastSerialNumber]
                       ,[AddId]
                       ,[IsDeleted]
                       ,[EnableMerchantReceipts]
                       ,[DeviceLanguage]
                       ,[LastActivity]
                       ,[IPAddress]
                       ,[LastUser]
                       ,[CurrentConnectionID]
                       ,[NewConnectionID]
                       ,[ExternalPrinter]
                       ,[Encoder]
                       ,[ExternalMerchant]
                       ,[MasterKey]
                       ,[ContactID]
                       ,[PrintBarCodes]
                       ,[AuthCode]
                       ,[IsPinForTransaction]
                       ,[IsEncriptPin]
                       ,[InvoiceDevice]
                       ,[MultipleVoucherSales]
                       ,[SalesConfirmation]
                       ,[ForceMenuDownload]
                       ,[UseElectGlobalBin]
                       ,[AllowOthDevToSellElect]
                       ,[EnableIthubaConfirmSlip]
                       ,[ForceDownload]
                       ,[DownloadTime]
                       ,[AllowedProductGroupingId] 
                       ,[IoTTagEnable]
                       ,[HeartBeatEnable] 
                       ,[VendChannelId]
					   ,[SSLEnable]
					   ,[UseVoucherGlobalBin]
					   ,[AllowOthDevToSellVoucher]
              INTO #del   
              FROM deleted   
                  
              --IF (@ModifiedUser IS NULL)   
              -- SELECT TOP 1 @ModifiedUser = ModifiedUser   
              -- FROM #del   
                  
              -- Get primary key columns for full outer join - d alias will be used later   
              SELECT @PKCols = coalesce(@PKCols + ' and', ' on') + ' i.' + c.COLUMN_NAME + ' = d.' + c.COLUMN_NAME   
              FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN    
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME   
               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME      
              WHERE pk.TABLE_NAME = @TableName   
               AND CONSTRAINT_TYPE = 'PRIMARY KEY'   
               
                  
              --PRINT '@PKCols'   
              --PRINT @PKCols   
              -- Get primary key fields select for insert   
              --select @PKFieldSelect =  coalesce(@PKFieldSelect,',') + COLUMN_NAME   
              SELECT @PKFieldSelect = coalesce(@PKFieldSelect + '' + '', '''') + '' + COLUMN_NAME + ''''   
              FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN    
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME   
               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
              WHERE pk.TABLE_NAME = @TableName   
               AND CONSTRAINT_TYPE = 'PRIMARY KEY'   
                  
              --PRINT '@PKFieldSelect'   
              --PRINT @PKFieldSelect   
              --Get the values        ''   
              SELECT @temp1 = 'convert(varchar(100), coalesce(i.'   
                  
              SELECT @temp2 = ',d.'   
                  
              SELECT @PKValueSelect = @temp1 + COLUMN_NAME + @temp2 + COLUMN_NAME + '))'   
              FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk INNER JOIN    
               INFORMATION_SCHEMA.KEY_COLUMN_USAGE c ON c.TABLE_NAME = pk.TABLE_NAME   
               AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME
              WHERE pk.TABLE_NAME = @TableName   
               AND CONSTRAINT_TYPE = 'PRIMARY KEY'   
                  
              --PRINT '@PKValueSelect'   
              --PRINT @PKValueSelect   
              IF @PKCols IS NULL   
              BEGIN   
               RAISERROR (   
                 'no PK on table %s',   
                 16,   
                 - 1,   
                 @TableName   
                 )   
                  
               RETURN   
              END   
                  
              SELECT @field = 0,   
               @maxfield = max(ORDINAL_POSITION)   
              FROM INFORMATION_SCHEMA.COLUMNS   
              WHERE TABLE_NAME = @TableName   
                  
              --Test Code must be removed   
              SELECT @UpdateDate = CONVERT(VARCHAR(24), GETDATE(), 121)   
                  
              WHILE @field < @maxfield   
              BEGIN   
               SELECT @field = min(ORDINAL_POSITION)   
               FROM INFORMATION_SCHEMA.COLUMNS   
               WHERE TABLE_NAME = @TableName   
                AND ORDINAL_POSITION > @field   
                  
               SELECT @bit = (@field - 1) % 8 + 1   
                  
               SELECT @bit = power(2, @bit - 1)   
                  
               SELECT @char = ((@field - 1) / 8) + 1   
                  
               -- if substring(COLUMNS_UPDATED(),@char, 1) & @bit > 0 or @Type in ('I','D')   
               IF @Type IN (   
                 'I',   
                 'D',   
                 'U'   
                 )   
               BEGIN   
                SELECT @fieldname = COLUMN_NAME   
                FROM INFORMATION_SCHEMA.COLUMNS   
                WHERE TABLE_NAME = @TableName   
                 AND ORDINAL_POSITION = @field   
                 AND DATA_TYPE <> 'text'   
                 AND (   
                     CHARACTER_MAXIMUM_LENGTH IS NULL   
                     OR CHARACTER_MAXIMUM_LENGTH <= 500   
                     )   
                    
                SET @ModifiedUser = ISNULL(@ModifiedUser,@DBUserName)
                
                SELECT @sql = 'insert Audit (Type, TableName,PrimaryKeyField, PrimaryKeyValue, FieldName, OldValue, NewValue, ModifiedDate, DBUserName, ModifiedUser, AuditId )'   
                  
                SELECT @sql = @sql + ' select ' + '''' + @Type + ''','   
                  
                SELECT @sql = @sql + '''' + @TableName + ''''   
                  
                SELECT @sql = @sql + ',' + @PKFieldSelect   
                  
                SELECT @sql = @sql + ',' + @PKValueSelect   
                  
                SELECT @sql = @sql + ',' + '''' + @fieldname + ''''   
                  
                SELECT @sql = @sql + ',convert(varchar(1000),d.' + @fieldname + ')'   
                  
                SELECT @sql = @sql + ',convert(varchar(1000),i.' + @fieldname + ')'   
                  
                SELECT @sql = @sql + ',' + '''' + @UpdateDate + ''''   
                  
                SELECT @sql = @sql + ',' + '''' + @DBUserName + ''''   
                  
                SELECT @sql = @sql + ',' + '''' + @ModifiedUser + ''''   
                  
                SELECT @sql = @sql + ',' + '''' + convert(NVARCHAR(50), @AuditId) + ''''   
                  
                SELECT @sql = @sql + ' from #ins i full outer join #del d '   
                  
                SELECT @sql = @sql + @PKCols   
                  
                SELECT @sql = @sql + ' where i.' + @fieldname + ' <> d.' + @fieldname   
                  
                SELECT @sql = @sql + ' or (i.' + @fieldname + ' is null and d.' + @fieldname + ' is not null)'   
                  
                SELECT @sql = @sql + ' or (i.' + @fieldname + ' is not null and d.' + @fieldname + ' is null)'   
                  
                --PRINT '-----------sql'   
                --PRINT @sql
                EXEC (@sql)   
               END   
    END             
END
GO



