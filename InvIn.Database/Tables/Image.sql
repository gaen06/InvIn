CREATE TABLE [InvIn].[Image]
(
	[Id] INT NOT NULL PRIMARY KEY identity, 
    [Name] NVARCHAR(250) NOT NULL, 
    [URL] NVARCHAR(250) NOT NULL, 
    [Description] TEXT NULL,
    [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US'
)
