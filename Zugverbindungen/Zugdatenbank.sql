USE [master]
GO
/****** Object:  Database [Zugdatenbank]    Script Date: 15.09.2021 16:23:28 ******/
CREATE DATABASE [Zugdatenbank]
GO
ALTER DATABASE [Zugdatenbank] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Zugdatenbank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Zugdatenbank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Zugdatenbank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Zugdatenbank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Zugdatenbank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Zugdatenbank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Zugdatenbank] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Zugdatenbank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Zugdatenbank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Zugdatenbank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Zugdatenbank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Zugdatenbank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Zugdatenbank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Zugdatenbank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Zugdatenbank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Zugdatenbank] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Zugdatenbank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Zugdatenbank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Zugdatenbank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Zugdatenbank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Zugdatenbank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Zugdatenbank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Zugdatenbank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Zugdatenbank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Zugdatenbank] SET  MULTI_USER 
GO
ALTER DATABASE [Zugdatenbank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Zugdatenbank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Zugdatenbank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Zugdatenbank] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Zugdatenbank] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Zugdatenbank]
GO
/****** Object:  Table [dbo].[Bahnhoefe]    Script Date: 15.09.2021 16:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bahnhoefe](
	[Name] [varchar](50) NOT NULL,
	[Gleise] [int] NULL,
	[LiegtInOrt] [varchar](50) NULL,
	[LiegtInKanton] [varchar](50) NULL,
 CONSTRAINT [PK_Bahnhoefe] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staedte]    Script Date: 15.09.2021 16:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staedte](
	[Name] [varchar](50) NOT NULL,
	[Kanton] [varchar](50) NULL,
 CONSTRAINT [PK_Staedte] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verbindet]    Script Date: 15.09.2021 16:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verbindet](
	[Zug] [int] NOT NULL,
	[Von] [varchar](50) NOT NULL,
	[Nach] [varchar](50) NULL,
	[Ankunft] [time](7) NULL,
	[Abfahrt] [time](7) NULL,
 CONSTRAINT [PK_Verbindet] PRIMARY KEY CLUSTERED 
(
	[Zug] ASC,
	[Von] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zuege]    Script Date: 15.09.2021 16:23:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zuege](
	[ZugNr] [int] NOT NULL,
	[Start] [varchar](50) NULL,
	[Ziel] [varchar](50) NULL,
	[Laenge] [int] NULL,
 CONSTRAINT [PK_Zuege] PRIMARY KEY CLUSTERED 
(
	[ZugNr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Baden', 7, N'Baden', N'Aargau')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Basel Bad', 4, N'Basel', N'Basel Stadt')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Basel SBB', 17, N'Basel', N'Basel Stadt')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Horw', 3, N'Horw', N'Luzern')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Luzern', 15, N'Luzern', N'Luzern    ')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Olten', 18, N'Olten', N'Solothurn')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Thalwil', 5, N'Thalwil', N'Zürich')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Zug', 8, N'Zug', N'Zug')
GO
INSERT [dbo].[Bahnhoefe] ([Name], [Gleise], [LiegtInOrt], [LiegtInKanton]) VALUES (N'Zürich HB', 52, N'Zürich', N'Zürich')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Baden', N'Aargau')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Basel', N'Basel Stadt')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Horw', N'Luzern')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Luzern', N'Luzern')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Olten', N'Solothurn')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Thalwil', N'Zürich')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Zug', N'Zug')
GO
INSERT [dbo].[Staedte] ([Name], [Kanton]) VALUES (N'Zürich', N'Zürich')
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (1, N'Luzern', N'Zug', CAST(N'12:35:00' AS Time), CAST(N'12:12:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (1, N'Thalwil', N'Zürich HB', CAST(N'13:05:00' AS Time), CAST(N'12:52:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (1, N'Zug', N'Thalwil', CAST(N'12:50:00' AS Time), CAST(N'12:37:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (2, N'Thalwil', N'Zug', CAST(N'13:40:00' AS Time), CAST(N'13:23:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (2, N'Zug', N'Luzern', CAST(N'14:00:00' AS Time), CAST(N'13:42:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (2, N'Zürich HB', N'Thalwil', CAST(N'13:22:00' AS Time), CAST(N'13:15:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (3, N'Luzern', N'Horw', CAST(N'14:14:00' AS Time), CAST(N'14:10:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (4, N'Horw', N'Luzern', CAST(N'14:25:00' AS Time), CAST(N'14:21:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (5, N'Luzern', N'Olten', CAST(N'14:42:00' AS Time), CAST(N'14:12:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (5, N'Olten', N'Basel SBB', CAST(N'15:08:00' AS Time), CAST(N'14:45:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (6, N'Basel SBB', N'Olten', CAST(N'15:33:00' AS Time), CAST(N'15:12:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (6, N'Olten', N'Luzern', CAST(N'16:05:00' AS Time), CAST(N'15:36:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (7, N'Baden', N'Basel SBB', CAST(N'14:05:00' AS Time), CAST(N'13:39:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (7, N'Basel SBB', N'Basel Bad', CAST(N'14:12:00' AS Time), CAST(N'14:08:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (7, N'Zürich HB', N'Baden', CAST(N'13:37:00' AS Time), CAST(N'13:25:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (8, N'Baden', N'Zürich HB', CAST(N'15:20:00' AS Time), CAST(N'15:07:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (8, N'Basel Bad', N'Basel SBB', CAST(N'14:30:00' AS Time), CAST(N'14:26:00' AS Time))
GO
INSERT [dbo].[Verbindet] ([Zug], [Von], [Nach], [Ankunft], [Abfahrt]) VALUES (8, N'Basel SBB', N'Baden', CAST(N'15:05:00' AS Time), CAST(N'14:32:00' AS Time))
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (1, N'Luzern', N'Zürich HB', 45)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (2, N'Zürich HB', N'Luzern', 48)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (3, N'Luzern', N'Horw', 25)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (4, N'Horw', N'Luzern', 25)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (5, N'Luzern', N'Basel SBB', 60)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (6, N'Basel SBB', N'Luzern', 60)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (7, N'Zürich HB', N'Basel Bad', 60)
GO
INSERT [dbo].[Zuege] ([ZugNr], [Start], [Ziel], [Laenge]) VALUES (8, N'Basel Bad', N'Zürich HB', 60)
GO
ALTER TABLE [dbo].[Verbindet]  WITH CHECK ADD  CONSTRAINT [FK_Verbindet_Bahnhoefe] FOREIGN KEY([Von])
REFERENCES [dbo].[Bahnhoefe] ([Name])
GO
ALTER TABLE [dbo].[Verbindet] CHECK CONSTRAINT [FK_Verbindet_Bahnhoefe]
GO
ALTER TABLE [dbo].[Verbindet]  WITH CHECK ADD  CONSTRAINT [FK_Verbindet_Zuege] FOREIGN KEY([Zug])
REFERENCES [dbo].[Zuege] ([ZugNr])
GO
ALTER TABLE [dbo].[Verbindet] CHECK CONSTRAINT [FK_Verbindet_Zuege]
GO
USE [master]
GO
ALTER DATABASE [Zugdatenbank] SET  READ_WRITE 
GO
