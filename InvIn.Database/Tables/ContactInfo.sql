CREATE TABLE [InvIn].[ContactInfo] (
    [Id]                 INT           IDENTITY (1, 1) NOT NULL,
    [CompanyName]        VARCHAR (250) NOT NULL,
    [CompanyDescription] VARCHAR (MAX) NULL,
    [CompanyEmail]       VARCHAR (150) NULL,
    [CompanyPhone]       VARCHAR (50)  NULL,
    [ImageId]            INT           NULL,
    [Language]           VARCHAR (10)  NOT NULL,
    CONSTRAINT [PK_ContactInfo] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_ContactInfo_ToImage] FOREIGN KEY ([ImageId]) REFERENCES [InvIn].[Image] ([Id])
);
