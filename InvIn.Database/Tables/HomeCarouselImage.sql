CREATE TABLE [InvIn].[HomeCarouselImage]
(
	[Id] INT NOT NULL identity(1,1) PRIMARY KEY, 
    [ImageId] INT NOT NULL,				-- Image Id to display on the carousel
    [Order] INT NULL,					-- Order of appearance of the images
    [URLLink] NVARCHAR(250) NULL,		-- If the Image is clicked, this URL is used
    [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US', 
    CONSTRAINT [FK_HomeCarouselImage_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [InvIn].[Image]([Id])
)
