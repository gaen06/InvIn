CREATE TABLE [InvIn].[MenuItem]
(
	[Id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
   [MainMenuId] INT NOT NULL,
   [Name] NVARCHAR(250) NOT NULL,
   [OrderBy] INT NOT NULL,
	[Action] NVARCHAR(250) NOT NULL,
   [Text] NVARCHAR(250) NULL,
   [Icon] NVARCHAR(50) NULL,
   [ToolTip] NVARCHAR(250) NULL,
   [Language] VARCHAR(10) NOT NULL DEFAULT 'en-US', 
    CONSTRAINT [FK_MenuItem_ToMainMenu] FOREIGN KEY ([MainMenuId]) REFERENCES [InvIn].[MainMenu]([Id])
)
