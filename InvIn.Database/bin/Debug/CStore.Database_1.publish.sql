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
