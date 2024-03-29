USE [master]
GO
/****** Object:  Database [GamerPlus]    Script Date: 5/9/2020 8:46:53 PM ******/
CREATE DATABASE [GamerPlus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GamerPlus', FILENAME = N'C:\Users\Gerald Alzaga\GamerPlus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GamerPlus_log', FILENAME = N'C:\Users\Gerald Alzaga\GamerPlus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GamerPlus] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GamerPlus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GamerPlus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GamerPlus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GamerPlus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GamerPlus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GamerPlus] SET ARITHABORT OFF 
GO
ALTER DATABASE [GamerPlus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GamerPlus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GamerPlus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GamerPlus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GamerPlus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GamerPlus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GamerPlus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GamerPlus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GamerPlus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GamerPlus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GamerPlus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GamerPlus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GamerPlus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GamerPlus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GamerPlus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GamerPlus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GamerPlus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GamerPlus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GamerPlus] SET  MULTI_USER 
GO
ALTER DATABASE [GamerPlus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GamerPlus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GamerPlus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GamerPlus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GamerPlus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GamerPlus] SET QUERY_STORE = OFF
GO
USE [GamerPlus]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [GamerPlus]
GO
/****** Object:  Table [dbo].[Console]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Console](
	[Console_ID] [int] IDENTITY(1,1) NOT NULL,
	[ConsoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Console] PRIMARY KEY CLUSTERED 
(
	[Console_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Developer]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Developer](
	[DevID] [int] IDENTITY(1,1) NOT NULL,
	[DeveloperName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Developer] PRIMARY KEY CLUSTERED 
(
	[DevID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Game]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[GameTitle] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NULL,
	[Image] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[System_Requirements] [nvarchar](max) NULL,
	[ConsoleID_FK] [int] NULL,
	[DevID_FK] [int] NULL,
	[BestSelling] [int] NULL,
	[GenreID_FK] [int] NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GamePreview]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePreview](
	[PreviewID] [int] IDENTITY(1,1) NOT NULL,
	[Preview] [nvarchar](max) NULL,
	[PreviewType] [int] NULL,
	[GameID_FK] [int] NULL,
 CONSTRAINT [PK_GamePreview] PRIMARY KEY CLUSTERED 
(
	[PreviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Genre]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[GenreName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Genre] PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NameLogo]    Script Date: 5/9/2020 8:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NameLogo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AppName] [nvarchar](50) NULL,
	[AppLogo] [nvarchar](50) NULL,
 CONSTRAINT [PK_NameLogo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Console] ON 

INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (1, N'All')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (2, N'GameCube')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (3, N'GameBoy Advance')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (4, N'GameBoy Color')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (5, N'Nintendo DS')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (6, N'Nintendo 3DS')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (7, N'Nintendo Wii')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (8, N'Nintendo Wii U')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (9, N'PlayStation')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (10, N'PlayStation 2')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (11, N'PlayStation 3')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (12, N'PlayStation 4')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (13, N'Xbox')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (14, N'Xbox 360')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (15, N'Xbox One')
INSERT [dbo].[Console] ([Console_ID], [ConsoleName]) VALUES (16, N'Xbox 5')
SET IDENTITY_INSERT [dbo].[Console] OFF
SET IDENTITY_INSERT [dbo].[Developer] ON 

INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1, N'Nintendo')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (2, N'Retro Studios')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (3, N'Capcom')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (4, N'Genius Sonority')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (5, N'Game Freak')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (6, N'Square Enix')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (7, N'Sonic Team, Dimps')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (8, N'Intelligent Systems')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (9, N'Konami')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (10, N'Banpresto')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (11, N'Core Design, Activision')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (12, N'Neversoft, Vicarious Visions')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (13, N'Acclaim Studios Teesside,')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (14, N'Rockstar North')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (15, N'Masahiro Sakurai')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (16, N'Q-Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (17, N'Grezzo')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (18, N'Mojang')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (19, N'Namco')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (20, N'Rockstar Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (21, N'SIE Santa Monica Studio')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (22, N'Naughty Dog')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (23, N'Treyarch')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (24, N'Rocksteady Studios')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (25, N'NetherRealm Studios')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (26, N'Insomniac Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (27, N'Visual Concepts')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (28, N'Epic Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (29, N'Playground Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (30, N'Panic Button Games')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (31, N'The Coalition')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (32, N'CD Projekt RED')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (33, N'Bethesda')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (34, N'Bungie')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1002, N'Respawn Entertainment')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1003, N'Rare')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1004, N'Remedy Entertainment')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1005, N'EA Tiburon')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1006, N'Studio MDHR')
INSERT [dbo].[Developer] ([DevID], [DeveloperName]) VALUES (1007, N'Gearbox Software')
SET IDENTITY_INSERT [dbo].[Developer] OFF
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1, N'Super Smash Bros. Melee', CAST(300.00 AS Decimal(18, 2)), N'/Images/supermariomelee.jpg', N'It is the second installment in the Super Smash Bros. series. It also features characters from Nintendo video game franchises such as Mario, The Legend of Zelda, Star Fox, and Pokémon. The stages and gameplay modes reference or take designs from these franchises as well.', N'Intel Core i5 First Gen or AMD Phenom II. nVidia 8xxx or ATi/AMD Radeon 4xxx Series Video Card. 4GB RAM', 2, 1, 2, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2, N'The Legend of Zelda: The Wind Waker', CAST(300.00 AS Decimal(18, 2)), N'/Images/wp-1-1920x1080-e13794567707251.jpg', N'The Legend of Zelda: The Wind Waker is a 2002 action-adventure game developed and published by Nintendo for the GameCube. The tenth installment in The Legend of Zelda series, The Wind Waker is set on a group of islands in a vast sea, a departure for the series.', N'CPU AMD Six-Core CPU / Intel Quad-Core CPU, RAM 6GB, OS Windows 8.1 64-bit or Windows 10, Graphics Card ASUS Radeon R7 250 / NVIDIA GeForce GTX 750 or higher; Graphics Memory 2 GB, HDD 8 GB ore more', 2, 1, 4, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (3, N'Metroid Prime', CAST(300.00 AS Decimal(18, 2)), N'/Images/Metroid Prime.jpg', N'Metroid Prime is an action-adventure game developed by Retro Studios and Nintendo for the GameCube. Metroid Prime is the fifth main installment in the Metroid series, and the first Metroid game to use 3D computer graphics being played from the first-person perspective.', N'Processor: A CPU with SSE2 support. A modern CPU (3 GHz and Dual Core, not older than 2008) is highly recommended. Graphics: A reasonably modern graphics card (Direct3D 10.0 / OpenGL 3.0). A graphics card that supports Direct3D 11 / OpenGL 4.4', 2, 2, 6, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (4, N'Resident Evil 4', CAST(300.00 AS Decimal(18, 2)), N'/Images/resident-evil-leon-s-kennedy.jpg', N'Resident Evil 4 is a third-person shooter survival horror video game developed by Capcom Production Studio 4 and published by Capcom. The sixth major installment in the Resident Evil series, it was originally released for the GameCube in 2005.', N'OS: Windows XP/ Vista®, Windows 7, Windows 8. Processor: Intel® Core™ 2 Duo 2.4 Ghz or better, AMD Athlon™ X2 2.8 Ghz or better. Memory: 2 GB RAM. Graphics: NVIDIA® GeForce® 8800GTS or better, ATI Radeon™ HD 4850 or better.', 2, 3, 8, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (5, N'Pokémon XD: Gale of Darkness', CAST(300.00 AS Decimal(18, 2)), N'/Images/Pokémon XD Gale of Darkness.jpg', N'Pokémon XD: Gale of Darkness, released in Japan as Pokémon XD Yami no Kaze Dark Lugia, is a role-playing video game, part of the Pokémon franchise, released for the GameCube. It is the successor of the GameCube game Pokémon Colosseum. The game takes place in Orre, the setting of Pokémon Colosseum''s adventure mode.', N'Platform GameCube,
Genre Role-Playing,
Number of players 1-4 Players,
Connectivity Handheld-Console Connectivity,
Difficulty Easy,
Learning curve About 1 hour,
Customization Downloadable Content,
Offline modes Competitive,Team Oriented', 2, 4, 10, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (6, N'Pokémon FireRed and LeafGreen', CAST(300.00 AS Decimal(18, 2)), N'/Images/Pokémon FireRed and LeafGreen.jpg', N'Pokémon FireRed Version and Pokémon LeafGreen Version are enhanced remakes of the 1996 role-playing video games Pokémon Red and Blue. They were developed by Game Freak, published by The Pokémon Company and Nintendo for the Game Boy Advance.', N'Platform Nintendo Game Boy Advance, 
Genre games - role playing game (RPG)', 3, 5, 4, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (7, N'Final Fantasy Tactics Advance', CAST(300.00 AS Decimal(18, 2)), N'/Images/final-fantasy-tactics-background-hd-1920x1080-387433.jpg', N'Final Fantasy Tactics Advance is a tactical role-playing game developed and published by Square for the Nintendo Game Boy Advance. A spin-off of the Final Fantasy series, the game shares several traits with 1997''s Final Fantasy Tactics, although it is not a direct sequel.', N'Platform Game Boy Advance, 
Genre Strategy, 
Context Fantasy, , 
Play Time Mode Turn-Based, 
Number of players 1-2 Players, 
Connectivity System Link, 
Offline modes Cooperative,Competitive', 3, 6, 2, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (8, N'Sonic Advance', CAST(300.00 AS Decimal(18, 2)), N'/Images/Sonic Advance.jpg', N'Sonic Advance is a 2001 side-scrolling platform game developed by Dimps for the Game Boy Advance. It was the first Sonic the Hedgehog game to be released on a Nintendo platform and was produced in commemoration of the series'' tenth anniversary.', N'Processor: 3.0 GHz Intel Pentium 4. Memory: 2GB RAM. Graphics: DirectX 9.0c compatible, NVIDIA GeForce 7300 series, ATI Radeon™ X1600 Video Card with 256MB RAM. DirectX®: DirectX 9.0c.', 3, 7, 6, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (9, N'Fire Emblem: The Sacred Stones', CAST(300.00 AS Decimal(18, 2)), N'/Images/FireEmblemTheSacredStones.jpg', N'Fire Emblem: The Sacred Stones is a tactical role-playing game developed by Intelligent Systems, and published by Nintendo for the Game Boy Advance handheld video game console in 2004 for Japan and 2005 in the West', N'PEGI Rating 7 ( Portugal 6+ ), 
Platform Nintendo Game Boy Advance, 
Genre strategy / tactics / wargame - wargame, 
Max Number of Players 4, 
ESRB Rating Everyone (6+), 
ESRB Content Descriptorsf antasy violence, 
PEGI Rating Exception Portugal 6+, 
PEGI Content Descriptors violence', 3, 8, 8, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (10, N'Castlevania: Circle of the Moon', CAST(300.00 AS Decimal(18, 2)), N'/Images/Castlevania Circle of the Moon.jpg', N'Castlevania: Circle of the Moon, known in the PAL region as simply Castlevania, is a platform video game created by Konami for the Game Boy Advance.', N'OS: Win 7 64, 
Processor: Intel Core i3-3240 3.4GHz / AMD Phenom II X4 40, 
Graphics: AMD Radeon HD 6770 or NVIDIA GeForce GTX 650 2GB, 
System Memory: 4 GB RAM, 
Storage: 10 GB Hard drive space', 3, 9, 20, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (11, N'Pokémon Crystal', CAST(300.00 AS Decimal(18, 2)), N'/Images/H2x1_GBC_PokemonCrystal_enGB.jpg', N'Pokémon Crystal Version is a role-playing video game developed by Game Freak and published by Nintendo for the Game Boy Color. It is an enhanced version of Pokémon Gold and Silver, and is part of the second generation of the Pokémon video game series.', N'CPU INTEL Core 2 Duo 2.66 GHz, RAM 4 GB, OS Windows XP/Vista/7/8/8.1/10, Direct X 9.0c, HDD 10 MB free', 4, 5, 8, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (12, N'Dragon Ball Z: Legendary SW', CAST(300.00 AS Decimal(18, 2)), N'/Images/Dragon Ball Z.jpg', N'The game''s story takes place from the start of Dragon Ball Z, the Saiyan Saga, and runs until the end of the Buu Saga. The game also includes two extra stories involving Future Trunks''s timeline. The game boasts a large array of characters for a Game Boy Color game, featuring all of the Ginyu Force, Super Saiyan forms of all characters that reach it, as well as the fusion characters Vegito and Gotenks.', N'Processor: Intel Core i5-2400 or AMD Phenom II X6 1100T. Memory: 4 GB RAM. Graphics: GeForce GTX 750 Ti or Radeon HD 7950. DirectX: Version 11.', 4, 10, 4, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (13, N'Tomb Raider: Curse of the Sword', CAST(300.00 AS Decimal(18, 2)), N'/Images/220px-Tomb_Raider_-_Curse_of_the_Sword.png', N'Tomb Raider: Curse of the Sword is an action-adventure video game, part of the Tomb Raider series, developed by Core Design and published by Activision under license from Eidos Interactive. It was released for the Game Boy Color in 2001, and it is a sequel to the first Tomb Raider for the same system.', N'CPU: Dual core CPU (AMD Athlon64 X2 2.1 Ghz (4050+)/Intel Core2 Duo 1.86 Ghz (E6300), 
RAM: 1 GB (Win XP), 2 GB (Win Vista/7), 
OS: Windows XP, Vista, 7, 8., 
VIDEO CARD: DirectX 9 Graphics card with 512 MB Video RAM (Radeon HD 2600 XT/Geforce 8600)', 4, 11, 6, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (14, N'Tony Hawk''s Pro Skater 3', CAST(300.00 AS Decimal(18, 2)), N'/Images/Tony Hawks Pro Skater 3.jpg', N'Tony Hawk''s Pro Skater 3 is a skateboarding video game in the Tony Hawk''s series. Named after professional skateboarder Tony Hawk, it was developed by Neversoft and published by Activision under the Activision O2 label in 2001 for the PlayStation 2, PlayStation, Game Boy Color and GameCube.', N'CPU Core i7-6700T 4-Core 2.8GHz, 
Graphics Card GeForce GTX 1060, 
RAM 11GB', 4, 12, 2, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (15, N'NBA Jam 99', CAST(300.00 AS Decimal(18, 2)), N'/Images/Nbajam99.jpg', N'NBA Jam 99 is a basketball game for the Nintendo 64 and Game Boy Color, released in 1998 by Acclaim Sports. New Jersey Nets forward Keith Van Horn appeared on the cover. ', NULL, 4, 13, 30, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1002, N'Mario Kart DS', CAST(800.00 AS Decimal(18, 2)), N'/Images/Mario Kart DS.jpg', N'Mario Kart DS is a go-kart racing video game developed and published by Nintendo. It was released for the Nintendo DS handheld game console on November 14, 2005 in North America, on November 17, 2005 in Australia, on November 25, 2005 in Europe, on December 8, 2005 in Japan, and on April 5, 2007 in South Korea.', N'Nintendo DS', 5, 1, 4, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1003, N'Pokémon Diamond and Pearl', CAST(800.00 AS Decimal(18, 2)), N'/Images/Pokémon Diamond and Pearl.jpg', N'Pokémon Diamond Version and Pokémon Pearl Version are role-playing video games developed by Game Freak, published by The Pokémon Company and Nintendo for the Nintendo DS. They are the first installments in the fourth generation of the Pokémon video game series.', N'Platform DS, 
Genre Role-Playing, 
Number of players 1-8 Players, 
Connectivity Wi-Fi, 
Difficulty Medium, 
Learning curve About a half hour', 5, 5, 6, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1004, N'Super Mario 64 DS', CAST(800.00 AS Decimal(18, 2)), N'/Images/SI_NDS_SuperMario64DS_image1600w.jpg', N'Super Mario 64 DS is a 2004 platform video game developed and published by Nintendo for the Nintendo DS. It was a launch title for the DS and the system''s first Mario game.', N'Nintendo DS', 5, 1, 2, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1005, N'Dragon Quest V', CAST(800.00 AS Decimal(18, 2)), N'/Images/175488.jpg', N'Dragon Quest V: Hand of the Heavenly Bride is a role-playing video game and the fifth installment in the Dragon Quest video game series, second of the Zenithian Trilogy.', N'Nintendo DS', 5, 6, 8, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1006, N'Grand Theft Auto: Chinatown Wars', CAST(800.00 AS Decimal(18, 2)), N'/Images/5026555042451_l.jpg', N'Grand Theft Auto: Chinatown Wars is an action-adventure video game, developed by Rockstar Leeds in conjunction with Rockstar North, and published by Rockstar Games for Nintendo DS and PlayStation Portable in 2009, iPhone, iPod Touch, and iOS in 2010, and Android and Fire OS devices in 2014.', N'Input Devices Supported	DS Microphone/Headset, Stylus, 
Multiplayer Game Modes	Attribute Image Co-Op, Attribute Image Free-for-all / One-on-one (VS), 
Number of Offline Players Attribute Image 1 Player, 
Number of Players: Wireless Multi-Card	Attribute Image 2 Players, 
Miscellaneous Attributes Wi-Fi Connection', 5, 14, 40, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1007, N'Mario Kart 7', CAST(800.00 AS Decimal(18, 2)), N'/Images/919L5NSGB6L._SX385_.jpg', N'Mario Kart 7 is a kart racing game developed by Nintendo EAD in cooperation with Retro Studios and published by Nintendo. As with previous games in the Mario Kart series, players participate in racing on various Mario-themed tracks, playing as one of seventeen different Mario characters.', N'Platform Nintendo 3DS, 
Genre racing / driving - kart, 
Multiplayer Yes, 
Online Game Internet, 
Max Number of Players 8.', 6, 1, 2, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1008, N'Pokémon X and Y', CAST(800.00 AS Decimal(18, 2)), N'/Images/61uurRhu0IL._AC_.jpg', N'Pokémon X and Pokémon Y are 2013 role-playing video games developed by Game Freak, published by The Pokémon Company and Nintendo for the Nintendo 3DS. They are the first installments in the sixth generation of the main Pokémon video game series.', N'Players:up to 4 players, 
Genre:Role-Playing, 
Publisher:Nintendo, 
Game file size:13789 Blocks.', 6, 5, 4, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1009, N'Kid Icarus: Uprising', CAST(800.00 AS Decimal(18, 2)), N'/Images/Kid Icarus Uprising.jpg', N'Kid Icarus: Uprising is a third-person shooter video game developed by Project Sora and Sora Ltd. and published by Nintendo for the Nintendo 3DS handheld video game console.', N'Platform Nintendo 3DS, 
Genre action - third person shooter, 
Max Number of Players 6, 
ESRB Rating Everyone 10 and older (10+).', 6, 15, 6, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1010, N'Star Fox 64 3D', CAST(800.00 AS Decimal(18, 2)), N'/Images/Star Fox 64 3D.jpg', N'Star Fox 64 3D is a video game for the Nintendo 3DS and is a remake of the 1997 videogame Star Fox 64. It was co-developed by Nintendo EAD and Q-Games, and was published by Nintendo. It was released on July 14, 2011 in Japan, September 9, 2011 in Europe and North America, and on September 15, 2011 in Australia.', N'Players: 1 player, 
Genre: Action, Shooter, 
Game file size: 4613 Blocks.', 6, 16, 8, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1011, N'Ever Oasis', CAST(800.00 AS Decimal(18, 2)), N'/Images/b76dc467e9d76d70dad5cc68e5fe81ca8ed1f1a6.jpg', N'Ever Oasis is an action-adventure role-playing video game developed by Grezzo and published by Nintendo for the Nintendo 3DS video game console. Ever Oasis resembles the Mana series, which also involved director Koichi Ishii, in its gameplay elements, and is considered to be that series’ spiritual successor.', N'Players: 1 player, 
Genre: Role-Playing, Action, Adventure, 
Game file size: 6237 Blocks.', 6, 17, 50, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1012, N'Super Smash Bros. Brawl', CAST(1000.00 AS Decimal(18, 2)), N'/Images/Super Smash Bros Brawl.jpg', N'Super Smash Bros. Brawl is a crossover fighting video game developed by Sora Ltd., HAL Laboratory, and Game Arts and published by Nintendo for the Wii. The third installment in the Super Smash Bros. series, it was announced at a pre-E3 2005 press conference by Nintendo president Satoru Iwata.', N'Platform Wii, 
Genre Action, 
Number of players 1-4 Players, 
Customization Editing Tools, 
Offline modes Cooperative,Competitive,Team Oriented, 
Online modes Competitive,Team Oriented.', 7, 1, 2, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1013, N'Resident Evil 4', CAST(1000.00 AS Decimal(18, 2)), N'/Images/Resident Evil 4.jpg', N'Resident Evil 4 is a third-person shooter survival horror video game developed by Capcom Production Studio 4 and published by Capcom. The sixth major installment in the Resident Evil series, it was originally released for the GameCube in 2005.', N'PEGI Rating 18, 
Platform Nintendo Wii, 
Genre action - third person shooter, 
ESRB Rating Mature (17+), 
ESRB Content Descriptors blood and gore, 
PEGI Content Descriptors violence.', 7, 3, 4, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1014, N'Super Mario Galaxy 2', CAST(1000.00 AS Decimal(18, 2)), N'/Images/wii_super_mario_galaxy_2_p_ujqur0.jpg', N'Super Mario Galaxy 2 is a 2010 platform video game developed and published by Nintendo for the Wii. It was first announced at E3 2009 and is the sequel to 2007''s Super Mario Galaxy. It was released worldwide in 2010.', N'Platform Wii, 
Genre action - platformer, 
Max Number of Players 1, 
ESRB Rating Everyone (6+), 
ESRB Content Descriptors mild cartoon violence.', 7, 1, 6, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1015, N'Donkey Kong Country Returns', CAST(1000.00 AS Decimal(18, 2)), N'/Images/SI_3DS_DonkeyKongCountryReturns3D_image1600w.jpg', N'Donkey Kong Country Returns is a side-scrolling platformer video game developed by Retro Studios and published by Nintendo for the Wii console. The game was released first in North America in November 2010, and in PAL regions and Japan the following month.', N'Platform Wii, 
Genre action - adventure, 
Max Number of Players 2, 
ESRB Rating Everyone (6+), 
ESRB Content Descriptors mild cartoon violence.', 7, 2, 8, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1016, N'The Legend of Zelda: Majora''s Mask', CAST(1000.00 AS Decimal(18, 2)), N'/Images/109413.jpg', N'The Legend of Zelda: Majora''s Mask is an action-adventure game developed and published by Nintendo for the Nintendo 64. It was released in 2000 as the sixth main installment in The Legend of Zelda series and was the second to use 3D graphics, following 1998''s The Legend of Zelda: Ocarina of Time.', N'Platform Wii, 
Genre Adventure, 
Number of players 1 Player, 
Difficulty Medium', 7, 1, 60, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1017, N'The Legend of Zelda: Breath of the Wild', CAST(1500.00 AS Decimal(18, 2)), N'/Images/The Legend of Zelda Breath of the Wild.jpg', N'The Legend of Zelda: Breath of the Wild is an action-adventure game developed and published by Nintendo, released for the Nintendo Switch and Wii U consoles on March 3, 2017.', N'3 GB of available storage are required on the Wii U system or external drive to play the main game. An additional 2.5 GB of storage is required to play DLC Packs 1 and 2.', 8, 1, 4, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1018, N'Minecraft', CAST(1500.00 AS Decimal(18, 2)), N'/Images/apps4b2cd93b8845.jpg', N'Minecraft is a sandbox video game developed by Mojang. Minecraft was created by Markus "Notch" Persson in the Java programming language and was released as a public alpha for personal computers in 2009 before officially releasing in November 2011, with Jens Bergensten taking over development around then.', N'Platform Wii, 
Players: up to 8 players, 
Genre: Action, Adventure', 8, 18, 2, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1019, N'Mario Kart 8', CAST(1500.00 AS Decimal(18, 2)), N'/Images/Mario Kart 8.jpg', N'Mario Kart 8 is a 2014 kart racing video game and the eighth major installment in the Mario Kart series, developed and published by Nintendo for their Wii U home video game console. The game was announced at E3 2013 and released worldwide in May 2014.', N'Platform Wii U, 
Genre racing / driving - kart, 
Multiplayer Yes, 
Online Game Internet,
Max Number of Players 12,
ESRB Rating Everyone (6+).', 8, 1, 6, 1)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1020, N'Splatoon', CAST(1500.00 AS Decimal(18, 2)), N'/Images/Splatoon.jpg', N'Splatoon is a third-person shooter video game developed and published by Nintendo for the Wii U, which was released worldwide in May 2015.', N'Platform Wii U, 
Players: up to 8 players, 
Genre: Action', 8, 1, 8, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1021, N'Mario Party 10', CAST(1500.00 AS Decimal(18, 2)), N'/Images/Mario Party 10.jpg', N'Mario Party 10 is a party video game developed by NDcube and published by Nintendo for the Wii U. The tenth main installment in the Mario Party series, it was released worldwide in March 2015.', N'Platform Wii U, 
Players: up to 5 players, 
Genre: Party.', 8, 1, 70, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1022, N'Final Fantasy VII', CAST(2000.00 AS Decimal(18, 2)), N'/Images/ff7r-cover-1920x1200-1.jpg', N'Final Fantasy VII is a 1997 role-playing video game developed by Square for the PlayStation console. It is the seventh main installment in the Final Fantasy series.', N'CPU: Info., 
CPU SPEED: 2 GHz., 
RAM: 1 GB., 
OS: Microsoft Windows XP/Vista/7., 
VIDEO CARD: DirectX 9.0c-compatible graphic card., 
FREE DISK SPACE: 3 GB.', 9, 6, 4, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1023, N'Metal Gear Solid', CAST(2000.00 AS Decimal(18, 2)), N'/Images/metal-gear-solid-mgs-wallpaper-1080p-121051.jpg', N'Metal Gear is a series of action-adventure stealth video games created by Hideo Kojima and developed and published by Konami. The first game, Metal Gear, was released in 1987 for MSX home computers.', N'OS: Windows 7x64, Windows 8x64 (64-bit OS Required), 
Processor: Intel Core i5-4460 (3.40 GHz) or better; Quad-core or better., 
Memory: 4 GB RAM., 
Graphics: NVIDIA GeForce GTX 650 (2GB) or better (DirectX 11 card Required), 
DirectX: Version 11., 
Hard Drive: 28 GB available space.', 9, 9, 2, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1024, N'Tekken 3', CAST(2000.00 AS Decimal(18, 2)), N'/Images/tekken-3-android-apk.jpg', N'Tekken 3 is a fighting game, the third installment in the Tekken series. It was released in arcades in March 1997, and for the PlayStation in 1998. The original arcade version of the game was released in 2005 for the PlayStation 2 as part of Tekken 5''s Arcade History mode.', N'Platform PlayStation, 
Genre Action, 
Number of players 1-2 Players, 
Difficulty Variable, 
Learning curve About a half hour.', 9, 19, 6, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1025, N'Street Fighter Alpha 3', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Street_Fighter_Alpha_3.jpg', N'Street Fighter Alpha 3 is a 2D competitive fighting game originally released by Capcom for the arcades in 1998. It is the third and final game in the Street Fighter Alpha sub-series, which serves as a prequel to Street Fighter II, and ran on the same CP System II hardware as previous Alpha games', N'Platform PlayStation, 
Genre Action, 
Number of players 1-2 Players, 
Difficulty Variable, 
Learning curve About 1 hour, 
Offline modes Competitive.', 9, 3, 8, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1026, N'Chrono Cross', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Chrono Cross.jpg', N'Chrono Cross is a 1999 role-playing video game developed and published by Square for the PlayStation video game console. It is the sequel to Chrono Trigger, which was released in 1995 for the Super Nintendo Entertainment System.', N'Platform PlayStation, 
Genre Role-Playing, 
Number of players 1 Player, 
Difficulty Medium, 
Learning curve About 1 hour.', 9, 6, 80, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1027, N'Grand Theft Auto III', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Grand Theft Auto III.jpg', N'Grand Theft Auto III is a 2001 action-adventure game developed by DMA Design and published by Rockstar Games. It is the first main entry in the Grand Theft Auto series since 1999''s Grand Theft Auto 2. ', N'Memory:96 MB., 
Graphics Card:NVIDIA GeForce 6200., 
CPU:Intel Core 2 Duo E8400., 
Grand Theft Auto III File Size:500 MB., 
OS:Microsoft® Windows® 2000/XP.', 10, 20, 2, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1028, N'Final Fantasy X-2', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Final Fantasy X2.jpg', N'Final Fantasy X-2 is a role-playing video game developed and published by Square for the PlayStation 2. As a direct sequel to 2001''s Final Fantasy X, the story follows Yuna as she seeks Tidus and tries to resolve political conflicts in Spira before it can lead to war. ', N'OS: Windows Vista or later., 
Processor: 2GHz Dual Core CPU., 
Memory: 1 GB RAM., 
Graphics: NVIDIA Geforce 9600GT VRAM 512MB or later / ATI Radeon HD 2600XT VRAM 512MB or later., 
Storage: 37 GB available space., 
Sound Card: DirectX Compatible Sound Card.', 10, 6, 4, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1029, N'God of War II', CAST(2000.00 AS Decimal(18, 2)), N'/Images/God of War II.jpg', N'God of War II is an action-adventure game developed by Santa Monica Studio and published by Sony Computer Entertainment. First released for the PlayStation 2 console on March 13, 2007, it is the second installment in the God of War series, the sixth chronologically, and the sequel to 2005''s God of War.', N'Operating System: Windows 7 / 8 / 8.1, Windows Vista 32-Bit with Service Pack 2 and the KB971512 platform update., 
Processor: AMD Athlon X2 2.8 GHZ or Intel Core 2 Duo 2.4 GHZ., 
CPU/Ram: 4GB or more., 
Total HDD Space Required: 8GB., 
Processor: AMD Athlon X2 2.8 GHz or higher; Intel Core 2 Duo 2.4 GHz or higher.', 10, 21, 6, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1030, N'Devil May Cry 3: Dante''s Awakening', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Devil May Cry 3 Dantes Awakening.jpg', N'Devil May Cry 3: Dante''s Awakening, known in Japan as Devil May Cry 3, is a hack and slash video game developed and published by Capcom, released in 2005 for the PlayStation 2 and ported to Microsoft Windows in 2006. The game is a prequel to the original Devil May Cry, featuring a younger Dante.', N'Radeon X850 Series graphics card, 
Pentium 4 2.0GHz or Athlon MP 1900+ processor,
500 MB performance memory,
Minimum RAM requirements are 128 MB system memory.', 10, 3, 200, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (1031, N'Resident Evil 3', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Resident Evil 3.jpg', N'Resident Evil 3 is a survival horror game developed and published by Capcom. It is a remake of Resident Evil 3: Nemesis and follows Jill Valentine and Carlos Oliveira as they attempt to survive a zombie apocalypse while hunted by the intelligent bioweapon Nemesis.', N'OS: Windows 7 64-bit, 
CPU:Â Intel Core i5-4460 3.2 GHz or AMD FX-6300 3.5 GHz., 
RAM: 8Â GB System Memory., 
GPU RAM:Â 2 GB Video Memory., 
GPU: NvidiaÂ GeForce GTX 760 or AMD Radeon R7 260X., 
HDD: TBA., 
DX: DirectX 11.', 10, 3, 300, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2002, N'The Last of Us', CAST(2000.00 AS Decimal(18, 2)), N'/Images/The_Last_of_Us.jpg', N'The Last of Us is a 2013 action-adventure game developed by Naughty Dog and published by Sony Computer Entertainment. Players control Joel, a smuggler tasked with escorting a teenage girl, Ellie, across a post-apocalyptic United States. The Last of Us is played from a third-person perspective.', N'RAM: 2 GB. Hard Disc Space: 14 GB. Direct X: 9.0c. Graphics Card: 512 MB RAM, Nvidia 7-series, AMD 3000-series.', 11, 22, 95, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2003, N'Uncharted 3: Drake''s Deception', CAST(2000.00 AS Decimal(18, 2)), N'/Images/91BJ4oyPXeL._SX466_.jpg', N'Uncharted 3: Drake''s Deception is a 2011 action-adventure game developed by Naughty Dog and published by Sony Computer Entertainment. It is the third game in the Uncharted series, and was released in November 2011 for the PlayStation 3.', N'Operating System: Windows 7 and the KB3135445 platform update.,
Processor: AMD Athlon X2 2.8 GHZ or Intel Core 2 Duo 2.4 GHZ., 
Ram: 4GB or more., 
Free Hard Drive Space: 46GB., 
Processor: AMD Athlon X2 2.8 GHz or higher; Intel Core 2 Duo 2.4 GHz or higher.', 11, 22, 4, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2004, N'Call of Duty: Black Ops', CAST(2000.00 AS Decimal(18, 2)), N'/Images/Call of Duty Black Ops.jpg', N'Call of Duty: Black Ops is a 2010 first-person shooter, developed by Treyarch and published by Activision. It was released worldwide in November 2010 for Microsoft Windows, the PlayStation 3, Xbox 360, and Wii, with a separate version for Nintendo DS developed by n-Space.', N'CPU: Intel Core 2 Duo E8200 2.66 GHz or AMD Phenom X3 8750 2.4 GHz., 
RAM: 2GB for 32-bit OS or 4GB for 64-bit OS., 
OS: Windows Vista SP2 or Windows 7., 
VIDEO CARD: Nvidia GeForce 8800GT 512 MB or ATI Radeon HD 3870 512 MB.', 11, 23, 6, 1)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2005, N'Batman: Arkham Asylum', CAST(2000.00 AS Decimal(18, 2)), N'/Images/71na7464UTL._SX385_.jpg', N'Batman: Arkham Asylum is a 2009 action-adventure game developed by Rocksteady Studios and published by Eidos Interactive in conjunction with Warner Bros. Interactive Entertainment.', N'CPU: Core 2 Duo E6600 (2.4 GHz) or AMD Athlon 64 X2 4600+
RAM: XP = 2 GB, Vista = 3 GB.
OS: Windows XP & Vista.
VIDEO CARD: 512 MB 3D Graphics card (NVIDIA GeForce 7900 GT or better)
TOTAL VIDEO RAM: 512 MB.
FREE DISK SPACE: 9 GB.', 11, 24, 2, 1)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2006, N'Mortal Kombat', CAST(2000.00 AS Decimal(18, 2)), N'/Images/43826-114613.jpg', N'Mortal Kombat is an American media franchise centered on a series of video games, originally developed by Midway Games in 1992.', N'OS: 32-bit Windows Vista or Windows 7 or Windows 8.
CPU: AMD Athlon X2 2.8@GHz or Intel Core Duo 2.4@GHz.
RAM: 2GB of Memory.
GPU: ATI Radeon 3850 or NVIDIA GeForce 8800 GT.
DX: 10.
OS: 64-bit Windows Vista or Windows 7 or Windows 8.
CPU: AMD Phenom II X4 965 @3.4GHz or Intel Core i5 750 @2.67GHz.
RAM: 4 GB of Memory.', 11, 25, 8, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2007, N'Marvel''s Spider-Man', CAST(2500.00 AS Decimal(18, 2)), N'/Images/3max.jpg', N'Marvel''s Spider-Man is a 2018 action-adventure game developed by Insomniac Games and published by Sony Interactive Entertainment. Based on the Marvel Comics superhero Spider-Man, it is inspired by the long-running comic book mythology and adaptations in other media.', N'HDD: 6.7 GB, 1 GB RAM of Free RAM, DirectX 9 version.', 12, 26, 2, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2008, N'Final Fantasy VII Remake', CAST(2500.00 AS Decimal(18, 2)), N'/Images/FFVIIRemake.png', N'Final Fantasy VII Remake is an action role-playing game developed and published by Square Enix, released for PlayStation 4 on April 10, 2020. It is the first in a planned series of games remaking the 1997 PlayStation game Final Fantasy VII.', N'Operating System: Windows 8 64-bit
Processor: AMD Six-Core CPU; Intel Quad-Core CPU
RAM: 8GB
Free Hard Drive Space: 2GB
Graphics Card: AMD Radeon 7870 or higher; NVIDIA GeForce GTX 660 or higher
Graphics Memory: 3GB', 12, 6, 4, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2009, N'God of War', CAST(2500.00 AS Decimal(18, 2)), N'/Images/4771107-l.jpg', N'God of War is an action-adventure game franchise created by David Jaffe at Sony''s Santa Monica Studio. It began in 2005 on the PlayStation 2 video game console, and has become a flagship title for the PlayStation brand, consisting of eight games across multiple platforms.', N'CPU AMD Six-Core CPU; Intel Quad-Core CPU, 
VRAM 2 GB, 
RAM 8GB, 
OS Windows 8 64-bit or Windows 10, 
Graphics Card AMD Radeon 7870 or higher; NVIDIA GeForce GTX 660 or higher; Graphics Memory: 3GB, 
Direct X 10, 
SOUND CARD DirectX Compatible, 
HDD Space 75GB.', 12, 21, 6, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2010, N'NBA 2K20', CAST(2500.00 AS Decimal(18, 2)), N'/Images/nba-2k20-3.jpg', N'NBA 2K20 is a basketball simulation video game developed by Visual Concepts and published by 2K Sports, based on the National Basketball Association. It is the 21st installment in the NBA 2K franchise and the successor to NBA 2K19.', N'OS: Windows 7 64-bit, Windows 8.1 64-bit or Windows 10 64-bit. Processor: Intel® Core™ i3-530 @ 2.93 GHz / AMD FX-4100 @ 3.60 GHz or better. Memory: 4 GB RAM. Graphics: NVIDIA® GeForce® GT 450 1GB / AMD® Radeon™ HD 7770 1GB', 12, 27, 8, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2011, N'Uncharted 4: A Thief''s End', CAST(2500.00 AS Decimal(18, 2)), N'/Images/uncharted.jpg', N'Uncharted 4: A Thief''s End is a 2016 action-adventure game developed by Naughty Dog and published by Sony Computer Entertainment. It is the fourth main entry in the Uncharted series.', N'Operating System: Windows 8 64-bit or Windows 10, 
Processor: AMD Six-Core CPU; Intel Quad-Core CPU, 
RAM: 8GB, 
Free Hard Drive Space: 30GB, 
Graphics Card: AMD Radeon 7870 or higher; NVIDIA GeForce GTX 660 or higher, 
Graphics Memory: 3GB.', 12, 22, 100, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2012, N'Fortnite', CAST(3000.00 AS Decimal(18, 2)), N'/Images/5c366de02a5b7442d75cda92.jpg', N'Fortnite is an online video game developed by Epic Games and released in 2017. It is available in three distinct game mode versions that otherwise share the same general gameplay and game engine:', N'CPU: Core i5 2.8GHz., 
RAM: 8GB RAM., 
HDD: 16GB Free Space., 
GPU: Nvidia GeForce GTX 660 / AMD Radeon HD 7870 or equivalent video card with dedicated memory of 2GB or higher VRAM., 
OS: Windows 7, 8.1, or Windows 10 64-bit., 
DirectX: Version 11 or better.', 13, 28, 2, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2013, N'Forza Horizon 4', CAST(3000.00 AS Decimal(18, 2)), N'/Images/ceae6d402db809e6180733e9ce8639aa.png', N'Forza Horizon 4 is a 2018 racing video game developed by Playground Games and published by Microsoft Studios. It was released on 2 October 2018 on Xbox One and Microsoft Windows after being announced at Xbox''s E3 2018 conference. The game is set in a fictionalised representation of areas of Great Britain.', N'OS: Windows 10 version 15063.0 or higher., 
DirectX: DirectX 12 API., 
Memory: 8GB., 
VRAM: 2GB., 
Processor: Intel i3-4170 @ 3.7Ghz or Intel i5 750 @ 2.67Ghz., 
Graphics card: Nvidia GTX 650 Ti or Nvidia GT 740 or AMD R7 250x.', 13, 29, 4, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2014, N'DOOM Eternal', CAST(3000.00 AS Decimal(18, 2)), N'/Images/doom-eternal-hd-wallpapers.jpg', N'Doom Eternal is a first person shooter video game developed by id Software and published by Bethesda Softworks. The sequel to Doom, and the fifth main game in the Doom series, it was released on March 20, 2020, for Windows, PlayStation 4, Stadia and Xbox One, with a Nintendo Switch version planned.', N'CPU: Intel Core i7-6700K or AMD Ryzen 7 1800X., 
RAM: 8 GB., 
HDD: 50 GB., 
GPU: Nvidia GeForce RTX 2060, GTX 1080 or AMD Radeon RX Vega 56. 
OS: Windows 7 / Windows 10 (64 bit), 
DirectX: 11., 
Screen Resolution: 1080p., 
Network: Broadband Internet connection.', 13, 30, 6, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2015, N'Gears 5', CAST(3000.00 AS Decimal(18, 2)), N'/Images/gears.jpg', N'Gears 5 is a third-person shooter video game developed by The Coalition and published by Xbox Game Studios for Microsoft Windows and Xbox One. It is the sixth installment of the Gears of War series and the sequel to Gears of War 4.', N'CPU: AMD FX-6000 series | Intel i3., 
RAM: 8 GB RAM., 
HDD: 80 GB available space., 
GPU: AMD Radeon R9 280 | NVIDIA GeForce GTX 760 (Windows 10) | NVIDIA GeForce GTX 1050 (Windows 7) or better.
OS: Windows 7 SP1 64-bit, Windows 10 64-bit., 
Screen Resolution: 1280×720.', 13, 31, 8, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2016, N'The Witcher 3: Wild Hunt', CAST(3000.00 AS Decimal(18, 2)), N'/Images/The Witcher 3 Wild Hunt.jpg', N'The Witcher 3: Wild Hunt is a 2015 action role-playing game developed and published by a Polish developer CD Projekt and is based on The Witcher series of fantasy novels by Andrzej Sapkowski. It is the sequel to the 2011 game The Witcher 2: Assassins of Kings, played in an open world with a third-person perspective.', N'CPU: Intel CPU Core i5-2500K 3.3GHz / AMD CPU Phenom II X4 940., 
RAM: 6 GB., 
OS: 64-bit Windows 7 or 64-bit Windows 8 (8.1), 
VIDEO CARD: Nvidia GPU GeForce GTX 660 / AMD GPU Radeon HD 7870., 
FREE DISK SPACE: 40 GB., 
DEDICATED VIDEO RAM: 1.5 GB.', 13, 32, 115, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2017, N'Call of Duty: Black Ops II', CAST(3000.00 AS Decimal(18, 2)), N'/Images/9098965_R_Z001A.jpg', N'Call of Duty: Black Ops II is a 2012 first-person shooter developed by Treyarch and published by Activision. It was released for Microsoft Windows, PlayStation 3, and the Xbox 360 on November 12, 2012, and for the Wii U on November 18 in North America and November 30 in PAL regions.', N'Processor: Intel Core2 Duo E8200 2.66 GHz or AMD Phenom X3 8750 2.4 GHz. Memory: 2 GB for 32-bit OS or 4 GB for 64-bit OS. Graphics: Nvidia GeForce 8800GT 512 MB or ATI Radeon HD 3870 512 MB. DirectX: Version 9.0c.', 14, 23, 2, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2018, N'Fallout 3', CAST(3000.00 AS Decimal(18, 2)), N'/Images/321173-fallout-3-xbox-360-front-cover.jpg', N'Fallout 3 is a post-apocalyptic action role-playing open world video game developed by Bethesda Game Studios and published by Bethesda Softworks. The third major installment in the Fallout series, it is the first game to be created by Bethesda since it bought the franchise from Interplay Entertainment.', N'Hard disk space: 7 GB. Video: Direct X 9.0c compliant video card with 512MB RAM. Sound: DirectX®: 9.0c. Controller support: Xbox 360 controller.', 14, 33, 4, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2019, N'The Elder Scrolls V: Skyrim', CAST(3000.00 AS Decimal(18, 2)), N'/Images/5911bb735bafe36b2b29ea68.jpg', N'The Elder Scrolls V: Skyrim is an action role-playing video game developed by Bethesda Game Studios and published by Bethesda Softworks.', N'4 GB System RAM. 6 GB free HDD space. DirectX 9 compatible NVIDIA or AMD ATI video card with 1GB of RAM (Nvidia GeForce GTX 260 or higher; ATI Radeon 4890 or higher). DirectX compatible sound card', 14, 33, 6, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2020, N'Halo 3', CAST(3000.00 AS Decimal(18, 2)), N'/Images/Halo 3.jpg', N'Halo 3 is a 2007 first-person shooter game developed by Bungie for the Xbox 360 console. The third installment in the Halo franchise, the game concludes the story arc begun in 2001''s Halo: Combat Evolved and continued in 2004''s Halo 2.', N'Platform Xbox 360, 
Genre Action, 
Context science-fiction, 
Number of players 1-4 Players, 
Connectivity System Link,Online, 
Offline modes Cooperative,Competitive,Team Oriented, 
Online modes Competitive,Team Oriented,Cooperative.', 14, 34, 8, 1)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2021, N'Pro Evolution Soccer 2018', CAST(3000.00 AS Decimal(18, 2)), N'/Images/81pY8n00pNL._SX342_.jpg', N'Pro Evolution Soccer 2018 is a sports video game developed and published by Konami for Microsoft Windows, PlayStation 3, PlayStation 4, Xbox 360 and Xbox One. The game is the 17th installment in the Pro Evolution Soccer series and was released worldwide in September 2017.', N'OS: Windows 10 64-bit., 
CPU: Intel Core i7-3770 3.4 GHzÂ orÂ AMD FX-4170 4.2 GHz., 
RAM: 8Â GB System Memory.,
GPU RAM:Â 2GB Video Memory., 
GPU: Nvidia GeForce GTX 660 or AMD Radeon HD 7950., 
HDD: 30GB Available Hard Drive Space., 
DX: DirectX 11.', 14, 9, 15, 1)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2022, N'Red Dead Redemption 2', CAST(3000.00 AS Decimal(18, 2)), N'/Images/unnamed.png', N'Red Dead Redemption 2 is a 2018 action-adventure game developed and published by Rockstar Games. The game is the third entry in the Red Dead series and is a prequel to the 2010 game Red Dead Redemption.', N'OS: Windows 10 - April 2018 Update (v1803), 
Processor: Intel Core i7-4770K / AMD Ryzen 5 1500X, 
Memory: 12GB, 
Graphics Card: Nvidia GeForce GTX 1060 6GB / AMD Radeon RX 480 4GB HDD Space: 150GB, 
Sound Card: DirectX compatible.', 15, 20, 2, 2)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2023, N'DOOM Eternal', CAST(3000.00 AS Decimal(18, 2)), N'/Images/doom-eternal-cover.jpg', N'Doom Eternal is a first person shooter video game developed by id Software and published by Bethesda Softworks. The sequel to Doom, and the fifth main game in the Doom series, it was released on March 20, 2020, for Windows, PlayStation 4, Stadia and Xbox One, with a Nintendo Switch version planned.', N'Radeon VII 16GB graphics card with a Core i9-9900K 8-Core 3.6GHz or Ryzen 7 3700X 8-Core 3.6GHz processor to reach the Ultra-Nightmare specs, achieving Ultra-Nightmare graphics setting on 4K at 60fps, or 1440p at 120fps.', 15, 1, 4, 3)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2024, N'Star Wars Jedi: Fallen Order', CAST(3000.00 AS Decimal(18, 2)), N'/Images/390x400_1x-0.jpeg', N'Star Wars Jedi: Fallen Order is an action-adventure game developed by Respawn Entertainment and published by Electronic Arts. It was released for Windows, PlayStation 4, and Xbox One on November 15, 2019. A Google Stadia version is due in 2020.', N'Memory:16 GB, 
Graphics Card:AMD Radeon RX Vega 56, 
CPU:Intel Core i7-6700K, 
File Size:55 GB, 
OS:64-bit Windows 7/8.1/10.', 15, 1002, 6, 4)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2025, N'Sea of Thieves', CAST(3000.00 AS Decimal(18, 2)), N'/Images/Sea_of_thieves_cover_art.jpg', N'Sea of Thieves is a 2018 action-adventure game developed by Rare and published by Microsoft Studios. The player assumes the role of a pirate who completes voyages from different trading companies in order to become the ultimate pirate legend.', N'OS Windows 10 Anniversary, 
Processor Intel i5 4690 @ 3.5GHz or AMD FX-8150 @ 3.6 GHz,
RAM 8GB, 
VRAM 4GB, 
GPU Nvidia GeForce GTX 770 or AMD Radeon R9 380x.', 15, 1003, 8, 5)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2026, N'Control', CAST(3000.00 AS Decimal(18, 2)), N'/Images/unnamed (1).png', N'Control is an action-adventure video game developed by Remedy Entertainment and published by 505 Games. Control was released on 27 August 2019 for Microsoft Windows, PlayStation 4, and Xbox One.', N'CPU: Intel Core i5-7600K / AMD Ryzen 5 1600X, 
RAM: 16 GB, 
HDD: 43 GB of storage space, 
GPU: NVIDIA GeForce GTX 1660/1060 / AMD Radeon RX 580 / NVIDIA GeForce RTX 2060 (for ray tracing), 
OS: 64-bit Windows 10, 
DirectX: DirectX 11 or 12, 
Screen Resolution: 1080p or better, 
Network: Broadband Internet Connection.', 15, 1004, 45, 6)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2027, N'Madden NFL 20', CAST(3000.00 AS Decimal(18, 2)), N'/Images/madden-nfl-20-xbox-one-cover.jpg', N'Madden NFL 20 is an American football video game based on the National Football League, developed by EA Tiburon and published by Electronic Arts.', N'CPU: AMD FX-4330 / Core i3-4350 or better, 
CPU SPEED: Info, 
RAM: 8 GB, 
OS: 64-bit Windows 10, 
VIDEO CARD: Radeon R9 270X / GeForce GTX 670 or better, 
PIXEL SHADER: 5.0, 
VERTEX SHADER: 5.0, 
FREE DISK SPACE: 48.5 GB, 
DEDICATED VIDEO RAM: 2048 MB.', 16, 1005, 2, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2028, N'Halo: The Master Chief Collection', CAST(3000.00 AS Decimal(18, 2)), N'/Images/halothemastv2erchiefcollectioncoveroriginal.jpg', N'Halo: The Master Chief Collection is a compilation of first-person shooter video games in the Halo series, originally released in November 2014 for the Xbox One, and later on Windows through 2019 and 2020.', N'CPU: AMD FX-4100 / Intel Core i7-870, 
CPU SPEED: Info, 
RAM: 8 GB, 
OS: WIndows 10, 
VIDEO CARD: AMD Radeon R7 360 ; NVIDIA GeForce GTX 560 TI, 
PIXEL SHADER: 5.0, 
VERTEX SHADER: 5.0, 
FREE DISK SPACE: 20 GB, 
DEDICATED VIDEO RAM: 1536 MB.', 16, 34, 4, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2029, N'Cuphead', CAST(3000.00 AS Decimal(18, 2)), N'/Images/apps.37905.13670972585585116.7f29dc82-c969-4e89-aaf9-7c0e3f52d890.jpg', N'Cuphead is a run and gun video game developed and published by the Canadian video game developer StudioMDHR in 2017.', N'OS Xbox One, Windows 10 version 14393.351 or higher, 
Memory 4 GB, 
Video Memory 1 GB, 
Processor Intel Core2 Duo E8400, 3.0GHz or AMD Athlon 64 X2 6000+, 3.0GHz or higher, 
Graphics Geforce 9600 GT or AMD HD 3870 512MB or higher.', 16, 1006, 6, 8)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2030, N'Borderlands 3', CAST(3000.00 AS Decimal(18, 2)), N'/Images/images.jpg', N'Borderlands 3 is an action role-playing first-person shooter video game developed by Gearbox Software and published by 2K Games. It is the sequel to 2012''s Borderlands 2, and the fourth main entry in the Borderlands series.', N'CPU: AMD Ryzen 5 2600 | Intel i7-4770, 
RAM: 16GB RAM, 
HDD: 75 GB available space, 
GPU: AMD Radeon™ RX 590 | NVIDIA GeForce GTX 1060 6GB or better, 
OS: Windows 7/8/10 64-bit with latest service pack, 
Screen Resolution: 2560 x 1440, 
DirectX: Version 12 – Hardware Level 11, 
Network: Broadband Internet connection, 
Sound Card: DirectX compatible.', 16, 1007, 8, 7)
INSERT [dbo].[Game] ([GameID], [GameTitle], [Price], [Image], [Description], [System_Requirements], [ConsoleID_FK], [DevID_FK], [BestSelling], [GenreID_FK]) VALUES (2031, N'Apex Legends', CAST(3000.00 AS Decimal(18, 2)), N'/Images/538006-apex-legends-xbox-one-front-cover.jpg', N'Apex Legends is a free-to-play battle royale game developed by Respawn Entertainment and published by Electronic Arts. It was released for Windows, PlayStation 4 and Xbox One on February 4, 2019, without any prior announcement or marketing. The game is in its fourth season.', N'OS: 64-bit Windows 7, 
CPU: Intel i5 3570K or equivalent, 
RAM: 8GB, 
GPU: Nvidia GeForce GTX 970 / AMD Radeon R9 290, 
GPU RAM: 8GB, 
HARD DRIVE: Minimum 22 GB of free space.', 16, 1002, 56, 6)
SET IDENTITY_INSERT [dbo].[Game] OFF
SET IDENTITY_INSERT [dbo].[GamePreview] ON 

INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1, N'/Images/mk8_01.jpg', 1, 1019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2, N'/Images/mk8_02.jpg', 1, 1019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3, N'/Images/mk8_03.jpg', 1, 1019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4, N'https://www.youtube.com/embed/tKlRN2YpxRE?rel=0', 2, 1019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5, N'/Images/melee-screenshot1.jpg', 1, 1)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6, N'/Images/melee-screenshot2.jpg', 1, 1)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7, N'/Images/melee-screenshot3.jpg', 1, 1)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (8, N'https://www.youtube.com/embed/WLu7e8RZoYc', 2, 1)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1005, N'/Images/the-legend-of-zelda-the-wind-waker-hd-1.jpg', 1, 2)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1006, N'/Images/the-legend-of-zelda-the-wind-waker-hd-2.jpg', 1, 2)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1007, N'/Images/the-legend-of-zelda-the-wind-waker-hd-3.jpg', 1, 2)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1008, N'https://www.youtube.com/embed/IkVt1s_ZFbw', 2, 2)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1009, N'/Images/mprime_wii_01.jpg', 1, 3)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1010, N'/Images/mprime_wii_02.jpg', 1, 3)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1011, N'/Images/mprime_wii_03.jpg', 1, 3)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1012, N'https://www.youtube.com/embed/kLfkkSD15zQ', 2, 3)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1013, N'/Images/RE4_Screenshot_2.jpg', 1, 4)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1014, N'/Images/RE4_Screenshot_1.jpg', 1, 4)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1015, N'/Images/RE4_Screenshot_3.jpg', 1, 4)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1016, N'https://www.youtube.com/embed/vP45ZXbFRH0', 2, 4)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1017, N'/Images/pokemonxdgaleofdarkness-1.jpg', 1, 5)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1018, N'/Images/pokemonxdgaleofdarkness-2.jpg', 1, 5)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1019, N'/Images/pokemonxdgaleofdarkness-3.jpg', 1, 5)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1020, N'https://www.youtube.com/embed/pEwe3eL92ck', 2, 5)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1021, N'/Images/pokefr1.jpg', 1, 6)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1022, N'/Images/pokefr2.jpg', 1, 6)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1023, N'/Images/pokefr3.jpg', 1, 6)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1024, N'https://www.youtube.com/embed/7Df6iOkYdHI', 2, 6)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1025, N'/Images/FFTactics1.jpg', 1, 7)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1026, N'/Images/FFTactics2.jpg', 1, 7)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1027, N'/Images/FFTactics3.jpg', 1, 7)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1028, N'https://www.youtube.com/embed/_RI_mIFuSzc', 2, 7)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1029, N'/Images/SonicA1.jpg', 1, 8)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1030, N'/Images/SonicA2.jpg', 1, 8)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1031, N'/Images/SonicA3.jpg', 1, 8)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1032, N'https://www.youtube.com/embed/Csv_Ina41no', 2, 8)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1033, N'/Images/FireEmblem1.jpg', 1, 9)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1034, N'/Images/FireEmblem2.jpg', 1, 9)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1035, N'/Images/FireEmblem3.jpg', 1, 9)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1036, N'https://www.youtube.com/embed/3e4AgTUhpHk', 2, 9)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1037, N'/Images/CastlevaniaCircleoftheMoon1.jpg', 1, 10)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1038, N'/Images/CastlevaniaCircleoftheMoon2.jpg', 1, 10)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1039, N'/Images/CastlevaniaCircleoftheMoon3.jpg', 1, 10)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1040, N'https://www.youtube.com/embed/LgcX2KOgvOU', 2, 10)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1041, N'/Images/PokémonCrystal01.jpg', 1, 11)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1042, N'/Images/PokémonCrystal02.jpg', 1, 11)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1043, N'/Images/PokémonCrystal03.jpg', 1, 11)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1044, N'https://www.youtube.com/embed/LGnKCzbpsKM', 2, 11)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1045, N'/Images/dragon_ball_z_legendary_super_warriors_image2.jpg', 1, 12)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1046, N'/Images/dragon_ball_z_legendary_super_warriors_image1.jpg', 1, 12)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1047, N'/Images/dragon_ball_z_legendary_super_warriors_image3.jpg', 1, 12)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1048, N'https://www.youtube.com/embed/II4-IPhgTqY', 2, 12)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1049, N'/Images/TombRaiderCurseoftheSword01.jpg', 1, 13)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1050, N'/Images/TombRaiderCurseoftheSword02.jpg', 1, 13)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1051, N'/Images/TombRaiderCurseoftheSword03.jpg', 1, 13)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (1052, N'https://www.youtube.com/embed/4unrgElGeHM', 2, 13)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2005, N'/Images/TonyHawksProSkater3_01.jpg', 1, 14)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2006, N'/Images/TonyHawksProSkater3_02.jpg', 1, 14)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2007, N'/Images/TonyHawksProSkater3_03.jpg', 1, 14)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2008, N'https://www.youtube.com/embed/ZckcdMkkbN8', 2, 14)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2009, N'/Images/NBAJam99_01.jpg', 1, 15)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2010, N'/Images/NBAJam99_02.jpg', 1, 15)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2011, N'/Images/NBAJam99_03.jpg', 1, 15)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2012, N'https://www.youtube.com/embed/hNQ-frOeF9Q', 2, 15)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2013, N'/Images/mario_kart_ds_image2.jpg', 1, 1002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2014, N'/Images/mario_kart_ds_image1.jpg', 1, 1002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2015, N'/Images/mario_kart_ds_image3.jpg', 1, 1002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2016, N'https://www.youtube.com/embed/3Bx9WtQ5EMg', 2, 1002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2017, N'/Images/PokémonDiamondandPearl_01.jpg', 1, 1003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2018, N'/Images/PokémonDiamondandPearl_02.jpg', 1, 1003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2019, N'/Images/PokémonDiamondandPearl_03.jpg', 1, 1003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2020, N'https://www.youtube.com/embed/BlzlJrdLkKc', 2, 1003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2021, N'/Images/SuperMario64DS_01.jpg', 1, 1004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2022, N'/Images/SuperMario64DS_02.jpg', 1, 1004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2023, N'/Images/SuperMario64DS_03.jpg', 1, 1004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2024, N'https://www.youtube.com/embed/3fCtmY9tEjw', 2, 1004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2025, N'/Images/Dragon Quest V_01.jpg', 1, 1005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2026, N'/Images/Dragon Quest V_02.jpg', 1, 1005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2027, N'/Images/Dragon Quest V_03.jpg', 1, 1005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2028, N'https://www.youtube.com/embed/SFpZ7-Wtw3s', 2, 1005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2029, N'/Images/gtaChinatownWars01.jpg', 1, 1006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2030, N'/Images/gtaChinatownWars02.jpg', 1, 1006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2031, N'/Images/gtaChinatownWars03.jpg', 1, 1006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (2032, N'https://www.youtube.com/embed/Djgn5ejgHCQ', 2, 1006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3005, N'/Images/mk7.jpg', 1, 1007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3006, N'/Images/mk7_02.jpg', 1, 1007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3007, N'/Images/mk7_03.jpg', 1, 1007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3008, N'https://www.youtube.com/embed/N36jPMZWyAA', 2, 1007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3009, N'/Images/PokémonXandY_01.jpg', 1, 1008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3010, N'/Images/PokémonXandY_02.jpg', 1, 1008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3011, N'/Images/PokémonXandY_03.jpg', 1, 1008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3012, N'https://www.youtube.com/embed/t13fIcpyhDk', 2, 1008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3013, N'/Images/KidIcarus_Uprising_01.jpg', 1, 1009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3014, N'/Images/KidIcarus_Uprising_03.jpg', 1, 1009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3015, N'/Images/KidIcarus_Uprising_02.jpg', 1, 1009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3016, N'https://www.youtube.com/embed/LVTElnEiDyQ', 2, 1009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3017, N'/Images/star-fox-64-3d-screenshot_01.jpg', 1, 1010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3018, N'/Images/star-fox-64-3d-screenshot_02.jpg', 1, 1010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3019, N'/Images/star-fox-64-3d-screenshot_03.jpg', 1, 1010)
GO
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3020, N'https://www.youtube.com/embed/6QljgmvG5lE', 2, 1010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3021, N'/Images/Ever-Oasis_01.jpg', 1, 1011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3022, N'/Images/Ever-Oasis_02.jpg', 1, 1011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3023, N'/Images/Ever-Oasis_03.jpg', 1, 1011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3024, N'https://www.youtube.com/embed/vLoh8lz8sKY', 2, 1011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3025, N'/Images/super-smash-bros-brawl-screenshot_01.jpg', 1, 1012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3026, N'/Images/super-smash-bros-brawl-screenshot_02.jpg', 1, 1012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3027, N'/Images/super-smash-bros-brawl-screenshot_03.jpg', 1, 1012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3028, N'https://www.youtube.com/embed/PbetJKOQB7k', 2, 1012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3029, N'/Images/RE4wii_01.jpg', 1, 1013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3030, N'/Images/RE4wii_02.jpg', 1, 1013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3031, N'/Images/RE4wii_03.jpg', 1, 1013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3032, N'https://www.youtube.com/embed/nxrxwuU8_iM', 2, 1013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3033, N'/Images/margal2-1.jpg', 1, 1014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3034, N'/Images/margal2-2.jpg', 1, 1014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3035, N'/Images/margal2-3.jpg', 1, 1014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3036, N'https://www.youtube.com/embed/O7steQttNTo', 2, 1014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3037, N'/Images/donkey-kong-country-returns-1.jpg', 1, 1015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3038, N'/Images/donkey-kong-country-returns-2.jpg', 1, 1015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3039, N'/Images/donkey-kong-country-returns-3.jpg', 1, 1015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3040, N'https://www.youtube.com/embed/TMhEs78Zix8', 2, 1015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3041, N'/Images/TheLegendofZeldaMajorasMask01.jpg', 1, 1016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3042, N'/Images/TheLegendofZeldaMajorasMask02.jpg', 1, 1016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3043, N'/Images/TheLegendofZeldaMajorasMask03.jpg', 1, 1016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3044, N'https://www.youtube.com/embed/cyazYYev7Nw', 2, 1016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3045, N'/Images/legendzeldabreathwild1.jpg', 1, 1017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3046, N'/Images/legendzeldabreathwild2.jpg', 1, 1017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3047, N'/Images/legendzeldabreathwild3.jpg', 1, 1017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3048, N'https://www.youtube.com/embed/1rPxiXXxftE', 2, 1017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3049, N'/Images/minecraft-1.jpg', 1, 1018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3050, N'/Images/minecraft-2.jpg', 1, 1018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3051, N'/Images/minecraft-3.jpg', 1, 1018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3052, N'https://www.youtube.com/embed/AV9Bqba8V1Q', 2, 1018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3053, N'/Images/splatoon_03.jpg', 1, 1020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3054, N'/Images/splatoon_01.jpg', 1, 1020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3055, N'/Images/splatoon_02.jpg', 1, 1020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3056, N'https://www.youtube.com/embed/8L54s2m1dPs', 2, 1020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3057, N'/Images/MarioParty10_01.jpg', 1, 1021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3058, N'/Images/MarioParty10_02.jpg', 1, 1021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3059, N'/Images/MarioParty10_03.jpg', 1, 1021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (3060, N'https://www.youtube.com/embed/L69Z39bgdU4', 2, 1021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4005, N'/Images/ff7-1.jpg', 1, 1022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4006, N'/Images/ff7-2.jpg', 1, 1022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4007, N'/Images/ff7-3.jpg', 1, 1022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4008, N'https://www.youtube.com/embed/utVE4aUKYuY', 2, 1022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4009, N'/Images/metal-gear-solid-playstation-screenshot01.jpg', 1, 1023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4010, N'/Images/metal-gear-solid-playstation-screenshot02.jpg', 1, 1023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4011, N'/Images/metal-gear-solid-playstation-screenshot03.jpg', 1, 1023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4012, N'https://www.youtube.com/embed/5SA5VVBb2bU', 2, 1023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4013, N'/Images/tekken-3-playstation-screenshot-1.jpg', 1, 1024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4014, N'/Images/tekken-3-playstation-screenshot-2.jpg', 1, 1024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4015, N'/Images/tekken-3-playstation-screenshot-3.jpg', 1, 1024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4016, N'https://www.youtube.com/embed/n8DLyuosCp8', 2, 1024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4017, N'/Images/SFA01.jpg', 1, 1025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4018, N'/Images/SFA02.jpg', 1, 1025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4019, N'/Images/SFA03.jpg', 1, 1025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4020, N'https://www.youtube.com/embed/4NKbNyHSaeQ', 2, 1025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4021, N'/Images/ChronoCross01.jpg', 1, 1026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4022, N'/Images/ChronoCross02.jpg', 1, 1026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4023, N'/Images/ChronoCross03.jpg', 1, 1026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4024, N'https://www.youtube.com/embed/U709nJ_AQ-s', 2, 1026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4025, N'/Images/GrandTheftAutoIII-01.jpg', 1, 1027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4026, N'/Images/GrandTheftAutoIII-02.jpg', 1, 1027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4027, N'/Images/GrandTheftAutoIII-03.jpg', 1, 1027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4028, N'https://www.youtube.com/embed/lCyiW882D7U', 2, 1027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4029, N'/Images/slus-20672-game-ss-1.jpg', 1, 1028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4030, N'/Images/slus-20672-game-ss-2.jpg', 1, 1028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4031, N'/Images/slus-20672-game-ss-3.jpg', 1, 1028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4032, N'https://www.youtube.com/embed/St0vHw4OOyE', 2, 1028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4033, N'/Images/scus-97481-game-ss-01.jpg', 1, 1029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4034, N'/Images/scus-97481-game-ss-02.jpg', 1, 1029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4035, N'/Images/scus-97481-game-ss-03.jpg', 1, 1029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4036, N'https://www.youtube.com/embed/oe0OmX9hINA', 2, 1029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4037, N'/Images/maxresdefault.jpg', 1, 1030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4038, N'/Images/maxresdefault2.jpg', 1, 1030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4039, N'/Images/maxresdefault3.jpg', 1, 1030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4040, N'https://www.youtube.com/embed/DDVIve_LP0Q', 2, 1030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4041, N'/Images/ResidentEvil3_01.jpg', 1, 1031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4042, N'/Images/ResidentEvil3_02.jpg', 1, 1031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4043, N'/Images/ResidentEvil3_03.jpg', 1, 1031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4044, N'https://www.youtube.com/embed/spDD7fxVETQ', 2, 1031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4045, N'/Images/TheLastofUs_01.jpg', 1, 2002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4046, N'/Images/TheLastofUs_02.jpg', 1, 2002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4047, N'/Images/TheLastofUs_03.jpg', 1, 2002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4048, N'https://www.youtube.com/embed/OQWD5W3fpPM', 2, 2002)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4049, N'/Images/uncharted-3-screenshots-1.jpg', 1, 2003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4050, N'/Images/uncharted-3-screenshots-2.jpg', 1, 2003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4051, N'/Images/uncharted-3-screenshots-3.jpg', 1, 2003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4052, N'https://www.youtube.com/embed/DHHcM6aHPnE', 2, 2003)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4053, N'/Images/ps3-game-6751-ss01.jpg', 1, 2004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4054, N'/Images/ps3-game-6751-ss02.jpg', 1, 2004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4055, N'/Images/ps3-game-6751-ss03.jpg', 1, 2004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4056, N'https://www.youtube.com/embed/OPTOVQFRggI', 2, 2004)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4057, N'/Images/maxresdefault01.jpg', 1, 2005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4058, N'/Images/maxresdefault02.jpg', 1, 2005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4059, N'/Images/maxresdefault03.jpg', 1, 2005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4060, N'https://www.youtube.com/embed/T8bu2Y_cZb8', 2, 2005)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4061, N'/Images/MK9_01.jpg', 1, 2006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4062, N'/Images/MK9_02.jpg', 1, 2006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4063, N'/Images/MK9_03.jpg', 1, 2006)
GO
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4064, N'https://www.youtube.com/embed/o00-MspCacs', 2, 2006)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4065, N'/Images/marvels-spider-man-screen-01.jpg', 1, 2007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4066, N'/Images/marvels-spider-man-screen-02.jpg', 1, 2007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4067, N'/Images/marvels-spider-man-screen-03.jpg', 1, 2007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4068, N'https://www.youtube.com/embed/8pR0o2fGyHg', 2, 2007)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4069, N'/Images/FinalFantasyVIIRemake01.jpg', 1, 2008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4070, N'/Images/FinalFantasyVIIRemake02.jpg', 1, 2008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4071, N'/Images/FinalFantasyVIIRemake03.jpg', 1, 2008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4072, N'https://www.youtube.com/embed/sz9QWTcbXYE', 2, 2008)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4073, N'/Images/gow_01.jpg', 1, 2009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4074, N'/Images/gow_02.jpg', 1, 2009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4075, N'/Images/gow_03.jpg', 1, 2009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4076, N'https://www.youtube.com/embed/K0u_kAWLJOA', 2, 2009)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4077, N'/Images/nba-2k20-screenshot-01.jpg', 1, 2010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4078, N'/Images/nba-2k20-screenshot-02.jpg', 1, 2010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4079, N'/Images/nba-2k20-screenshot-03.jpg', 1, 2010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4080, N'https://www.youtube.com/embed/I2O0gsYlesw', 2, 2010)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4081, N'/Images/uncharted-4-1.jpg', 1, 2011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4082, N'/Images/uncharted-4-2.jpg', 1, 2011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4083, N'/Images/uncharted-4-3.jpg', 1, 2011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4084, N'https://www.youtube.com/embed/y1Rx-Bbht5E', 2, 2011)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4085, N'/Images/fornite-xbox-1.jpg', 1, 2012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4086, N'/Images/fornite-xbox-2.jpg', 1, 2012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4087, N'/Images/fornite-xbox-3.jpg', 1, 2012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4088, N'https://www.youtube.com/embed/qpKtzf5fXn4', 2, 2012)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4089, N'/Images/ForzaHorizon4_01.jpg', 1, 2013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4090, N'/Images/ForzaHorizon4_02.jpg', 1, 2013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4091, N'/Images/ForzaHorizon4_03.jpg', 1, 2013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4092, N'https://www.youtube.com/embed/zJ477xAIlgU', 2, 2013)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4093, N'/Images/DOOMEternal01.jpg', 1, 2014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4094, N'/Images/DOOMEternal02.jpg', 1, 2014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4095, N'/Images/DOOMEternal03.jpg', 1, 2014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4096, N'https://www.youtube.com/embed/WZ8EmUkh0Y4', 2, 2014)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4097, N'/Images/EDoGuJgUcAI0LLE01.jpg', 1, 2015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4098, N'/Images/EDoGuJgUcAI0LLE02.jpg', 1, 2015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4099, N'/Images/EDoGuJgUcAI0LLE03.jpg', 1, 2015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4100, N'https://www.youtube.com/embed/q_Qi14S4Djw', 2, 2015)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4101, N'/Images/TheWitcher3WildHunt01.jpg', 1, 2016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4102, N'/Images/TheWitcher3WildHunt02.jpg', 1, 2016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4103, N'/Images/TheWitcher3WildHunt03.jpg', 1, 2016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (4104, N'https://www.youtube.com/embed/nDiD6M2cQ2k', 2, 2016)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5005, N'/Images/CallofDutyBlackOpsII_01.jpg', 1, 2017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5006, N'/Images/CallofDutyBlackOpsII_02.jpg', 1, 2017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5007, N'/Images/CallofDutyBlackOpsII_03.jpg', 1, 2017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5008, N'https://www.youtube.com/embed/x3tedlWs1XY', 2, 2017)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5009, N'/Images/maxresdefault_01.jpg', 1, 2018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5010, N'/Images/maxresdefault_02.jpg', 1, 2018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5011, N'/Images/maxresdefault_03.jpg', 1, 2018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5012, N'https://www.youtube.com/embed/iYZpR51XgW0', 2, 2018)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5013, N'/Images/TheElderScrollsVSkyrim_01.jpg', 1, 2019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5014, N'/Images/TheElderScrollsVSkyrim_02.jpg', 1, 2019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5015, N'/Images/TheElderScrollsVSkyrim_03.jpg', 1, 2019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5016, N'https://www.youtube.com/embed/JSRtYpNRoN0', 2, 2019)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5017, N'/Images/Halo_3_01.jpg', 1, 2020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5018, N'/Images/Halo_3_02.jpg', 1, 2020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5019, N'/Images/Halo_3_03.jpg', 1, 2020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5020, N'https://www.youtube.com/embed/RSvFnsexuvo', 2, 2020)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5021, N'/Images/pes2018_01.jpg', 1, 2021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5022, N'/Images/pes2018_02.jpg', 1, 2021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5023, N'/Images/pes2018_03.jpg', 1, 2021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (5024, N'https://www.youtube.com/embed/Xp1bXAE0pM0', 2, 2021)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6005, N'/Images/red_dead_redemption_2_01.jpg', 1, 2022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6006, N'/Images/red_dead_redemption_2_02.jpg', 1, 2022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6007, N'/Images/red_dead_redemption_2_03.jpg', 1, 2022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6008, N'https://www.youtube.com/embed/kQfX6QgTnMg', 2, 2022)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6009, N'/Images/DOOM-EternalScreenshot-01.jpg', 1, 2023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6010, N'/Images/DOOM-EternalScreenshot-02.jpg', 1, 2023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6011, N'/Images/DOOM-EternalScreenshot-03.jpg', 1, 2023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6012, N'https://www.youtube.com/embed/WZ8EmUkh0Y4', 2, 2023)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6013, N'/Images/Star-Wars-Jedi-Fallen-01.jpg', 1, 2024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6014, N'/Images/Star-Wars-Jedi-Fallen-02.jpg', 1, 2024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6015, N'/Images/Star-Wars-Jedi-Fallen-03.jpg', 1, 2024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (6016, N'https://www.youtube.com/embed/0GLbwkfhYZk', 2, 2024)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7005, N'/Images/Sea_of_Thieves_01.jpg', 1, 2025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7006, N'/Images/Sea_of_Thieves_02.jpg', 1, 2025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7007, N'/Images/Sea_of_Thieves_03.jpg', 1, 2025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7008, N'https://www.youtube.com/embed/r5JIBaasuE8', 2, 2025)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7009, N'/Images/control_01.jpg', 1, 2026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7010, N'/Images/control_02.jpg', 1, 2026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7011, N'/Images/control_03.jpg', 1, 2026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7012, N'https://www.youtube.com/embed/yW0DK3o4BC0', 2, 2026)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7013, N'/Images/madden_nfl_20_01.jpg', 1, 2027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7014, N'/Images/madden_nfl_20_02.jpg', 1, 2027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7015, N'/Images/madden_nfl_20_03.jpg', 1, 2027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7016, N'https://www.youtube.com/embed/90537CmseQg', 2, 2027)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7017, N'/Images/HaloTheMasterChiefCollection_01.jpg', 1, 2028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7018, N'/Images/HaloTheMasterChiefCollection_02.jpg', 1, 2028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7019, N'/Images/HaloTheMasterChiefCollection_03.jpg', 1, 2028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7020, N'https://www.youtube.com/embed/ZDvYJGquXgE', 2, 2028)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7021, N'/Images/cuphead_screenshot_01.jpg', 1, 2029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7022, N'/Images/cuphead_screenshot_02.jpg', 1, 2029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7023, N'/Images/cuphead_screenshot_03.jpg', 1, 2029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7024, N'https://www.youtube.com/embed/NN-9SQXoi50', 2, 2029)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7025, N'/Images/2KGDS_Oak_Screenshot_Broken-Hearts-Day_Character-Skin_Group-Shot_01.jpg', 1, 2030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7026, N'/Images/2KGDS_Oak_Screenshot_Broken-Hearts-Day_Character-Skin_Group-Shot_02.jpg', 1, 2030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7027, N'/Images/2KGDS_Oak_Screenshot_Broken-Hearts-Day_Character-Skin_Group-Shot_03.jpg', 1, 2030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7028, N'https://www.youtube.com/embed/d9Gu1PspA3Y', 2, 2030)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7029, N'/Images/ApexLegends_001.jpg', 1, 2031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7030, N'/Images/ApexLegends_002.jpg', 1, 2031)
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7031, N'/Images/ApexLegends_003.jpg', 1, 2031)
GO
INSERT [dbo].[GamePreview] ([PreviewID], [Preview], [PreviewType], [GameID_FK]) VALUES (7032, N'https://www.youtube.com/embed/UMJb_mkqynU', 2, 2031)
SET IDENTITY_INSERT [dbo].[GamePreview] OFF
SET IDENTITY_INSERT [dbo].[Genre] ON 

INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (2, N'Action-Adventure')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (3, N'Adventure')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (4, N'Role-Playing')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (5, N'Simulation')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (6, N'Strategy')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (7, N'Sports')
INSERT [dbo].[Genre] ([GenreID], [GenreName]) VALUES (8, N'Others')
SET IDENTITY_INSERT [dbo].[Genre] OFF
SET IDENTITY_INSERT [dbo].[NameLogo] ON 

INSERT [dbo].[NameLogo] ([ID], [AppName], [AppLogo]) VALUES (1, N'GAMER+', N'fas fa-gamepad')
SET IDENTITY_INSERT [dbo].[NameLogo] OFF
USE [master]
GO
ALTER DATABASE [GamerPlus] SET  READ_WRITE 
GO
