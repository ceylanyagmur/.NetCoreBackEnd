USE [master]
GO
/****** Object:  Database [EShop]    Script Date: 11/15/2022 11:30:45 PM ******/
CREATE DATABASE [EShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [EShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EShop] SET  MULTI_USER 
GO
ALTER DATABASE [EShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EShop', N'ON'
GO
ALTER DATABASE [EShop] SET QUERY_STORE = OFF
GO
USE [EShop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UseId] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quatity] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
	[ShoppingID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ShoppingID] [int] NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderNo] [varchar](100) NULL,
	[OrderTotal] [decimal](18, 2) NULL,
	[OrderStatus] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shoppings]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shoppings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Manufacturer] [varchar](100) NULL,
	[UnitPrice] [decimal](18, 2) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Quantity] [int] NULL,
	[ExpDate] [datetime] NULL,
	[ImageUrl] [varchar](100) NULL,
	[Status] [int] NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK__Shopping__3214EC2796E91B80] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](100) NULL,
	[LastName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Fund] [decimal](18, 2) NULL,
	[Type] [varchar](100) NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([ID], [UseId], [UnitPrice], [Discount], [Quatity], [TotalPrice], [ShoppingID]) VALUES (1, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Cart] ([ID], [UseId], [UnitPrice], [Discount], [Quatity], [TotalPrice], [ShoppingID]) VALUES (2, 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, CAST(1.00 AS Decimal(18, 2)), 1)
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [OrderNo], [OrderTotal], [OrderStatus]) VALUES (1, 1, N'1111', CAST(1.00 AS Decimal(18, 2)), N'1')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Shoppings] ON 

INSERT [dbo].[Shoppings] ([ID], [Name], [Manufacturer], [UnitPrice], [Discount], [Quantity], [ExpDate], [ImageUrl], [Status], [Type]) VALUES (1, N'string', N'string', CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, CAST(N'2022-11-14T20:58:11.380' AS DateTime), N'string', 0, N'string')
SET IDENTITY_INSERT [dbo].[Shoppings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Password], [Email], [Fund], [Type], [Status], [CreatedOn]) VALUES (1, N'KAMIL', N'KAPLAN', N'Kamil1234', N'ceylanyagmur@gmail.com', CAST(1.00 AS Decimal(18, 2)), N'1', 1, CAST(N'2022-10-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Password], [Email], [Fund], [Type], [Status], [CreatedOn]) VALUES (2, N'Kamil', N'Kaplan', N'5678', N'kamilkaplnn@gmail.com', CAST(2.00 AS Decimal(18, 2)), N'2', 1, CAST(N'2022-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Password], [Email], [Fund], [Type], [Status], [CreatedOn]) VALUES (3, N'a', N'a', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Users] ([ID], [FirstName], [LastName], [Password], [Email], [Fund], [Type], [Status], [CreatedOn]) VALUES (4, N'Ceylan', N'Yagmur', N'ceylanyagmur123', N'string', CAST(0.00 AS Decimal(18, 2)), N'string', 0, CAST(N'2022-11-15T20:26:59.643' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_AddToCart]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_PlaceOrder 2

create procedure [dbo].[sp_AddToCart] @UseId int, @UnitPrice decimal(18, 2),
@Discount decimal(18, 2), @Quatity int, @TotalPrice decimal(18, 2), @ShoppingID int
as
insert into Cart values (@UseId, @UnitPrice, @Discount, @Quatity, @TotalPrice, @ShoppingID)
GO
/****** Object:  StoredProcedure [dbo].[sp_AddUpdateShopping]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_AddUpdateShopping] @Name varchar(100), @Manufacturer varchar(100),
@UnitPrice decimal(18, 2), @Discount decimal(18, 2), @Quantity int, 
@ExpDate datetime, @ImageUrl varchar(100), @Status int, @Type nvarchar(50)
as
insert into Shoppings (Name, Manufacturer, UnitPrice, Discount, Quantity, ExpDate, ImageUrl, Status, Type)
values(@Name, @Manufacturer, @UnitPrice, @Discount, @Quantity, @ExpDate, @ImageUrl, @Status, @Type)
GO
/****** Object:  StoredProcedure [dbo].[sp_login]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_PlaceOrder 2

create procedure [dbo].[sp_login] @Email varchar(100), @Password varchar(100)
as
select * from Users where Email = @Email and @Password = Password
GO
/****** Object:  StoredProcedure [dbo].[sp_OrderList]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_OrderList] @Type varchar(100), @Id int
as
select * from Orders where UserID = (
select ID from Users where Type = @Type and ID = @Id )
GO
/****** Object:  StoredProcedure [dbo].[sp_PlaceOrder]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_PlaceOrder] @Id int
as
select * from Orders where UserID = @Id
GO
/****** Object:  StoredProcedure [dbo].[sp_register]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_PlaceOrder 2

create procedure [dbo].[sp_register] 
@FirstName varchar(100),
@LastName varchar(100),
@Password varchar(100),
@Email varchar(100),
@Fund decimal(18, 2),
@Type varchar(100),
@Status int,
@CreatedOn datetime
as
insert into Users values (@FirstName, @LastName, @Password, @Email, @Fund, @Type, @Status, @CreatedOn)
GO
/****** Object:  StoredProcedure [dbo].[sp_updateProfile]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_PlaceOrder 2

create procedure [dbo].[sp_updateProfile] @ID int ,@FirstName varchar(100), @LastName varchar(100), @Password varchar(100),@Email varchar(100)
as
update Users set FirstName = @FirstName, LastName = @LastName, Password = @Password, Email = @Email
where ID = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_UserList]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UserList]
AS
SELECT * FROM Users 
GO
/****** Object:  StoredProcedure [dbo].[sp_viewUser]    Script Date: 11/15/2022 11:30:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_PlaceOrder 2

create procedure [dbo].[sp_viewUser] @ID int
as
select * from Users where ID = @ID
GO
USE [master]
GO
ALTER DATABASE [EShop] SET  READ_WRITE 
GO
