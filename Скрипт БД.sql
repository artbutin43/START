USE [master]
GO
/****** Object:  Database [Строительная_Компания]    Script Date: 07.06.2021 8:55:41 ******/
CREATE DATABASE [Строительная_Компания]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Строительная_Компания', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Строительная_Компания.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Строительная_Компания_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Строительная_Компания_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Строительная_Компания] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Строительная_Компания].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Строительная_Компания] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Строительная_Компания] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Строительная_Компания] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Строительная_Компания] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Строительная_Компания] SET ARITHABORT OFF 
GO
ALTER DATABASE [Строительная_Компания] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Строительная_Компания] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Строительная_Компания] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Строительная_Компания] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Строительная_Компания] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Строительная_Компания] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Строительная_Компания] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Строительная_Компания] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Строительная_Компания] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Строительная_Компания] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Строительная_Компания] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Строительная_Компания] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Строительная_Компания] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Строительная_Компания] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Строительная_Компания] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Строительная_Компания] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Строительная_Компания] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Строительная_Компания] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Строительная_Компания] SET  MULTI_USER 
GO
ALTER DATABASE [Строительная_Компания] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Строительная_Компания] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Строительная_Компания] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Строительная_Компания] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Строительная_Компания] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Строительная_Компания]
GO
/****** Object:  User [админ]    Script Date: 07.06.2021 8:55:41 ******/
CREATE USER [админ] FOR LOGIN [admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [админ]
GO
/****** Object:  Table [dbo].[Группа_Пользователя]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группа_Пользователя](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Группа_Пользователя] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Должность] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дом]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дом](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Адрес] [varchar](max) NOT NULL,
	[ID_Типа_Дома] [int] NOT NULL,
	[Отметка_О_Продаже] [bit] NULL,
 CONSTRAINT [PK_Дом] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Покупатель]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Покупатель](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NULL,
 CONSTRAINT [PK_Покупатель] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователь]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователь](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [varchar](50) NOT NULL,
	[Пароль] [varchar](50) NOT NULL,
	[ID_Сотрудника] [int] NOT NULL,
	[ID_Группы_Пользователей] [int] NOT NULL,
	[Возможность_Входа] [bit] NULL,
	[Количество_Неудачных_Входов] [int] NULL,
	[Время_Исчерпания_Попыток_Входа] [datetime] NULL,
 CONSTRAINT [PK_Пользователь] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Продажа]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Продажа](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_Покупателя] [int] NOT NULL,
	[ID_Дома] [int] NOT NULL,
	[Отметка_Об_Оплате] [bit] NOT NULL,
 CONSTRAINT [PK_Продажа] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [varchar](50) NOT NULL,
	[Имя] [varchar](50) NOT NULL,
	[Отчество] [varchar](50) NOT NULL,
	[ID_Должности] [int] NOT NULL,
 CONSTRAINT [PK_Сотрудник] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Тип_Дома]    Script Date: 07.06.2021 8:55:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Тип_Дома](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [varchar](50) NOT NULL,
	[Цена] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Тип_Дома] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Группа_Пользователя] ON 

INSERT [dbo].[Группа_Пользователя] ([ID], [Наименование]) VALUES (1, N'Администратор БД')
INSERT [dbo].[Группа_Пользователя] ([ID], [Наименование]) VALUES (2, N'Менеджер по работе с клиентами')
INSERT [dbo].[Группа_Пользователя] ([ID], [Наименование]) VALUES (3, N'Табельщик')
INSERT [dbo].[Группа_Пользователя] ([ID], [Наименование]) VALUES (4, N'Бухгалтер')
SET IDENTITY_INSERT [dbo].[Группа_Пользователя] OFF
SET IDENTITY_INSERT [dbo].[Должность] ON 

INSERT [dbo].[Должность] ([ID], [Наименование]) VALUES (1, N'Администратор')
INSERT [dbo].[Должность] ([ID], [Наименование]) VALUES (2, N'Менеджер по работе с клиентами')
INSERT [dbo].[Должность] ([ID], [Наименование]) VALUES (3, N'Табельщик')
INSERT [dbo].[Должность] ([ID], [Наименование]) VALUES (4, N'Бухгалтер')
SET IDENTITY_INSERT [dbo].[Должность] OFF
SET IDENTITY_INSERT [dbo].[Дом] ON 

INSERT [dbo].[Дом] ([ID], [Адрес], [ID_Типа_Дома], [Отметка_О_Продаже]) VALUES (1, N'ул. Кирова д.88', 1, 0)
INSERT [dbo].[Дом] ([ID], [Адрес], [ID_Типа_Дома], [Отметка_О_Продаже]) VALUES (2, N'ул. Кирова д.89', 1, 1)
SET IDENTITY_INSERT [dbo].[Дом] OFF
SET IDENTITY_INSERT [dbo].[Пользователь] ON 

INSERT [dbo].[Пользователь] ([ID], [Логин], [Пароль], [ID_Сотрудника], [ID_Группы_Пользователей], [Возможность_Входа], [Количество_Неудачных_Входов], [Время_Исчерпания_Попыток_Входа]) VALUES (19, N'admin', N'admin', 2, 1, 1, 0, CAST(N'2021-05-27T16:11:13.980' AS DateTime))
INSERT [dbo].[Пользователь] ([ID], [Логин], [Пароль], [ID_Сотрудника], [ID_Группы_Пользователей], [Возможность_Входа], [Количество_Неудачных_Входов], [Время_Исчерпания_Попыток_Входа]) VALUES (26, N'ad1', N'ad1', 4, 1, 1, 0, CAST(N'2021-05-27T14:47:46.563' AS DateTime))
INSERT [dbo].[Пользователь] ([ID], [Логин], [Пароль], [ID_Сотрудника], [ID_Группы_Пользователей], [Возможность_Входа], [Количество_Неудачных_Входов], [Время_Исчерпания_Попыток_Входа]) VALUES (27, N'mngr', N'mngr', 6, 2, 1, 0, CAST(N'2021-05-27T14:47:46.563' AS DateTime))
INSERT [dbo].[Пользователь] ([ID], [Логин], [Пароль], [ID_Сотрудника], [ID_Группы_Пользователей], [Возможность_Входа], [Количество_Неудачных_Входов], [Время_Исчерпания_Попыток_Входа]) VALUES (28, N'tabel', N'tabel', 7, 3, 1, 0, CAST(N'2021-05-27T15:31:47.857' AS DateTime))
SET IDENTITY_INSERT [dbo].[Пользователь] OFF
SET IDENTITY_INSERT [dbo].[Сотрудник] ON 

INSERT [dbo].[Сотрудник] ([ID], [Фамилия], [Имя], [Отчество], [ID_Должности]) VALUES (2, N'Агуша', N'Тимофей', N'Петрович', 1)
INSERT [dbo].[Сотрудник] ([ID], [Фамилия], [Имя], [Отчество], [ID_Должности]) VALUES (4, N'Агуша', N'Ирина', N'Анатольевна', 1)
INSERT [dbo].[Сотрудник] ([ID], [Фамилия], [Имя], [Отчество], [ID_Должности]) VALUES (6, N'Володарский', N'Инокентий', N'Олегович', 2)
INSERT [dbo].[Сотрудник] ([ID], [Фамилия], [Имя], [Отчество], [ID_Должности]) VALUES (7, N'Белый', N'Александр', N'Васильевич', 3)
SET IDENTITY_INSERT [dbo].[Сотрудник] OFF
SET IDENTITY_INSERT [dbo].[Тип_Дома] ON 

INSERT [dbo].[Тип_Дома] ([ID], [Наименование], [Цена]) VALUES (1, N'Берёза', CAST(11000000.66 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Тип_Дома] OFF
ALTER TABLE [dbo].[Дом]  WITH CHECK ADD  CONSTRAINT [FK_Дом_Тип_Дома] FOREIGN KEY([ID_Типа_Дома])
REFERENCES [dbo].[Тип_Дома] ([ID])
GO
ALTER TABLE [dbo].[Дом] CHECK CONSTRAINT [FK_Дом_Тип_Дома]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователь_Группа_Пользователя] FOREIGN KEY([ID_Группы_Пользователей])
REFERENCES [dbo].[Группа_Пользователя] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователь_Группа_Пользователя]
GO
ALTER TABLE [dbo].[Пользователь]  WITH CHECK ADD  CONSTRAINT [FK_Пользователь_Сотрудник] FOREIGN KEY([ID_Сотрудника])
REFERENCES [dbo].[Сотрудник] ([ID])
GO
ALTER TABLE [dbo].[Пользователь] CHECK CONSTRAINT [FK_Пользователь_Сотрудник]
GO
ALTER TABLE [dbo].[Продажа]  WITH CHECK ADD  CONSTRAINT [FK_Продажа_Дом] FOREIGN KEY([ID_Дома])
REFERENCES [dbo].[Дом] ([ID])
GO
ALTER TABLE [dbo].[Продажа] CHECK CONSTRAINT [FK_Продажа_Дом]
GO
ALTER TABLE [dbo].[Продажа]  WITH CHECK ADD  CONSTRAINT [FK_Продажа_Покупатель] FOREIGN KEY([ID_Покупателя])
REFERENCES [dbo].[Покупатель] ([ID])
GO
ALTER TABLE [dbo].[Продажа] CHECK CONSTRAINT [FK_Продажа_Покупатель]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудник_Должность] FOREIGN KEY([ID_Должности])
REFERENCES [dbo].[Должность] ([ID])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK_Сотрудник_Должность]
GO
USE [master]
GO
ALTER DATABASE [Строительная_Компания] SET  READ_WRITE 
GO
