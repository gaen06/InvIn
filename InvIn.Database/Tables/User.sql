CREATE TABLE [InvIn].[User]
(
    [Id] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
    [Email] NVARCHAR(50) NOT NULL,
    [Password] NVARCHAR(100) NOT NULL,
    [Name] nvarchar(100) NOT NULL, 
    [RoleId] INT NOT NULL DEFAULT 1, 
    [CreatedBy] INT NOT NULL, 
    [CreatedDate] DATE NOT NULL, 
    [ModifiedBy] INT NOT NULL, 
    [ModifiedDate] DATE NOT NULL, 
    CONSTRAINT [FK_User_ToRole] FOREIGN KEY ([RoleId]) REFERENCES [InvIn].[Role]([Id])
)