CREATE TABLE [InvIn].[Document] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Title]       VARCHAR (150) NOT NULL,
    [Body]        VARCHAR (MAX) NULL,
    [ImageId]     INT           NULL,
    [DateCreated] DATETIME      NOT NULL,
    [Enabled]     BIT           NOT NULL,
    [Description] VARCHAR (250) NOT NULL,
    [Language]    VARCHAR (10)  NOT NULL,
    CONSTRAINT [PK_PageNews] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_PageNews_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [InvIn].[Image] ([Id])
);
