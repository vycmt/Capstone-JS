USE [master]
GO
/****** Object:  Database [BMW]    Script Date: 1/15/2017 2:26:19 PM ******/
CREATE DATABASE [BMW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BMW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BMW.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BMW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BMW_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BMW] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BMW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BMW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BMW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BMW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BMW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BMW] SET ARITHABORT OFF 
GO
ALTER DATABASE [BMW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BMW] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BMW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BMW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BMW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BMW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BMW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BMW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BMW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BMW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BMW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BMW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BMW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BMW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BMW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BMW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BMW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BMW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BMW] SET RECOVERY FULL 
GO
ALTER DATABASE [BMW] SET  MULTI_USER 
GO
ALTER DATABASE [BMW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BMW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BMW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BMW] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BMW', N'ON'
GO
USE [BMW]
GO
/****** Object:  Table [dbo].[Bids]    Script Date: 1/15/2017 2:26:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bids](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[SupplierID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Bid] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NULL,
	[SubCategoryID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[PaymentType] [int] NULL,
	[State] [nvarchar](max) NULL,
	[RequestID] [int] NULL,
	[SupplierID] [int] NULL,
	[Flag] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Productname] [nvarchar](max) NULL,
	[Manufacturer] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Flag] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestProducts]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestProducts](
	[RequestID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_RequestProducts] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Requests]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Requests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[OpenningBidPrice] [int] NULL,
	[PriceLeadership] [int] NULL,
	[Step] [int] NULL,
	[WinningBidder] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Requests] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ShopID] [int] NULL,
	[Price] [int] NULL,
	[Quality] [int] NULL,
	[Service] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Reivews] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopProducts]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopProducts](
	[ShopID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[InStock] [bit] NULL,
	[Price] [int] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_ShopProducts] PRIMARY KEY CLUSTERED 
(
	[ShopID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shops]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shops](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Shopname] [nvarchar](max) NULL,
	[SupplierID] [int] NULL,
	[Logo] [nvarchar](max) NULL,
	[State] [int] NULL,
	[Banner] [nvarchar](max) NULL,
	[Header] [nvarchar](max) NULL,
	[Footer] [nvarchar](max) NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_Shops] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/15/2017 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PhoneNumer] [nvarchar](max) NULL,
	[Role] [nvarchar](max) NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[UserToken] [nvarchar](max) NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Flag] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Requests]
GO
ALTER TABLE [dbo].[Bids]  WITH CHECK ADD  CONSTRAINT [FK_Bids_Users] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Bids] CHECK CONSTRAINT [FK_Bids_Users]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Categories] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Requests]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users2] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users2]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[RequestProducts]  WITH CHECK ADD  CONSTRAINT [FK_RequestProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[RequestProducts] CHECK CONSTRAINT [FK_RequestProducts_Products]
GO
ALTER TABLE [dbo].[RequestProducts]  WITH CHECK ADD  CONSTRAINT [FK_RequestProducts_Requests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[Requests] ([ID])
GO
ALTER TABLE [dbo].[RequestProducts] CHECK CONSTRAINT [FK_RequestProducts_Requests]
GO
ALTER TABLE [dbo].[Requests]  WITH CHECK ADD  CONSTRAINT [FK_Requests_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Requests] CHECK CONSTRAINT [FK_Requests_Users]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Shops] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Shops]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[ShopProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShopProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ShopProducts] CHECK CONSTRAINT [FK_ShopProducts_Products]
GO
ALTER TABLE [dbo].[ShopProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShopProducts_Shops] FOREIGN KEY([ShopID])
REFERENCES [dbo].[Shops] ([ID])
GO
ALTER TABLE [dbo].[ShopProducts] CHECK CONSTRAINT [FK_ShopProducts_Shops]
GO
USE [master]
GO
ALTER DATABASE [BMW] SET  READ_WRITE 
GO
