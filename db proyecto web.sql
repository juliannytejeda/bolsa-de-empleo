USE [master]
GO
/****** Object:  Database [proyecto_web1]    Script Date: 2/2/2021 12:57:29 AM ******/
CREATE DATABASE [proyecto_web1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto_web1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\proyecto_web1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_web1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\proyecto_web1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [proyecto_web1] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_web1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_web1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_web1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_web1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_web1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_web1] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_web1] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [proyecto_web1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_web1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_web1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_web1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_web1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_web1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_web1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_web1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_web1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proyecto_web1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_web1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_web1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_web1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_web1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_web1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_web1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_web1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto_web1] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_web1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_web1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_web1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_web1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_web1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_web1] SET QUERY_STORE = OFF
GO
USE [proyecto_web1]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrador](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_Administradores]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_Administradores](
	[Usuario] [varchar](50) NULL,
	[Clave] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Login_usuarios]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login_usuarios](
	[Usuario] [varchar](50) NULL,
	[Clave] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poster]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puestos]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puestos](
	[Categoria] [varchar](50) NULL,
	[Publicacion] [date] NULL,
	[Ubicacion] [varchar](70) NULL,
	[Posicion] [varchar](30) NULL,
	[Empresa] [varchar](30) NULL,
	[Descripcion] [text] NULL,
	[Tipo] [varchar](30) NULL,
	[Logo] [image] NULL,
	[Urll] [text] NULL,
	[Aplicacion] [varchar](50) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 2/2/2021 12:57:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [proyecto_web1] SET  READ_WRITE 
GO
