USE [master]
GO
/****** Object:  Database [DBAPI]    Script Date: 10/21/2023 5:30:09 AM ******/
CREATE DATABASE [DBAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBAPI', FILENAME = N'D:\Program Files\SQLDB\MSSQL15.LOCALDB\MSSQL\DATA\DBAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBAPI_log', FILENAME = N'D:\Program Files\SQLDB\MSSQL15.LOCALDB\MSSQL\DATA\DBAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBAPI] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBAPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBAPI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBAPI] SET  MULTI_USER 
GO
ALTER DATABASE [DBAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBAPI] SET QUERY_STORE = OFF
GO
USE [DBAPI]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 10/21/2023 5:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTO]    Script Date: 10/21/2023 5:30:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[CodigoBarra] [varchar](20) NULL,
	[Descripcion] [varchar](50) NULL,
	[Marca] [varchar](50) NULL,
	[IdCategoria] [int] NULL,
	[Precio] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PRODUCTO]  WITH CHECK ADD  CONSTRAINT [FK_IDCATEGORIA] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[CATEGORIA] ([IdCategoria])
GO
ALTER TABLE [dbo].[PRODUCTO] CHECK CONSTRAINT [FK_IDCATEGORIA]
GO
USE [master]
GO
ALTER DATABASE [DBAPI] SET  READ_WRITE 
GO
