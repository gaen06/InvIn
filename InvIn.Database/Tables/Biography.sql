CREATE TABLE [InvIn].[Biography]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
    [Title] VARCHAR(250) NULL, 
    [Body] TEXT NULL, 
    [ImageId] INT NULL, 
    [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US', 
    CONSTRAINT [FK_Biography_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [InvIn].[Image]([Id])
)