USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 05-05-2021 3.24.11 PM ******/
CREATE DATABASE [UserManagement]

ALTER DATABASE [UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE = OFF
GO
USE [UserManagement]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 05-05-2021 3.24.11 PM ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[LoginLogs]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginLogs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](250) NULL,
	[Password] [varchar](50) NULL,
	[LoginDate] [datetime] NULL,
	[isLogin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[Menuname] [varchar](250) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleMaster]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMaster](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Discription] [varchar](500) NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMenuMaster]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMenuMaster](
	[SubMenuID] [int] IDENTITY(1,1) NOT NULL,
	[SubMenuname] [varchar](250) NULL,
	[MenuId] [int] NULL,
	[Active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubMenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [uniqueidentifier] NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Active] [bit] NULL,
	[Email] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[MobileNo] [varchar](20) NULL,
	[UserType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRightMaster]    Script Date: 05-05-2021 3.24.12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRightMaster](
	[MenuID] [int] NULL,
	[UserId] [uniqueidentifier] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoginLogs] ON 
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1, N'saurav', N'12345122', CAST(N'2021-04-30T02:34:22.930' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2, N'saurav', N'12345122', CAST(N'2021-04-30T02:34:25.340' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (3, N'saurav', N'12345122', CAST(N'2021-04-30T02:34:27.547' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (4, N'saurav', N'12345', CAST(N'2021-04-30T02:45:40.207' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (5, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-01T19:56:23.317' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (6, N'saurav', N'12345', CAST(N'2021-05-01T19:56:32.143' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (7, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-01T20:11:51.367' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (8, N'saurav', N'12345', CAST(N'2021-05-01T20:11:54.960' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (9, N'saurav', N'12345', CAST(N'2021-05-01T20:11:59.790' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (10, N'saurav', N'12345', CAST(N'2021-05-01T20:12:53.827' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (11, N'saurav', N'12345', CAST(N'2021-05-01T20:12:56.737' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (12, N'saurav', N'12345', CAST(N'2021-05-02T15:39:54.763' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (13, N'saurav', N'12345', CAST(N'2021-05-02T15:39:55.457' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (14, N'saurav', N'12345', CAST(N'2021-05-02T19:44:53.353' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (15, N'saurav', N'12345', CAST(N'2021-05-02T19:44:54.543' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1002, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-03T14:28:06.243' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1003, N'saurav', N'12345', CAST(N'2021-05-03T14:29:06.123' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1004, N'saurav', N'12345', CAST(N'2021-05-03T14:29:08.337' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1005, N'saurav', N'12345', CAST(N'2021-05-03T14:34:48.407' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1006, N'saurav', N'12345', CAST(N'2021-05-03T14:48:15.483' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1007, N'saurav', N'12345', CAST(N'2021-05-03T14:48:39.793' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1008, N'saurav', N'12345', CAST(N'2021-05-03T14:48:56.203' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1009, N'saurav', N'12345', CAST(N'2021-05-03T14:48:56.810' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1010, N'saurav', N'12345', CAST(N'2021-05-03T14:48:56.970' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1011, N'saurav', N'12345', CAST(N'2021-05-03T14:48:57.120' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1012, N'saurav', N'12345', CAST(N'2021-05-03T15:04:39.300' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1013, N'saurav', N'12345', CAST(N'2021-05-03T15:44:06.473' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1014, N'saurav', N'12345', CAST(N'2021-05-03T15:55:06.807' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1015, N'saurav', N'12345', CAST(N'2021-05-03T15:55:08.757' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1016, N'saurav', N'12345', CAST(N'2021-05-03T16:09:39.240' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1017, N'saurav', N'12345', CAST(N'2021-05-03T16:09:40.690' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1018, N'saurav', N'12345', CAST(N'2021-05-03T16:09:41.537' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1019, N'saurav', N'12345', CAST(N'2021-05-03T16:38:16.527' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1020, N'saurav', N'12345', CAST(N'2021-05-03T16:38:17.680' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1021, N'saurav', N'12345', CAST(N'2021-05-03T16:45:24.173' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1022, N'saurav', N'12345', CAST(N'2021-05-03T16:45:26.400' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1023, N'saurav', N'12345', CAST(N'2021-05-03T16:45:27.583' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1024, N'saurav', N'12345', CAST(N'2021-05-03T16:45:27.723' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1025, N'saurav', N'12345', CAST(N'2021-05-03T16:45:27.900' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1026, N'saurav', N'12345', CAST(N'2021-05-03T16:51:07.353' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1027, N'saurav', N'12345', CAST(N'2021-05-03T16:52:37.600' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1028, N'saurav', N'1234', CAST(N'2021-05-03T17:07:07.400' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1029, N'saurav', N'12345', CAST(N'2021-05-03T17:07:14.527' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1030, N'saurav', N'12345', CAST(N'2021-05-03T17:15:26.713' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1031, N'saurav', N'12345', CAST(N'2021-05-03T19:56:43.393' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1032, N'saurav', N'12345', CAST(N'2021-05-03T19:56:43.413' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1033, N'saurav', N'12345', CAST(N'2021-05-03T21:51:40.903' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1034, N'saurav', N'12345', CAST(N'2021-05-03T22:02:29.290' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1035, N'saurav', N'12345', CAST(N'2021-05-03T22:04:31.793' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1036, N'saurav', N'12345', CAST(N'2021-05-03T22:25:48.050' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1037, N'saurav', N'12345', CAST(N'2021-05-03T23:14:42.630' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1038, N'saurav', N'12345', CAST(N'2021-05-03T23:53:36.413' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1039, N'saurav', N'12345', CAST(N'2021-05-03T23:53:44.320' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1040, N'saurav', N'12345', CAST(N'2021-05-03T23:56:05.880' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1041, N'saurav', N'12345', CAST(N'2021-05-03T23:57:40.823' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1042, N'saurav', N'12345', CAST(N'2021-05-04T00:05:55.063' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1043, N'saurav', N'12345', CAST(N'2021-05-04T00:06:26.017' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1044, N'saurav', N'12345', CAST(N'2021-05-04T14:54:37.637' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1045, N'saurav', N'12345', CAST(N'2021-05-04T14:55:00.630' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1046, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T16:14:24.037' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1047, N'saurav', N'12345', CAST(N'2021-05-04T16:54:41.363' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1048, N'saurav', N'12345111', CAST(N'2021-05-04T17:28:40.293' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1049, N'saurav', N'12345111', CAST(N'2021-05-04T17:28:43.290' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1050, N'saurav', N'12345111', CAST(N'2021-05-04T17:28:45.293' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1051, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T17:37:36.497' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1052, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T17:37:44.480' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1053, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T17:38:30.567' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1054, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T17:53:31.817' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1055, N'saurav', N'123456', CAST(N'2021-05-04T19:27:28.650' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1056, N'saurav', N'123456', CAST(N'2021-05-04T19:27:32.440' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1057, N'saurav', N'123456', CAST(N'2021-05-04T19:27:34.347' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1058, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T19:35:08.083' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1059, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T19:35:20.457' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1060, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T19:39:15.377' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1061, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T19:45:56.777' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1062, N'saurav', N'12345', CAST(N'2021-05-04T19:46:35.823' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1063, N'saurav', N'12345', CAST(N'2021-05-04T19:47:20.417' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1064, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T20:04:06.633' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1065, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T20:47:58.770' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1066, N'saurav', N'12345', CAST(N'2021-05-04T20:48:07.897' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1067, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T20:51:32.000' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1068, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T20:51:41.820' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1069, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T20:52:27.187' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1070, N'saurav', N'12345', CAST(N'2021-05-04T20:52:40.377' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (1071, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-04T21:14:16.060' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2038, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-05T10:41:34.143' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2039, N'saurav', N'12345', CAST(N'2021-05-05T10:42:04.733' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2040, N'saurav', N'123456', CAST(N'2021-05-05T10:44:33.473' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2041, N'saurav', N'123456', CAST(N'2021-05-05T10:44:37.073' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2042, N'saurav', N'123456', CAST(N'2021-05-05T10:44:39.320' AS DateTime), 0)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2043, N'saurav', N'12345', CAST(N'2021-05-05T15:07:39.667' AS DateTime), 1)
GO
INSERT [dbo].[LoginLogs] ([ID], [Email], [Password], [LoginDate], [isLogin]) VALUES (2044, N'saurav1@gmail.com', N'12345', CAST(N'2021-05-05T15:09:26.273' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[LoginLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleMaster] ON 
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [Discription], [Active]) VALUES (1, N'Admin1', N'Can add roles and rights', 1)
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [Discription], [Active]) VALUES (2, N'General', N'Can make changes for itself', 1)
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [Discription], [Active]) VALUES (3, N'User1', N'Can view profile', 1)
GO
INSERT [dbo].[RoleMaster] ([RoleID], [RoleName], [Discription], [Active]) VALUES (1002, N'Admin1', N'helo', 0)
GO
SET IDENTITY_INSERT [dbo].[RoleMaster] OFF
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [Active], [Email], [UserName], [Password], [MobileNo], [UserType]) VALUES (N'197acb70-0d6c-4db7-94c8-3893f7215b58', N'Saurav', N'Tanwer', 1, N'Sauravtanwer79@gmail.com', N'saurav', N'12345', N'8868878861', 1)
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [Active], [Email], [UserName], [Password], [MobileNo], [UserType]) VALUES (N'935276bf-ee98-414d-638f-08d90b9a2fe8', N'Ritika', N'JIndal', 1, N'Ritikajindal@gmail.com', N'saurav1@gmail.com', N'12345', N'8523698522', 2)
GO
INSERT [dbo].[UserMaster] ([UserId], [FirstName], [LastName], [Active], [Email], [UserName], [Password], [MobileNo], [UserType]) VALUES (N'9d7f371b-8d77-42b6-ff01-08d90ba3f45e', N'Randeep', N'Bhati', 1, N'bhatiRandeep@gmail.com', N'Randeep', N'12345', N'8785878451', 2)
GO
USE [master]
GO
ALTER DATABASE [UserManagement] SET  READ_WRITE 
GO
