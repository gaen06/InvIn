﻿/*
Deployment script for CStore.DB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CStore.DB"
:setvar DefaultFilePrefix "CStore.DB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367)) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Creating [dbo].[Biography]...';


GO
CREATE TABLE [dbo].[Biography] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Title]    VARCHAR (250) NULL,
    [Body]     TEXT          NULL,
    [ImageId]  INT           NULL,
    [Language] VARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[HomeCarouselImage]...';


GO
CREATE TABLE [dbo].[HomeCarouselImage] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [ImageId]  INT            NOT NULL,
    [Order]    INT            NULL,
    [URLLink]  NVARCHAR (250) NULL,
    [Language] VARCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[HomeConfiguration]...';


GO
CREATE TABLE [dbo].[HomeConfiguration] (
    [Id]                      INT          IDENTITY (1, 1) NOT NULL,
    [CardAnnouncementImageId] INT          NULL,
    [CardVideoImageId]        INT          NULL,
    [Language]                VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Image]...';


GO
CREATE TABLE [dbo].[Image] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (250) NOT NULL,
    [URL]         NVARCHAR (250) NOT NULL,
    [Description] TEXT           NULL,
    [Language]    VARCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ImageList]...';


GO
CREATE TABLE [dbo].[ImageList] (
    [Id]       INT          IDENTITY (1, 1) NOT NULL,
    [ImageId]  INT          NOT NULL,
    [Language] VARCHAR (10) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MenuItem]...';


GO
CREATE TABLE [dbo].[MenuItem] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Name]       NVARCHAR (250) NOT NULL,
    [OrderBy]    INT            NOT NULL,
    [Action]     NVARCHAR (250) NOT NULL,
    [Controller] NVARCHAR (250) NOT NULL,
    [Area]       NVARCHAR (250) NULL,
    [Text]       NVARCHAR (250) NULL,
    [Icon]       NVARCHAR (50)  NULL,
    [ToolTip]    NVARCHAR (50)  NULL,
    [Language]   VARCHAR (10)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Rol]...';


GO
CREATE TABLE [dbo].[Rol] (
    [Id]   INT          IDENTITY (1, 1) NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [Email]        NVARCHAR (50)  NOT NULL,
    [Password]     NVARCHAR (100) NOT NULL,
    [Name]         NVARCHAR (100) NOT NULL,
    [RolId]        INT            NOT NULL,
    [CreatedBy]    INT            NOT NULL,
    [CreatedDate]  DATE           NOT NULL,
    [ModifiedBy]   INT            NOT NULL,
    [ModifiedDate] DATE           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ImageFile]...';


GO
CREATE TABLE [dbo].[ImageFile] AS FILETABLE
WITH (FILETABLE_DIRECTORY = N'docs');


GO
PRINT N'Creating [dbo].[VideoFile]...';


GO
CREATE TABLE [dbo].[VideoFile] AS FILETABLE
WITH (FILETABLE_DIRECTORY = N'docs');


GO
PRINT N'Creating unnamed constraint on [dbo].[Biography]...';


GO
ALTER TABLE [dbo].[Biography]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[HomeCarouselImage]...';


GO
ALTER TABLE [dbo].[HomeCarouselImage]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[HomeConfiguration]...';


GO
ALTER TABLE [dbo].[HomeConfiguration]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[Image]...';


GO
ALTER TABLE [dbo].[Image]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[ImageList]...';


GO
ALTER TABLE [dbo].[ImageList]
    ADD DEFAULT 1 FOR [ImageId];


GO
PRINT N'Creating unnamed constraint on [dbo].[ImageList]...';


GO
ALTER TABLE [dbo].[ImageList]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[MenuItem]...';


GO
ALTER TABLE [dbo].[MenuItem]
    ADD DEFAULT 'en-US' FOR [Language];


GO
PRINT N'Creating unnamed constraint on [dbo].[User]...';


GO
ALTER TABLE [dbo].[User]
    ADD DEFAULT 1 FOR [RolId];


GO
PRINT N'Creating [dbo].[FK_Biography_ToImage]...';


GO
ALTER TABLE [dbo].[Biography] WITH NOCHECK
    ADD CONSTRAINT [FK_Biography_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Image] ([Id]);


GO
PRINT N'Creating [dbo].[FK_HomeCarouselImage_ToImage]...';


GO
ALTER TABLE [dbo].[HomeCarouselImage] WITH NOCHECK
    ADD CONSTRAINT [FK_HomeCarouselImage_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Image] ([Id]);


GO
PRINT N'Creating [dbo].[FK_HomeConfigurationCard_ToImage]...';


GO
ALTER TABLE [dbo].[HomeConfiguration] WITH NOCHECK
    ADD CONSTRAINT [FK_HomeConfigurationCard_ToImage] FOREIGN KEY ([CardAnnouncementImageId]) REFERENCES [dbo].[Image] ([Id]);


GO
PRINT N'Creating [dbo].[FK_HomeConfigurationVideo_ToImage]...';


GO
ALTER TABLE [dbo].[HomeConfiguration] WITH NOCHECK
    ADD CONSTRAINT [FK_HomeConfigurationVideo_ToImage] FOREIGN KEY ([CardVideoImageId]) REFERENCES [dbo].[Image] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ImageList_ToImage]...';


GO
ALTER TABLE [dbo].[ImageList] WITH NOCHECK
    ADD CONSTRAINT [FK_ImageList_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [dbo].[Image] ([Id]);


GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Biography] WITH CHECK CHECK CONSTRAINT [FK_Biography_ToImage];

ALTER TABLE [dbo].[HomeCarouselImage] WITH CHECK CHECK CONSTRAINT [FK_HomeCarouselImage_ToImage];

ALTER TABLE [dbo].[HomeConfiguration] WITH CHECK CHECK CONSTRAINT [FK_HomeConfigurationCard_ToImage];

ALTER TABLE [dbo].[HomeConfiguration] WITH CHECK CHECK CONSTRAINT [FK_HomeConfigurationVideo_ToImage];

ALTER TABLE [dbo].[ImageList] WITH CHECK CHECK CONSTRAINT [FK_ImageList_ToImage];


GO
PRINT N'Update complete.';


GO
