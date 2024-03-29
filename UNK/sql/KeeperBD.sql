/****** Object:  Database [unkeeper]    Script Date: 16/09/2021 13:46:49 ******/
CREATE DATABASE [unkeeper]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [unkeeper] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [unkeeper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [unkeeper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [unkeeper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [unkeeper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [unkeeper] SET ARITHABORT OFF 
GO
ALTER DATABASE [unkeeper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [unkeeper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [unkeeper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [unkeeper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [unkeeper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [unkeeper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [unkeeper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [unkeeper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [unkeeper] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [unkeeper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [unkeeper] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [unkeeper] SET  MULTI_USER 
GO
ALTER DATABASE [unkeeper] SET ENCRYPTION ON
GO
ALTER DATABASE [unkeeper] SET QUERY_STORE = ON
GO
ALTER DATABASE [unkeeper] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[TEquipo]    Script Date: 16/09/2021 13:46:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEquipo](
	[IdEquipo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](80) NOT NULL,
	[Ubicacion] [nvarchar](80) NULL,
	[Fabricante] [nvarchar](80) NULL,
	[Modelo] [nvarchar](80) NULL,
	[Documentos] [varbinary](max) NULL,
	[FechaInstalacion] [date] NULL,
	[NumeroSerie] [nvarchar](50) NULL,
	[Observaciones] [nvarchar](200) NULL,
 CONSTRAINT [PK_TEquipo] PRIMARY KEY CLUSTERED 
(
	[IdEquipo] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TFiles]    Script Date: 16/09/2021 13:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TFiles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContentType] [nvarchar](200) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	[idServicio] [int] NOT NULL,
 CONSTRAINT [PK_TFiles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TProveedor]    Script Date: 16/09/2021 13:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TProveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[CIF] [nvarchar](9) NOT NULL,
	[Nombre] [nvarchar](80) NOT NULL,
	[Direccion] [nvarchar](100) NULL,
	[Provincia] [nvarchar](80) NULL,
	[CP] [nvarchar](5) NULL,
	[Mail] [nvarchar](50) NULL,
	[Telefono] [nvarchar](50) NULL,
	[Contacto] [nvarchar](50) NULL,
	[Observaciones] [nvarchar](200) NULL,
	[Ciudad] [nvarchar](80) NULL,
 CONSTRAINT [PK_TProveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TServicio]    Script Date: 16/09/2021 13:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TServicio](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdEquipo] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Descripcion] [nvarchar](200) NOT NULL,
	[Documento] [varbinary](max) NULL,
	[Vencimiento] [datetime] NOT NULL,
 CONSTRAINT [PK_TServicio] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[TFiles]  WITH CHECK ADD  CONSTRAINT [FK_TFiles_TServicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[TServicio] ([IdServicio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TFiles] CHECK CONSTRAINT [FK_TFiles_TServicio]
GO
ALTER TABLE [dbo].[TServicio]  WITH CHECK ADD  CONSTRAINT [FK_TServicio_TEquipo] FOREIGN KEY([IdEquipo])
REFERENCES [dbo].[TEquipo] ([IdEquipo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TServicio] CHECK CONSTRAINT [FK_TServicio_TEquipo]
GO
ALTER TABLE [dbo].[TServicio]  WITH CHECK ADD  CONSTRAINT [FK_TServicio_TProveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[TProveedor] ([IdProveedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TServicio] CHECK CONSTRAINT [FK_TServicio_TProveedor]
GO
ALTER DATABASE [unkeeper] SET  READ_WRITE 
GO
