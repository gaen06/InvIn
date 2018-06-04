CREATE TABLE [InvIn].[HomeConfiguration]
(
    [Id] INT NOT NULL PRIMARY KEY identity(1,1), 
    [CardAnnouncementImageId] INT NULL, 
    [CardVideoImageId] INT NULL, 
    [Text] VARCHAR(MAX) NULL,
    [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US', 
    CONSTRAINT [FK_HomeConfigurationCard_ToImage] FOREIGN KEY ([CardAnnouncementImageId]) REFERENCES [InvIn].[Image]([Id]),
    CONSTRAINT [FK_HomeConfigurationVideo_ToImage] FOREIGN KEY ([CardVideoImageId]) REFERENCES [InvIn].[Image]([Id])
)
