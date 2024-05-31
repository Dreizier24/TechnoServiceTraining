USE [master]
GO
/****** Object:  Database [TechnoService]    Script Date: 31.05.2024 11:31:58 ******/
CREATE DATABASE [TechnoService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TechnoService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechnoService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TechnoService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\TechnoService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TechnoService] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TechnoService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TechnoService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TechnoService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TechnoService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TechnoService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TechnoService] SET ARITHABORT OFF 
GO
ALTER DATABASE [TechnoService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TechnoService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TechnoService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TechnoService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TechnoService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TechnoService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TechnoService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TechnoService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TechnoService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TechnoService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TechnoService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TechnoService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TechnoService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TechnoService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TechnoService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TechnoService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TechnoService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TechnoService] SET RECOVERY FULL 
GO
ALTER DATABASE [TechnoService] SET  MULTI_USER 
GO
ALTER DATABASE [TechnoService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TechnoService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TechnoService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TechnoService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TechnoService] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TechnoService] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TechnoService', N'ON'
GO
ALTER DATABASE [TechnoService] SET QUERY_STORE = ON
GO
ALTER DATABASE [TechnoService] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TechnoService]
GO
/****** Object:  Table [dbo].[Fault]    Script Date: 31.05.2024 11:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fault](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FaultTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 31.05.2024 11:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateAdded] [date] NOT NULL,
	[Equipment] [nvarchar](100) NULL,
	[FaultTypeId] [int] NOT NULL,
	[ProblemDescription] [nvarchar](500) NOT NULL,
	[ClientName] [nvarchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
	[ApplicantId] [int] NULL,
	[ExecutorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.05.2024 11:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 31.05.2024 11:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StatusTitle] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.05.2024 11:31:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Fault] ON 

INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (1, N'аппаратные')
INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (2, N'программные')
INSERT [dbo].[Fault] ([Id], [FaultTitle]) VALUES (3, N'косвенные')
SET IDENTITY_INSERT [dbo].[Fault] OFF
GO
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([Id], [DateAdded], [Equipment], [FaultTypeId], [ProblemDescription], [ClientName], [StatusId], [ApplicantId], [ExecutorId]) VALUES (3, CAST(N'2024-05-31' AS Date), N'sdfsdf', 3, N'sdfsdfsdf', N'sdfsd sdfsd fsdfsd', 1, 1, NULL)
INSERT [dbo].[Request] ([Id], [DateAdded], [Equipment], [FaultTypeId], [ProblemDescription], [ClientName], [StatusId], [ApplicantId], [ExecutorId]) VALUES (4, CAST(N'2024-05-31' AS Date), N'1', 2, N'adsdfsdfsdf', N'1', 1, 1, NULL)
INSERT [dbo].[Request] ([Id], [DateAdded], [Equipment], [FaultTypeId], [ProblemDescription], [ClientName], [StatusId], [ApplicantId], [ExecutorId]) VALUES (5, CAST(N'2024-05-31' AS Date), N'1', 3, N'adfsfsdf', N'1', 1, 1, NULL)
INSERT [dbo].[Request] ([Id], [DateAdded], [Equipment], [FaultTypeId], [ProblemDescription], [ClientName], [StatusId], [ApplicantId], [ExecutorId]) VALUES (7, CAST(N'2024-05-31' AS Date), N'sdfsdf', 1, N'sffjsdfjksdfsdf', N'sdfsdfsdf', 1, 1, NULL)
SET IDENTITY_INSERT [dbo].[Request] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleTitle]) VALUES (1, N'администратор')
INSERT [dbo].[Role] ([Id], [RoleTitle]) VALUES (2, N'менеджер')
INSERT [dbo].[Role] ([Id], [RoleTitle]) VALUES (3, N'подающий')
INSERT [dbo].[Role] ([Id], [RoleTitle]) VALUES (4, N'исполнитель')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (1, N'в ожидании')
INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (2, N'в работе')
INSERT [dbo].[Status] ([Id], [StatusTitle]) VALUES (3, N'выполнено')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [RoleID]) VALUES (1, N'1', N'1', N'еукеуке', N'вамвам', N'вамвам', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [RoleID]) VALUES (2, N'2', N'2', N'ваппвкеу', N'вамвам', N'вапвап', 2)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [RoleID]) VALUES (3, N'3', N'3', N'фы', N'фывфыв', N'вапвап', 3)
INSERT [dbo].[User] ([Id], [Login], [Password], [Name], [Surname], [Lastname], [RoleID]) VALUES (4, N'4', N'4', N'фывфыв', N'фывфыв', N'', 4)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Fault] FOREIGN KEY([FaultTypeId])
REFERENCES [dbo].[Fault] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Fault]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Status]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([ApplicantId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User1] FOREIGN KEY([ExecutorId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [TechnoService] SET  READ_WRITE 
GO
