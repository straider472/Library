USE [master]
GO
/****** Object:  Database [Library]    Script Date: 26.04.2022 0:43:07 ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Library.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Library_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Library_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Library', N'ON'
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id_Author] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Middle_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id_Author] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id_Book] [int] IDENTITY(1,1) NOT NULL,
	[ISBN] [nchar](15) NULL,
	[Name] [nchar](50) NOT NULL,
	[Id_Genre] [int] NOT NULL,
	[Id_Publication] [int] NOT NULL,
	[Count_Pages] [int] NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books_Of_Authors]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books_Of_Authors](
	[Id_Author] [int] NOT NULL,
	[Id_Book] [int] NOT NULL,
 CONSTRAINT [PK_Books_Of_Authors] PRIMARY KEY CLUSTERED 
(
	[Id_Author] ASC,
	[Id_Book] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id_Genre] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](30) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id_Genre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id_Order] [int] IDENTITY(1,1) NOT NULL,
	[Date_Inception] [date] NOT NULL,
	[Date_End] [date] NOT NULL,
	[Count_Books] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Id_User] [int] NOT NULL,
	[Id_Reader] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id_Order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders_Lines]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders_Lines](
	[Id_Order_Lines] [int] IDENTITY(1,1) NOT NULL,
	[Id_Book] [int] NOT NULL,
	[Id_Order] [int] NOT NULL,
 CONSTRAINT [PK_Orders_Lines] PRIMARY KEY CLUSTERED 
(
	[Id_Order_Lines] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publications]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publications](
	[Id_Publication] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Publications] PRIMARY KEY CLUSTERED 
(
	[Id_Publication] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Readers]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[Id_Reader] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Middle_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NULL,
	[Number] [nchar](12) NOT NULL,
	[Mail] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Readers] PRIMARY KEY CLUSTERED 
(
	[Id_Reader] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types_Users]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types_Users](
	[Id_Type] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Types_Users] PRIMARY KEY CLUSTERED 
(
	[Id_Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26.04.2022 0:43:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nchar](30) NOT NULL,
	[Password] [nchar](30) NOT NULL,
	[Mail] [nchar](30) NULL,
	[Number] [nchar](12) NOT NULL,
	[First_Name] [nchar](30) NOT NULL,
	[Middle_Name] [nchar](30) NOT NULL,
	[Last_Name] [nchar](30) NULL,
	[Id_Type_Users] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id_Author], [First_Name], [Middle_Name], [Last_Name]) VALUES (1, N'Лев                           ', N'Толстой                       ', N'Николаевич                    ')
INSERT [dbo].[Authors] ([Id_Author], [First_Name], [Middle_Name], [Last_Name]) VALUES (2, N'Федор                         ', N'Достоевский                   ', N'Михайлович                    ')
INSERT [dbo].[Authors] ([Id_Author], [First_Name], [Middle_Name], [Last_Name]) VALUES (3, N'Михаил                        ', N'Лермонтов                     ', N'Юрьевич                       ')
INSERT [dbo].[Authors] ([Id_Author], [First_Name], [Middle_Name], [Last_Name]) VALUES (4, N'Александр                     ', N'Пушкин                        ', N'Сергеевич                     ')
INSERT [dbo].[Authors] ([Id_Author], [First_Name], [Middle_Name], [Last_Name]) VALUES (5, N'Джордж                        ', N'Оруэлл                        ', NULL)
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id_Book], [ISBN], [Name], [Id_Genre], [Id_Publication], [Count_Pages], [Status]) VALUES (1, N'9788493902292  ', N'1984-ый                                           ', 2, 1, 160, 1)
INSERT [dbo].[Books] ([Id_Book], [ISBN], [Name], [Id_Genre], [Id_Publication], [Count_Pages], [Status]) VALUES (2, N'9788493902291  ', N'Руслан и Людмила                                  ', 7, 2, 120, 1)
INSERT [dbo].[Books] ([Id_Book], [ISBN], [Name], [Id_Genre], [Id_Publication], [Count_Pages], [Status]) VALUES (3, N'9788493902294  ', N'Смерть Ивана Ильича                               ', 4, 3, 100, 1)
INSERT [dbo].[Books] ([Id_Book], [ISBN], [Name], [Id_Genre], [Id_Publication], [Count_Pages], [Status]) VALUES (4, N'9788493902295  ', N'Мы                                                ', 2, 4, 200, 1)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
INSERT [dbo].[Books_Of_Authors] ([Id_Author], [Id_Book]) VALUES (1, 3)
INSERT [dbo].[Books_Of_Authors] ([Id_Author], [Id_Book]) VALUES (4, 2)
INSERT [dbo].[Books_Of_Authors] ([Id_Author], [Id_Book]) VALUES (5, 1)
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (2, N'Роман                         ', N'Описание романа')
INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (3, N'Антиутопия                    ', N'Описание антиутопии')
INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (4, N'Драма                         ', N'Описание драмы')
INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (5, N'Комедия                       ', N'Описание комедии')
INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (6, N'Трагедия                      ', N'Описание трагедии')
INSERT [dbo].[Genres] ([Id_Genre], [Name], [Description]) VALUES (7, N'Сказка                        ', N'Описание сказки')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id_Order], [Date_Inception], [Date_End], [Count_Books], [Status], [Id_User], [Id_Reader]) VALUES (5, CAST(N'2022-04-22' AS Date), CAST(N'2022-05-06' AS Date), 2, 1, 2, 1)
INSERT [dbo].[Orders] ([Id_Order], [Date_Inception], [Date_End], [Count_Books], [Status], [Id_User], [Id_Reader]) VALUES (6, CAST(N'2022-04-22' AS Date), CAST(N'2022-05-06' AS Date), 1, 1, 2, 2)
INSERT [dbo].[Orders] ([Id_Order], [Date_Inception], [Date_End], [Count_Books], [Status], [Id_User], [Id_Reader]) VALUES (7, CAST(N'2022-04-22' AS Date), CAST(N'2022-05-06' AS Date), 2, 1, 2, 3)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders_Lines] ON 

INSERT [dbo].[Orders_Lines] ([Id_Order_Lines], [Id_Book], [Id_Order]) VALUES (2, 1, 5)
INSERT [dbo].[Orders_Lines] ([Id_Order_Lines], [Id_Book], [Id_Order]) VALUES (3, 2, 5)
INSERT [dbo].[Orders_Lines] ([Id_Order_Lines], [Id_Book], [Id_Order]) VALUES (4, 3, 6)
SET IDENTITY_INSERT [dbo].[Orders_Lines] OFF
GO
SET IDENTITY_INSERT [dbo].[Publications] ON 

INSERT [dbo].[Publications] ([Id_Publication], [Name], [Description]) VALUES (1, N'Freedom                                           ', N'Описание издательства Freedom')
INSERT [dbo].[Publications] ([Id_Publication], [Name], [Description]) VALUES (2, N'Хлеб&Соль                                         ', N'Описание издательства Хлеб&Соль')
INSERT [dbo].[Publications] ([Id_Publication], [Name], [Description]) VALUES (3, N'ЭКСМО                                             ', N'Описание издательства ЭКСМО')
INSERT [dbo].[Publications] ([Id_Publication], [Name], [Description]) VALUES (4, N'Просвещение                                       ', N'Описание издательсва Просвещение')
INSERT [dbo].[Publications] ([Id_Publication], [Name], [Description]) VALUES (5, N'Альпина Паблишер                                  ', N'Описание издательсва Альпина Паблишер')
SET IDENTITY_INSERT [dbo].[Publications] OFF
GO
SET IDENTITY_INSERT [dbo].[Readers] ON 

INSERT [dbo].[Readers] ([Id_Reader], [First_Name], [Middle_Name], [Last_Name], [Number], [Mail]) VALUES (1, N'Ионов                         ', N'Александр                     ', N'Николаевич                    ', N'89877922415 ', N'shurik@mail.ru                ')
INSERT [dbo].[Readers] ([Id_Reader], [First_Name], [Middle_Name], [Last_Name], [Number], [Mail]) VALUES (2, N'Марисаева                     ', N'Анжелика                      ', N'Владимировна                  ', N'89058984156 ', N'angela@gmail.com              ')
INSERT [dbo].[Readers] ([Id_Reader], [First_Name], [Middle_Name], [Last_Name], [Number], [Mail]) VALUES (3, N'Попов                         ', N'Алексей                       ', N'Сергеевич                     ', N'89096064405 ', N'alexpopov@mail.ru             ')
INSERT [dbo].[Readers] ([Id_Reader], [First_Name], [Middle_Name], [Last_Name], [Number], [Mail]) VALUES (5, N'Петрова                       ', N'Надежа                        ', N'Ивановна                      ', N'89093034406 ', N'petrnad@mail.ru               ')
SET IDENTITY_INSERT [dbo].[Readers] OFF
GO
SET IDENTITY_INSERT [dbo].[Types_Users] ON 

INSERT [dbo].[Types_Users] ([Id_Type], [Name]) VALUES (1, N'Администратор       ')
INSERT [dbo].[Types_Users] ([Id_Type], [Name]) VALUES (2, N'Библиотекарь        ')
SET IDENTITY_INSERT [dbo].[Types_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id_User], [Login], [Password], [Mail], [Number], [First_Name], [Middle_Name], [Last_Name], [Id_Type_Users]) VALUES (1, N'admin                         ', N'123                           ', N'ilya.ovchinnikov.@gmail.com   ', N'89877922414 ', N'Илья                          ', N'Овчинников                    ', N'Леонидович                    ', 1)
INSERT [dbo].[Users] ([Id_User], [Login], [Password], [Mail], [Number], [First_Name], [Middle_Name], [Last_Name], [Id_Type_Users]) VALUES (2, N'librarian                     ', N'321                           ', N'masha.ivanova@mail.ru         ', N'89096065506 ', N'Мария                         ', N'Иванова                       ', N'Петровна                      ', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres] FOREIGN KEY([Id_Genre])
REFERENCES [dbo].[Genres] ([Id_Genre])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Publications] FOREIGN KEY([Id_Publication])
REFERENCES [dbo].[Publications] ([Id_Publication])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Publications]
GO
ALTER TABLE [dbo].[Books_Of_Authors]  WITH CHECK ADD  CONSTRAINT [FK_Books_Of_Authors_Authors] FOREIGN KEY([Id_Author])
REFERENCES [dbo].[Authors] ([Id_Author])
GO
ALTER TABLE [dbo].[Books_Of_Authors] CHECK CONSTRAINT [FK_Books_Of_Authors_Authors]
GO
ALTER TABLE [dbo].[Books_Of_Authors]  WITH CHECK ADD  CONSTRAINT [FK_Books_Of_Authors_Books] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id_Book])
GO
ALTER TABLE [dbo].[Books_Of_Authors] CHECK CONSTRAINT [FK_Books_Of_Authors_Books]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Readers] FOREIGN KEY([Id_Reader])
REFERENCES [dbo].[Readers] ([Id_Reader])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Readers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([Id_User])
REFERENCES [dbo].[Users] ([Id_User])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders_Lines]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Lines_Books] FOREIGN KEY([Id_Book])
REFERENCES [dbo].[Books] ([Id_Book])
GO
ALTER TABLE [dbo].[Orders_Lines] CHECK CONSTRAINT [FK_Orders_Lines_Books]
GO
ALTER TABLE [dbo].[Orders_Lines]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Lines_Orders] FOREIGN KEY([Id_Order])
REFERENCES [dbo].[Orders] ([Id_Order])
GO
ALTER TABLE [dbo].[Orders_Lines] CHECK CONSTRAINT [FK_Orders_Lines_Orders]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Types_Users] FOREIGN KEY([Id_Type_Users])
REFERENCES [dbo].[Types_Users] ([Id_Type])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Types_Users]
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
