CREATE TABLE [InvIn].[AdminItem] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Name]      NVARCHAR (50)  NOT NULL,
    [URL]       NVARCHAR (MAX) NOT NULL,
    [Language]  VARCHAR (10)   NOT NULL,
    CONSTRAINT [PK_AdminItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);