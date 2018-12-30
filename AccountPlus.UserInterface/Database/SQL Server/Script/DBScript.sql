if db_id (N'AccountPlus') is not null drop database AccountPlus;
Create Database AccountPlus
Go

Use AccountPlus

/****** Object:  Table [dbo].[Expense_Details]    Script Date: 09/08/2009 11:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Expense_Details](
	[Exp_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Id] [int] NULL DEFAULT ((0)),
	[Exp_Desc] [nvarchar](255) NULL,
	[Exp_Amount] [int] NULL DEFAULT ((0)),
	[Exp_By] [int] NULL DEFAULT ((0)),
	[Exp_Date] [datetime] NULL,
	[MonthYear] [nvarchar](50) NULL,
	[Finalized] [int] NULL DEFAULT ((0)),
	[IsDeleted] [int] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaaExpense_Details_PK] PRIMARY KEY NONCLUSTERED 
(
	[Exp_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Item_Details]    Script Date: 09/08/2009 11:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item_Details](
	[Item_Id] [int] IDENTITY(1,1) NOT NULL,
	[Item_Name] [nvarchar](100) NULL,
	[Item_Desc] [nvarchar](255) NULL,
	[Created_By] [nvarchar](50) NULL,
	[Entry_Date] [datetime] NULL,
	[IsActive] [int] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaaItem_Details_PK] PRIMARY KEY NONCLUSTERED 
(
	[Item_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[RoleDetails]    Script Date: 09/08/2009 11:17:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleDetails](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [aaaaaRoleDetails_PK] PRIMARY KEY NONCLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[User_Info]    Script Date: 09/08/2009 11:18:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Info](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[User_Name] [nvarchar](50) NULL,
	[Pwd] [nvarchar](50) NULL,
	[First_Name] [nvarchar](50) NULL,
	[Last_Name] [nvarchar](50) NULL,
	[EMail] [nvarchar](255) NULL,
	[Mobile] [nvarchar](255) NULL,
	[Last_Login_Date] [datetime] NULL,
	[Password_Change_Date] [datetime] NULL,
	[IsActive] [int] NULL DEFAULT ((0)),
 CONSTRAINT [aaaaaUser_Info_PK] PRIMARY KEY NONCLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

-- SCRIPT FOR ADDING MASTER DATA

--INSERT MASTER USER
INSERT INTO User_Info (RoleId,User_Name,Pwd,First_Name,Last_Name,EMail,Mobile,Last_Login_Date,Password_Change_Date,IsActive) VALUES 
 (1,'admin','a6jr0tclfyWJWKaPi9URIQ==','Admin','Admin','ak.tripathi@yahoo.com','9880946821','2009-08-24 00:00:00','2009-08-18 00:00:00',1);

--INSERT Roles
INSERT INTO RoleDetails (Role,Description) VALUES ('Admin','Super User')
INSERT INTO RoleDetails (Role,Description) VALUES  ('User',NULL)

--INSERT Test Item
INSERT INTO item_Details (Item_Name, Item_Desc, Created_By, IsActive)
VALUES('TestItem','Please edit this item details. Its simply added for test purpose.',1,1);