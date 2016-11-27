USE master
GO

IF DB_NAME() <> N'master' SET NOEXEC ON

--
-- Создать базу данных "rico_olap"
--
--PRINT (N'Создать базу данных "rico_olap"')
--GO
--CREATE DATABASE rico_olap
--ON PRIMARY(
--    NAME = N'test',
--    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\rico_olap.mdf',
--    SIZE = 163072KB,
--    MAXSIZE = UNLIMITED,
--    FILEGROWTH = 1024KB-
--)
--LOG ON(
--    NAME = N'test_log',
--    FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\rico_olap_log.LDF',
--    SIZE = 359424KB,
--    MAXSIZE = UNLIMITED,
--    FILEGROWTH = 10%
--)
GO

--
-- Изменить базу данных
--
PRINT (N'Изменить базу данных')
GO
ALTER DATABASE rico_olap
  SET
    ANSI_NULL_DEFAULT OFF,
    ANSI_NULLS OFF,
    ANSI_PADDING OFF,
    ANSI_WARNINGS OFF,
    ARITHABORT OFF,
    AUTO_CLOSE OFF,
    AUTO_CREATE_STATISTICS ON,
    AUTO_SHRINK OFF,
    AUTO_UPDATE_STATISTICS ON,
    AUTO_UPDATE_STATISTICS_ASYNC OFF,
    COMPATIBILITY_LEVEL = 100,
    CONCAT_NULL_YIELDS_NULL OFF,
    CURSOR_CLOSE_ON_COMMIT OFF,
    CURSOR_DEFAULT GLOBAL,
    DATE_CORRELATION_OPTIMIZATION OFF,
    DB_CHAINING OFF,
    HONOR_BROKER_PRIORITY OFF,
    MULTI_USER,
    NUMERIC_ROUNDABORT OFF,
    PAGE_VERIFY CHECKSUM,
    PARAMETERIZATION SIMPLE,
    QUOTED_IDENTIFIER OFF,
    READ_COMMITTED_SNAPSHOT OFF,
    RECOVERY FULL,
    RECURSIVE_TRIGGERS OFF,
    TRUSTWORTHY OFF
    WITH ROLLBACK IMMEDIATE
GO

ALTER DATABASE rico_olap
  SET ENABLE_BROKER
GO

ALTER DATABASE rico_olap
  SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

USE rico_olap
GO

IF DB_NAME() <> N'rico_olap' SET NOEXEC ON
GO

--
-- Создать таблицу "dbo.V8_MetaDataFieldsDescr"
--
PRINT (N'Создать таблицу "dbo.V8_MetaDataFieldsDescr"')
GO
CREATE TABLE dbo.V8_MetaDataFieldsDescr (
  V8_ObjectID numeric(5) NULL,
  V8_ObjectFieldName ntext NULL,
  V8_ObjectFieldID numeric(8) NOT NULL,
  CONSTRAINT PK_V8_MetaDataFields PRIMARY KEY CLUSTERED (V8_ObjectFieldID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

--
-- Создать таблицу "dbo.V8_MetaDataDescr"
--
PRINT (N'Создать таблицу "dbo.V8_MetaDataDescr"')
GO
CREATE TABLE dbo.V8_MetaDataDescr (
  V8_DataType numeric(2) NULL,
  V8_ObjectName ntext NULL,
  V8_ObjectID numeric(5) NOT NULL,
  V8_ObjectOwnerID numeric(5) NULL,
  CONSTRAINT PK_V8_MetaDataDescr PRIMARY KEY CLUSTERED (V8_ObjectID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

--
-- Создать представление "dbo.vwReference"
--
GO
PRINT (N'Создать представление "dbo.vwReference"')
GO
CREATE VIEW dbo.vwReference 
AS SELECT
  V8_MetaDataDescr.V8_DataType
 ,V8_MetaDataDescr.V8_ObjectName
 ,V8_MetaDataDescr.V8_ObjectID
 ,TABLES.TABLE_NAME AS TableName
 ,V8_MetaDataDescr.V8_ObjectOwnerID
FROM dbo.V8_MetaDataDescr
INNER JOIN INFORMATION_SCHEMA.TABLES
  ON 'V8_Reference' + CAST(V8_MetaDataDescr.V8_ObjectID AS VARCHAR(4)) = TABLES.TABLE_NAME
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwReference" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwReference" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V8_MetaDataDescr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TABLES (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwReference'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwReference" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwReference" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'vwReference'
GO

--
-- Создать представление "dbo.vwInfoReg"
--
GO
PRINT (N'Создать представление "dbo.vwInfoReg"')
GO
CREATE VIEW dbo.vwInfoReg
AS
SELECT     dbo.V8_MetaDataDescr.V8_DataType, dbo.V8_MetaDataDescr.V8_ObjectName, dbo.V8_MetaDataDescr.V8_ObjectID, 
                      INFORMATION_SCHEMA.TABLES.TABLE_NAME AS TableName, dbo.V8_MetaDataDescr.V8_ObjectOwnerID
FROM         dbo.V8_MetaDataDescr INNER JOIN
                      INFORMATION_SCHEMA.TABLES ON 'V8_InfoReg' + CAST(dbo.V8_MetaDataDescr.V8_ObjectID AS VARCHAR(4)) = INFORMATION_SCHEMA.TABLES.TABLE_NAME
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwInfoReg" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwInfoReg" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V8_MetaDataDescr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TABLES (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwInfoReg'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwInfoReg" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwInfoReg" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'vwInfoReg'
GO

--
-- Создать представление "dbo.vwConsts"
--
GO
PRINT (N'Создать представление "dbo.vwConsts"')
GO
CREATE VIEW dbo.vwConsts
AS
SELECT     dbo.V8_MetaDataDescr.V8_DataType, dbo.V8_MetaDataDescr.V8_ObjectName, dbo.V8_MetaDataDescr.V8_ObjectID, 
                      INFORMATION_SCHEMA.TABLES.TABLE_NAME AS TableName, dbo.V8_MetaDataDescr.V8_ObjectOwnerID
FROM         dbo.V8_MetaDataDescr INNER JOIN
                      INFORMATION_SCHEMA.TABLES ON 'V8_Consts' + CAST(dbo.V8_MetaDataDescr.V8_ObjectID AS VARCHAR(4)) = INFORMATION_SCHEMA.TABLES.TABLE_NAME
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwConsts" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwConsts" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V8_MetaDataDescr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TABLES (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwConsts'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwConsts" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwConsts" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'vwConsts'
GO

--
-- Создать представление "dbo.vwChrc"
--
GO
PRINT (N'Создать представление "dbo.vwChrc"')
GO
CREATE VIEW dbo.vwChrc
AS
SELECT     dbo.V8_MetaDataDescr.V8_DataType, dbo.V8_MetaDataDescr.V8_ObjectName, dbo.V8_MetaDataDescr.V8_ObjectID, 
                      INFORMATION_SCHEMA.TABLES.TABLE_NAME AS TableName, dbo.V8_MetaDataDescr.V8_ObjectOwnerID
FROM         dbo.V8_MetaDataDescr INNER JOIN
                      INFORMATION_SCHEMA.TABLES ON 'V8_Chrc' + CAST(dbo.V8_MetaDataDescr.V8_ObjectID AS VARCHAR(4)) = INFORMATION_SCHEMA.TABLES.TABLE_NAME
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwChrc" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwChrc" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V8_MetaDataDescr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TABLES (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwChrc'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwChrc" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwChrc" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'vwChrc'
GO

--
-- Создать представление "dbo.vwAccumReg"
--
GO
PRINT (N'Создать представление "dbo.vwAccumReg"')
GO
CREATE VIEW dbo.vwAccumReg
AS
SELECT     dbo.V8_MetaDataDescr.V8_DataType, dbo.V8_MetaDataDescr.V8_ObjectName, dbo.V8_MetaDataDescr.V8_ObjectID, 
                      INFORMATION_SCHEMA.TABLES.TABLE_NAME AS TableName, dbo.V8_MetaDataDescr.V8_ObjectOwnerID
FROM         dbo.V8_MetaDataDescr INNER JOIN
                      INFORMATION_SCHEMA.TABLES ON 'V8_AccumReg' + CAST(dbo.V8_MetaDataDescr.V8_ObjectID AS VARCHAR(4)) = INFORMATION_SCHEMA.TABLES.TABLE_NAME
GO

--
-- Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwAccumReg" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPane1" для "dbo.vwAccumReg" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "V8_MetaDataDescr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TABLES (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 125
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'vwAccumReg'
GO

--
-- Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwAccumReg" (представление)
--
PRINT (N'Добавить расширенное свойство "MS_DiagramPaneCount" для "dbo.vwAccumReg" (представление)')
GO
EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'vwAccumReg'
GO

--
-- Создать таблицу "dbo.V8_MetaDataAccDimKindDescr"
--
PRINT (N'Создать таблицу "dbo.V8_MetaDataAccDimKindDescr"')
GO
CREATE TABLE dbo.V8_MetaDataAccDimKindDescr (
  V8_AccID numeric(5) NULL,
  V8_AccDimKindName ntext NULL,
  V8_AccDimKindID numeric(5) NOT NULL,
  CONSTRAINT PK_V8_MetaDataAcc PRIMARY KEY CLUSTERED (V8_AccDimKindID)
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO
SET NOEXEC OFF
GO