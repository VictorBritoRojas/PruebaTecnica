USE [master]
GO
/****** Object:  Database [PTVideojuegos]    Script Date: 25/04/2023 09:10:26 a. m. ******/
CREATE DATABASE [PTVideojuegos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PTVideojuegos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PTVideojuegos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PTVideojuegos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PTVideojuegos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PTVideojuegos] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PTVideojuegos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PTVideojuegos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PTVideojuegos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PTVideojuegos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PTVideojuegos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PTVideojuegos] SET ARITHABORT OFF 
GO
ALTER DATABASE [PTVideojuegos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PTVideojuegos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PTVideojuegos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PTVideojuegos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PTVideojuegos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PTVideojuegos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PTVideojuegos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PTVideojuegos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PTVideojuegos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PTVideojuegos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PTVideojuegos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PTVideojuegos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PTVideojuegos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PTVideojuegos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PTVideojuegos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PTVideojuegos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PTVideojuegos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PTVideojuegos] SET RECOVERY FULL 
GO
ALTER DATABASE [PTVideojuegos] SET  MULTI_USER 
GO
ALTER DATABASE [PTVideojuegos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PTVideojuegos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PTVideojuegos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PTVideojuegos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PTVideojuegos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PTVideojuegos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PTVideojuegos', N'ON'
GO
ALTER DATABASE [PTVideojuegos] SET QUERY_STORE = OFF
GO
USE [PTVideojuegos]
GO
/****** Object:  Table [dbo].[TBConsola]    Script Date: 25/04/2023 09:10:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBConsola](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBConsola] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBGenero]    Script Date: 25/04/2023 09:10:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBGenero](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TBGenero] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TBVideojuego]    Script Date: 25/04/2023 09:10:26 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBVideojuego](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[anio] [smallint] NOT NULL,
	[calificacion] [tinyint] NOT NULL,
	[idConsola] [int] NOT NULL,
	[idGenero] [int] NOT NULL,
 CONSTRAINT [PK_TBVideojuego] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TBConsola] ON 
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (1, N'PlayStation 1')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (2, N'Sega Dreamcast')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (3, N'PlayStation 2')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (4, N'Xbox')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (5, N'Nintendo GameCube')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (6, N'Xbox 360')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (7, N'PlayStation 3')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (8, N'Wii')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (9, N'Wii U')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (10, N'PlayStation 4')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (11, N'Xbox One')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (12, N'Xbox Series X')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (13, N'Xbox Series S')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (14, N'PlayStation 5')
GO
INSERT [dbo].[TBConsola] ([id], [nombre]) VALUES (15, N'Nintendo Switch')
GO
SET IDENTITY_INSERT [dbo].[TBConsola] OFF
GO
SET IDENTITY_INSERT [dbo].[TBGenero] ON 
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (1, N'Accion')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (2, N'Disparos')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (3, N'Estrategia')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (4, N'Simulacion')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (5, N'Deportes')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (6, N'Carreras')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (7, N'Aventura')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (8, N'Rol')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (9, N'Sandbox')
GO
INSERT [dbo].[TBGenero] ([id], [nombre]) VALUES (10, N'Musical')
GO
SET IDENTITY_INSERT [dbo].[TBGenero] OFF
GO
/****** Object:  StoredProcedure [dbo].[SPAgregar]    Script Date: 25/04/2023 09:10:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Brito Rojas
-- Create date: 21-04-2023
-- Description:	Se encarga de la insercion de datos a la tabla de Videojuego
-- =============================================
CREATE PROCEDURE [dbo].[SPAgregar]
	@titulo varchar(50) = '',
	@descripcion varchar(500) = '',
	@anio smallint,
	@calificacion tinyint = 1,
	@idConsola int,
	@idGenero int

AS
BEGIN

	SET NOCOUNT ON;
	
	IF(EXISTS (SELECT id FROM dbo.TBConsola WHERE id = @idConsola))
	BEGIN
		IF(EXISTS (SELECT id FROM dbo.TBGenero WHERE id = @idGenero))
		BEGIN
			IF(NOT EXISTS(SELECT titulo FROM dbo.TBVideojuego WHERE titulo = @titulo))
			BEGIN
				INSERT INTO dbo.TBVideojuego (titulo, descripcion, anio, calificacion, idConsola, idGenero)
				VALUES (@titulo, @descripcion, @anio, @calificacion, @idConsola, @idGenero)

				SELECT 'Se ingreso el registro' 'msg', 1 'flag'
			END
			ELSE
			BEGIN
				SELECT 'El Titulo "'+@titulo+'" ya existe en la base de datos' 'msg', 0 'flag'
			END
		END
		ELSE
		BEGIN
			SELECT 'No existe el genero indicado' 'msg', 0 'flag'
		END
	END
	ELSE
	BEGIN
		SELECT 'No existe la consola indicada' 'msg', 0 'flag'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SPCatalogo]    Script Date: 25/04/2023 09:10:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Brito Rojas
-- Create date: 21-04-2023
-- Description:	Se encarga de obtener la informacion de la tabla de Videojuego
-- =============================================
create PROCEDURE [dbo].[SPCatalogo]
	@opc int = 1
AS
BEGIN
	/*
	----Opciones disponibles
	-- 1. Obtiene Catalogo de Consolas
	-- 2. Obtiene Catalogo de Generos
	*/
	SET NOCOUNT ON;

	IF(@opc = 1)
	BEGIN
		SELECT id, nombre 'txt' FROM dbo.TBConsola
	END

	IF(@opc = 2)
	BEGIN
		SELECT id, nombre 'txt' FROM dbo.TBGenero
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SPConsultar]    Script Date: 25/04/2023 09:10:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Brito Rojas
-- Create date: 21-04-2023
-- Description:	Se encarga de obtener la informacion de la tabla de Videojuego
-- =============================================
CREATE PROCEDURE [dbo].[SPConsultar]
	@id int = -1
AS
BEGIN

	SET NOCOUNT ON;

	if(@id = -1)
	BEGIN
		SELECT a.id 'Id', titulo 'Titulo', descripcion 'Descripcion', anio 'Año', calificacion 'Calificacion', b.nombre 'Consola', c.nombre 'Genero'
		FROM dbo.TBVideojuego a
		INNER JOIN dbo.TBConsola b ON a.idConsola = b.id
		INNER JOIN dbo.TBGenero c ON a.idConsola = c.id
		ORDER BY titulo
	END
	ELSE
	BEGIN
		SELECT a.id 'Id', titulo 'Titulo', descripcion 'Descripcion', anio 'Año', calificacion 'Calificacion', a.idConsola 'Consola', a.idGenero 'Genero'
		FROM dbo.TBVideojuego a
		INNER JOIN dbo.TBConsola b ON a.idConsola = b.id
		INNER JOIN dbo.TBGenero c ON a.idConsola = c.id
		WHERE a.id = @id
	END

	

END
GO
/****** Object:  StoredProcedure [dbo].[SPEditar]    Script Date: 25/04/2023 09:10:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Brito Rojas
-- Create date: 21-04-2023
-- Description:	Se encarga de la edicion de datos a la tabla de Videojuego
-- =============================================
CREATE PROCEDURE [dbo].[SPEditar]
	@id int
	,@titulo varchar(50)
	,@descripcion varchar(500)
	,@anio smallint
	,@calificacion tinyint
	,@idConsola int
	,@idGenero int

AS
BEGIN

	SET NOCOUNT ON;
	
	IF(EXISTS (SELECT id FROM dbo.TBVideojuego WHERE id = @id))
	BEGIN
		UPDATE dbo.TBVideojuego
		SET titulo = @titulo
		,descripcion = @descripcion
		,anio = @anio
		,calificacion = @calificacion
		,idConsola = @idConsola
		,idGenero = @idGenero
		WHERE id = @id

		SELECT 'Se edito el registro' 'msg', 1 'flag'
	END
	ELSE
	BEGIN
		SELECT 'No existe el Videojuego indicado' 'msg', 0 'flag'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SPEliminar]    Script Date: 25/04/2023 09:10:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Victor Brito Rojas
-- Create date: 21-04-2023
-- Description:	Se encarga de la eliminacion de datos a la tabla de Videojuego
-- =============================================
CREATE PROCEDURE [dbo].[SPEliminar]
	@id int
AS
BEGIN

	SET NOCOUNT ON;
	
	IF(EXISTS (SELECT id FROM dbo.TBVideojuego WHERE id = @id))
	BEGIN
		DELETE FROM dbo.TBVideojuego
		WHERE id = @id

		SELECT 'Se elimino el registro' 'msg', 1 'flag'
	END
	ELSE
	BEGIN
		SELECT 'No existe el Videojuego indicado' 'msg', 0 'flag'
	END

END
GO
USE [master]
GO
ALTER DATABASE [PTVideojuegos] SET  READ_WRITE 
GO
