CREATE TABLE [InvIn].[ImageList]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
    [ImageId] INT NOT NULL DEFAULT 1, 
    [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US'
    CONSTRAINT [FK_ImageList_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [InvIn].[Image]([Id])
)
