USE [master]
GO
/****** Object:  Database [Справочник_номеров]    Script Date: 15.05.2024 11:44:06 ******/
CREATE DATABASE [Справочник_номеров]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Справочник_номеров', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Справочник_номеров.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Справочник_номеров_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Справочник_номеров_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Справочник_номеров] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Справочник_номеров].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Справочник_номеров] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Справочник_номеров] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Справочник_номеров] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Справочник_номеров] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Справочник_номеров] SET ARITHABORT OFF 
GO
ALTER DATABASE [Справочник_номеров] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Справочник_номеров] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Справочник_номеров] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Справочник_номеров] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Справочник_номеров] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Справочник_номеров] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Справочник_номеров] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Справочник_номеров] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Справочник_номеров] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Справочник_номеров] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Справочник_номеров] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Справочник_номеров] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Справочник_номеров] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Справочник_номеров] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Справочник_номеров] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Справочник_номеров] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Справочник_номеров] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Справочник_номеров] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Справочник_номеров] SET  MULTI_USER 
GO
ALTER DATABASE [Справочник_номеров] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Справочник_номеров] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Справочник_номеров] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Справочник_номеров] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Справочник_номеров] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Справочник_номеров] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Справочник_номеров] SET QUERY_STORE = OFF
GO
USE [Справочник_номеров]
GO
/****** Object:  Table [dbo].[Группа_контактов]    Script Date: 15.05.2024 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Группа_контактов](
	[ID_группы_контактов] [int] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](150) NULL,
 CONSTRAINT [PK_Группа_контактов] PRIMARY KEY CLUSTERED 
(
	[ID_группы_контактов] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Должность]    Script Date: 15.05.2024 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Должность](
	[ID_должности] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](150) NULL,
 CONSTRAINT [PK_Должность] PRIMARY KEY CLUSTERED 
(
	[ID_должности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Компания]    Script Date: 15.05.2024 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Компания](
	[ID_компании] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](150) NULL,
 CONSTRAINT [PK_Компания] PRIMARY KEY CLUSTERED 
(
	[ID_компании] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Контакты]    Script Date: 15.05.2024 11:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Контакты](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя] [nvarchar](50) NOT NULL,
	[Отчество] [nvarchar](50) NOT NULL,
	[Номер_телефона] [nvarchar](18) NOT NULL,
	[Электронная_почта] [nvarchar](150) NULL,
	[ID_компании] [int] NULL,
	[ID_должности] [int] NULL,
	[ID_группы_контактов] [int] NULL,
	[Дата_рождения] [date] NULL,
	[Фотография] [nchar](10) NULL,
 CONSTRAINT [PK_Контакты] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Группа_контактов] ON 

INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (1, N'Клиенты')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (2, N'Поставщики')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (3, N'Партнеры')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (4, N'Конкуренты')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (5, N'Журналисты')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (6, N'Инвесторы')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (7, N'Сотрудники')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (8, N'Друзья')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (9, N'Семья')
INSERT [dbo].[Группа_контактов] ([ID_группы_контактов], [Название]) VALUES (10, N'Прочие')
SET IDENTITY_INSERT [dbo].[Группа_контактов] OFF
GO
SET IDENTITY_INSERT [dbo].[Должность] ON 

INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (1, N'Генеральный директор')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (2, N'Заместитель генерального директора')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (3, N'Финансовый директор')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (4, N'Коммерческий директор')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (5, N'Производственный директор')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (6, N'Главный бухгалтер')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (7, N'Менеджер по продажам')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (8, N'Менеджер по закупкам')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (9, N'Менеджер по маркетингу')
INSERT [dbo].[Должность] ([ID_должности], [Наименование]) VALUES (10, N'Инженер')
SET IDENTITY_INSERT [dbo].[Должность] OFF
GO
SET IDENTITY_INSERT [dbo].[Компания] ON 

INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (1, N'ООО "Рога и копыта"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (2, N'ООО "ТехноХим"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (3, N'ООО "Энергострой"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (4, N'ООО "Мастер"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (5, N'ООО "Информационные технологии"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (6, N'ООО "СтройИнвест"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (7, N'ООО "Торговый дом"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (8, N'ООО "Агропродукт"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (9, N'ООО "Металлург"')
INSERT [dbo].[Компания] ([ID_компании], [Наименование]) VALUES (10, N'ООО "Трансстрой"')
SET IDENTITY_INSERT [dbo].[Компания] OFF
GO
SET IDENTITY_INSERT [dbo].[Контакты] ON 

INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (1, N'Иванов', N'Иван', N'Иванович', N'89001234567', N'ivanov@mail.ru', 1, 1, 1, CAST(N'1980-01-01' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (2, N'Петров', N'Петр', N'Петрович', N'89002345678', N'petrov@mail.ru', 2, 2, 2, CAST(N'1981-02-02' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (3, N'Сидоров', N'Сидор', N'Сидорович', N'89003456789', N'sidorov@mail.ru', 3, 3, 3, CAST(N'1982-03-03' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (4, N'Кузнецов', N'Кузьма', N'Кузьмич', N'89004567890', N'kuznecov@mail.ru', 4, 4, 4, CAST(N'1983-04-04' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (5, N'Смирнов', N'Сергей', N'Сергеевич', N'89005678901', N'smirnov@mail.ru', 5, 5, 9, CAST(N'1984-05-05' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (6, N'Попов', N'Павел', N'Павлович', N'89006789012', N'popov@mail.ru', 6, 6, 9, CAST(N'1985-06-06' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (7, N'Орлов', N'Олег', N'Олегович', N'89007890123', N'orlov@mail.ru', 7, 7, 9, CAST(N'1986-07-07' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (8, N'Соколов', N'Семен', N'Семенович', N'89008901234', N'sokolov@mail.ru', 8, 8, 9, CAST(N'1987-08-08' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (9, N'Лебедев', N'Леонид', N'Леонидович', N'89009012345', N'lebedev@mail.ru', 9, 9, 9, CAST(N'1988-09-09' AS Date), NULL)
INSERT [dbo].[Контакты] ([ID], [Фамилия], [Имя], [Отчество], [Номер_телефона], [Электронная_почта], [ID_компании], [ID_должности], [ID_группы_контактов], [Дата_рождения], [Фотография]) VALUES (10, N'Козлов', N'Константин', N'Константинович', N'89010123456', N'kozlov@mail.ru', 10, 10, 10, CAST(N'1989-10-10' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Контакты] OFF
GO
ALTER TABLE [dbo].[Контакты]  WITH CHECK ADD  CONSTRAINT [FK_Контакты_Группа_контактов] FOREIGN KEY([ID_группы_контактов])
REFERENCES [dbo].[Группа_контактов] ([ID_группы_контактов])
GO
ALTER TABLE [dbo].[Контакты] CHECK CONSTRAINT [FK_Контакты_Группа_контактов]
GO
ALTER TABLE [dbo].[Контакты]  WITH CHECK ADD  CONSTRAINT [FK_Контакты_Должность] FOREIGN KEY([ID_должности])
REFERENCES [dbo].[Должность] ([ID_должности])
GO
ALTER TABLE [dbo].[Контакты] CHECK CONSTRAINT [FK_Контакты_Должность]
GO
ALTER TABLE [dbo].[Контакты]  WITH CHECK ADD  CONSTRAINT [FK_Контакты_Компания] FOREIGN KEY([ID_компании])
REFERENCES [dbo].[Компания] ([ID_компании])
GO
ALTER TABLE [dbo].[Контакты] CHECK CONSTRAINT [FK_Контакты_Компания]
GO
USE [master]
GO
ALTER DATABASE [Справочник_номеров] SET  READ_WRITE 
GO
