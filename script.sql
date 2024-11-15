USE [master]
GO
/****** Object:  Database [KT6]    Script Date: 21.10.2024 13:18:13 ******/
CREATE DATABASE [KT6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KT6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KT6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'KT6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\KT6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [KT6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KT6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KT6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KT6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KT6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KT6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KT6] SET ARITHABORT OFF 
GO
ALTER DATABASE [KT6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KT6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KT6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KT6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KT6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KT6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KT6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KT6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KT6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KT6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [KT6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KT6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KT6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KT6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KT6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KT6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KT6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KT6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KT6] SET  MULTI_USER 
GO
ALTER DATABASE [KT6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KT6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KT6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KT6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KT6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KT6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KT6] SET QUERY_STORE = OFF
GO
USE [KT6]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDOrder] [int] NOT NULL,
	[Article] [nvarchar](50) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMain]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMain](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[PunktVida] [int] NOT NULL,
	[IDClient] [int] NULL,
	[Code] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
 CONSTRAINT [PK_OrderMain] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producer]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Producer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticle] [nvarchar](50) NOT NULL,
	[IDSupply] [int] NOT NULL,
	[IDUnits] [int] NOT NULL,
	[Cost] [int] NOT NULL,
	[MaxSale] [int] NOT NULL,
	[IDProducer] [int] NOT NULL,
	[IDProvider] [int] NOT NULL,
	[IDCategory] [int] NOT NULL,
	[Sale] [int] NOT NULL,
	[CountOnStorage] [int] NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[PhotoName] [nvarchar](50) NULL,
	[PhotoPicture] [image] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Units]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Units](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.10.2024 13:18:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDRole] [int] NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name]) VALUES (1, N'Для животных')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (2, N'Товары для кошек')
INSERT [dbo].[Category] ([ID], [Name]) VALUES (3, N'Товары для собак')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (1, 1, N'А112Т4', 15)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (2, 2, N'F432F4', 15)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (3, 3, N'E532Q5', 10)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (4, 4, N'G345E4', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (5, 5, N'R356F4', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (6, 6, N'H436R4', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (7, 7, N'H342F5', 2)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (8, 8, N'K436T5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (9, 9, N'V527T5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (10, 10, N'M356R4', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (11, 1, N'G453T5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (12, 2, N'Y324F4', 15)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (13, 3, N'T432F4', 10)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (14, 4, N'E345R4', 2)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (15, 5, N'E431R5', 10)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (16, 6, N'D643B5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (17, 7, N'Q245F5', 2)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (18, 8, N'V527T5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (19, 9, N'K452T5', 1)
INSERT [dbo].[Order] ([ID], [IDOrder], [Article], [Count]) VALUES (20, 10, N'W548O7', 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderMain] ON 

INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (1, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 25, NULL, 601, 2)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (2, CAST(N'2022-05-06' AS Date), CAST(N'2022-05-12' AS Date), 20, NULL, 602, 2)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (3, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 22, 9, 603, 1)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (4, CAST(N'2022-05-08' AS Date), CAST(N'2022-05-14' AS Date), 24, NULL, 604, 1)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (5, CAST(N'2022-05-10' AS Date), CAST(N'2022-05-16' AS Date), 25, NULL, 605, 1)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (6, CAST(N'2022-05-11' AS Date), CAST(N'2022-05-17' AS Date), 28, 7, 606, 1)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (7, CAST(N'2022-05-12' AS Date), CAST(N'2022-05-18' AS Date), 36, NULL, 607, 2)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (8, CAST(N'2022-05-13' AS Date), CAST(N'2022-05-19' AS Date), 32, NULL, 608, 2)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (9, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 34, 1, 609, 2)
INSERT [dbo].[OrderMain] ([ID], [DateStart], [DateEnd], [PunktVida], [IDClient], [Code], [IDStatus]) VALUES (10, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 36, 8, 610, 1)
SET IDENTITY_INSERT [dbo].[OrderMain] OFF
GO
SET IDENTITY_INSERT [dbo].[Producer] ON 

INSERT [dbo].[Producer] ([ID], [Name]) VALUES (1, N'Cat Chow')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (2, N'Chappy')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (3, N'Dog Chow')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (4, N'Dreames')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (5, N'Fancy Pets')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (6, N'LIKER')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (7, N'Nobby')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (8, N'Pro Plan')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (9, N'TitBit')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (10, N'Triol')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (11, N'trixie')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (12, N'True Touch')
INSERT [dbo].[Producer] ([ID], [Name]) VALUES (13, N'ZooM')
SET IDENTITY_INSERT [dbo].[Producer] OFF
GO
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'B427R5', 5, 1, 400, 15, 10, 2, 1, 4, 5, N'Миска для животных Triol "Стрекоза", 450 мл', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'D356R4', 6, 1, 600, 15, 11, 1, 3, 2, 16, N'Мячик для собак TRIXIE DentaFun (32942) зеленый / белый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'D563F4', 1, 1, 600, 10, 10, 1, 3, 5, 5, N'Игрушка для собак Triol Бобер 41 см 12141053 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'D643B5', 7, 1, 4100, 30, 1, 1, 2, 4, 9, N'Сухой корм для котят CAT CHOW с высоким содержанием домашней птицы', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'E345R4', 1, 1, 199, 5, 5, 2, 2, 5, 7, N'Игрушка для животных «Котик» с кошачьей мятой FANCY PETS', N'E345R4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'E431R5', 3, 1, 170, 5, 10, 2, 3, 5, 5, N'Лакомство для собак Triol Кость из жил 7.5 см, 4шт. в уп.', N'E431R5.png', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'E434U6', 3, 1, 140, 20, 9, 2, 3, 3, 19, N'Лакомство для собак Titbit Лакомый кусочек Нарезка из говядины, 80 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'E466T6', 2, 1, 3500, 30, 10, 2, 3, 5, 3, N'Клетка для собак Triol 30671002 61х45.5х52 см серый/белый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'E532Q5', 3, 1, 166, 15, 9, 1, 3, 5, 18, N'Лакомство для собак Titbit Печенье Био Десерт с лососем стандарт, 350 г', N'E532Q5.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'F432F4', 7, 1, 1200, 10, 8, 2, 2, 3, 15, N'Сухой корм для кошек Pro Plan с чувствительным пищеварением', N'F432F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'G345E4', 6, 1, 300, 5, 6, 2, 3, 3, 19, N'Мячик для собак LIKER Мячик Лайкер (6294) оранжевый', N'G345E4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'G453T5', 8, 1, 149, 15, 12, 2, 1, 2, 7, N'Щетка-варежка True Touch для вычесывания шерсти, синий', N'G453T5.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'G542F5', 7, 1, 2190, 30, 8, 1, 3, 4, 7, N'Сухой корм для собак Pro Plan при чувствительном пищеварении, ягненок', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'H342F5', 1, 1, 510, 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Енот 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'H432F4', 5, 1, 385, 10, 10, 2, 1, 2, 17, N'Миска Triol 9002/KIDP3211/30261087 400 мл серебристый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'H436R4', 1, 1, 300, 15, 10, 1, 3, 2, 15, N'Игрушка для собак Triol 3D плетение EC-04/12171005 бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'H542R6', 3, 1, 177, 15, 10, 2, 3, 3, 15, N'Лакомство для собак Triol Мясные полоски из кролика, 70 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'H643W2', 5, 1, 292, 25, 10, 1, 1, 3, 13, N'Миска Triol CB02/30231002 100 мл бежевый/голубой', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'K436T5', 6, 1, 100, 5, 10, 2, 3, 4, 21, N'Мячик для собак Triol с косточками 12101096 желтый/зеленый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'K452T5', 4, 1, 800, 25, 13, 2, 3, 2, 17, N'Лежак для собак и кошек ZooM Lama 40х30х8 см бежевый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'M356R4', 3, 1, 50, 5, 9, 2, 3, 4, 6, N'Лакомство для собак Titbit Гематоген мясной Classic, 35 г', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'Q245F5', 1, 1, 510, 5, 10, 2, 3, 2, 17, N'Игрушка для собак Triol Бобер 41 см 12141063 серый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'R356F4', 5, 1, 234, 10, 7, 1, 3, 3, 17, N'Миска Nobby с рисунком Dog для собак 130 мл красный', N'R356F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'S245R4', 7, 1, 280, 15, 1, 2, 2, 3, 8, N'Сухой корм для кошек CAT CHOW', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'T432F4', 7, 1, 1700, 25, 2, 2, 3, 2, 5, N'Сухой корм для собак Chappi говядина по-домашнему, с овощами', N'T432F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'V352R4', 7, 1, 1700, 25, 2, 1, 3, 4, 9, N'Сухой корм для собак Chappi Мясное изобилие, мясное ассорти', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'V527T5', 1, 1, 640, 5, 10, 1, 3, 5, 4, N'Игрушка для собак Triol Ящерица 39 см коричневый', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'W548O7', 7, 1, 600, 15, 3, 1, 3, 5, 15, N'Сухой корм для щенков DOG CHOW Puppy, ягненок 2.5 кг', NULL, NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'Y324F4', 3, 1, 86, 5, 9, 1, 3, 4, 17, N'Лакомство для собак Titbit Косточки мясные с индейкой и ягненком, 145 г', N'Y324F4.jpg', NULL)
INSERT [dbo].[Product] ([ProductArticle], [IDSupply], [IDUnits], [Cost], [MaxSale], [IDProducer], [IDProvider], [IDCategory], [Sale], [CountOnStorage], [Description], [PhotoName], [PhotoPicture]) VALUES (N'А112Т4', 3, 1, 123, 30, 4, 1, 2, 3, 6, N'Лакомство для кошек Dreamies Подушечки с курицей, 140 г', N'А112Т4.png', NULL)
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ID], [Name]) VALUES (1, N'PetShop')
INSERT [dbo].[Provider] ([ID], [Name]) VALUES (2, N'ZooMir')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'Клиент')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Name]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([ID], [Name]) VALUES (2, N'Новый ')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supply] ON 

INSERT [dbo].[Supply] ([ID], [Name]) VALUES (1, N'Игрушка')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (2, N'Клетка')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (3, N'Лакомство')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (4, N'Лежак')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (5, N'Миска')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (6, N'Мячик')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (7, N'Сухой корм')
INSERT [dbo].[Supply] ([ID], [Name]) VALUES (8, N'Щетка-варежка')
SET IDENTITY_INSERT [dbo].[Supply] OFF
GO
SET IDENTITY_INSERT [dbo].[Units] ON 

INSERT [dbo].[Units] ([ID], [Name]) VALUES (1, N'шт.')
SET IDENTITY_INSERT [dbo].[Units] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (1, 2, N'Волкова', N'Эмилия', N'Артёмовна', N'nokupekidda2001@gmail.com', N'JlFRCZ')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (2, 3, N'Денисов', N'Михаил', N'Романович', N'frusubroppotou656@yandex.ru', N'YOyhfR')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (3, 1, N'Игнатьева', N'Алина', N'Михайловна', N'vilagajaunne-5170@yandex.ru', N'8ntwUp')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (4, 3, N'Соловьев', N'Ярослав', N'Маркович', N'frapreubrulloba1141@yandex.ru', N'rwVDh9')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (5, 1, N'Суслов', N'Илья', N'Арсентьевич', N'pixil59@gmail.com', N'2L6KZG')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (6, 3, N'Тимофеев', N'Михаил', N'Елисеевич', N'leuttevitrafo1998@mail.ru', N'RSbvHv')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (7, 2, N'Филимонов', N'Роберт', N'Васильевич', N'loudittoimmolau1900@gmail.com', N'LdNyos')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (8, 2, N'Чистякова', N'Виктория', N'Степановна', N'freineiciweijau888@yandex.ru', N'AtnDjr')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (9, 2, N'Шилова', N'Майя', N'Артемьевна', N'hittuprofassa4984@mail.com', N'gynQMT')
INSERT [dbo].[Users] ([ID], [IDRole], [LastName], [FirstName], [Patronymic], [Login], [Password]) VALUES (10, 1, N'Яковлева', N'Ярослава', N'Даниэльевна', N'deummecillummu-4992@mail.ru', N'uzWC67')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderMain] FOREIGN KEY([IDOrder])
REFERENCES [dbo].[OrderMain] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderMain]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([Article])
REFERENCES [dbo].[Product] ([ProductArticle])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[OrderMain]  WITH CHECK ADD  CONSTRAINT [FK_OrderMain_Status] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_Status]
GO
ALTER TABLE [dbo].[OrderMain]  WITH CHECK ADD  CONSTRAINT [FK_OrderMain_Users] FOREIGN KEY([IDClient])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[OrderMain] CHECK CONSTRAINT [FK_OrderMain_Users]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Producer] FOREIGN KEY([IDProducer])
REFERENCES [dbo].[Producer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Producer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([IDProvider])
REFERENCES [dbo].[Provider] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supply] FOREIGN KEY([IDSupply])
REFERENCES [dbo].[Supply] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supply]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Units] FOREIGN KEY([IDUnits])
REFERENCES [dbo].[Units] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Units]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
USE [master]
GO
ALTER DATABASE [KT6] SET  READ_WRITE 
GO
