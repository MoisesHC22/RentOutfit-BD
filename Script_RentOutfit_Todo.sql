CREATE DATABASE [RentOutfit]

USE [RentOutfit]
GO


/******
Creación de tabla de calificaciones     
Script Date: 01/10/2024 03:33:47 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificaciones](
	[calificacionesID] [int] IDENTITY(1,1) NOT NULL,
	[usuarioID] [int] NOT NULL,
	[vestimentaID] [int] NOT NULL,
	[fechaCalificada] [date] NOT NULL,
	[comentario] [varchar](250) NOT NULL,
	[puntuacion] [int] NOT NULL,
	[ultimaModificacionCalificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Calificaciones] PRIMARY KEY CLUSTERED 
(
	[calificacionesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de chats               
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[chatID] [int] IDENTITY(1,1) NOT NULL,
	[clienteID] [int] NOT NULL,
	[establecimientoID] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[ultimaModificacionChat] [datetime] NOT NULL,
	[mensajeID] [int] NOT NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[chatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de clientes 
Script Date: 10/10/2024 04:09:11 a. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[clienteID] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](50) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NOT NULL,
	[linkImagenPerfil] [varchar](250) NULL,
	[usuarioID] [int] NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[direccionID] [int] NOT NULL,
	[generoID] [int] NOT NULL,
	[ultimaModificacionCliente] [datetime] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[clienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de detalle Roles       
Script Date: 01/10/2024 03:33:47 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleRol](
	[detalleRolID] [int] IDENTITY(1,1) NOT NULL,
	[nombreRol] [varchar](50) NOT NULL,
	[ultimaModificacionDtRol] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleRol] PRIMARY KEY CLUSTERED 
(
	[detalleRolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** 
Creación de tabla de detalle ventas       
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[detalleVentaID] [int] IDENTITY(1,1) NOT NULL,
	[vestimentaID] [int] NOT NULL,
	[precioTotal] [decimal](18, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[pedidoID] [int] NOT NULL,
	[incidenciaID] [int] NOT NULL,
	[ultimaModificacionDV] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[detalleVentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de direcciones        
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direcciones](
	[direccionID] [int] IDENTITY(1,1) NOT NULL,
	[codigoPostal] [varchar](5) NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[noInt] [varchar](5) NOT NULL,
	[noExt] [varchar](5) NOT NULL,
	[ultimaModificacionDireccion] [datetime] NOT NULL,
	[estadoID] [int] NOT NULL,
	[municipio] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[direccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de establecimientos   
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva      
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimientos](
	[establecimientosID] [int] IDENTITY(1,1) NOT NULL,
	[clienteID] [int] NOT NULL,
	[nombreEstablecimiento] [varchar](50) NOT NULL,
	[direccionID] [int] NOT NULL,
	[ultimaModificacionEstablecimiento] [datetime] NOT NULL,
	[linkImagenEstablecimiento] [varchar](250) NULL,
 CONSTRAINT [PK_Establecimientos] PRIMARY KEY CLUSTERED 
(
	[establecimientosID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de estados             
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[estadoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstado] [varchar](50) NOT NULL,
	[ultimaModificacionEstado] [datetime] NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de estilos     
Script Date: 14/10/2024 12:19:36 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estilo](
	[estiloID] [int] IDENTITY(1,1) NOT NULL,
	[nombreEstilo] [varchar](50) NOT NULL,
	[ultimaModificacionEstilo] [datetime] NOT NULL,
 CONSTRAINT [PK_Estilo] PRIMARY KEY CLUSTERED 
(
	[estiloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de generos             
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[generoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreGenero] [varchar](50) NOT NULL,
	[ultimaModificacionGenero] [datetime] NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[generoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de incidentes         
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva      
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencias](
	[incidenciaID] [int] IDENTITY(1,1) NOT NULL,
	[fechaIncidencia] [datetime] NOT NULL,
	[descripcion] [text] NOT NULL,
	[incidenciaEstatus] [bit] NOT NULL,
	[ultimaModificacionIncidencia] [datetime] NOT NULL,
 CONSTRAINT [PK_Incidencias] PRIMARY KEY CLUSTERED 
(
	[incidenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/******
Creación de tabla de mensajes            
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mensajes](
	[mensajeID] [int] IDENTITY(1,1) NOT NULL,
	[contenido] [text] NOT NULL,
	[fechaEnvio] [datetime] NOT NULL,
	[ultimaModificacionMensaje] [datetime] NOT NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[mensajeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO



/****** 
Creación de tabla de municipios          
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[municipioID] [int] IDENTITY(1,1) NOT NULL,
	[nombreMunicipio] [varchar](150) NOT NULL,
	[estadoID] [int] NOT NULL,
	[ultimaModificacionMunicipio] [datetime] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[municipioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de pedidos             
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[pedidoID] [int] IDENTITY(1,1) NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[clienteID] [int] NOT NULL,
	[total] [decimal](18, 2) NOT NULL,
	[pedidosEstatus] [bit] NOT NULL,
	[ultimaModifiacionPedido] [datetime] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[pedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/******
Creación de tabla de roles               
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[rolID] [int] IDENTITY(1,1) NOT NULL,
	[detalleRolID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
	[ultimaModificacionRol] [datetime] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[rolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de tallas              
Script Date: 01/10/2024 03:33:47 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tallas](
	[tallaID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTalla] [varchar](50) NOT NULL,
	[ultimaModificacionTalla] [datetime] NOT NULL,
 CONSTRAINT [PK_Tallas] PRIMARY KEY CLUSTERED 
(
	[tallaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/******
Creación de tabla de usuarios            
Script Date: 11/10/2024 02:39:07 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contrasena] [varchar](255) NOT NULL,
	[token] [varchar](50) NOT NULL,
	[ultimaModificacionUsuario] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/******
Creación de tabla de imagenes para la vestimenta            
Script Date: 14/10/2024 12:21:59 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImagenesVes](
	[imagenesVesID] [int] IDENTITY(1,1) NOT NULL,
	[imagen1] [varchar](250) NOT NULL,
	[imagen2] [varchar](250) NULL,
	[imagen3] [varchar](250) NULL,
	[imagen4] [varchar](250) NULL,
	[ultimaModificacionImgVes] [datetime] NOT NULL,
 CONSTRAINT [PK_ImagenesVes] PRIMARY KEY CLUSTERED 
(
	[imagenesVesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** 
Creación de tabla de vestimentas            
Script Date: 15/10/2024 07:26:03 p. m.
Autor: Moisés Jael Hernández Calva          
Contacto: moyhc2204gamer@outlook.com
******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vestimentas](
	[vestimentaID] [int] IDENTITY(1,1) NOT NULL,
	[nombrePrenda] [varchar](50) NOT NULL,
	[precioPorDia] [decimal](18, 2) NOT NULL,
	[stock] [int] NOT NULL,
	[fechaDePublicacion] [date] NOT NULL,
	[tallaID] [int] NOT NULL,
	[establecimientoID] [int] NOT NULL,
	[ultimaModificacionVestimenta] [datetime] NOT NULL,
	[vestimentaEstatus] [bit] NULL,
	[imagenesVesID] [int] NOT NULL,
	[estiloID] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Vestimentas] PRIMARY KEY CLUSTERED 
(
	[vestimentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuarios] ([usuarioID])
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Usuarios]
GO
ALTER TABLE [dbo].[Calificaciones]  WITH CHECK ADD  CONSTRAINT [FK_Calificaciones_Vestimentas] FOREIGN KEY([vestimentaID])
REFERENCES [dbo].[Vestimentas] ([vestimentaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Calificaciones] CHECK CONSTRAINT [FK_Calificaciones_Vestimentas]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Clientes] FOREIGN KEY([clienteID])
REFERENCES [dbo].[Clientes] ([clienteID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Clientes]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Establecimientos] FOREIGN KEY([establecimientoID])
REFERENCES [dbo].[Establecimientos] ([establecimientosID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Establecimientos]
GO
ALTER TABLE [dbo].[Chats]  WITH CHECK ADD  CONSTRAINT [FK_Chats_Mensajes] FOREIGN KEY([mensajeID])
REFERENCES [dbo].[Mensajes] ([mensajeID])
GO
ALTER TABLE [dbo].[Chats] CHECK CONSTRAINT [FK_Chats_Mensajes]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Direcciones] FOREIGN KEY([direccionID])
REFERENCES [dbo].[Direcciones] ([direccionID])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Direcciones]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Generos] FOREIGN KEY([generoID])
REFERENCES [dbo].[Generos] ([generoID])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Generos]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuarios] ([usuarioID])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Usuarios]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Incidencias] FOREIGN KEY([incidenciaID])
REFERENCES [dbo].[Incidencias] ([incidenciaID])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Incidencias]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Pedidos] FOREIGN KEY([pedidoID])
REFERENCES [dbo].[Pedidos] ([pedidoID])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Pedidos]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Vestimentas] FOREIGN KEY([vestimentaID])
REFERENCES [dbo].[Vestimentas] ([vestimentaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Vestimentas]
GO
ALTER TABLE [dbo].[Direcciones]  WITH CHECK ADD  CONSTRAINT [FK_Direcciones_Estados] FOREIGN KEY([estadoID])
REFERENCES [dbo].[Estados] ([estadoID])
GO
ALTER TABLE [dbo].[Direcciones] CHECK CONSTRAINT [FK_Direcciones_Estados]
GO
ALTER TABLE [dbo].[Establecimientos]  WITH CHECK ADD  CONSTRAINT [FK_Establecimientos_Clientes] FOREIGN KEY([clienteID])
REFERENCES [dbo].[Clientes] ([clienteID])
GO
ALTER TABLE [dbo].[Establecimientos] CHECK CONSTRAINT [FK_Establecimientos_Clientes]
GO
ALTER TABLE [dbo].[Establecimientos]  WITH CHECK ADD  CONSTRAINT [FK_Establecimientos_Direcciones] FOREIGN KEY([direccionID])
REFERENCES [dbo].[Direcciones] ([direccionID])
GO
ALTER TABLE [dbo].[Establecimientos] CHECK CONSTRAINT [FK_Establecimientos_Direcciones]
GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Municipios_Estados] FOREIGN KEY([estadoID])
REFERENCES [dbo].[Estados] ([estadoID])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_Municipios_Estados]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([clienteID])
REFERENCES [dbo].[Clientes] ([clienteID])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_DetalleRol] FOREIGN KEY([detalleRolID])
REFERENCES [dbo].[DetalleRol] ([detalleRolID])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_DetalleRol]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Usuarios] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[Usuarios] ([usuarioID])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Usuarios]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Establecimientos] FOREIGN KEY([establecimientoID])
REFERENCES [dbo].[Establecimientos] ([establecimientosID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Establecimientos]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Estilo] FOREIGN KEY([estiloID])
REFERENCES [dbo].[Estilo] ([estiloID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Estilo]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_ImagenesVes] FOREIGN KEY([imagenesVesID])
REFERENCES [dbo].[ImagenesVes] ([imagenesVesID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_ImagenesVes]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Tallas] FOREIGN KEY([tallaID])
REFERENCES [dbo].[Tallas] ([tallaID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Tallas]
GO



/******
Creación de Stored procedure para crear un cliente.   
Script Date: 13/10/2024 12:10:36 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_registrar_cliente]
(
-- Usuarios
@email VARCHAR(50) = NULL,
@contrasena VARCHAR(255) = NULL,
@token VARCHAR(50) = NULL,

-- Cliente

@nombreCliente VARCHAR(50) = NULL,
@apellidoPaterno VARCHAR(50) = NULL,
@apellidoMaterno VARCHAR(50) = NULL,
@linkImagenPerfil VARCHAR(250) = NULL,
@telefono VARCHAR(10) = NULL,
@generoID INT = NULL,

-- Direccion

@codigoPostal VARCHAR(5) = NULL,
@colonia VARCHAR(50) = NULL,
@calle VARCHAR(50) = NULL,
@noInt VARCHAR(5) = NULL,
@noExt VARCHAR(5) = NULL,
@estadoID INT = NULL,
@municipio VARCHAR(50) = NULL
)
AS
BEGIN
   SET NOCOUNT ON;

   DECLARE @tipoError INT = 0;
   DECLARE @mensaje NVARCHAR(255)= '';

   BEGIN TRY
      BEGIN TRANSACTION;

	  --Validación de campos
	  IF @email IS NULL OR @contrasena IS NULL OR @token IS NULL OR @nombreCliente IS NULL OR 
	     @apellidoPaterno IS NULL OR @apellidoMaterno IS NULL OR @telefono IS NULL OR @generoID IS NULL OR
		 @codigoPostal IS NULL OR @colonia IS NULL OR @calle IS NULL OR @noInt IS NULL OR @noExt IS NULL OR
		 @estadoID IS NULL OR @municipio IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	  IF EXISTS(
	   SELECT 
		  M.municipioID,
		  M.estadoID,
		  E.nombreEstado
	   FROM Estados E
	     INNER JOIN Municipios M ON E.estadoID = M.estadoID
	   WHERE M.nombreMunicipio = @municipio AND E.estadoID = @estadoID
	  )
	  BEGIN
	    
		  IF EXISTS(
		   SELECT * FROM Usuarios WHERE email = @email 
		  )
		  BEGIN
	         
			 SET @tipoError = 2;
	         SET @mensaje = 'El email ya esta en uso.'

	         ROLLBACK TRANSACTION;

   	         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	         RETURN;
		  END
		ELSE
		  BEGIN
		
	      -- Insertar el usuario

	      DECLARE @usuarioID INT;
	      DECLARE @contrasenaEncryptada VARBINARY(64) = HASHBYTES('SHA2_256', @contrasena);
              INSERT INTO Usuarios (email, contrasena, token, ultimaModificacionUsuario)
	          VALUES (@email, @contrasenaEncryptada, @token, GETDATE());
   	      SET @usuarioID = SCOPE_IDENTITY();

	      -- Insertar el rol

	      DECLARE @rolID INT;
	          INSERT INTO Roles (detalleRolID, usuarioID, ultimaModificacionRol)
		      VALUES (1, @usuarioID, GETDATE());

	      -- Insertar el domicilio

	      DECLARE @direccionID INT;
	          INSERT INTO Direcciones (codigoPostal, colonia, calle, noInt, noExt, ultimaModificacionDireccion, estadoID, municipio)
		      VALUES (@codigoPostal, @colonia, @calle, @noInt, @noExt, GETDATE() ,@estadoID, @municipio)
   	      SET @direccionID = SCOPE_IDENTITY();

	      -- Insertar al cliente

	      INSERT INTO Clientes (nombreCliente, apellidoPaterno, apellidoMaterno, linkImagenPerfil, usuarioID, telefono, direccionID, generoID, ultimaModificacionCliente)
	      VALUES (@nombreCliente, @apellidoPaterno, @apellidoMaterno, @linkImagenPerfil, @usuarioID, @telefono, @direccionID, @generoID, GETDATE())

  	      COMMIT TRANSACTION;

	      SET @tipoError = 0;
	      SET @mensaje = 'Se insertó el cliente de forma correcta.';
	      SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	    END
	 END
	ELSE
	 BEGIN
	   SET @tipoError = 3;
	   SET @mensaje = 'El estado y municipio con coinciden.'

	   ROLLBACK TRANSACTION;

	   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	 END

   END TRY
   BEGIN CATCH

      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;

   END CATCH
END



/******
Creación de Stored procedure para actualizar la foto de perfil de un cliente nuevo.   
Script Date: 14/10/2024 02:42:57 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_actualizar_fotoDePefil]
(
@email VARCHAR(50) = NULL,
@linkImagenPerfil VARCHAR(250) = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';
  DECLARE @usuarioID INT = NULL;

BEGIN TRY

IF @email IS NULL OR @linkImagenPerfil IS NULL
  BEGIN
      SET @tipoError = 1;
	  SET @mensaje = 'Uno o más campos requeridos están vacíos.';

	  ROLLBACK TRANSACTION;
      SELECT @tipoError AS tipoError, @mensaje AS mensaje;
      RETURN;
  END

  SELECT
   @usuarioID = usuarioID 
  FROM Usuarios
  WHERE email = @email

  UPDATE Clientes
  SET linkImagenPerfil = @linkImagenPerfil
  WHERE usuarioID = @usuarioID

   SET @tipoError = 0;
   SET @mensaje = 'Se inserto la imagen de forma correcta.';
   SELECT @tipoError AS tipoError, @mensaje AS mensaje;

END TRY
  BEGIN CATCH

  IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 2;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END




/******
Creación de Stored procedure para mostrar uno o más cliente.   
Script Date: 07/10/2024 02:22:55 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_cliente]
(
@usuarioID INT = NULL,
@pagina INT = 1
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';
  DECLARE @registrosPorPagina INT  = 25;
  DECLARE @offset INT;
  DECLARE @detalleRolID INT;

  BEGIN TRY

	 IF @usuarioID IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Aún no tienes Acceso.'

		 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	  SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  IF EXISTS (SELECT 1 FROM Usuarios WHERE usuarioID = @usuarioID)
	    BEGIN

		   -- Obtener el rol
	     
		  SELECT @detalleRolID = DT.detalleRolID
	      FROM Usuarios U
	        INNER JOIN Roles R ON U.usuarioID = R.usuarioID
	        INNER JOIN DetalleRol DT ON R.detalleRolID = DT.detalleRolID
	      WHERE U.usuarioID = @usuarioID

	      SELECT
	       C.usuarioID,
		   U.email,

		   C.nombreCliente,
		   C.apellidoMaterno,
		   C.apellidoPaterno,
		   C.linkImagenPerfil,
		   C.telefono,
		   G.nombreGenero AS genero,
		   
		   D.codigoPostal,
		   D.colonia,
		   D.calle,
		   D.noExt,
		   D.noInt,
		   E.nombreEstado AS estado,
		   D.municipio
	      FROM Usuarios U
            INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
		    INNER JOIN Roles R ON U.usuarioID = R.usuarioID
		    INNER JOIN Direcciones D ON C.direccionID = D.direccionID
		    INNER JOIN Estados E ON D.estadoID = E.estadoID
	   	    INNER JOIN Generos G ON C.generoID = G.generoID
		    INNER JOIN DetalleRol DT ON R.detalleRolID = DT.detalleRolID
	      WHERE (C.usuarioID = @usuarioID OR @detalleRolID = 3)

          ORDER BY C.clienteID
	      OFFSET CASE WHEN @detalleRolID = 3 THEN @offset ELSE 0 END ROWS
	      FETCH NEXT CASE WHEN @detalleRolID = 3  THEN @registrosPorPagina ELSE 1000 END ROWS ONLY;

     	  COMMIT TRANSACTION;

	      SET @tipoError = 0;
	      SET @mensaje = 'Consulta de cliente exitosa.';
	      -- SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	    END
	  ELSE
	   BEGIN
	   SET @tipoError = 2;
	         SET @mensaje = 'Revisa tus datos.';
	   
	         ROLLBACK TRANSACTION;

        	 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    	   RETURN;
	   END
  END TRY
  BEGIN CATCH
    
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;

   END CATCH
END



/******
Creación de Stored procedure para actualizar un cliente.   
Script Date: 14/10/2024 01:30:51 p. m. 																	
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_actualizar_cliente]
(

--Usuarios
@usuarioID INT = NULL,
@email VARCHAR(50),
@token VARCHAR(50),

-- Cliente

@nombreCliente VARCHAR(50),
@apellidoPaterno VARCHAR(50),
@apellidoMaterno VARCHAR(50),
@linkImagenPerfil VARCHAR(250),
@telefono VARCHAR(10),
@generoID INT,

-- Direccion

@codigoPostal VARCHAR(5),
@colonia VARCHAR(50),
@calle VARCHAR(50),
@noInt INT,
@noExt INT,
@estadoID INT,
@municipio VARCHAR(150)
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';
  DECLARE @emailActual VARCHAR(50) = NULL;

  BEGIN TRY
    BEGIN TRANSACTION;

	-- Validación del campo
	IF @usuarioID IS NULL
	  BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'Debe proporcionar al menos un ID para actualizar.';

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	  END

      SELECT @emailActual = U.email
	  FROM Usuarios U
	    INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
	  WHERE C.usuarioID = @usuarioID;

	  IF @emailActual <> @email
	   BEGIN
	     IF EXISTS (SELECT 1 FROM Usuarios WHERE email = @email)
	      BEGIN
	        SET @tipoError = 2;
		    SET @mensaje = 'El nuevo correo ya está registrado por otro usuario.'

		    ROLLBACK TRANSACTION;
		    SELECT @tipoError AS tipoError, @mensaje AS mensaje;
            RETURN;
	     END
       END

	    IF EXISTS(
	      SELECT
	         M.municipioID,
	         M.estadoID,
	         E.nombreEstado
	      FROM Estados E
	        INNER JOIN Municipios M ON E.estadoID = M.estadoID
	      WHERE M.nombreMunicipio = @municipio AND E.estadoID = @estadoID)
	      BEGIN

	    	IF EXISTS (SELECT 1 FROM Clientes
	        WHERE usuarioID = usuarioID
	        AND (nombreCliente <> @nombreCliente OR
	            apellidoMaterno <> @apellidoMaterno OR
		        apellidoPaterno <> @apellidoPaterno OR
		        linkImagenPerfil <> @linkImagenPerfil OR
		        telefono <> @telefono OR
		        generoID <> @generoID))
	        BEGIN
            UPDATE Clientes
	        SET nombreCliente = @nombreCliente,
	           apellidoMaterno = @apellidoMaterno,
		       apellidoPaterno = @apellidoPaterno,
		       linkImagenPerfil = @linkImagenPerfil,
		       telefono = @telefono,
		       generoID = @generoID,
	           ultimaModificacionCliente = GETDATE()
	        WHERE usuarioID = @usuarioID;
   	      END

	      IF EXISTS (SELECT 1 FROM Usuarios U
		     WHERE usuarioID = @usuarioID
	   	  AND (email <> @email OR 
			  token <> @token))
          BEGIN
	      UPDATE Usuarios
	      SET email = @email,
		      token = @token,
		      ultimaModificacionUsuario = GETDATE()
	       WHERE usuarioID = @usuarioID;
	     END

	     IF EXISTS (SELECT 1 FROM Direcciones D
	           INNER JOIN Clientes C WITH(NOLOCK) ON D.direccionID = C.direccionID
	         WHERE C.usuarioID = @usuarioID
	       AND (codigoPostal <> @codigoPostal OR
	           colonia <> @colonia OR
			   calle <> @calle OR
			   noInt <> @noInt OR
			   noExt <> @noExt OR
			   estadoID <> @estadoID OR
		  	   municipio <> @municipio))
	       BEGIN
	       UPDATE Direcciones
	       SET codigoPostal = @codigoPostal,
	          colonia = @colonia,
		      calle = @calle,
		      noInt = @noInt,
		      noExt = @noExt,
		      estadoID = @estadoID,
		      municipio = @municipio,
		      ultimaModificacionDireccion = GETDATE()
	        WHERE direccionID = (SELECT direccionID FROM Clientes WHERE usuarioID = @usuarioID);
	       END

	       COMMIT TRANSACTION;

	       SET @tipoError = 0;
	       SET @mensaje = 'Actualización exitosa.';
   	       SELECT @tipoError AS tipoError, @mensaje AS mensaje;

	   END
	ELSE
	  BEGIN
         SET @tipoError = 3;
	     SET @mensaje = 'El estado y municipio con coinciden.'

	     ROLLBACK TRANSACTION;

	     SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END

  END TRY
  BEGIN CATCH

  IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 2;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END



/******
Creación del stored procedure para consultar los generos
Script Date: 04/10/2024 06:58:19 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_generos]
AS
BEGIN
  SELECT 
  generoID,
  nombreGenero
  FROM Generos
END



/******
Creación de Stored procedure para iniciar sesión  
Script Date: 07/10/2024 01:48:16 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Iniciar_Sesion]
(
@email VARCHAR(50) = NULL,
@contrasena VARCHAR(255) = NULL
)
AS
BEGIN
   SET NOCOUNT ON;

   DECLARE @tipoError INT = 0;
   DECLARE @mensaje NVARCHAR(255)= '';
   DECLARE @ContrasenaEncryptada VARBINARY(64) = NULL;


  BEGIN TRY
    BEGIN TRANSACTION;

	IF @email IS NULL OR @contrasena IS NULL
	  BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'Verifica tus datos.';

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	  END

	  IF EXISTS (SELECT 1 FROM Usuarios WHERE email = @email)
	    BEGIN

		 SET @ContrasenaEncryptada = HASHBYTES('SHA2_256', @contrasena);

		  IF EXISTS(SELECT 1 FROM Usuarios WHERE email = @email AND contrasena = @ContrasenaEncryptada)
		   BEGIN  

		      SELECT
                R.detalleRolID,
                C.nombreCliente,
                C.linkImagenPerfil,
				E.nombreEstado,
                D.municipio
			  FROM Usuarios U
			    INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
			    INNER JOIN Roles R ON U.usuarioID = R.usuarioID
			    INNER JOIN Direcciones D ON C.direccionID = D.direccionID
			    INNER JOIN Estados E ON D.estadoID = E.estadoID
			  WHERE U.email = @email AND U.contrasena = @ContrasenaEncryptada

			  COMMIT TRANSACTION;

	            SET @tipoError = 0;
                SET @mensaje = 'La cuenta ' + @email + ' inicio correctamente.' ;
            --  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		    
		   END
          ELSE
		   BEGIN
		     SET @tipoError = 2;
	         SET @mensaje = 'Revisa tu contraseña.';
	   
	         ROLLBACK TRANSACTION;

        	 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    	   RETURN;
		   END;

	    END
	  ELSE
	    BEGIN

		   SET @tipoError = 3;
	       SET @mensaje = 'Verifica que tu correo sea el correcto.';
	   
	       ROLLBACK TRANSACTION;

     	   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END;

  END TRY
  
  BEGIN CATCH

   IF @@TRANCOUNT > 0

	     ROLLBACK TRANSACTION;

		 SET @tipoError = 4;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END



/******
Creación del stored procedure para consultar Estados
Script Date: 04/10/2024 05:50:34 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/


CREATE OR ALTER PROC [dbo].[sp_consultar_estados]
AS
BEGIN
  SELECT 
    estadoID,
	nombreEstado
  FROM Estados
END



/******
Creación de un stored procedure para consular los municipios de un estado especifico
Script Date: 04/10/2024 06:20:29 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_municipios]
(
@estadoID INT = NULL
)
AS
BEGIN
   SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';

BEGIN TRY
   IF @estadoID IS NULL
    BEGIN
	  SET @tipoError = 1;
	  SET @mensaje = 'Necesitas seleccionar un estados.'
	  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	  RETURN;
	END

	BEGIN TRANSACTION;

	IF NOT EXISTS (
	 SELECT 1 FROM Estados WHERE estadoID = @estadoID
	)
	BEGIN
	   SET @tipoError = 1;
	   SET @mensaje = 'El estado no existe.';

	     ROLLBACK TRANSACTION;

         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
      END

	SELECT
	 M.municipioID,
	 M.nombreMunicipio
	FROM Municipios M
	 INNER JOIN Estados E ON M.estadoID = E.estadoID
	 WHERE E.estadoID = @estadoID;

	COMMIT TRANSACTION;

	SET @tipoError = 0;
	SET @mensaje = 'Operación exitosa.';
	-- SELECT @tipoError AS tipoError, @mensaje AS mensaje;

END TRY
  BEGIN CATCH
    
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 2;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;

   END CATCH
END



/******
Creación de Stored procedure para dar de alta un establecimiento  
Script Date: 06/10/2024 01:58:16 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_DarDeAlta_Establecimiento]
(
@usuarioID INT = NULL,

-- Establecimiento

@nombreEstablecimiento VARCHAR(50) = NULL,

-- Direcciones

@codigoPostal VARCHAR(5) = NULL,
@colonia VARCHAR(50) = NULL,
@calle VARCHAR(50) = NULL,
@noInt INT= NULL,
@noExt INT = NULL,
@estadoID INT = NULL,
@municipio VARCHAR(150) = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';
  DECLARE @direccionID INT;
  DECLARE @clienteID INT;
  DECLARE @detalleRolID INT;

  BEGIN TRY
    BEGIN TRANSACTION;

	IF @usuarioID IS NULL
	   BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'No tienes acceso a esta funcion.'

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	   END;

	IF @nombreEstablecimiento IS NULL OR @codigoPostal IS NULL OR @colonia IS NULL OR @calle IS NULL OR
		 @noInt IS NULL OR @noExt IS NULL OR @estadoID IS NULL OR @municipio IS NULL
    BEGIN
	     SET @tipoError = 2;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	 END



    IF EXISTS (SELECT 1 FROM Usuarios WHERE usuarioID = @usuarioID)
	BEGIN

	   SELECT 
	   @clienteID = C.clienteID,
	   @detalleRolID = R.detalleRolID
	   FROM Roles R
	    INNER JOIN Usuarios U WITH(NOLOCK) ON R.usuarioID = U.usuarioID
		INNER JOIN Clientes C WITH(NOLOCK) ON R.usuarioID = C.usuarioID
	   WHERE R.usuarioID = @usuarioID;


	   IF @detalleRolID = 2
	      BEGIN

	         INSERT INTO Direcciones (codigoPostal, colonia, calle, noInt, noExt, ultimaModificacionDireccion, estadoID, municipio)
		        VALUES (@codigoPostal, @colonia, @calle, @noInt, @noExt, GETDATE() ,@estadoID, @municipio)
	         SET @direccionID = SCOPE_IDENTITY();

	         INSERT INTO Establecimientos (clienteID, nombreEstablecimiento, direccionID, ultimaModificacionEstablecimiento)
	         VALUES (@clienteID, @nombreEstablecimiento, @direccionID, GETDATE())

		 COMMIT TRANSACTION;

	     SET @tipoError = 0;
         SET @mensaje = 'Se dio de alta Establecimiento con exito.';
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		    
	   END
	   ELSE
	      BEGIN
        	
			SET @tipoError = 3;
	        SET @mensaje = 'No tienes acceso.';
	        
			ROLLBACK TRANSACTION;
			SELECT @tipoError AS tipoError, @mensaje AS mensaje;

	      END;
	END
	ElSE
	  BEGIN
    	
       SET @tipoError = 4;
	   SET @mensaje = 'El usuario no existe.';
	   
	    ROLLBACK TRANSACTION;

	   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END;

  END TRY
  BEGIN CATCH

    IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 5;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END;



/******
Creación de Stored procedure para actualizar la imagen de un establecimiento 
Script Date: 18/10/2024 06:24:46 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Actualizar_FotoDeEstablecimiento]
(
@usuarioID INT = NULL,
@linkImagenEstablecimiento VARCHAR(250) = NULL
)
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @tipoError INT = 0;
    DECLARE @mensaje NVARCHAR(255)= '';

	BEGIN TRY
	    BEGIN TRANSACTION;

	    IF @usuarioID IS NULL OR @linkImagenEstablecimiento IS NULL
		 BEGIN
		    SET @tipoError = 1;
	        SET @mensaje = 'Uno o más campos requeridos están vacíos.';

	        ROLLBACK TRANSACTION;
            SELECT @tipoError AS tipoError, @mensaje AS mensaje;
            RETURN;
		END

		IF EXISTS (
		    SELECT 1 FROM
			Establecimientos E
			  INNER JOIN Clientes C ON E.clienteID = C.clienteID
			  INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID 
			WHERE U.usuarioID = @usuarioID  
		)
		 BEGIN
		  UPDATE Establecimientos
        	SET linkImagenEstablecimiento = @linkImagenEstablecimiento
          WHERE clienteID  = (SELECT clienteID FROM Clientes WHERE usuarioID = @usuarioID)

		  COMMIT TRANSACTION;

          SET @tipoError = 0;
          SET @mensaje = 'Se inserto la imagen de forma correcta.';
          SELECT @tipoError AS tipoError, @mensaje AS mensaje;

		 END
		ELSE
		 BEGIN
		  
		    SET @tipoError = 2;
	        SET @mensaje = 'No tienes acceso a esta función.'

	        COMMIT TRANSACTION;

	        SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	        RETURN;
		  END

	
	END TRY
	BEGIN CATCH

     IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
     END CATCH
  END



/******
Creación de Stored procedure para dar de alta un nuevo vendedor 
Script Date: 05/10/2024 10:53:12 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_DardeAlta_Vendedor]
(
@usuarioID INT = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';

  BEGIN TRY
    BEGIN TRANSACTION;

	IF @usuarioID IS NULL
	  BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'Necesitas iniciar sesion.'

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	  END

	  IF EXISTS (SELECT 1 FROM Usuarios
	     WHERE usuarioID = @usuarioID)
	   BEGIN
	      UPDATE Roles
		  SET detalleRolID = 2,
		  ultimaModificacionRol = GETDATE()
		  WHERE usuarioID = @usuarioID;

	  	COMMIT TRANSACTION;

      	  SET @tipoError = 0;
	      SET @mensaje = 'Cambio de Rol de cliente a vendedor exitoso.';
	    SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   END
	   ElSE
	   BEGIN
    	
		COMMIT TRANSACTION;

      	  SET @tipoError = 2;
	      SET @mensaje = 'No existe el usuario.';
	    SELECT @tipoError AS tipoError, @mensaje AS mensaje;

	   END

  END TRY
  BEGIN CATCH

  IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END



/******
Creación de Stored procedure para obtener el token de la cuenta para recuperar la contraseña.   
Script Date: 14/10/2024 04:23:13 p. m. 																	
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_olvideLaContrasena_Email]
(
@email VARCHAR(50) = NULL
)
AS
 BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';

  BEGIN TRY
     BEGIN TRANSACTION;

	 IF @email IS NULL
	   BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Debe proporcionar un correo en esta funcion.';

		 ROLLBACK TRANSACTION;
		 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		 RETURN;
	   END

	 IF EXISTS( SELECT token FROM Usuarios WHERE email = @email)
	  BEGIN

	      SELECT token FROM Usuarios WHERE email = @email;
	      COMMIT TRANSACTION;

	  END
	 ELSE
	  BEGIN

	     SET @tipoError = 2;
	     SET @mensaje = 'Ocurrio un error.'

	     ROLLBACK TRANSACTION;

	     SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END
  END TRY
    BEGIN CATCH

  IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
 END



 /******
Creación de Stored procedure para validar que el token sea correcto.   
Script Date: 14/10/2024 04:40:00 p. m. 																	
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_olvideLaContrasena_Token]
(
@email VARCHAR(50) = NULL,
@token VARCHAR(50) = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';

  BEGIN TRY
     BEGIN TRANSACTION;

	 IF @token IS NULL OR @email IS NULL
	   BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
		 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		 RETURN;
	   END

	 IF EXISTS( SELECT token FROM Usuarios WHERE token = @token AND email = @email)
	  BEGIN

	      COMMIT TRANSACTION;

		  SET @tipoError = 0;
	      SET @mensaje = 'Token correcto.';
   	      SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	  END
	 ELSE
	  BEGIN

	     SET @tipoError = 2;
	     SET @mensaje = 'Token incorrecto.'

	     ROLLBACK TRANSACTION;

	     SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END
  END TRY
    BEGIN CATCH

      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    END CATCH
 END



 /******
Creación de un stored procedure para actualizar la contraseña.   
Script Date: 14/10/2024 05:24:38 p. m. 																	
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_olvideLaContrasena_Actualizacion]
(
@contrasena VARCHAR(250) = NULL,
@email VARCHAR(50) = NULL,
@token VARCHAR(50) = NULL
)
AS
 BEGIN
SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';

  BEGIN TRY
     BEGIN TRANSACTION;

	 IF @contrasena IS NULL OR @email IS NULL OR @token IS NULL
	   BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
		 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		 RETURN;
	   END

	 IF EXISTS( SELECT 1 FROM Usuarios WHERE email = @email)
	  BEGIN

	  DECLARE @contrasenaEncryptada VARBINARY(64) = HASHBYTES('SHA2_256', @contrasena);

	  UPDATE Usuarios
	    SET token = @token,
	        contrasena = @contrasenaEncryptada
	  WHERE email = @email 
	
	      COMMIT TRANSACTION;

		  SET @tipoError = 0;
	      SET @mensaje = 'Se actualizo la contraseña con exito.';
		  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	  END
	 ELSE
	  BEGIN

	     SET @tipoError = 2;
	     SET @mensaje = 'Ocurrio un error.'

	     ROLLBACK TRANSACTION;

	     SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END
  END TRY
    BEGIN CATCH

      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    END CATCH
 END





 
/******
Creación de Stored procedure para registrar una vestimenta.   
Script Date: 15/10/2024 06:55:10 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_registrar_vestimenta]
(
-- Vestimenta
@usuarioID INT = NULL,
@nombre VARCHAR(50) = NULL,
@precio DECIMAL(18,2) = NULL,
@stock INT = NULL,
@tallaID INT = NULL,
@estiloID INT = NULL,
@descripcion VARCHAR(500) = NULL,

-- ImagenesVes
@imagen1 VARCHAR(250) = NULL,
@imagen2 VARCHAR(250) = NULL,
@imagen3 VARCHAR(250) = NULL,
@imagen4 VARCHAR(250) = NULL
)
AS
 BEGIN
    SET NOCOUNT ON;

	DECLARE @tipoError INT = NULL;
	DECLARE @mensaje NVARCHAR(255);

	BEGIN TRY

	   BEGIN TRANSACTION;
	   
	   IF @usuarioID IS NULL OR @nombre IS NULL OR @precio IS NULL OR
	      @stock IS NULL OR @tallaID IS NULL OR @estiloID IS NULL OR  @imagen1 IS NULL OR
		  @descripcion IS NULL
	   BEGIN
	      SET @tipoError = 1;
		  SET @mensaje = 'Uno o más campos requeridos están vacios';

		  ROLLBACK TRANSACTION;
		  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		  RETURN;
	   END

	   IF EXISTS(
	     SELECT 1 FROM Establecimientos E
		   INNER JOIN Clientes C ON E.clienteID = C.clienteID
		   INNER JOIN Usuarios U ON C.clienteID = u.usuarioID
		 WHERE U.usuarioID =  @usuarioID  
	   )
	    BEGIN

		   DECLARE @imagenesVesID INT;
		     INSERT INTO ImagenesVes (imagen1, imagen2, imagen3, imagen4, ultimaModificacionImgVes)
		     VALUES(@imagen1, @imagen2, @imagen3, @imagen4, GETDATE());
		   SET @imagenesVesID = SCOPE_IDENTITY();


		   DECLARE @establecimientoID INT;
		   SELECT 
		     @establecimientoID = e.establecimientosID
		   FROM Establecimientos E
		     INNER JOIN Clientes C ON E.clienteID = C.clienteID
		     INNER JOIN Usuarios U ON C.clienteID = u.usuarioID
		   WHERE U.usuarioID =  @usuarioID 
		   

		   INSERT INTO Vestimentas (nombrePrenda, precioPorDia, stock, fechaDePublicacion, tallaID, establecimientoID, ultimaModificacionVestimenta, vestimentaEstatus, imagenesVesID, estiloID, descripcion)
		   VALUES(@nombre, @precio, @stock, GETDATE(), @tallaID, @establecimientoID, GETDATE(), 1, @imagenesVesID, @estiloID, @descripcion)

		   COMMIT TRANSACTION;

		   SET @tipoError = 0;
		   SET @mensaje = 'Se agrego la vestimenta con exito';
	       SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	     RETURN;
		END
	   ELSE 
	    BEGIN
	       SET @tipoError = 2;
		   SET @mensaje = 'No tienes acceso aún.';

	       ROLLBACK TRANSACTION;

	       SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	     RETURN;
		END

	END TRY
    BEGIN CATCH

      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;

   END CATCH
 END


 /******
Creación de Stored procedure para consultar vestimentas
Script Date: 15/10/2024 07:30:01 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_vestimenta]
(
@nombrePrenda VARCHAR(50) = NULL,
@estilo VARCHAR(50) = NULL,
@talla VARCHAR(50) = NULL,
@establecimiento VARCHAR(50) = NULL,
@estado VARCHAR(50) = NULL,
@municipio VARCHAR(150) = NULL,
@usuarioID INT = NULL,
@pagina INT = 1
)
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';
  DECLARE @registrosPorPagina INT  = 10;
  DECLARE @offset INT;

  BEGIN TRY

      SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  SELECT
	     V.vestimentaID AS Vestimenta,
	     V.nombrePrenda,
	     V.precioPorDia,
		 IMV.imagen1,
	     V.vestimentaEstatus,

	     -- Pruebas

	     T.nombreTalla,
	     ES.nombreEstilo,
	     E.nombreEstablecimiento
	  FROM Roles R
	     INNER JOIN Usuarios U ON R.usuarioID = U.usuarioID
		 INNER JOIN Clientes C ON C.usuarioID = U.usuarioID
	     INNER JOIN Establecimientos E ON C.clienteID = E.clienteID
		 INNER JOIN Vestimentas V ON E.establecimientosID = V.establecimientoID
		 INNER JOIN Tallas T WITH(NOLOCK) ON V.tallaID = T.tallaID
		 INNER JOIN ImagenesVes IMV WITH(NOLOCK) ON V.imagenesVesID = IMV.imagenesVesID
		 INNER JOIN Estilo ES WITH(NOLOCK) ON V.estiloID = ES.estiloID
		 INNER JOIN Direcciones D ON  E.direccionID = D.direccionID
		 INNER JOIN Estados EST ON D.estadoID = EST.estadoID
		 INNER JOIN Municipios M ON D.municipio	= M.nombreMunicipio
	   WHERE (@nombrePrenda IS NULL OR V.nombrePrenda LIKE '%' + @nombrePrenda + '%')
	     AND (@usuarioID IS NULL OR U.usuarioID = @usuarioID)
         AND (@talla IS NULL OR T.nombreTalla = @talla)
         AND (@estilo IS NULL OR ES.nombreEstilo = @estilo)
         AND (@establecimiento IS NULL OR E.nombreEstablecimiento LIKE '%' + @establecimiento + '%')
		 AND (@estado IS NULL OR EST.nombreEstado = @estado AND @municipio IS NULL OR M.nombreMunicipio = @municipio)
	  ORDER BY V.nombrePrenda
	  OFFSET @offset ROWS
	  FETCH NEXT @registrosPorPagina ROWS ONLY;
	  
	  COMMIT TRANSACTION;

	 SET @tipoError = 0;
	 SET @mensaje = 'Consulta de vestimenta exitosa.';

  END TRY
  BEGIN CATCH
   
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 1;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;
   
  END CATCH
END



/******
Insertar datos a la tabla de estados
Script Date: 01/10/2024 07:47:47 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Estados (nombreEstado, ultimaModificacionEstado) VALUES
('Aguascalientes', GETDATE()),
('Baja California', GETDATE()),
('Baja California Sur', GETDATE()),
('Campeche', GETDATE()),
('Chiapas', GETDATE()),
('Chihuahua', GETDATE()),
('Coahuila', GETDATE()),
('Colima', GETDATE()),
('Durango', GETDATE()),
('Guanajuato', GETDATE()),
('Guerrero', GETDATE()),
('Hidalgo', GETDATE()),
('Jalisco', GETDATE()),
('Mexico', GETDATE()),
('Michoacán', GETDATE()),
('Morelos', GETDATE()),
('Nayarit', GETDATE()),
('Nuevo León', GETDATE()),
('Oaxaca', GETDATE()),
('Puebla', GETDATE()),
('Querétaro', GETDATE()),
('Quintana Roo', GETDATE()),
('San Luis Potosí', GETDATE()),
('Sinaloa', GETDATE()),
('Sonora', GETDATE()),
('Tabasco', GETDATE()),
('Tamaulipas', GETDATE()),
('Tlaxcala', GETDATE()),
('Veracruz', GETDATE()),
('Yucatán', GETDATE()),
('Zacatecas', GETDATE());




/******
Insertar datos a la tabla municipios parte 1
Script Date: 01/10/2024 11:05:40 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Municipios (nombreMunicipio, estadoID, ultimaModificacionMunicipio) VALUES 

-- Aguascalientes
('Aguascalientes', 1, GETDATE()),
('Asientos', 1, GETDATE()),
('Calvillo', 1, GETDATE()),
('Cosío', 1, GETDATE()),
('Jesús Maria', 1, GETDATE()),
('El Llano', 1, GETDATE()),
('Pabellón de Arteaga', 1, GETDATE()),
('Rincón de Romos', 1, GETDATE()),
('San Francisco de los Romo', 1, GETDATE()),
('Tepezalá', 1, GETDATE()),
('San José de Gracia', 1, GETDATE()),

-- Baja California
('Ensenada', 2, GETDATE()),
('Mexicali', 2, GETDATE()),
('Tijuana', 2, GETDATE()),
('Tecate', 2, GETDATE()),
('San Quintín', 2, GETDATE()),
('Playas de Rosario', 2, GETDATE()),
('San Felipe', 2, GETDATE()),

-- Baja California Sur
('La Paz', 3, GETDATE()),
('Comondú', 3, GETDATE()),
('Mulegé', 3, GETDATE()),
('Loreto', 3, GETDATE()),
('Los Cabos', 3, GETDATE()),

-- Campeche
('Calkini', 4, GETDATE()),
('Campeche', 4, GETDATE()),
('Carmen', 4, GETDATE()),
('Champotón', 4, GETDATE()),
('Hecelchakán', 4, GETDATE()),
('Hopelchén', 4, GETDATE()),
('Palizada', 4, GETDATE()),
('Tenabo', 4, GETDATE()),
('Escárcega', 4, GETDATE()),
('Calakmul', 4, GETDATE()),
('Candelaria', 4, GETDATE()),
('Seybaplaya', 4, GETDATE()),
('Dzitbalché', 4, GETDATE()),

-- Chiapas
('Acacoyagua', 5, GETDATE()),
('Acala', 5, GETDATE()),
('Acapetahua', 5, GETDATE()),
('Altamirano', 5, GETDATE()),
('Amatán', 5, GETDATE()),
('Amatenango de la Frontera', 5, GETDATE()),
('Amatenango del Valle', 5, GETDATE()),
('Jaltenango de la Paz', 5, GETDATE()),
('Arriaga', 5, GETDATE()),
('Bejucal de Ocampo', 5, GETDATE()),
('Bella Vista', 5, GETDATE()),
('Berriozábal', 5, GETDATE()),
('Bochil', 5, GETDATE()),
('El Bosque', 5, GETDATE()),
('Cacahoatán', 5, GETDATE()),
('Catazajá', 5, GETDATE()),
('Cintalapa de Figueroa', 5, GETDATE()),
('Coapilla', 5, GETDATE()),
('Comitán de Domínguez', 5, GETDATE()),
('La Concordia', 5, GETDATE()),
('Copainalá', 5, GETDATE()),
('Chalchihuitán', 5, GETDATE()),
('San Juan Chamula', 5, GETDATE()),
('Chanal', 5, GETDATE()),
('Chapultenango', 5, GETDATE()),
('Chenalhó', 5, GETDATE()),
('Chiapa de Corzo', 5, GETDATE()),
('Chiapilla', 5, GETDATE()),
('Chicoasén', 5, GETDATE()),
('Chicomuselo', 5, GETDATE()),
('Chilón', 5, GETDATE()),
('Escuintla', 5, GETDATE()),
('Rivera el Viejo Carmen', 5, GETDATE()),
('Frontera Comalapa', 5, GETDATE()),
('Frontera Hidalgo', 5, GETDATE()),
('La Grandeza', 5, GETDATE()),
('Huehuetán', 5, GETDATE()),
('Huixtán', 5, GETDATE()),
('Huitiupán', 5, GETDATE()),
('Huixtla', 5, GETDATE()),
('La Independencia', 5, GETDATE()),
('Ixhuatán', 5, GETDATE()),
('Ixtacomitán', 5, GETDATE()),
('Ixtapa', 5, GETDATE()),
('Ixtapangajoya', 5, GETDATE()),
('Jiquipilas', 5, GETDATE()),
('Jitotol', 5, GETDATE()),
('Juárez', 5, GETDATE()),
('San Andrés Larráinzar', 5, GETDATE()),
('La Libertad', 5, GETDATE()),
('Mapastepec', 5, GETDATE()),
('Las Margaritas', 5, GETDATE()),
('Mazapa de Madero', 5, GETDATE()),
('Mazatán', 5, GETDATE()),
('Metapa de Domínguez', 5, GETDATE()),
('Mitontic', 5, GETDATE()),
('Motozintla de Mendoza', 5, GETDATE()),
('Nicolás Ruíz', 5, GETDATE()),
('Ocosingo', 5, GETDATE()),
('Ocotepec', 5, GETDATE()),
('Ocozocoautla de Espinosa', 5, GETDATE()),
('Ostuacán', 5, GETDATE()),
('Osumacinta', 5, GETDATE()),
('Oxchuc', 5, GETDATE()),
('Palenque', 5, GETDATE()),
('Pantelhó', 5, GETDATE()),
('Pantepec', 5, GETDATE()),
('Pichucalco', 5, GETDATE()),
('Pijijiapan', 5, GETDATE()),
('El Porvenir de Velasco Suárez', 5, GETDATE()),
('Villa Comaltitlán', 5, GETDATE()),
('Pueblo Nuevo Solistahuacán', 5, GETDATE()),
('Rayón', 5, GETDATE()),
('Reforma', 5, GETDATE()),
('Las Rosas', 5, GETDATE()),
('Sabanilla', 5, GETDATE()),
('Salto de Agua', 5, GETDATE()),
('San Cristóbal de las Casas', 5, GETDATE()),
('San Fernando', 5, GETDATE()),
('Siltepec', 5, GETDATE()),
('Simojovel de Allende', 5, GETDATE()),
('Sitalá', 5, GETDATE()),
('Socoltenango', 5, GETDATE()),
('Solosuchiapa', 5, GETDATE()),
('Soyaló', 5, GETDATE()),
('Suchiapa', 5, GETDATE()),
('Ciudad Hidalgo', 5, GETDATE()),
('Sunuapa', 5, GETDATE()),
('Tapachula de Córdova y Ordóñez', 5, GETDATE()),
('Tapalapa', 5, GETDATE()),
('Tapilula', 5, GETDATE()),
('Tecpatán', 5, GETDATE()),
('Tenejapa', 5, GETDATE()),
('Teopisca', 5, GETDATE()),
('Tila', 5, GETDATE()),
('Tonalá', 5, GETDATE()),
('Totolapa', 5, GETDATE()),
('La Trinitaria', 5, GETDATE()),
('Tumbalá', 5, GETDATE()),
('Tuxtla Gutiérrez', 5, GETDATE()),
('Tuxtla Chico', 5, GETDATE()),
('Tuzantán', 5, GETDATE()),
('Tzimol', 5, GETDATE()),
('Unión Juárez', 5, GETDATE()),
('Venustiano Carranza', 5, GETDATE()),
('Ciudad de Villa Corzo', 5, GETDATE()),
('Villaflores', 5, GETDATE()),
('Yajalón', 5, GETDATE()),
('San Lucas', 5, GETDATE()),
('Zinacantán', 5, GETDATE()),
('San Juan Cancuc', 5, GETDATE()),
('Aldama', 5, GETDATE()),
('Benemérito de las Américas', 5, GETDATE()),
('Maravilla Tenejapa', 5, GETDATE()),
('Zamora Pico de Oro', 5, GETDATE()),
('Montecristo de Guerrero', 5, GETDATE()),
('San Andrés Duraznal', 5, GETDATE()),
('Santiago el Pinar', 5, GETDATE()),
('Capitán Luis Ángel Vidal', 5, GETDATE()),
('Rincón Chamula', 5, GETDATE()),
('El Parral', 5, GETDATE()),
('Emiliano Zapata', 5, GETDATE()),
('Mezcalapa', 5, GETDATE()),
('	Honduras de la Sierra', 5, GETDATE()),

-- Chihuahua
('Ahumada', 6, GETDATE()),
('Aldama', 6, GETDATE()),
('Allende', 6, GETDATE()),
('Aquiles Serdán', 6, GETDATE()),
('Ascensión', 6, GETDATE()),
('Bachíniva', 6, GETDATE()),
('Balleza', 6, GETDATE()),
('Batopilas de Manuel Gómez Morín', 6, GETDATE()),
('Bocoyna', 6, GETDATE()),
('Buenaventura', 6, GETDATE()),
('Camargo', 6, GETDATE()),
('Carichí', 6, GETDATE()),
('Casas Grandes', 6, GETDATE()),
('Coronado', 6, GETDATE()),
('Coyame del Sotol', 6, GETDATE()),
('La Cruz', 6, GETDATE()),
('Cuauhtémoc', 6, GETDATE()),
('Cusihuiriachi', 6, GETDATE()),
('Chihuahua', 6, GETDATE()),
('Chínipas', 6, GETDATE()),
('Delicias', 6, GETDATE()),
('Dr. Belisario Domínguez', 6, GETDATE()),
('Galeana', 6, GETDATE()),
('Santa Isabel', 6, GETDATE()),
('Gómez Farías', 6, GETDATE()),
('Gran Morelos', 6, GETDATE()),
('Guachochi', 6, GETDATE()),
('Guadalupe', 6, GETDATE()),
('Guadalupe y Calvo', 6, GETDATE()),
('Guazapares', 6, GETDATE()),
('Guerrero', 6, GETDATE()),
('Hidalgo del Parral', 6, GETDATE()),
('Huejotitán', 6, GETDATE()),
('Ignacio Zaragoza', 6, GETDATE()),
('Janos', 6, GETDATE()),
('Jiménez', 6, GETDATE()),
('Juárez', 6, GETDATE()),
('Julimes', 6, GETDATE()),
('López', 6, GETDATE()),
('Madera', 6, GETDATE()),
('Maguarichi', 6, GETDATE()),
('Manuel Benavides', 6, GETDATE()),
('Matachí', 6, GETDATE()),
('Matamoros', 6, GETDATE()),
('Meoqui', 6, GETDATE()),
('Morelos', 6, GETDATE()),
('Moris', 6, GETDATE()),
('Namiquipa', 6, GETDATE()),
('Nonoava', 6, GETDATE()),
('Nuevo Casas Grandes', 6, GETDATE()),
('Ocampo', 6, GETDATE()),
('Ojinaga', 6, GETDATE()),
('Práxedis G. Guerrero', 6, GETDATE()),
('Riva Palacio', 6, GETDATE()),
('Rosales', 6, GETDATE()),
('Rosario', 6, GETDATE()),
('San Francisco de Borja', 6, GETDATE()),
('San Francisco de Conchos', 6, GETDATE()),
('San Francisco del Oro', 6, GETDATE()),
('Santa Bárbara', 6, GETDATE()),
('Satevó', 6, GETDATE()),
('Saucillo', 6, GETDATE()),
('Temósachic', 6, GETDATE()),
('El Tule', 6, GETDATE()),
('Urique', 6, GETDATE()),
('Uruachi', 6, GETDATE()),
('Valle de Zaragoza', 6, GETDATE()),

-- Coahuila
('Abasolo', 7, GETDATE()),
('Acuña', 7, GETDATE()),
('Allende', 7, GETDATE()),
('Arteaga', 7, GETDATE()),
('Candela', 7, GETDATE()),
('Castaños', 7, GETDATE()),
('Cuatro Ciénegas', 7, GETDATE()),
('Escobedo', 7, GETDATE()),
('Francisco I. Madero', 7, GETDATE()),
('Frontera', 7, GETDATE()),
('General Cepeda', 7, GETDATE()),
('Guerrero', 7, GETDATE()),
('Hidalgo', 7, GETDATE()),
('Jiménez', 7, GETDATE()),
('Juárez', 7, GETDATE()),
('Lamadrid', 7, GETDATE()),
('Matamoros', 7, GETDATE()),
('Monclova', 7, GETDATE()),
('Morelos', 7, GETDATE()),
('Múzquiz', 7, GETDATE()),
('Nadadores', 7, GETDATE()),
('Nava', 7, GETDATE()),
('Ocampo', 7, GETDATE()),
('Parras', 7, GETDATE()),
('Piedras Negras', 7, GETDATE()),
('Progreso', 7, GETDATE()),
('Ramos Arizpe', 7, GETDATE()),
('Sabinas', 7, GETDATE()),
('Sacramento', 7, GETDATE()),
('Saltillo', 7, GETDATE()),
('San Buenaventura', 7, GETDATE()),
('San Juan de Sabinas', 7, GETDATE()),
('San Pedro', 7, GETDATE()),
('Sierra Mojada', 7, GETDATE()),
('Torreón', 7, GETDATE()),
('Viesca', 7, GETDATE()),
('Villa Unión', 7, GETDATE()),
('Zaragoza', 7, GETDATE()),

-- Colima
('Armería', 8, GETDATE()),
('Colima', 8, GETDATE()),
('Comala', 8, GETDATE()),
('Arteaga', 8, GETDATE()),
('Coquimatlán', 8, GETDATE()),
('Cuauhtémoc', 8, GETDATE()),
('Ixtlahuacán', 8, GETDATE()),
('Manzanillo', 8, GETDATE()),
('Minatitlán', 8, GETDATE()),
('Tecomán', 8, GETDATE()),
('Villa de Álvarez', 8, GETDATE()),

-- Durango
('Canatlán', 9, GETDATE()),
('Canelas', 9, GETDATE()),
('Coneto de Comonfort', 9, GETDATE()),
('Cuencamé', 9, GETDATE()),
('Durango', 9, GETDATE()),
('General Simón Bolívar', 9, GETDATE()),
('Gómez Palacio', 9, GETDATE()),
('Guadalupe Victoria', 9, GETDATE()),
('Guanaceví', 9, GETDATE()),
('Hidalgo', 9, GETDATE()),
('Indé', 9, GETDATE()),
('Lerdo', 9, GETDATE()),
('Mapimí', 9, GETDATE()),
('Mezquital', 9, GETDATE()),
('Nazas', 9, GETDATE()),
('Nombre de Dios', 9, GETDATE()),
('Ocampo', 9, GETDATE()),
('El Oro', 9, GETDATE()),
('Otáez', 9, GETDATE()),
('Pánuco de Coronado', 9, GETDATE()),
('Peñón Blanco', 9, GETDATE()),
('Poanas', 9, GETDATE()),
('Pueblo Nuevo', 9, GETDATE()),
('Rodeo', 9, GETDATE()),
('San Bernardo', 9, GETDATE()),
('San Dimas', 9, GETDATE()),
('San Juan de Guadalupe', 9, GETDATE()),
('San Juan del Río', 9, GETDATE()),
('San Luis del Cordero', 9, GETDATE()),
('San Pedro del Gallo', 9, GETDATE()),
('Santa Clara', 9, GETDATE()),
('Santiago Papasquiaro', 9, GETDATE()),
('Súchil', 9, GETDATE()),
('Tamazula', 9, GETDATE()),
('Tepehuanes', 9, GETDATE()),
('Tlahualilo', 9, GETDATE()),
('Topia', 9, GETDATE()),
('Vicente Guerrero', 9, GETDATE()),
('Nuevo Ideal', 9, GETDATE()),

-- Guanajuato
('Abasolo', 10, GETDATE()),
('Acámbaro', 10, GETDATE()),
('San Miguel de Allende', 10, GETDATE()),
('Apaseo el Alto', 10, GETDATE()),
('Apaseo el Grande', 10, GETDATE()),
('Atarjea', 10, GETDATE()),
('Celaya', 10, GETDATE()),
('Manuel Doblado', 10, GETDATE()),
('Comonfort', 10, GETDATE()),
('Coroneo', 10, GETDATE()),
('Cortazar', 10, GETDATE()),
('Cuerámaro', 10, GETDATE()),
('Doctor Mora', 10, GETDATE()),
('Dolores Hidalgo', 10, GETDATE()),
('Guanajuato', 10, GETDATE()),
('Huanímaro', 10, GETDATE()),
('Irapuato', 10, GETDATE()),
('Jaral del Progreso', 10, GETDATE()),
('Jerécuaro', 10, GETDATE()),
('León', 10, GETDATE()),
('Moroleón', 10, GETDATE()),
('Ocampo', 10, GETDATE()),
('Pénjamo', 10, GETDATE()),
('Pueblo Nuevo', 10, GETDATE()),
('Purísima del Rincón', 10, GETDATE()),
('Romita', 10, GETDATE()),
('Salamanca', 10, GETDATE()),
('Salvatierra', 10, GETDATE()),
('San Diego de la Unión', 10, GETDATE()),
('San Felipe', 10, GETDATE()),
('San Francisco del Rincón', 10, GETDATE()),
('San José Iturbide', 10, GETDATE()),
('San Luis de la Paz', 10, GETDATE()),
('Santa Catarina', 10, GETDATE()),
('Santa Cruz de Juventino Rosas', 10, GETDATE()),
('Santiago Maravatío', 10, GETDATE()),
('Silao de la Victoria', 10, GETDATE()),
('Tarandacuao', 10, GETDATE()),
('Tarimoro', 10, GETDATE()),
('Tierra Blanca', 10, GETDATE()),
('Uriangato', 10, GETDATE()),
('Valle de Santiago', 10, GETDATE()),
('Victoria', 10, GETDATE()),
('Villagrán', 10, GETDATE()),
('Xichú', 10, GETDATE()),
('Yuriria', 10, GETDATE()),

-- Guerrero
('Acapulco de Juárez', 11, GETDATE()),
('Ahuacuotzingo', 11, GETDATE()),
('Ajuchitlán del Progreso', 11, GETDATE()),
('Alcozauca de Guerrero', 11, GETDATE()),
('Alpoyeca', 11, GETDATE()),
('Apaxtla', 11, GETDATE()),
('Arcelia', 11, GETDATE()),
('Atenango del Río', 11, GETDATE()),
('Atlamajalcingo del Monte', 11, GETDATE()),
('Atlixtac', 11, GETDATE()),
('Atoyac de Álvarez', 11, GETDATE()),
('Ayutla de los Libres', 11, GETDATE()),
('Azoyú', 11, GETDATE()),
('Benito Juárez', 11, GETDATE()),
('Buenavista de Cuéllar', 11, GETDATE()),
('Chilapa de Álvarez', 11, GETDATE()),
('Chilpancingo de los Bravo', 11, GETDATE()),
('Coahuayutla de José María Izazaga', 11, GETDATE()),
('Cochoapa el Grande', 11, GETDATE()),
('Cocula', 11, GETDATE()),
('Copala', 11, GETDATE()),
('Copalillo', 11, GETDATE()),
('Copanatoyac', 11, GETDATE()),
('Coyuca de Benítez', 11, GETDATE()),
('Coyuca de Catalán', 11, GETDATE()),
('Cuajinicuilapa', 11, GETDATE()),
('Cualác', 11, GETDATE()),
('Cuautepec', 11, GETDATE()),
('Cuetzala del Progreso', 11, GETDATE()),
('Cutzamala de Pinzón', 11, GETDATE()),
('Eduardo Neri', 11, GETDATE()),
('Florencio Villarreal', 11, GETDATE()),
('General Canuto A. Neri', 11, GETDATE()),
('General Heliodoro Castillo', 11, GETDATE()),
('Huamuxtitlán', 11, GETDATE()),
('Huitzuco de los Figueroa', 11, GETDATE()),
('Iguala de la Independencia', 11, GETDATE()),
('Igualapa', 11, GETDATE()),
('Iliatenco', 11, GETDATE()),
('Ixcateopan de Cuauhtémoc', 11, GETDATE()),
('José Joaquín de Herrera', 11, GETDATE()),
('Juan R. Escudero', 11, GETDATE()),
('Juchitán', 11, GETDATE()),
('La Unión de Isidoro Montes de Oca', 11, GETDATE()),
('Leonardo Bravo', 11, GETDATE()),
('Malinaltepec', 11, GETDATE()),
('Marquelia', 11, GETDATE()),
('Martír de Cuilapan', 11, GETDATE()),
('Metlatónoc', 11, GETDATE()),
('Mochitlán', 11, GETDATE()),
('Ñuu Savi', 11, GETDATE()),
('Olinalá', 11, GETDATE()),
('Ometepec', 11, GETDATE()),
('Pedro Ascencio Alquisiras', 11, GETDATE()),
('Petatlán', 11, GETDATE()),
('Pilcaya', 11, GETDATE()),
('Pungarabato', 11, GETDATE()),
('Quechultenango', 11, GETDATE()),
('Santa Cruz del Rincón', 11, GETDATE()),
('San Nicolás', 11, GETDATE()),
('San Luis Acatlán', 11, GETDATE()),
('San Marcos', 11, GETDATE()),
('San Miguel Totolapan', 11, GETDATE()),
('Taxco de Alarcón', 11, GETDATE()),
('Tecoanapa', 11, GETDATE()),
('Técpan de Galeana', 11, GETDATE()),
('Teloloapan', 11, GETDATE()),
('Tepecoacuilco de Trujano', 11, GETDATE()),
('Tetipac', 11, GETDATE()),
('Tixtla de Guerrero', 11, GETDATE()),
('Tlacoachistlahuaca', 11, GETDATE()),
('Tlacoapa', 11, GETDATE()),
('Tlalchapa', 11, GETDATE()),
('Tlalixtaquilla de Maldonado', 11, GETDATE()),
('Tlapa de Comonfort', 11, GETDATE()),
('Tlapehuala', 11, GETDATE()),
('Xalpatláhuac', 11, GETDATE()),
('Xochihuehuetlán', 11, GETDATE()),
('Xochistlahuaca', 11, GETDATE()),
('Zapotitlán Tablas', 11, GETDATE()),
('Zihuatanejo de Azueta', 11, GETDATE()),
('Zirándaro', 11, GETDATE()),
('Zitlala', 11, GETDATE()),
('Zumpango del Río', 11, GETDATE()),

-- Hidalgo
('Acatlán', 12, GETDATE()),
('Acaxochitlán', 12, GETDATE()),
('Actopan', 12, GETDATE()),
('Agua Blanca de Iturbide', 12, GETDATE()),
('Ajacuba', 12, GETDATE()),
('Alfajayucan', 12, GETDATE()),
('Almoloya', 12, GETDATE()),
('Apan', 12, GETDATE()),
('Atitalaquia', 12, GETDATE()),
('Atlapexco', 12, GETDATE()),
('Atotonilco de Tula', 12, GETDATE()),
('Atotonilco el Grande', 12, GETDATE()),
('Calnali', 12, GETDATE()),
('Cardonal', 12, GETDATE()),
('Chapantongo', 12, GETDATE()),
('Chapulhuacán', 12, GETDATE()),
('Chilcuautla', 12, GETDATE()),
('Cuautepec de Hinojosa', 12, GETDATE()),
('El Arenal', 12, GETDATE()),
('Eloxochitlán', 12, GETDATE()),
('Emiliano Zapata', 12, GETDATE()),
('Epazoyucan', 12, GETDATE()),
('Francisco I. Madero', 12, GETDATE()),
('Huasca de Ocampo', 12, GETDATE()),
('Huautla', 12, GETDATE()),
('Huazalingo', 12, GETDATE()),
('Huehuetla', 12, GETDATE()),
('Huejutla de Reyes', 12, GETDATE()),
('Huichapan', 12, GETDATE()),
('Ixmiquilpan', 12, GETDATE()),
('Jacala de Ledezma', 12, GETDATE()),
('Jaltocán', 12, GETDATE()),
('Juárez Hidalgo', 12, GETDATE()),
('La Misión', 12, GETDATE()),
('Lolotla', 12, GETDATE()),
('Metepec', 12, GETDATE()),
('Metztitlán', 12, GETDATE()),
('Mineral de la Reforma', 12, GETDATE()),
('Mineral del Chico', 12, GETDATE()),
('Mineral del Monte', 12, GETDATE()),
('Mixquiahuala de Juárez', 12, GETDATE()),
('Molango de Escamilla', 12, GETDATE()),
('Nicolás Flores', 12, GETDATE()),
('Nopala de Villagrán', 12, GETDATE()),
('Omitlán de Juárez', 12, GETDATE()),
('San Agustín Metzquititlán', 12, GETDATE()),
('San Agustín Tlaxiaca', 12, GETDATE()),
('San Bartolo Tutotepec', 12, GETDATE()),
('San Felipe Orizatlán', 12, GETDATE()),
('San Salvador', 12, GETDATE()),
('Santiago de Anaya', 12, GETDATE()),
('Santiago Tulantepec de Lugo Guerrero', 12, GETDATE()),
('Singuilucan', 12, GETDATE()),
('Tasquillo', 12, GETDATE()),
('Tecozautla', 12, GETDATE()),
('Tenango de Doria', 12, GETDATE()),
('Tepeapulco', 12, GETDATE()),
('Tepehuacán de Guerrero', 12, GETDATE()),
('Tepeji del Río de Ocampo', 12, GETDATE()),
('Tepetitlán', 12, GETDATE()),
('Tetepango', 12, GETDATE()),
('Tezontepec de Aldama', 12, GETDATE()),
('Tianguistengo', 12, GETDATE()),
('Tizayuca', 12, GETDATE()),
('Tlahuelilpan', 12, GETDATE()),
('Tlahuiltepa', 12, GETDATE()),
('Tlanalapa', 12, GETDATE()),
('Tlanchinol', 12, GETDATE()),
('Tlaxcoapan', 12, GETDATE()),
('Tolcayuca', 12, GETDATE()),
('Tula de Allende', 12, GETDATE()),
('Tulancingo de Bravo', 12, GETDATE()),
('Villa de Tezontepec', 12, GETDATE()),
('Xochiatipan', 12, GETDATE()),
('Xochicoatlán', 12, GETDATE()),
('Yahualica', 12, GETDATE()),
('Zacualtipán de Ángeles', 12, GETDATE()),
('Zapotlán de Juárez', 12, GETDATE()),
('Zempoala', 12, GETDATE()),
('Zimapán', 12, GETDATE()),

-- Jalisco
('Acatic', 13, GETDATE()),
('Acatlán de Juárez', 13, GETDATE()),
('Ahualulco de Mercado', 13, GETDATE()),
('Amacueca', 13, GETDATE()),
('Amatitán', 13, GETDATE()),
('Ameca', 13, GETDATE()),
('San Juanito de Escobedo', 13, GETDATE()),
('Arandas', 13, GETDATE()),
('El Arenal', 13, GETDATE()),
('Atemajac de Brizuela', 13, GETDATE()),
('Atengo', 13, GETDATE()),
('Atenguillo', 13, GETDATE()),
('Atotonilco el Alto', 13, GETDATE()),
('Atoyac', 13, GETDATE()),
('Autlán de Navarro', 13, GETDATE()),
('Ayotlán', 13, GETDATE()),
('Ayutla', 13, GETDATE()),
('La Barca', 13, GETDATE()),
('Bolaños', 13, GETDATE()),
('Cabo Corrientes', 13, GETDATE()),
('Casimiro Castillo', 13, GETDATE()),
('Cihuatlán', 13, GETDATE()),
('Zapotlán el Grande', 13, GETDATE()),
('Cocula', 13, GETDATE()),
('Colotlán', 13, GETDATE()),
('Concepción de Buenos Aires', 13, GETDATE()),
('Cuautitlán de García Barragán', 13, GETDATE()),
('Cuautla', 13, GETDATE()),
('Cuquío', 13, GETDATE()),
('Chapala', 13, GETDATE()),
('Chimaltitán', 13, GETDATE()),
('Chiquilistlán', 13, GETDATE()),
('Degollado', 13, GETDATE()),
('Ejutla', 13, GETDATE()),
('Encarnación de Díaz', 13, GETDATE()),
('Etzatlán', 13, GETDATE()),
('El Grullo', 13, GETDATE()),
('Guachinango', 13, GETDATE()),
('Guadalajara', 13, GETDATE()),
('Hostotipaquillo', 13, GETDATE()),
('Huejúcar', 13, GETDATE()),
('Huejuquilla el Alto', 13, GETDATE()),
('La Huerta', 13, GETDATE()),
('Ixtlahuacán de los Membrillos', 13, GETDATE()),
('Ixtlahuacán del Río', 13, GETDATE()),
('Jalostotitlán', 13, GETDATE()),
('Jamay', 13, GETDATE()),
('Jesús María', 13, GETDATE()),
('Jilotlán de los Dolores', 13, GETDATE()),
('Jocotepec', 13, GETDATE()),
('Juanacatlán', 13, GETDATE()),
('Juchitlán', 13, GETDATE()),
('Lagos de Moreno', 13, GETDATE()),
('El Limón', 13, GETDATE()),
('Magdalena', 13, GETDATE()),
('Santa María del Oro', 13, GETDATE()),
('La Manzanilla de la Paz', 13, GETDATE()),
('Mascota', 13, GETDATE()),
('Mazamitla', 13, GETDATE()),
('Mexticacán', 13, GETDATE()),
('Mezquitic', 13, GETDATE()),
('Mixtlán', 13, GETDATE()),
('Ocotlán', 13, GETDATE()),
('Ojuelos de Jalisco', 13, GETDATE()),
('Pihuamo', 13, GETDATE()),
('Poncitlán', 13, GETDATE()),
('Puerto Vallarta', 13, GETDATE()),
('Villa Purificación', 13, GETDATE()),
('Quitupan', 13, GETDATE()),
('El Salto', 13, GETDATE()),
('San Cristóbal de la Barranca', 13, GETDATE()),
('San Diego de Alejandría', 13, GETDATE()),
('San Juan de los Lagos', 13, GETDATE()),
('San Julián', 13, GETDATE()),
('San Marcos', 13, GETDATE()),
('San Martín de Bolaños', 13, GETDATE()),
('San Martín Hidalgo', 13, GETDATE()),
('San Miguel el Alto', 13, GETDATE()),
('Gómez Farías', 13, GETDATE()),
('San Sebastián del Oeste', 13, GETDATE()),
('Santa María de los Ángeles', 13, GETDATE()),
('Sayula', 13, GETDATE()),
('Tala', 13, GETDATE()),
('Talpa de Allende', 13, GETDATE()),
('Tamazula de Gordiano', 13, GETDATE()),
('Tapalpa', 13, GETDATE()),
('Tecalitlán', 13, GETDATE()),
('Tecolotlán', 13, GETDATE()),
('Techaluta de Montenegro', 13, GETDATE()),
('Tenamaxtlán', 13, GETDATE()),
('Teocaltiche', 13, GETDATE()),
('Teocuitatlán de Corona', 13, GETDATE()),
('Tepatitlán de Morelos', 13, GETDATE()),
('Tequila', 13, GETDATE()),
('Teuchitlán', 13, GETDATE()),
('Tizapán el Alto', 13, GETDATE()),
('Tlajomulco de Zúñiga', 13, GETDATE()),
('Tlaquepaque', 13, GETDATE()),
('Tolimán', 13, GETDATE()),
('Tomatlán', 13, GETDATE()),
('Tonalá', 13, GETDATE()),
('Tonaya', 13, GETDATE()),
('Tonila', 13, GETDATE()),
('Totatiche', 13, GETDATE()),
('Tototlán', 13, GETDATE()),
('Tuxcacuesco', 13, GETDATE()),
('Tuxcueca', 13, GETDATE()),
('Tuxpan', 13, GETDATE()),
('Unión de San Antonio', 13, GETDATE()),
('Unión de Tula', 13, GETDATE()),
('Valle de Guadalupe', 13, GETDATE()),
('Valle de Juárez', 13, GETDATE()),
('San Gabriel', 13, GETDATE()),
('Villa Corona', 13, GETDATE()),
('Villa Guerrero', 13, GETDATE()),
('Villa Hidalgo', 13, GETDATE()),
('Cañadas de Obregón', 13, GETDATE()),
('Yahualica de González Gallo', 13, GETDATE()),
('Zacoalco de Torres', 13, GETDATE()),
('Zapopan', 13, GETDATE()),
('Zapotiltic', 13, GETDATE()),
('Zapotitlán de Vadillo', 13, GETDATE()),
('Zapotlanejo', 13, GETDATE()),
('San Ignacio Cerro Gordo', 13, GETDATE());



/******
Insertar datos a la tabla municipios parte 2
Script Date: 01/10/2024 11:50:14 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Municipios (nombreMunicipio, estadoID, ultimaModificacionMunicipio) VALUES

-- México
('Acambay de Ruíz Castañeda', 14, GETDATE()),
('Acolman', 14, GETDATE()),
('Aculco', 14, GETDATE()),
('Almoloya de Alquisiras', 14, GETDATE()),
('Almoloya de Juárez', 14, GETDATE()),
('Almoloya del Río', 14, GETDATE()),
('Amanalco', 14, GETDATE()),
('Amatepec', 14, GETDATE()),
('Amecameca', 14, GETDATE()),
('Apaxco', 14, GETDATE()),
('Atenco', 14, GETDATE()),
('Atizapán', 14, GETDATE()),
('Atizapán de Zaragoza', 14, GETDATE()),
('Atlacomulco', 14, GETDATE()),
('Atlautla', 14, GETDATE()),
('Axapusco', 14, GETDATE()),
('Ayapango', 14, GETDATE()),
('Calimaya', 14, GETDATE()),
('Capulhuac', 14, GETDATE()),
('Coacalco de Berriozábal', 14, GETDATE()),
('Coatepec Harinas', 14, GETDATE()),
('Cocotitlán', 14, GETDATE()),
('Coyotepec', 14, GETDATE()),
('Cuautitlán', 14, GETDATE()),
('Cuautitlán Izcalli', 14, GETDATE()),
('Chalco', 14, GETDATE()),
('Chapa de Mota', 14, GETDATE()),
('Chapultepec', 14, GETDATE()),
('Chiautla', 14, GETDATE()),
('Chicoloapan', 14, GETDATE()),
('Chiconcuac', 14, GETDATE()),
('Chimalhuacán', 14, GETDATE()),
('Donato Guerra', 14, GETDATE()),
('Ecatepec de Morelos', 14, GETDATE()),
('Ecatzingo', 14, GETDATE()),
('Huehuetoca', 14, GETDATE()),
('Hueypoxtla', 14, GETDATE()),
('Huixquilucan', 14, GETDATE()),
('Isidro Fabela', 14, GETDATE()),
('Ixtapaluca', 14, GETDATE()),
('Ixtapan de la Sal', 14, GETDATE()),
('Ixtapan del Oro', 14, GETDATE()),
('Ixtlahuaca', 14, GETDATE()),
('Jaltenco', 14, GETDATE()),
('Jilotepec', 14, GETDATE()),
('Jilotzingo', 14, GETDATE()),
('Jiquipilco', 14, GETDATE()),
('Jocotitlán', 14, GETDATE()),
('Joquicingo', 14, GETDATE()),
('Juchitepec', 14, GETDATE()),
('Lerma', 14, GETDATE()),
('Malinalco', 14, GETDATE()),
('Melchor Ocampo', 14, GETDATE()),
('Metepec', 14, GETDATE()),
('Mexicaltzingo', 14, GETDATE()),
('Morelos', 14, GETDATE()),
('Naucalpan de Juárez', 14, GETDATE()),
('Nezahualcóyotl', 14, GETDATE()),
('Nextlalpan', 14, GETDATE()),
('Nicolás Romero', 14, GETDATE()),
('Nopaltepec', 14, GETDATE()),
('Ocoyoacac', 14, GETDATE()),
('Ocuilan', 14, GETDATE()),
('El Oro', 14, GETDATE()),
('Otumba', 14, GETDATE()),
('Otzoloapan', 14, GETDATE()),
('Otzolotepec', 14, GETDATE()),
('Ozumba', 14, GETDATE()),
('Papalotla', 14, GETDATE()),
('La Paz', 14, GETDATE()),
('Polotitlán', 14, GETDATE()),
('Rayón', 14, GETDATE()),
('San Antonio la Isla', 14, GETDATE()),
('San Felipe del Progreso', 14, GETDATE()),
('San Martín de las Pirámides', 14, GETDATE()),
('San Mateo Atenco', 14, GETDATE()),
('San Simón de Guerrero', 14, GETDATE()),
('Santo Tomás', 14, GETDATE()),
('Soyaniquilpan de Juárez', 14, GETDATE()),
('Sultepec', 14, GETDATE()),
('Tecámac', 14, GETDATE()),
('Tejupilco', 14, GETDATE()),
('Temamatla', 14, GETDATE()),
('Temascalapa', 14, GETDATE()),
('Temascalcingo', 14, GETDATE()),
('Temascaltepec', 14, GETDATE()),
('Temoaya', 14, GETDATE()),
('Tenancingo', 14, GETDATE()),
('Tenango del Aire', 14, GETDATE()),
('Tenango del Valle', 14, GETDATE()),
('Teoloyucan', 14, GETDATE()),
('Teotihuacán', 14, GETDATE()),
('Tepetlaoxtoc', 14, GETDATE()),
('Tepetlixpa', 14, GETDATE()),
('Tepotzotlán', 14, GETDATE()),
('Tequixquiac', 14, GETDATE()),
('Texcaltitlán', 14, GETDATE()),
('Texcalyacac', 14, GETDATE()),
('Texcoco', 14, GETDATE()),
('Tezoyuca', 14, GETDATE()),
('Tianguistenco', 14, GETDATE()),
('Timilpan', 14, GETDATE()),
('Tlalmanalco', 14, GETDATE()),
('Tlalnepantla de Baz', 14, GETDATE()),
('Tlatlaya', 14, GETDATE()),
('Toluca', 14, GETDATE()),
('Tonatico', 14, GETDATE()),
('Tultepec', 14, GETDATE()),
('Tultitlán', 14, GETDATE()),
('Valle de Bravo', 14, GETDATE()),
('Villa de Allende', 14, GETDATE()),
('Villa del Carbón', 14, GETDATE()),
('Villa Guerrero', 14, GETDATE()),
('Villa Victoria', 14, GETDATE()),
('Xalatlaco', 14, GETDATE()),
('Xonacatlán', 14, GETDATE()),
('Zacazonapan', 14, GETDATE()),
('Zacualpan', 14, GETDATE()),
('Zinacantepec', 14, GETDATE()),
('Zumpahuacán', 14, GETDATE()),
('Zumpango', 14, GETDATE()),

-- Michoacán
('Acuitzio', 15, GETDATE()),
('Aguililla', 15, GETDATE()),
('Álvaro Obregón', 15, GETDATE()),
('Angamacutiro', 15, GETDATE()),
('Angangueo', 15, GETDATE()),
('Apatzingán', 15, GETDATE()),
('Aporo', 15, GETDATE()),
('Aquila', 15, GETDATE()),
('Ario', 15, GETDATE()),
('Arteaga', 15, GETDATE()),
('Briseñas', 15, GETDATE()),
('Buenavista', 15, GETDATE()),
('Carácuaro', 15, GETDATE()),
('Charapan', 15, GETDATE()),
('Charo', 15, GETDATE()),
('Chavinda', 15, GETDATE()),
('Cherán', 15, GETDATE()),
('Chilchota', 15, GETDATE()),
('Chinicuila', 15, GETDATE()),
('Chucándiro', 15, GETDATE()),
('Churintzio', 15, GETDATE()),
('Churumuco', 15, GETDATE()),
('Coahuayana', 15, GETDATE()),
('Coalcomán de Vázquez Pallares', 15, GETDATE()),
('Coeneo', 15, GETDATE()),
('Contepec', 15, GETDATE()),
('Copándaro', 15, GETDATE()),
('Cotija', 15, GETDATE()),
('Cuitzeo', 15, GETDATE()),
('Ecuandureo', 15, GETDATE()),
('Epitacio Huerta', 15, GETDATE()),
('Erongarícuaro', 15, GETDATE()),
('Gabriel Zamora', 15, GETDATE()),
('Hidalgo', 15, GETDATE()),
('Huandacareo', 15, GETDATE()),
('Huaniqueo', 15, GETDATE()),
('Huetamo', 15, GETDATE()),
('Huiramba', 15, GETDATE()),
('Indaparapeo', 15, GETDATE()),
('Irimbo', 15, GETDATE()),
('Ixtlán', 15, GETDATE()),
('Jacona', 15, GETDATE()),
('Jiménez', 15, GETDATE()),
('Jiquilpan', 15, GETDATE()),
('José Sixto Verduzco', 15, GETDATE()),
('Jungapeo', 15, GETDATE()),
('Juárez', 15, GETDATE()),
('La Huacana', 15, GETDATE()),
('La Piedad', 15, GETDATE()),
('Lázaro Cárdenas', 15, GETDATE()),
('Los Reyes', 15, GETDATE()),
('Madero', 15, GETDATE()),
('Maravatío', 15, GETDATE()),
('Marcos Castellanos', 15, GETDATE()),
('Morelia', 15, GETDATE()),
('Morelos', 15, GETDATE()),
('Múgica', 15, GETDATE()),
('Nahuatzen', 15, GETDATE()),
('Nocupétaro', 15, GETDATE()),
('Nuevo Parangaricutiro', 15, GETDATE()),
('Nuevo Urecho', 15, GETDATE()),
('Numarán', 15, GETDATE()),
('Ocampo', 15, GETDATE()),
('Pajacuarán', 15, GETDATE()),
('Panindícuaro', 15, GETDATE()),
('Paracho', 15, GETDATE()),
('Parácuaro', 15, GETDATE()),
('Pátzcuaro', 15, GETDATE()),
('Penjamillo', 15, GETDATE()),
('Peribán', 15, GETDATE()),
('Purépero', 15, GETDATE()),
('Puruándiro', 15, GETDATE()),
('Queréndaro', 15, GETDATE()),
('Quiroga', 15, GETDATE()),
('Sahuayo', 15, GETDATE()),
('Salvador Escalante', 15, GETDATE()),
('San Lucas', 15, GETDATE()),
('Santa Ana Maya', 15, GETDATE()),
('Senguio', 15, GETDATE()),
('Susupuato', 15, GETDATE()),
('Tacámbaro', 15, GETDATE()),
('Tancítaro', 15, GETDATE()),
('Tangamandapio', 15, GETDATE()),
('Tangancícuaro', 15, GETDATE()),
('Tanhuato', 15, GETDATE()),
('Taretan', 15, GETDATE()),
('Tarímbaro', 15, GETDATE()),
('Tepalcatepec', 15, GETDATE()),
('Tingambato', 15, GETDATE()),
('Tingüindín', 15, GETDATE()),
('Tiquicheo de Nicolás Romero', 15, GETDATE()),
('Tlalpujahua', 15, GETDATE()),
('Tlazazalca', 15, GETDATE()),
('Tocumbo', 15, GETDATE()),
('Tumbiscatío', 15, GETDATE()),
('Turicato', 15, GETDATE()),
('Tuxpan', 15, GETDATE()),
('Tuzantla', 15, GETDATE()),
('Tzintzuntzan', 15, GETDATE()),
('Tzitzio', 15, GETDATE()),
('Uruapan', 15, GETDATE()),
('Venustiano Carranza', 15, GETDATE()),
('Villamar', 15, GETDATE()),
('Vista Hermosa', 15, GETDATE()),
('Yurécuaro', 15, GETDATE()),
('Zacapu', 15, GETDATE()),
('Zamora', 15, GETDATE()),
('Zináparo', 15, GETDATE()),
('Zinapécuaro', 15, GETDATE()),
('Ziracuaretiro', 15, GETDATE()),
('Zitácuaro', 15, GETDATE()),
('Álvaro Obregón', 15, GETDATE()),

-- Morelos
('Amacuzac', 16, GETDATE()),
('Atlatlahucan', 16, GETDATE()),
('Axochiapan', 16, GETDATE()),
('Ayala', 16, GETDATE()),
('Coatlán del Río', 16, GETDATE()),
('Cuautla', 16, GETDATE()),
('Cuernavaca', 16, GETDATE()),
('Emiliano Zapata', 16, GETDATE()),
('Huitzilac', 16, GETDATE()),
('Jantetelco', 16, GETDATE()),
('Jiutepec', 16, GETDATE()),
('Jojutla', 16, GETDATE()),
('Jonacatepec de Leandro Valle', 16, GETDATE()),
('Mazatepec', 16, GETDATE()),
('Miacatlán', 16, GETDATE()),
('Ocuituco', 16, GETDATE()),
('Puente de Ixtla', 16, GETDATE()),
('Temixco', 16, GETDATE()),
('Temoac', 16, GETDATE()),
('Tepalcingo', 16, GETDATE()),
('Tepoztlán', 16, GETDATE()),
('Tetecala', 16, GETDATE()),
('Tetela del Volcán', 16, GETDATE()),
('Tlalnepantla', 16, GETDATE()),
('Tlaltizapán de Zapata', 16, GETDATE()),
('Tlaquiltenango', 16, GETDATE()),
('Tlayacapan', 16, GETDATE()),
('Totolapan', 16, GETDATE()),
('Xochitepec', 16, GETDATE()),
('Yautepec', 16, GETDATE()),
('Yecapixtla', 16, GETDATE()),
('Zacatepec', 16, GETDATE()),
('Zacualpan de Amilpas', 16, GETDATE()),
('Coatetelco', 16, GETDATE()),
('Xoxocotla', 16, GETDATE()),
('Hueyapan', 16, GETDATE()),

-- Nayarit
('Acaponeta', 17, GETDATE()),
('Ahuacatlán', 17, GETDATE()),
('Amatlán de Cañas', 17, GETDATE()),
('Compostela', 17, GETDATE()),
('Huajicori', 17, GETDATE()),
('Ixtlán del Río', 17, GETDATE()),
('Jala', 17, GETDATE()),
('La Yesca', 17, GETDATE()),
('Rosamorada', 17, GETDATE()),
('Ruíz', 17, GETDATE()),
('San Blas', 17, GETDATE()),
('San Pedro Lagunillas', 17, GETDATE()),
('Santa María del Oro', 17, GETDATE()),
('Santiago Ixcuintla', 17, GETDATE()),
('Tecuala', 17, GETDATE()),
('Tepic', 17, GETDATE()),
('Tuxpan', 17, GETDATE()),
('Xalisco', 17, GETDATE()),
('Del Nayar', 17, GETDATE()),
('Bahía de Banderas', 17, GETDATE()),

-- Nuevo León
('Agua Dulce', 18, GETDATE()),
('Allende', 18, GETDATE()),
('Anáhuac', 18, GETDATE()),
('Apodaca', 18, GETDATE()),
('Aramberri', 18, GETDATE()),
('Bernardo Reyes', 18, GETDATE()),
('Cadereyta Jiménez', 18, GETDATE()),
('El Carmen', 18, GETDATE()),
('García', 18, GETDATE()),
('General Bravo', 18, GETDATE()),
('General Escobedo', 18, GETDATE()),
('General Terán', 18, GETDATE()),
('Hidalgo', 18, GETDATE()),
('Linares', 18, GETDATE()),
('Marín', 18, GETDATE()),
('Monterrey', 18, GETDATE()),
('Montemorelos', 18, GETDATE()),
('Nuevo León', 18, GETDATE()),
('Pesquería', 18, GETDATE()),
('Sabinas Hidalgo', 18, GETDATE()),
('Salinas Victoria', 18, GETDATE()),
('San Nicolás de los Garza', 18, GETDATE()),
('San Pedro Garza García', 18, GETDATE()),
('Santa Catarina', 18, GETDATE()),
('Santiago', 18, GETDATE()),
('San Juan de los Durán', 18, GETDATE()),
('Villa de Santiago', 18, GETDATE()),
('Santa Rosa', 18, GETDATE()),
('Los Aldamas', 18, GETDATE()),
('Los Ramones', 18, GETDATE()),
('Hualahuises', 18, GETDATE()),
('Cerralvo', 18, GETDATE()),
('Cadereyta', 18, GETDATE()),
('Montemorelos', 18, GETDATE()),
('Lampazos de Naranjo', 18, GETDATE()),
('Vallecillo', 18, GETDATE()),
('Doctor González', 18, GETDATE()),
('Cienega de Flores', 18, GETDATE()),
('Salinas Victoria', 18, GETDATE()),
('Zuazua', 18, GETDATE()),
('Ildefonso', 18, GETDATE()),
('Mier y Noriega', 18, GETDATE()),
('El Salto', 18, GETDATE()),
('San Mateo', 18, GETDATE()),
('General Zuazua', 18, GETDATE()),
('San Felipe', 18, GETDATE()),
('Los Cerritos', 18, GETDATE()),
('Los Ramones', 18, GETDATE()),
('Anáhuac', 18, GETDATE()),
('Hidalgo', 18, GETDATE()),
('Salinas Victoria', 18, GETDATE()),
('General Escobedo', 18, GETDATE()),
('Monterrey', 18, GETDATE()),

-- Oaxaca
('Abejones', 19, GETDATE()),
('Acatlán de Pérez Figueroa', 19, GETDATE()),
('Asunción Cacalotepec', 19, GETDATE()),
('Asunción Cuyotepeji', 19, GETDATE()),
('Asunción Ixtaltepec', 19, GETDATE()),
('Asunción Nochixtlán', 19, GETDATE()),
('Asunción Ocotlán', 19, GETDATE()),
('Asunción Tlacolulita', 19, GETDATE()),
('Ayotzintepec', 19, GETDATE()),
('El Barrio de la Soledad', 19, GETDATE()),
('Calihualá', 19, GETDATE()),
('Candelaria Loxicha', 19, GETDATE()),
('Ciénega de Zimatlán', 19, GETDATE()),
('Ciudad Ixtepec', 19, GETDATE()),
('Coatecas Altas', 19, GETDATE()),
('Coicoyán de las Flores', 19, GETDATE()),
('La Compañía', 19, GETDATE()),
('Concepción Buenavista', 19, GETDATE()),
('Concepción Pápalo', 19, GETDATE()),
('Constancia del Rosario', 19, GETDATE()),
('Cosolapa', 19, GETDATE()),
('Cosoltepec', 19, GETDATE()),
('Cuilápam de Guerrero', 19, GETDATE()),
('Cuyamecalco Villa de Zaragoza', 19, GETDATE()),
('Chahuites', 19, GETDATE()),
('Chalcatongo de Hidalgo', 19, GETDATE()),
('Chiquihuitlán de Benito Juárez', 19, GETDATE()),
('Heroica Ciudad de Ejutla de Crespo', 19, GETDATE()),
('Eloxochitlán de Flores Magón', 19, GETDATE()),
('El Espinal', 19, GETDATE()),
('Tamazulápam del Espíritu Santo', 19, GETDATE()),
('Fresnillo de Trujano', 19, GETDATE()),
('Guadalupe Etla', 19, GETDATE()),
('Guadalupe de Ramírez', 19, GETDATE()),
('Guelatao de Juárez', 19, GETDATE()),
('Guevea de Humboldt', 19, GETDATE()),
('Mesones Hidalgo', 19, GETDATE()),
('Villa Hidalgo', 19, GETDATE()),
('Heroica Ciudad de Huajuapan de León', 19, GETDATE()),
('Huautepec', 19, GETDATE()),
('Huautla de Jiménez', 19, GETDATE()),
('Ixtlán de Juárez', 19, GETDATE()),
('Juchitán de Zaragoza', 19, GETDATE()),
('Loma Bonita', 19, GETDATE()),
('Magdalena Apasco', 19, GETDATE()),
('Magdalena Jaltepec', 19, GETDATE()),
('Santa Magdalena Jicotlán', 19, GETDATE()),
('Magdalena Ocotlán', 19, GETDATE()),
('Magdalena Peñasco', 19, GETDATE()),
('Magdalena Teitipac', 19, GETDATE()),
('Magdalena Tequisistlán', 19, GETDATE()),
('Magdalena Tlacotepec', 19, GETDATE()),
('Magdalena Zahuatlán', 19, GETDATE()),
('Mariscala de Juárez', 19, GETDATE()),
('Mártires de Tacubaya', 19, GETDATE()),
('Matías Romero Avendaño', 19, GETDATE()),
('Mazatlán Villa de Flores', 19, GETDATE()),
('Miahuatlán de Porfirio Díaz', 19, GETDATE()),
('Mixistlán de la Reforma', 19, GETDATE()),
('Monjas', 19, GETDATE()),
('Natividad', 19, GETDATE()),
('Nazareno Etla', 19, GETDATE()),
('Nejapa de Madero', 19, GETDATE()),
('Ixpantepec Nieves', 19, GETDATE()),
('Santiago Niltepec', 19, GETDATE()),
('Oaxaca de Juárez', 19, GETDATE()),
('Ocotlán de Morelos', 19, GETDATE()),
('La Pe', 19, GETDATE()),
('Pinotepa de Don Luis', 19, GETDATE()),
('Pluma Hidalgo', 19, GETDATE()),
('San José del Progreso', 19, GETDATE()),
('Putla Villa de Guerrero', 19, GETDATE()),
('Santa Catarina Quioquitani', 19, GETDATE()),
('Reforma de Pineda', 19, GETDATE()),
('La Reforma', 19, GETDATE()),
('Reyes Etla', 19, GETDATE()),
('Rojas de Cuauhtémoc', 19, GETDATE()),
('Salina Cruz', 19, GETDATE()),
('San Agustín Amatengo', 19, GETDATE()),
('San Agustín Atenango', 19, GETDATE()),
('San Agustín Chayuco', 19, GETDATE()),
('San Agustín de las Juntas', 19, GETDATE()),
('San Agustín Etla', 19, GETDATE()),
('San Agustín Loxicha', 19, GETDATE()),
('San Agustín Tlacotepec', 19, GETDATE()),
('San Agustín Yatareni', 19, GETDATE()),
('San Andrés Cabecera Nueva', 19, GETDATE()),
('San Andrés Dinicuiti', 19, GETDATE()),
('San Andrés Huaxpaltepec', 19, GETDATE()),
('San Andrés Huayápam', 19, GETDATE()),
('San Andrés Ixtlahuaca', 19, GETDATE()),
('San Andrés Lagunas', 19, GETDATE()),
('San Andrés Nuxiño', 19, GETDATE()),
('San Andrés Paxtlán', 19, GETDATE()),
('San Andrés Sinaxtla', 19, GETDATE()),
('San Andrés Solaga', 19, GETDATE()),
('San Andrés Teotilálpam', 19, GETDATE()),
('San Andrés Tepetlapa', 19, GETDATE()),
('San Andrés Yaá', 19, GETDATE()),
('San Andrés Zabache', 19, GETDATE()),
('San Andrés Zautla', 19, GETDATE()),
('San Antonino Castillo Velasco', 19, GETDATE()),
('San Antonino el Alto', 19, GETDATE()),
('San Antonino Monte Verde', 19, GETDATE()),
('San Antonio Acutla', 19, GETDATE()),
('San Antonio de la Cal', 19, GETDATE()),
('San Antonio Huitepec', 19, GETDATE()),
('San Antonio Nanahuatípam', 19, GETDATE()),
('San Antonio Sinicahua', 19, GETDATE()),
('San Antonio Tepetlapa', 19, GETDATE()),
('San Baltazar Chichicápam', 19, GETDATE()),
('San Baltazar Loxicha', 19, GETDATE()),
('San Baltazar Yatzachi el Bajo', 19, GETDATE()),
('San Bartolo Coyotepec', 19, GETDATE()),
('San Bartolomé Ayautla', 19, GETDATE()),
('San Bartolomé Loxicha', 19, GETDATE()),
('San Bartolomé Quialana', 19, GETDATE()),
('San Bartolomé Yucuañe', 19, GETDATE()),
('San Bartolomé Zoogocho', 19, GETDATE()),
('San Bartolo Soyaltepec', 19, GETDATE()),
('San Bartolo Yautepec', 19, GETDATE()),
('San Bernardo Mixtepec', 19, GETDATE()),
('San Blas Atempa', 19, GETDATE()),
('San Carlos Yautepec', 19, GETDATE()),
('San Cristóbal Amatlán', 19, GETDATE()),
('San Cristóbal Amoltepec', 19, GETDATE()),
('San Cristóbal Lachirioag', 19, GETDATE()),
('San Cristóbal Suchixtlahuaca', 19, GETDATE()),
('San Dionisio del Mar', 19, GETDATE()),
('San Dionisio Ocotepec', 19, GETDATE()),
('San Dionisio Ocotlán', 19, GETDATE()),
('San Esteban Atatlahuca', 19, GETDATE()),
('San Felipe Jalapa de Díaz', 19, GETDATE()),
('San Felipe Tejalápam', 19, GETDATE()),
('San Felipe Usila', 19, GETDATE()),
('San Francisco Cahuacuá', 19, GETDATE()),
('San Francisco Cajonos', 19, GETDATE()),
('San Francisco Chapulapa', 19, GETDATE()),
('San Francisco Chindúa', 19, GETDATE()),
('San Francisco del Mar', 19, GETDATE()),
('San Francisco Huehuetlán', 19, GETDATE()),
('San Francisco Ixhuatán', 19, GETDATE()),
('San Francisco Jaltepetongo', 19, GETDATE()),
('San Francisco Lachigoló', 19, GETDATE()),
('San Francisco Logueche', 19, GETDATE()),
('San Francisco Nuxaño', 19, GETDATE()),
('San Francisco Ozolotepec', 19, GETDATE()),
('San Francisco Sola', 19, GETDATE()),
('San Francisco Telixtlahuaca', 19, GETDATE()),
('San Francisco Teopan', 19, GETDATE()),
('San Francisco Tlapancingo', 19, GETDATE()),
('San Gabriel Mixtepec', 19, GETDATE()),
('San Ildefonso Amatlán', 19, GETDATE()),
('San Ildefonso Sola', 19, GETDATE()),
('San Ildefonso Villa Alta', 19, GETDATE()),
('San Jacinto Amilpas', 19, GETDATE()),
('San Jacinto Tlacotepec', 19, GETDATE()),
('San Jerónimo Coatlán', 19, GETDATE()),
('San Jerónimo Silacayoapilla', 19, GETDATE()),
('San Jerónimo Sosola', 19, GETDATE()),
('San Jerónimo Taviche', 19, GETDATE()),
('San Jerónimo Tecóatl', 19, GETDATE()),
('San Jorge Nuchita', 19, GETDATE()),
('San José Ayuquila', 19, GETDATE()),
('San José Chiltepec', 19, GETDATE()),
('San José del Peñasco', 19, GETDATE()),
('San José Estancia Grande', 19, GETDATE()),
('San José Independencia', 19, GETDATE()),
('San José Lachiguiri', 19, GETDATE()),
('San José Tenango', 19, GETDATE()),
('San Juan Achiutla', 19, GETDATE()),
('San Juan Atepec', 19, GETDATE()),
('Ánimas Trujano', 19, GETDATE()),
('San Juan Bautista Atatlahuca', 19, GETDATE()),
('San Juan Bautista Coixtlahuaca', 19, GETDATE()),
('San Juan Bautista Cuicatlán', 19, GETDATE()),
('San Juan Bautista Guelache', 19, GETDATE()),
('San Juan Bautista Jayacatlán', 19, GETDATE()),
('San Juan Bautista Lo de Soto', 19, GETDATE()),
('San Juan Bautista Suchitepec', 19, GETDATE()),
('San Juan Bautista Tlacoatzintepec', 19, GETDATE()),
('San Juan Bautista Tlachichilco', 19, GETDATE()),
('San Juan Bautista Tuxtepec', 19, GETDATE()),
('San Juan Cacahuatepec', 19, GETDATE()),
('San Juan Cieneguilla', 19, GETDATE()),
('San Juan Coatzóspam', 19, GETDATE()),
('San Juan Colorado', 19, GETDATE()),
('San Juan Comaltepec', 19, GETDATE()),
('San Juan Cotzocón', 19, GETDATE()),
('San Juan Chicomezúchil', 19, GETDATE()),
('San Juan Chilateca', 19, GETDATE()),
('San Juan del Estado', 19, GETDATE()),
('San Juan del Río', 19, GETDATE()),
('San Juan Diuxi', 19, GETDATE()),
('San Juan Evangelista Analco', 19, GETDATE()),
('San Juan Guelavía', 19, GETDATE()),
('San Juan Guichicovi', 19, GETDATE()),
('San Juan Ihualtepec', 19, GETDATE()),
('San Juan Juquila Mixes', 19, GETDATE()),
('San Juan Juquila Vijanos', 19, GETDATE()),
('San Juan Lachao', 19, GETDATE()),
('San Juan Lachigalla', 19, GETDATE()),
('San Juan Lajarcia', 19, GETDATE()),
('San Juan Lalana', 19, GETDATE()),
('San Juan de los Cués', 19, GETDATE()),
('San Juan Mazatlán', 19, GETDATE()),
('San Juan Mixtepec', 19, GETDATE()),
('San Juan Mixtepec', 19, GETDATE()),
('San Juan Ñumí', 19, GETDATE()),
('San Juan Ozolotepec', 19, GETDATE()),
('San Juan Petlapa', 19, GETDATE()),
('San Juan Quiahije', 19, GETDATE()),
('San Juan Quiotepec', 19, GETDATE()),
('San Juan Sayultepec', 19, GETDATE()),
('San Juan Tabaá', 19, GETDATE()),
('San Juan Tamazola', 19, GETDATE()),
('San Juan Teita', 19, GETDATE()),
('San Juan Teitipac', 19, GETDATE()),
('San Juan Tepeuxila', 19, GETDATE()),
('San Juan Teposcolula', 19, GETDATE()),
('San Juan Yaeé', 19, GETDATE()),
('San Juan Yatzona', 19, GETDATE()),
('San Juan Yucuita', 19, GETDATE()),
('San Lorenzo', 19, GETDATE()),
('San Lorenzo Albarradas', 19, GETDATE()),
('San Lorenzo Cacaotepec', 19, GETDATE()),
('San Lorenzo Cuaunecuiltitla', 19, GETDATE()),
('San Lorenzo Texmelúcan', 19, GETDATE()),
('San Lorenzo Victoria', 19, GETDATE()),
('San Lucas Camotlán', 19, GETDATE()),
('San Lucas Ojitlán', 19, GETDATE()),
('San Lucas Quiaviní', 19, GETDATE()),
('San Lucas Zoquiápam', 19, GETDATE()),
('San Luis Amatlán', 19, GETDATE()),
('San Marcial Ozolotepec', 19, GETDATE()),
('San Marcos Arteaga', 19, GETDATE()),
('San Martín de los Cansecos', 19, GETDATE()),
('San Martín Huamelúlpam', 19, GETDATE()),
('San Martín Itunyoso', 19, GETDATE()),
('San Martín Lachilá', 19, GETDATE()),
('San Martín Peras', 19, GETDATE()),
('San Martín Tilcajete', 19, GETDATE()),
('San Martín Toxpalan', 19, GETDATE()),
('San Martín Zacatepec', 19, GETDATE()),
('San Mateo Cajonos', 19, GETDATE()),
('Capulálpam de Méndez', 19, GETDATE()),
('San Mateo del Mar', 19, GETDATE()),
('San Mateo Yoloxochitlán', 19, GETDATE()),
('San Mateo Etlatongo', 19, GETDATE()),
('San Mateo Nejápam', 19, GETDATE()),
('San Mateo Peñasco', 19, GETDATE()),
('San Mateo Piñas', 19, GETDATE()),
('San Mateo Río Hondo', 19, GETDATE()),
('San Mateo Sindihui', 19, GETDATE()),
('San Mateo Tlapiltepec', 19, GETDATE()),
('San Melchor Betaza', 19, GETDATE()),
('San Miguel Achiutla', 19, GETDATE()),
('San Miguel Ahuehuetitlán', 19, GETDATE()),
('San Miguel Aloápam', 19, GETDATE()),
('San Miguel Amatitlán', 19, GETDATE()),
('San Miguel Amatlán', 19, GETDATE()),
('San Miguel Coatlán', 19, GETDATE()),
('San Miguel Chicahua', 19, GETDATE()),
('San Miguel Chimalapa', 19, GETDATE()),
('San Miguel del Puerto', 19, GETDATE()),
('San Miguel del Río', 19, GETDATE()),
('San Miguel Ejutla', 19, GETDATE()),
('San Miguel el Grande', 19, GETDATE()),
('San Miguel Huautla', 19, GETDATE()),
('San Miguel Mixtepec', 19, GETDATE()),
('San Miguel Panixtlahuaca', 19, GETDATE()),
('San Miguel Peras', 19, GETDATE()),
('San Miguel Piedras', 19, GETDATE()),
('San Miguel Quetzaltepec', 19, GETDATE()),
('San Miguel Santa Flor', 19, GETDATE()),
('Villa Sola de Vega', 19, GETDATE()),
('San Miguel Soyaltepec', 19, GETDATE()),
('San Miguel Suchixtepec', 19, GETDATE()),
('Villa Talea de Castro', 19, GETDATE()),
('San Miguel Tecomatlán', 19, GETDATE()),
('San Miguel Tenango', 19, GETDATE()),
('San Miguel Tequixtepec', 19, GETDATE()),
('San Miguel Tilquiápam', 19, GETDATE()),
('San Miguel Tlacamama', 19, GETDATE()),
('San Miguel Tlacotepec', 19, GETDATE()),
('San Miguel Tulancingo', 19, GETDATE()),
('San Miguel Yotao', 19, GETDATE()),
('San Nicolás', 19, GETDATE()),
('San Nicolás Hidalgo', 19, GETDATE()),
('San Pablo Coatlán', 19, GETDATE()),
('San Pablo Cuatro Venados', 19, GETDATE()),
('San Pablo Etla', 19, GETDATE()),
('San Pablo Huitzo', 19, GETDATE()),
('San Pablo Huixtepec', 19, GETDATE()),
('San Pablo Macuiltianguis', 19, GETDATE()),
('San Pablo Tijaltepec', 19, GETDATE()),
('San Pablo Villa de Mitla', 19, GETDATE()),
('San Pablo Yaganiza', 19, GETDATE()),
('San Pedro Amuzgos', 19, GETDATE()),
('San Pedro Apóstol', 19, GETDATE()),
('San Pedro Atoyac', 19, GETDATE()),
('San Pedro Cajonos', 19, GETDATE()),
('San Pedro Coxcaltepec Cántaros', 19, GETDATE()),
('San Pedro Comitancillo', 19, GETDATE()),
('San Pedro el Alto', 19, GETDATE()),
('San Pedro Huamelula', 19, GETDATE()),
('San Pedro Huilotepec', 19, GETDATE()),
('San Pedro Ixcatlán', 19, GETDATE()),
('San Pedro Ixtlahuaca', 19, GETDATE()),
('San Pedro Jaltepetongo', 19, GETDATE()),
('San Pedro Jicayán', 19, GETDATE()),
('San Pedro Jocotipac', 19, GETDATE()),
('San Pedro Juchatengo', 19, GETDATE()),
('San Pedro Mártir', 19, GETDATE()),
('San Pedro Mártir Quiechapa', 19, GETDATE()),
('San Pedro Mártir Yucuxaco', 19, GETDATE()),
('San Pedro Mixtepec', 19, GETDATE()),
('San Pedro Mixtepec', 19, GETDATE()),
('San Pedro Molinos', 19, GETDATE()),
('San Pedro Nopala', 19, GETDATE()),
('San Pedro Ocopetatillo', 19, GETDATE()),
('San Pedro Ocotepec', 19, GETDATE()),
('San Pedro Pochutla', 19, GETDATE()),
('San Pedro Quiatoni', 19, GETDATE()),
('San Pedro Sochiápam', 19, GETDATE()),
('San Pedro Tapanatepec', 19, GETDATE()),
('San Pedro Taviche', 19, GETDATE()),
('San Pedro Teozacoalco', 19, GETDATE()),
('San Pedro Teutila', 19, GETDATE()),
('San Pedro Tidaá', 19, GETDATE()),
('San Pedro Topiltepec', 19, GETDATE()),
('San Pedro Totolápam', 19, GETDATE()),
('Villa de Tututepec', 19, GETDATE()),
('San Pedro Yaneri', 19, GETDATE()),
('San Pedro Yólox', 19, GETDATE()),
('San Pedro y San Pablo Ayutla', 19, GETDATE()),
('Villa de Etla', 19, GETDATE()),
('San Pedro y San Pablo Teposcolula', 19, GETDATE()),
('San Pedro y San Pablo Tequixtepec', 19, GETDATE()),
('San Pedro Yucunama', 19, GETDATE()),
('San Raymundo Jalpan', 19, GETDATE()),
('San Sebastián Abasolo', 19, GETDATE()),
('San Sebastián Coatlán', 19, GETDATE()),
('San Sebastián Ixcapa', 19, GETDATE()),
('San Sebastián Nicananduta', 19, GETDATE()),
('San Sebastián Río Hondo', 19, GETDATE()),
('San Sebastián Tecomaxtlahuaca', 19, GETDATE()),
('San Sebastián Teitipac', 19, GETDATE()),
('San Sebastián Tutla', 19, GETDATE()),
('San Simón Almolongas', 19, GETDATE()),
('San Simón Zahuatlán', 19, GETDATE()),
('Santa Ana', 19, GETDATE()),
('Santa Ana Ateixtlahuaca', 19, GETDATE()),
('Santa Ana Cuauhtémoc', 19, GETDATE()),
('Santa Ana del Valle', 19, GETDATE()),
('Santa Ana Tavela', 19, GETDATE()),
('Santa Ana Tlapacoyan', 19, GETDATE()),
('Santa Ana Yareni', 19, GETDATE()),
('Santa Ana Zegache', 19, GETDATE()),
('Santa Catalina', 19, GETDATE()),
('Santa Catarina Cuixtla', 19, GETDATE()),
('Santa Catarina Ixtepeji', 19, GETDATE()),
('Santa Catarina Juquila', 19, GETDATE()),
('Santa Catarina Lachatao', 19, GETDATE()),
('Santa Catarina Loxicha', 19, GETDATE()),
('Santa Catarina Mechoacán', 19, GETDATE()),
('Santa Catarina Minas', 19, GETDATE()),
('Santa Catarina Quiané', 19, GETDATE()),
('Santa Catarina Tayata', 19, GETDATE()),
('Santa Catarina Ticuá', 19, GETDATE()),
('Santa Catarina Yosonotú', 19, GETDATE()),
('Santa Catarina Zapoquila', 19, GETDATE()),
('Santa Cruz Acatepec', 19, GETDATE()),
('Santa Cruz Amilpas', 19, GETDATE()),
('Santa Cruz de Bravo', 19, GETDATE()),
('Santa Cruz Itundujia', 19, GETDATE()),
('Santa Cruz Mixtepec', 19, GETDATE()),
('Santa Cruz Nundaco', 19, GETDATE()),
('Santa Cruz Papalutla', 19, GETDATE()),
('Santa Cruz Tacache de Mina', 19, GETDATE()),
('Santa Cruz Tacahua', 19, GETDATE()),
('Santa Cruz Tayata', 19, GETDATE()),
('Santa Cruz Xitla', 19, GETDATE()),
('Santa Cruz Xoxocotlán', 19, GETDATE()),
('Santa Cruz Zenzontepec', 19, GETDATE()),
('Santa Gertrudis', 19, GETDATE()),
('Santa Inés del Monte', 19, GETDATE()),
('Santa Inés Yatzeche', 19, GETDATE()),
('Santa Lucía del Camino', 19, GETDATE()),
('Santa Lucía Miahuatlán', 19, GETDATE()),
('Santa Lucía Monteverde', 19, GETDATE()),
('Santa Lucía Ocotlán', 19, GETDATE()),
('Santa María Alotepec', 19, GETDATE()),
('Santa María Apazco', 19, GETDATE()),
('Santa María la Asunción', 19, GETDATE()),
('Heroica Ciudad de Tlaxiaco', 19, GETDATE()),
('Ayoquezco de Aldama', 19, GETDATE()),
('Santa María Atzompa', 19, GETDATE()),
('Santa María Camotlán', 19, GETDATE()),
('Santa María Colotepec', 19, GETDATE()),
('Santa María Cortijo', 19, GETDATE()),
('Santa María Coyotepec', 19, GETDATE()),
('Santa María Chachoápam', 19, GETDATE()),
('Villa de Chilapa de Díaz', 19, GETDATE()),
('Santa María Chilchotla', 19, GETDATE()),
('Santa María Chimalapa', 19, GETDATE()),
('Santa María del Rosario', 19, GETDATE()),
('Santa María del Tule', 19, GETDATE()),
('Santa María Ecatepec', 19, GETDATE()),
('Santa María Guelacé', 19, GETDATE()),
('Santa María Guienagati', 19, GETDATE()),
('Santa María Huatulco', 19, GETDATE()),
('Santa María Huazolotitlán', 19, GETDATE()),
('Santa María Ipalapa', 19, GETDATE()),
('Santa María Ixcatlán', 19, GETDATE()),
('Santa María Jacatepec', 19, GETDATE()),
('Santa María Jalapa del Marqués', 19, GETDATE()),
('Santa María Jaltianguis', 19, GETDATE()),
('Santa María Lachixío', 19, GETDATE()),
('Santa María Mixtequilla', 19, GETDATE()),
('Santa María Nativitas', 19, GETDATE()),
('Santa María Nduayaco', 19, GETDATE()),
('Santa María Ozolotepec', 19, GETDATE()),
('Santa María Pápalo', 19, GETDATE()),
('Santa María Peñoles', 19, GETDATE()),
('Santa María Petapa', 19, GETDATE()),
('Santa María Quiegolani', 19, GETDATE()),
('Santa María Sola', 19, GETDATE()),
('Santa María Tataltepec', 19, GETDATE()),
('Santa María Tecomavaca', 19, GETDATE()),
('Santa María Temaxcalapa', 19, GETDATE()),
('Santa María Temaxcaltepec', 19, GETDATE()),
('Santa María Teopoxco', 19, GETDATE()),
('Santa María Tepantlali', 19, GETDATE()),
('Santa María Texcatitlán', 19, GETDATE()),
('Santa María Tlahuitoltepec', 19, GETDATE()),
('Santa María Tlalixtac', 19, GETDATE()),
('Santa María Tonameca', 19, GETDATE()),
('Santa María Totolapilla', 19, GETDATE()),
('Santa María Xadani', 19, GETDATE()),
('Santa María Yalina', 19, GETDATE()),
('Santa María Yavesía', 19, GETDATE()),
('Santa María Yolotepec', 19, GETDATE()),
('Santa María Yosoyúa', 19, GETDATE()),
('Santa María Yucuhiti', 19, GETDATE()),
('Santa María Zacatepec', 19, GETDATE()),
('Santa María Zaniza', 19, GETDATE()),
('Santa María Zoquitlán', 19, GETDATE()),
('Santiago Amoltepec', 19, GETDATE()),
('Santiago Apoala', 19, GETDATE()),
('Santiago Apóstol', 19, GETDATE()),
('Santiago Astata', 19, GETDATE()),
('Santiago Atitlán', 19, GETDATE()),
('Santiago Ayuquililla', 19, GETDATE()),
('Santiago Cacaloxtepec', 19, GETDATE()),
('Santiago Camotlán', 19, GETDATE()),
('Santiago Comaltepec', 19, GETDATE()),
('Villa de Santiago Chazumba', 19, GETDATE()),
('Santiago Choápam', 19, GETDATE()),
('Santiago del Río', 19, GETDATE()),
('Santiago Huajolotitlán', 19, GETDATE()),
('Santiago Huauclilla', 19, GETDATE()),
('Santiago Ihuitlán Plumas', 19, GETDATE()),
('Santiago Ixcuintepec', 19, GETDATE()),
('Santiago Ixtayutla', 19, GETDATE()),
('Santiago Jamiltepec', 19, GETDATE()),
('Santiago Jocotepec', 19, GETDATE()),
('Santiago Juxtlahuaca', 19, GETDATE()),
('Santiago Lachiguiri', 19, GETDATE()),
('Santiago Lalopa', 19, GETDATE()),
('Santiago Laollaga', 19, GETDATE()),
('Santiago Laxopa', 19, GETDATE()),
('Santiago Llano Grande', 19, GETDATE()),
('Santiago Matatlán', 19, GETDATE()),
('Santiago Miltepec', 19, GETDATE()),
('Santiago Minas', 19, GETDATE()),
('Santiago Nacaltepec', 19, GETDATE()),
('Santiago Nejapilla', 19, GETDATE()),
('Santiago Nundiche', 19, GETDATE()),
('Santiago Nuyoó', 19, GETDATE()),
('Santiago Pinotepa Nacional', 19, GETDATE()),
('Santiago Suchilquitongo', 19, GETDATE()),
('Santiago Tamazola', 19, GETDATE()),
('Santiago Tapextla', 19, GETDATE()),
('Villa Tejúpam de la Unión', 19, GETDATE()),
('Santiago Tenango', 19, GETDATE()),
('Santiago Tepetlapa', 19, GETDATE()),
('Santiago Tetepec', 19, GETDATE()),
('Santiago Texcalcingo', 19, GETDATE()),
('Santiago Textitlán', 19, GETDATE()),
('Santiago Tilantongo', 19, GETDATE()),
('Santiago Tillo', 19, GETDATE()),
('Santiago Tlazoyaltepec', 19, GETDATE()),
('Santiago Xanica', 19, GETDATE()),
('Santiago Xiacuí', 19, GETDATE()),
('Santiago Yaitepec', 19, GETDATE()),
('Santiago Yaveo', 19, GETDATE()),
('Santiago Yolomécatl', 19, GETDATE()),
('Santiago Yosondúa', 19, GETDATE()),
('Santiago Yucuyachi', 19, GETDATE()),
('Santiago Zacatepec', 19, GETDATE()),
('Santiago Zoochila', 19, GETDATE()),
('Nuevo Zoquiápam', 19, GETDATE()),
('Santo Domingo Ingenio', 19, GETDATE()),
('Santo Domingo Albarradas', 19, GETDATE()),
('Santo Domingo Armenta', 19, GETDATE()),
('Santo Domingo Chihuitán', 19, GETDATE()),
('Santo Domingo de Morelos', 19, GETDATE()),
('Santo Domingo Ixcatlán', 19, GETDATE()),
('Santo Domingo Nuxaá', 19, GETDATE()),
('Santo Domingo Ozolotepec', 19, GETDATE()),
('Santo Domingo Petapa', 19, GETDATE()),
('Santo Domingo Roayaga', 19, GETDATE()),
('Santo Domingo Tehuantepec', 19, GETDATE()),
('Santo Domingo Teojomulco', 19, GETDATE()),
('Santo Domingo Tepuxtepec', 19, GETDATE()),
('Santo Domingo Tlatayápam', 19, GETDATE()),
('Santo Domingo Tomaltepec', 19, GETDATE()),
('Santo Domingo Tonalá', 19, GETDATE()),
('Santo Domingo Tonaltepec', 19, GETDATE()),
('Santo Domingo Xagacía', 19, GETDATE()),
('Santo Domingo Yanhuitlán', 19, GETDATE()),
('Santo Domingo Yodohino', 19, GETDATE()),
('Santo Domingo Zanatepec', 19, GETDATE()),
('Santos Reyes Nopala', 19, GETDATE()),
('Santos Reyes Pápalo', 19, GETDATE()),
('Santos Reyes Tepejillo', 19, GETDATE()),
('Santos Reyes Yucuná', 19, GETDATE()),
('Santo Tomás Jalieza', 19, GETDATE()),
('Santo Tomás Mazaltepec', 19, GETDATE()),
('Santo Tomás Ocotepec', 19, GETDATE()),
('Santo Tomás Tamazulapan', 19, GETDATE()),
('San Vicente Coatlán', 19, GETDATE()),
('San Vicente Lachixío', 19, GETDATE()),
('San Vicente Nuñú', 19, GETDATE()),
('Silacayoápam', 19, GETDATE()),
('Sitio de Xitlapehua', 19, GETDATE()),
('Soledad Etla', 19, GETDATE()),
('Villa de Tamazulápam del Progreso', 19, GETDATE()),
('Tanetze de Zaragoza', 19, GETDATE()),
('Taniche', 19, GETDATE()),
('Tataltepec de Valdés', 19, GETDATE()),
('Teococuilco de Marcos Pérez', 19, GETDATE()),
('Teotitlán de Flores Magón', 19, GETDATE()),
('Teotitlán del Valle', 19, GETDATE()),
('Teotongo', 19, GETDATE()),
('Tepelmeme Villa de Morelos', 19, GETDATE()),
('Heroica Villa Tezoatlán de Segura y Luna, Cuna de la Independencia de Oaxaca', 19, GETDATE()),
('San Jerónimo Tlacochahuaya', 19, GETDATE()),
('Tlacolula de Matamoros', 19, GETDATE()),
('Tlacotepec Plumas', 19, GETDATE()),
('Tlalixtac de Cabrera', 19, GETDATE()),
('Totontepec Villa de Morelos', 19, GETDATE()),
('Trinidad Zaachila', 19, GETDATE()),
('La Trinidad Vista Hermosa', 19, GETDATE()),
('Unión Hidalgo', 19, GETDATE()),
('Valerio Trujano', 19, GETDATE()),
('San Juan Bautista Valle Nacional', 19, GETDATE()),
('Villa Díaz Ordaz', 19, GETDATE()),
('Yaxe', 19, GETDATE()),
('Magdalena Yodocono de Porfirio Díaz', 19, GETDATE()),
('Yogana', 19, GETDATE()),
('Yutanduchi de Guerrero', 19, GETDATE()),
('Villa de Zaachila', 19, GETDATE()),
('San Mateo Yucutindoo', 19, GETDATE()),
('Zapotitlán Lagunas', 19, GETDATE()),
('Zapotitlán Palmas', 19, GETDATE()),
('Santa Inés de Zaragoza', 19, GETDATE()),
('Zimatlán de Álvarez', 19, GETDATE());



/******
Insertar datos a la tabla municipios parte 3
Script Date: 02/10/2024 01:18:00 a. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Municipios (nombreMunicipio, estadoID, ultimaModificacionMunicipio) VALUES

-- Puebla
('Acatlán de Osorio', 20, GETDATE()),
('Ajalpan', 20, GETDATE()),
('Aljojuca', 20, GETDATE()),
('Amoxtla', 20, GETDATE()),
('Atempan', 20, GETDATE()),
('Atlixco', 20, GETDATE()),
('Atoyatempan', 20, GETDATE()),
('Ayotoxco de Guerrero', 20, GETDATE()),
('Chalchicomula de Sesma', 20, GETDATE()),
('Chicuasen', 20, GETDATE()),
('Chigmecatitlán', 20, GETDATE()),
('Cholula de Rivadavia', 20, GETDATE()),
('Cohuecan', 20, GETDATE()),
('Coxcatlán', 20, GETDATE()),
('Cuapiaxtla de Madero', 20, GETDATE()),
('Cuitláhuac', 20, GETDATE()),
('El Seco', 20, GETDATE()),
('El Verde', 20, GETDATE()),
('Huehuetlán el Grande', 20, GETDATE()),
('Huejotzingo', 20, GETDATE()),
('Huitzilan de Serdán', 20, GETDATE()),
('Izúcar de Matamoros', 20, GETDATE()),
('Juan C. Bonilla', 20, GETDATE()),
('La Magdalena Tlatlauquitepec', 20, GETDATE()),
('Libres', 20, GETDATE()),
('Los Reyes de Juárez', 20, GETDATE()),
('Mazapiltepec de Juárez', 20, GETDATE()),
('Mixtla', 20, GETDATE()),
('Nautla', 20, GETDATE()),
('Ocotepec', 20, GETDATE()),
('Ocotlán de Puebla', 20, GETDATE()),
('Puebla de Zaragoza', 20, GETDATE()),
('San Andrés Cholula', 20, GETDATE()),
('San Juan Cuautlancingo', 20, GETDATE()),
('San Martín Texmelucan', 20, GETDATE()),
('San Pedro Cholula', 20, GETDATE()),
('San Salvador El Seco', 20, GETDATE()),
('San Salvador Huixcolotla', 20, GETDATE()),
('Santo Tomás Chautla', 20, GETDATE()),
('Tehuacán', 20, GETDATE()),
('Tepeaca', 20, GETDATE()),
('Tetela de Ocampo', 20, GETDATE()),
('Tlachichuca', 20, GETDATE()),
('Tlacotepec de Benito Juárez', 20, GETDATE()),
('Tlaola', 20, GETDATE()),
('Tochtepec', 20, GETDATE()),
('Tulcingo del Valle', 20, GETDATE()),
('Zacapoaxtla', 20, GETDATE()),
('Zapotitlán de Méndez', 20, GETDATE()),
('Zautla', 20, GETDATE()),
('Acajete', 20, GETDATE()),
('Acatzingo', 20, GETDATE()),
('Ahuazotepec', 20, GETDATE()),
('Ahuatlán', 20, GETDATE()),
('Alchichica', 20, GETDATE()),
('Amozoc', 20, GETDATE()),
('Atzala', 20, GETDATE()),
('Atzitzihuacan', 20, GETDATE()),
('Ayoxuxtla', 20, GETDATE()),
('Calpan', 20, GETDATE()),
('Caltepec', 20, GETDATE()),
('Chalchicomula', 20, GETDATE()),
('Chiautzingo', 20, GETDATE()),
('Chietla', 20, GETDATE()),
('Chinantla', 20, GETDATE()),
('Chonaca', 20, GETDATE()),
('Coatepec', 20, GETDATE()),
('Cuautempan', 20, GETDATE()),
('Cuetzalan del Progreso', 20, GETDATE()),
('Epatlán', 20, GETDATE()),
('Francisco Z. Mena', 20, GETDATE()),
('Hueytlalpan', 20, GETDATE()),
('Huitzilán de Serdán', 20, GETDATE()),
('La Paz', 20, GETDATE()),
('Mázatepec', 20, GETDATE()),
('Nopalucan', 20, GETDATE()),
('Pahuatlán', 20, GETDATE()),
('Palmar de Bravo', 20, GETDATE()),
('Petlapa', 20, GETDATE()),
('Piaxtla', 20, GETDATE()),
('San Antonio de la Cal', 20, GETDATE()),
('San Gregorio Atzompa', 20, GETDATE()),
('San Nicolás de los Ranchos', 20, GETDATE()),
('San Pablo del Monte', 20, GETDATE()),
('San Salvador el Seco', 20, GETDATE()),
('San Sebastián Tlacotepec', 20, GETDATE()),
('Santiago Miahuatlán', 20, GETDATE()),
('Tepatlaxco de Hidalgo', 20, GETDATE()),
('Tepexi de Rodríguez', 20, GETDATE()),
('Tequexquitla', 20, GETDATE()),
('Tianguismanalco', 20, GETDATE()),
('Tlachichuca', 20, GETDATE()),
('Tlacotepec de Benito Juárez', 20, GETDATE()),
('Tlaxco', 20, GETDATE()),
('Tochtepec', 20, GETDATE()),
('Tzicatlacoyan', 20, GETDATE()),
('Xicotepec', 20, GETDATE()),
('Xochitlán de Vicente Suárez', 20, GETDATE()),
('Zacatlán', 20, GETDATE()),
('Zaragoza', 20, GETDATE()),
('Zautla', 20, GETDATE()),
('Zinacatepec', 20, GETDATE()),

-- Querétaro
('Amealco de Bonfil', 21, GETDATE()),
('El Marqués', 21, GETDATE()),
('Querétaro', 21, GETDATE()),
('San Juan del Río', 21, GETDATE()),
('Cadereyta de Montes', 21, GETDATE()),
('Colón', 21, GETDATE()),
('Huimilpan', 21, GETDATE()),
('Pinal de Amoles', 21, GETDATE()),
('Querétaro', 21, GETDATE()),
('San Joaquín', 21, GETDATE()),
('Santiago de Querétaro', 21, GETDATE()),
('Tequisquiapan', 21, GETDATE()),
('Tolimán', 21, GETDATE()),
('Landa de Matamoros', 21, GETDATE()),
('Peñamiller', 21, GETDATE()),
('San Luis de la Paz', 21, GETDATE()),
('Zimapán', 21, GETDATE()),
('El Marqués', 21, GETDATE()),

-- Quintana Roo
('Benito Juárez', 22, GETDATE()),
('Cozumel', 22, GETDATE()),
('Isla Mujeres', 22, GETDATE()),
('Tulum', 22, GETDATE()),
('Solidaridad', 22, GETDATE()),
('Othón P. Blanco', 22, GETDATE()),
('Felipe Carrillo Puerto', 22, GETDATE()),
('José María Morelos', 22, GETDATE()),
('Lázaro Cárdenas', 22, GETDATE()),
('Puerto Morelos', 22, GETDATE()),
('Bacalar', 22, GETDATE()),

-- San Luis Potosí
('Acatlán', 23, GETDATE()),
('Ahualulco', 23, GETDATE()),
('Alaquines', 23, GETDATE()),
('Aquismón', 23, GETDATE()),
('Armadillo de los Infante', 23, GETDATE()),
('Cárdenas', 23, GETDATE()),
('Cedral', 23, GETDATE()),
('Cerritos', 23, GETDATE()),
('Ciudad del Maíz', 23, GETDATE()),
('Ciudad Fernández', 23, GETDATE()),
('Ciudad Valles', 23, GETDATE()),
('Coahuila de Zaragoza', 23, GETDATE()),
('Coyote', 23, GETDATE()),
('El Naranjo', 23, GETDATE()),
('Guadalcázar', 23, GETDATE()),
('Huehuetlán', 23, GETDATE()),
('La Paz', 23, GETDATE()),
('Matlapa', 23, GETDATE()),
('Mexquitic de Carmona', 23, GETDATE()),
('Moctezuma', 23, GETDATE()),
('San Antonio', 23, GETDATE()),
('San Ciro de Acosta', 23, GETDATE()),
('San Luis Potosí', 23, GETDATE()),
('San Martín Chalchicuautla', 23, GETDATE()),
('San Nicolás Tolentino', 23, GETDATE()),
('San Vicente Tancuayalab', 23, GETDATE()),
('Santa María del Río', 23, GETDATE()),
('Santo Domingo', 23, GETDATE()),
('Soledad de Graciano Sánchez', 23, GETDATE()),
('Tamasopo', 23, GETDATE()),
('Tamazunchale', 23, GETDATE()),
('Tanquecitos de Castro', 23, GETDATE()),
('Tierra Nueva', 23, GETDATE()),
('Venado', 23, GETDATE()),
('Villa de Arriaga', 23, GETDATE()),
('Villa de Guadalupe', 23, GETDATE()),
('Villa de la Paz', 23, GETDATE()),
('Villa de Reyes', 23, GETDATE()),
('Xilitla', 23, GETDATE()),
('Axtla de Terrazas', 23, GETDATE()),
('Matehuala', 23, GETDATE()),
('Salinas', 23, GETDATE()),
('Santa Catarina', 23, GETDATE()),
('Tamuín', 23, GETDATE()),
('Tancanhuitz', 23, GETDATE()),
('Tlaxcalan', 23, GETDATE()),
('Zaragoza', 23, GETDATE()),
('El Salto', 23, GETDATE()),
('Rayón', 23, GETDATE()),
('Sierra de San Miguelito', 23, GETDATE()),
('Santa Rosa', 23, GETDATE()),
('San Sebastián', 23, GETDATE()),
('El Catorce', 23, GETDATE()),
('Las Palmas', 23, GETDATE()),
('Pueblo Viejo', 23, GETDATE()),
('Cerro de San Pedro', 23, GETDATE()),
('Ahualulco de Mercado', 23, GETDATE()),

-- Sinaloa
('Ahome', 24, GETDATE()),
('Angostura', 24, GETDATE()),
('Badiraguato', 24, GETDATE()),
('Culiacán', 24, GETDATE()),
('El Fuerte', 24, GETDATE()),
('Escuinapa', 24, GETDATE()),
('Elota', 24, GETDATE()),
('Mazatlán', 24, GETDATE()),
('Miravalles', 24, GETDATE()),
('Navolato', 24, GETDATE()),
('San Ignacio', 24, GETDATE()),
('Sinaloa', 24, GETDATE()),
('Rosario', 24, GETDATE()),
('Salvador Alvarado', 24, GETDATE()),
('Concordia', 24, GETDATE()),
('Guasave', 24, GETDATE()),
('Cosalá', 24, GETDATE()),
('Cósala', 24, GETDATE()),
('San Pedro', 24, GETDATE()),
('Toledo', 24, GETDATE()),

-- Sonora
('Álamos', 25, GETDATE()),
('Atil', 25, GETDATE()),
('Bacadéhuachi', 25, GETDATE()),
('Bacanora', 25, GETDATE()),
('Bacoachi', 25, GETDATE()),
('Banámichi', 25, GETDATE()),
('Baviácora', 25, GETDATE()),
('Benjamín Hill', 25, GETDATE()),
('Caborca', 25, GETDATE()),
('Cajeme', 25, GETDATE()),
('Cananea', 25, GETDATE()),
('Carbó', 25, GETDATE()),
('Cumpas', 25, GETDATE()),
('Divisaderos', 25, GETDATE()),
('Empalme', 25, GETDATE()),
('Etchojoa', 25, GETDATE()),
('Fronteras', 25, GETDATE()),
('Hermosillo', 25, GETDATE()),
('Huachinera', 25, GETDATE()),
('Huásabas', 25, GETDATE()),
('Imuris', 25, GETDATE()),
('Magdalena de Kino', 25, GETDATE()),
('Mazatán', 25, GETDATE()),
('Nacozari de García', 25, GETDATE()),
('Nacozari', 25, GETDATE()),
('Nogales', 25, GETDATE()),
('Pitiquito', 25, GETDATE()),
('Plutarco Elías Calles', 25, GETDATE()),
('Puerto Peñasco', 25, GETDATE()),
('Quiriego', 25, GETDATE()),
('Rayón', 25, GETDATE()),
('Río Rico', 25, GETDATE()),
('San Luis Río Colorado', 25, GETDATE()),
('San Miguel de Horcasitas', 25, GETDATE()),
('San Pedro de la Cueva', 25, GETDATE()),
('Santa Ana', 25, GETDATE()),
('Sahuaripa', 25, GETDATE()),
('Santa Cruz', 25, GETDATE()),
('Sierra Vista', 25, GETDATE()),
('Sonoyta', 25, GETDATE()),
('Sonora', 25, GETDATE()),
('Tepache', 25, GETDATE()),
('Tucson', 25, GETDATE()),
('Ures', 25, GETDATE()),
('Villa Hidalgo', 25, GETDATE()),
('Villa de Seris', 25, GETDATE()),
('Yécora', 25, GETDATE()),
('Pitiquito', 25, GETDATE()),
('Sahuaripa', 25, GETDATE()),
('Santa Ana', 25, GETDATE()),
('Altar', 25, GETDATE()),
('Cumpas', 25, GETDATE()),
('San Ignacio Río Muerto', 25, GETDATE()),
('Álamos', 25, GETDATE()),
('Atil', 25, GETDATE()),
('Bacoachi', 25, GETDATE()),
('Banámichi', 25, GETDATE()),
('Baviácora', 25, GETDATE()),
('Benjamín Hill', 25, GETDATE()),
('Caborca', 25, GETDATE()),
('Cajeme', 25, GETDATE()),
('Cananea', 25, GETDATE()),
('Carbó', 25, GETDATE()),
('Divisaderos', 25, GETDATE()),
('Empalme', 25, GETDATE()),
('Etchojoa', 25, GETDATE()),
('Fronteras', 25, GETDATE()),
('Hermosillo', 25, GETDATE()),
('Huachinera', 25, GETDATE()),
('Huásabas', 25, GETDATE()),
('Imuris', 25, GETDATE()),
('Magdalena de Kino', 25, GETDATE()),
('Mazatán', 25, GETDATE()),
('Nacozari de García', 25, GETDATE()),
('Nacozari', 25, GETDATE()),
('Nogales', 25, GETDATE()),
('Pitiquito', 25, GETDATE()),
('Plutarco Elías Calles', 25, GETDATE()),
('Puerto Peñasco', 25, GETDATE()),
('Quiriego', 25, GETDATE()),
('Rayón', 25, GETDATE()),
('Río Rico', 25, GETDATE()),
('San Luis Río Colorado', 25, GETDATE()),
('San Miguel de Horcasitas', 25, GETDATE()),
('San Pedro de la Cueva', 25, GETDATE()),
('Santa Ana', 25, GETDATE()),
('Sahuaripa', 25, GETDATE()),
('Santa Cruz', 25, GETDATE()),
('Sierra Vista', 25, GETDATE()),
('Sonoyta', 25, GETDATE()),
('Sonora', 25, GETDATE()),
('Tepache', 25, GETDATE()),
('Tucson', 25, GETDATE()),
('Ures', 25, GETDATE()),
('Villa Hidalgo', 25, GETDATE()),
('Villa de Seris', 25, GETDATE()),
('Yécora', 25, GETDATE()),

-- Tabasco
('Aldama', 26, GETDATE()),
('Balancán', 26, GETDATE()),
('Cárdenas', 26, GETDATE()),
('Centro', 26, GETDATE()),
('Comalcalco', 26, GETDATE()),
('Cunduacán', 26, GETDATE()),
('Emiliano Zapata', 26, GETDATE()),
('Huimanguillo', 26, GETDATE()),
('Jonuta', 26, GETDATE()),
('Nacajuca', 26, GETDATE()),
('Paraíso', 26, GETDATE()),
('Tacotalpa', 26, GETDATE()),
('Teapa', 26, GETDATE()),
('Tenosique', 26, GETDATE()),
('Tila', 26, GETDATE()),
('Villa de Paraíso', 26, GETDATE()),
('Macuspana', 26, GETDATE()),

-- Tamaulipas
('Aldama', 27, GETDATE()),
('Altamira', 27, GETDATE()),
('Camargo', 27, GETDATE()),
('Casas', 27, GETDATE()),
('Ciudad Madero', 27, GETDATE()),
('Ciudad Victoria', 27, GETDATE()),
('El Mante', 27, GETDATE()),
('González', 27, GETDATE()),
('Güémez', 27, GETDATE()),
('Llera', 27, GETDATE()),
('Matamoros', 27, GETDATE()),
('Miquihuana', 27, GETDATE()),
('Nuevo Laredo', 27, GETDATE()),
('Nuevo Morelos', 27, GETDATE()),
('Padilla', 27, GETDATE()),
('Reynosa', 27, GETDATE()),
('Río Bravo', 27, GETDATE()),
('San Carlos', 27, GETDATE()),
('San Fernando', 27, GETDATE()),
('San Nicolás', 27, GETDATE()),
('Soto la Marina', 27, GETDATE()),
('Tampico', 27, GETDATE()),
('Tula', 27, GETDATE()),
('Valle Hermoso', 27, GETDATE()),
('Victoria', 27, GETDATE()),
('Villagrán', 27, GETDATE()),
('Xicoténcatl', 27, GETDATE()),
('Abasolo', 27, GETDATE()),
('Camerino Z. Mendoza', 27, GETDATE()),
('San Luis Potosí', 27, GETDATE()),
('Cruz de los Laredos', 27, GETDATE()),
('Antiguo Morelos', 27, GETDATE()),
('El Higo', 27, GETDATE()),
('La Peña', 27, GETDATE()),
('La Toma', 27, GETDATE()),
('San José de las Flores', 27, GETDATE()),
('San José de la Esquina', 27, GETDATE()),
('San Miguel de Allende', 27, GETDATE()),
('Tamaulipas', 27, GETDATE()),
('Santa María', 27, GETDATE()),
('San Felipe', 27, GETDATE()),
('Santa Isabel', 27, GETDATE()),
('Iztacalco', 27, GETDATE()),
('Hidalgo', 27, GETDATE()),

-- Tlaxcala
('Amaxac de Guerrero', 28, GETDATE()),
('Apetatitlán de Antonio Carvajal', 28, GETDATE()),
('Atlangatepec', 28, GETDATE()),
('Atltzayanca', 28, GETDATE()),
('Apizaco', 28, GETDATE()),
('Calpulalpan', 28, GETDATE()),
('El Carmen Tequexquitla', 28, GETDATE()),
('Cuapiaxtla', 28, GETDATE()),
('Cuaxomulco', 28, GETDATE()),
('Chiautempan', 28, GETDATE()),
('Muñoz de Domingo Arenas', 28, GETDATE()),
('Españita', 28, GETDATE()),
('Huamantla', 28, GETDATE()),
('Hueyotlipan', 28, GETDATE()),
('Ixtacuixtla de Mariano Matamoros', 28, GETDATE()),
('Ixtenco', 28, GETDATE()),
('Mazatecochco de José María Morelos', 28, GETDATE()),
('Contla de Juan Cuamatzi', 28, GETDATE()),
('Tepetitla de Lardizábal', 28, GETDATE()),
('Sanctórum de Lázaro Cárdenas', 28, GETDATE()),
('Nanacamilpa de Mariano Arista', 28, GETDATE()),
('Acuamanala de Miguel Hidalgo', 28, GETDATE()),
('Natívitas', 28, GETDATE()),
('Panotla', 28, GETDATE()),
('San Pablo del Monte', 28, GETDATE()),
('Santa Cruz Tlaxcala', 28, GETDATE()),
('Tenancingo', 28, GETDATE()),
('Teolocholco', 28, GETDATE()),
('Tepeyanco', 28, GETDATE()),
('Terrenate', 28, GETDATE()),
('Tetla de la Solidaridad', 28, GETDATE()),
('Tetlatlahuca', 28, GETDATE()),
('Tlaxcala', 28, GETDATE()),
('Tlaxco', 28, GETDATE()),
('Tocatlán', 28, GETDATE()),
('Totolac', 28, GETDATE()),
('Ziltlaltépec de Trinidad Sánchez Santos', 28, GETDATE()),
('Tzompantepec', 28, GETDATE()),
('Xaloztoc', 28, GETDATE()),
('Xaltocan', 28, GETDATE()),
('Papalotla de Xicohténcatl', 28, GETDATE()),
('Xicohtzinco', 28, GETDATE()),
('Yauhquemehcan', 28, GETDATE()),
('Zacatelco', 28, GETDATE()),
('Benito Juárez', 28, GETDATE()),
('Emiliano Zapata', 28, GETDATE()),
('Lázaro Cárdenas', 28, GETDATE()),
('La Magdalena Tlaltelulco', 28, GETDATE()),
('San Damián Texóloc', 28, GETDATE()),
('San Francisco Tetlanohcan', 28, GETDATE()),
('San Jerónimo Zacualpan', 28, GETDATE()),
('San José Teacalco', 28, GETDATE()),
('San Juan Huactzinco', 28, GETDATE()),
('San Lorenzo Axocomanitla', 28, GETDATE()),
('San Lucas Tecopilco', 28, GETDATE()),
('Santa Ana Nopalucan', 28, GETDATE()),
('Santa Apolonia Teacalco', 28, GETDATE()),
('Santa Catarina Ayometla', 28, GETDATE()),
('Santa Cruz Quilehtla', 28, GETDATE()),
('Santa Isabel Xiloxoxtla', 28, GETDATE()),

-- Veracruz
('Acajete', 29, GETDATE()),
('Acatlán', 29, GETDATE()),
('Acayucan', 29, GETDATE()),
('Actopan', 29, GETDATE()),
('Acula', 29, GETDATE()),
('Acultzingo', 29, GETDATE()),
('Camarón de Tejeda', 29, GETDATE()),
('Alpatláhuac', 29, GETDATE()),
('Alto Lucero de Gutiérrez Barrios', 29, GETDATE()),
('Altotonga', 29, GETDATE()),
('Alvarado', 29, GETDATE()),
('Amatitlán', 29, GETDATE()),
('Naranjos Amatlán', 29, GETDATE()),
('Amatlán de los Reyes', 29, GETDATE()),
('Angel R. Cabada', 29, GETDATE()),
('La Antigua', 29, GETDATE()),
('Apazapan', 29, GETDATE()),
('Aquila', 29, GETDATE()),
('Astacinga', 29, GETDATE()),
('Atlahuilco', 29, GETDATE()),
('Atoyac', 29, GETDATE()),
('Atzacan', 29, GETDATE()),
('Atzalan', 29, GETDATE()),
('Tlaltetela', 29, GETDATE()),
('Ayahualulco', 29, GETDATE()),
('Banderilla', 29, GETDATE()),
('Benito Juárez', 29, GETDATE()),
('Boca del Río', 29, GETDATE()),
('Calcahualco', 29, GETDATE()),
('Camerino Z. Mendoza', 29, GETDATE()),
('Carrillo Puerto', 29, GETDATE()),
('Catemaco', 29, GETDATE()),
('Cazones de Herrera', 29, GETDATE()),
('Cerro Azul', 29, GETDATE()),
('Citlaltépetl', 29, GETDATE()),
('Coacoatzintla', 29, GETDATE()),
('Coahuitlán', 29, GETDATE()),
('Coatepec', 29, GETDATE()),
('Coatzacoalcos', 29, GETDATE()),
('Coatzintla', 29, GETDATE()),
('Coetzala', 29, GETDATE()),
('Colipa', 29, GETDATE()),
('Comapa', 29, GETDATE()),
('Córdoba', 29, GETDATE()),
('Cosamaloapan de Carpio', 29, GETDATE()),
('Cosautlán de Carvajal', 29, GETDATE()),
('Coscomatepec', 29, GETDATE()),
('Cosoleacaque', 29, GETDATE()),
('Cotaxtla', 29, GETDATE()),
('Coxquihui', 29, GETDATE()),
('Coyutla', 29, GETDATE()),
('Cuichapa', 29, GETDATE()),
('Cuitláhuac', 29, GETDATE()),
('Chacaltianguis', 29, GETDATE()),
('Chalma', 29, GETDATE()),
('Chiconamel', 29, GETDATE()),
('Chiconquiaco', 29, GETDATE()),
('Chicontepec', 29, GETDATE()),
('Chinameca', 29, GETDATE()),
('Chinampa de Gorostiza', 29, GETDATE()),
('Las Choapas', 29, GETDATE()),
('Chocamán', 29, GETDATE()),
('Chontla', 29, GETDATE()),
('Chumatlán', 29, GETDATE()),
('Emiliano Zapata', 29, GETDATE()),
('Espinal', 29, GETDATE()),
('Filomeno Mata', 29, GETDATE()),
('Fortín', 29, GETDATE()),
('Gutiérrez Zamora', 29, GETDATE()),
('Hidalgotitlán', 29, GETDATE()),
('Huatusco', 29, GETDATE()),
('Huayacocotla', 29, GETDATE()),
('Hueyapan de Ocampo', 29, GETDATE()),
('Huiloapan de Cuauhtémoc', 29, GETDATE()),
('Ignacio de la Llave', 29, GETDATE()),
('Ilamatlán', 29, GETDATE()),
('Isla', 29, GETDATE()),
('Ixcatepec', 29, GETDATE()),
('Ixhuacán de los Reyes', 29, GETDATE()),
('Ixhuatlán del Café', 29, GETDATE()),
('Ixhuatlancillo', 29, GETDATE()),
('Ixhuatlán del Sureste', 29, GETDATE()),
('Ixhuatlán de Madero', 29, GETDATE()),
('Ixmatlahuacan', 29, GETDATE()),
('Ixtaczoquitlán', 29, GETDATE()),
('Jalacingo', 29, GETDATE()),
('Xalapa', 29, GETDATE()),
('Jalcomulco', 29, GETDATE()),
('Jáltipan', 29, GETDATE()),
('Jamapa', 29, GETDATE()),
('Jesús Carranza', 29, GETDATE()),
('Xico', 29, GETDATE()),
('Jilotepec', 29, GETDATE()),
('Juan Rodríguez Clara', 29, GETDATE()),
('Juchique de Ferrer', 29, GETDATE()),
('Landero y Coss', 29, GETDATE()),
('Lerdo de Tejada', 29, GETDATE()),
('Magdalena', 29, GETDATE()),
('Maltrata', 29, GETDATE()),
('Manlio Fabio Altamirano', 29, GETDATE()),
('Mariano Escobedo', 29, GETDATE()),
('Martínez de la Torre', 29, GETDATE()),
('Mecatlán', 29, GETDATE()),
('Mecayapan', 29, GETDATE()),
('Medellín de Bravo', 29, GETDATE()),
('Miahuatlán', 29, GETDATE()),
('Las Minas', 29, GETDATE()),
('Minatitlán', 29, GETDATE()),
('Misantla', 29, GETDATE()),
('Mixtla de Altamirano', 29, GETDATE()),
('Moloacán', 29, GETDATE()),
('Naolinco', 29, GETDATE()),
('Naranjal', 29, GETDATE()),
('Nautla', 29, GETDATE()),
('Nogales', 29, GETDATE()),
('Oluta', 29, GETDATE()),
('Omealca', 29, GETDATE()),
('Orizaba', 29, GETDATE()),
('Otatitlán', 29, GETDATE()),
('Oteapan', 29, GETDATE()),
('Ozuluama de Mascareñas', 29, GETDATE()),
('Pajapan', 29, GETDATE()),
('Pánuco', 29, GETDATE()),
('Papantla', 29, GETDATE()),
('Paso del Macho', 29, GETDATE()),
('Paso de Ovejas', 29, GETDATE()),
('La Perla', 29, GETDATE()),
('Perote', 29, GETDATE()),
('Platón Sánchez', 29, GETDATE()),
('Playa Vicente', 29, GETDATE()),
('Poza Rica de Hidalgo', 29, GETDATE()),
('Las Vigas de Ramírez', 29, GETDATE()),
('Pueblo Viejo', 29, GETDATE()),
('Puente Nacional', 29, GETDATE()),
('Rafael Delgado', 29, GETDATE()),
('Rafael Lucio', 29, GETDATE()),
('Los Reyes', 29, GETDATE()),
('Río Blanco', 29, GETDATE()),
('Saltabarranca', 29, GETDATE()),
('San Andrés Tenejapan', 29, GETDATE()),
('San Andrés Tuxtla', 29, GETDATE()),
('San Juan Evangelista', 29, GETDATE()),
('Santiago Tuxtla', 29, GETDATE()),
('Sayula de Alemán', 29, GETDATE()),
('Soconusco', 29, GETDATE()),
('Sochiapa', 29, GETDATE()),
('Soledad Atzompa', 29, GETDATE()),
('Soledad de Doblado', 29, GETDATE()),
('Soteapan', 29, GETDATE()),
('Tamalín', 29, GETDATE()),
('Tamiahua', 29, GETDATE()),
('Tampico Alto', 29, GETDATE()),
('Tancoco', 29, GETDATE()),
('Tantima', 29, GETDATE()),
('Tantoyuca', 29, GETDATE()),
('Tatatila', 29, GETDATE()),
('Castillo de Teayo', 29, GETDATE()),
('Tecolutla', 29, GETDATE()),
('Tehuipango', 29, GETDATE()),
('Álamo Temapache', 29, GETDATE()),
('Tempoal', 29, GETDATE()),
('Tenampa', 29, GETDATE()),
('Tenochtitlán', 29, GETDATE()),
('Teocelo', 29, GETDATE()),
('Tepatlaxco', 29, GETDATE()),
('Tepetlán', 29, GETDATE()),
('Tepetzintla', 29, GETDATE()),
('Tequila', 29, GETDATE()),
('José Azueta', 29, GETDATE()),
('Texcatepec', 29, GETDATE()),
('Texhuacán', 29, GETDATE()),
('Texistepec', 29, GETDATE()),
('Tezonapa', 29, GETDATE()),
('Tierra Blanca', 29, GETDATE()),
('Tihuatlán', 29, GETDATE()),
('Tlacojalpan', 29, GETDATE()),
('Tlacolulan', 29, GETDATE()),
('Tlacotalpan', 29, GETDATE()),
('Tlacotepec de Mejía', 29, GETDATE()),
('Tlachichilco', 29, GETDATE()),
('Tlalixcoyan', 29, GETDATE()),
('Tlalnelhuayocan', 29, GETDATE()),
('Tlapacoyan', 29, GETDATE()),
('Tlaquilpa', 29, GETDATE()),
('Tlilapan', 29, GETDATE()),
('Tomatlán', 29, GETDATE()),
('Tonayán', 29, GETDATE()),
('Totutla', 29, GETDATE()),
('Tuxpan', 29, GETDATE()),
('Tuxtilla', 29, GETDATE()),
('Ursulo Galván', 29, GETDATE()),
('Vega de Alatorre', 29, GETDATE()),
('Veracruz', 29, GETDATE()),
('Villa Aldama', 29, GETDATE()),
('Xoxocotla', 29, GETDATE()),
('Yanga', 29, GETDATE()),
('Yecuatla', 29, GETDATE()),
('Zacualpan', 29, GETDATE()),
('Zaragoza', 29, GETDATE()),
('Zentla', 29, GETDATE()),
('Zongolica', 29, GETDATE()),
('Zontecomatlán de López y Fuentes', 29, GETDATE()),
('Zozocolco de Hidalgo', 29, GETDATE()),
('Agua Dulce', 29, GETDATE()),
('El Higo', 29, GETDATE()),
('Nanchital de Lázaro Cárdenas del Río', 29, GETDATE()),
('Tres Valles', 29, GETDATE()),
('Carlos A. Carrillo', 29, GETDATE()),
('Tatahuicapan de Juárez', 29, GETDATE()),
('Uxpanapa', 29, GETDATE()),
('San Rafael', 29, GETDATE()),

-- Yucatán
('Abalá', 30, GETDATE()),
('Acanceh', 30, GETDATE()),
('Akil', 30, GETDATE()),
('Baca', 30, GETDATE()),
('Bokobá', 30, GETDATE()),
('Buctzotz', 30, GETDATE()),
('Cacalchén', 30, GETDATE()),
('Calotmul', 30, GETDATE()),
('Cansahcab', 30, GETDATE()),
('Cantamayec', 30, GETDATE()),
('Celestún', 30, GETDATE()),
('Cenotillo', 30, GETDATE()),
('Conkal', 30, GETDATE()),
('Cuncunul', 30, GETDATE()),
('Cuzamá', 30, GETDATE()),
('Chacsinkín', 30, GETDATE()),
('Chankom', 30, GETDATE()),
('Chapab', 30, GETDATE()),
('Chemax', 30, GETDATE()),
('Chicxulub Pueblo', 30, GETDATE()),
('Chichimilá', 30, GETDATE()),
('Chikindzonot', 30, GETDATE()),
('Chocholá', 30, GETDATE()),
('Chumayel', 30, GETDATE()),
('Dzán', 30, GETDATE()),
('Dzemul', 30, GETDATE()),
('Dzidzantún', 30, GETDATE()),
('Dzilam de Bravo', 30, GETDATE()),
('Dzilam González', 30, GETDATE()),
('Dzitás', 30, GETDATE()),
('Dzoncauich', 30, GETDATE()),
('Espita', 30, GETDATE()),
('Halachó', 30, GETDATE()),
('Hocabá', 30, GETDATE()),
('Hoctún', 30, GETDATE()),
('Homún', 30, GETDATE()),
('Huhí', 30, GETDATE()),
('Hunucmá', 30, GETDATE()),
('Ixil', 30, GETDATE()),
('Izamal', 30, GETDATE()),
('Kanasín', 30, GETDATE()),
('Kantunil', 30, GETDATE()),
('Kaua', 30, GETDATE()),
('Kinchil', 30, GETDATE()),
('Kopomá', 30, GETDATE()),
('Mama', 30, GETDATE()),
('Maní', 30, GETDATE()),
('Maxcanú', 30, GETDATE()),
('Mayapán', 30, GETDATE()),
('Mérida', 30, GETDATE()),
('Mocochá', 30, GETDATE()),
('Motul', 30, GETDATE()),
('Muna', 30, GETDATE()),
('Muxupip', 30, GETDATE()),
('Opichén', 30, GETDATE()),
('Oxkutzcab', 30, GETDATE()),
('Panabá', 30, GETDATE()),
('Peto', 30, GETDATE()),
('Progreso', 30, GETDATE()),
('Quintana Roo', 30, GETDATE()),
('Río Lagartos', 30, GETDATE()),
('Sacalum', 30, GETDATE()),
('Samahil', 30, GETDATE()),
('Sanahcat', 30, GETDATE()),
('San Felipe', 30, GETDATE()),
('Santa Elena', 30, GETDATE()),
('Seyé', 30, GETDATE()),
('Sinanché', 30, GETDATE()),
('Sotuta', 30, GETDATE()),
('Sucilá', 30, GETDATE()),
('Sudzal', 30, GETDATE()),
('Suma', 30, GETDATE()),
('Tahdziú', 30, GETDATE()),
('Tahmek', 30, GETDATE()),
('Teabo', 30, GETDATE()),
('Tecoh', 30, GETDATE()),
('Tekal de Venegas', 30, GETDATE()),
('Tekantó', 30, GETDATE()),
('Tekax', 30, GETDATE()),
('Tekit', 30, GETDATE()),
('Tekom', 30, GETDATE()),
('Telchac Pueblo', 30, GETDATE()),
('Telchac Puerto', 30, GETDATE()),
('Temax', 30, GETDATE()),
('Temozón', 30, GETDATE()),
('Tepakán', 30, GETDATE()),
('Tetiz', 30, GETDATE()),
('Teya', 30, GETDATE()),
('Ticul', 30, GETDATE()),
('Timucuy', 30, GETDATE()),
('Tinum', 30, GETDATE()),
('Tixcacalcupul', 30, GETDATE()),
('Tixkokob', 30, GETDATE()),
('Tixmehuac', 30, GETDATE()),
('Tixpéhual', 30, GETDATE()),
('Tizimín', 30, GETDATE()),
('Tunkás', 30, GETDATE()),
('Tzucacab', 30, GETDATE()),
('Uayma', 30, GETDATE()),
('Ucú', 30, GETDATE()),
('Umán', 30, GETDATE()),
('Valladolid', 30, GETDATE()),
('Xocchel', 30, GETDATE()),
('Yaxcabá', 30, GETDATE()),
('Yaxkukul', 30, GETDATE()),
('Yobaín', 30, GETDATE()),

-- Zacatecas
('Apozol', 31, GETDATE()),
('Apulco', 31, GETDATE()),
('Atolinga', 31, GETDATE()),
('Benito Juárez', 31, GETDATE()),
('Calera', 31, GETDATE()),
('Cañitas de Felipe Pescador', 31, GETDATE()),
('Concepción del Oro', 31, GETDATE()),
('Cuauhtémoc', 31, GETDATE()),
('Chalchihuites', 31, GETDATE()),
('Fresnillo', 31, GETDATE()),
('Trinidad García de la Cadena', 31, GETDATE()),
('Genaro Codina', 31, GETDATE()),
('General Enrique Estrada', 31, GETDATE()),
('General Francisco R. Murguía', 31, GETDATE()),
('El Plateado de Joaquín Amaro', 31, GETDATE()),
('General Pánfilo Natera', 31, GETDATE()),
('Guadalupe', 31, GETDATE()),
('Huanusco', 31, GETDATE()),
('Jalpa', 31, GETDATE()),
('Jerez', 31, GETDATE()),
('Jiménez del Teul', 31, GETDATE()),
('Juan Aldama', 31, GETDATE()),
('Juchipila', 31, GETDATE()),
('Loreto', 31, GETDATE()),
('Luis Moya', 31, GETDATE()),
('Mazapil', 31, GETDATE()),
('Melchor Ocampo', 31, GETDATE()),
('Mezquital del Oro', 31, GETDATE()),
('Miguel Auza', 31, GETDATE()),
('Momax', 31, GETDATE()),
('Monte Escobedo', 31, GETDATE()),
('Morelos', 31, GETDATE()),
('Moyahua de Estrada', 31, GETDATE()),
('Nochistlán de Mejía', 31, GETDATE()),
('Noria de Ángeles', 31, GETDATE()),
('Ojocaliente', 31, GETDATE()),
('Pánuco', 31, GETDATE()),
('Pinos', 31, GETDATE()),
('Río Grande', 31, GETDATE()),
('Sain Alto', 31, GETDATE()),
('El Salvador', 31, GETDATE()),
('Sombrerete', 31, GETDATE()),
('Susticacán', 31, GETDATE()),
('Tabasco', 31, GETDATE()),
('Tepechitlán', 31, GETDATE()),
('Tepetongo', 31, GETDATE()),
('Teúl de González Ortega', 31, GETDATE()),
('Tlaltenango de Sánchez Román', 31, GETDATE()),
('Valparaíso', 31, GETDATE()),
('Vetagrande', 31, GETDATE()),
('Villa de Cos', 31, GETDATE()),
('Villa García', 31, GETDATE()),
('Villa González Ortega', 31, GETDATE()),
('Villa Hidalgo', 31, GETDATE()),
('Villanueva', 31, GETDATE()),
('Zacatecas', 31, GETDATE()),
('Trancoso', 31, GETDATE()),
('Santa María de la Paz', 31, GETDATE());



/******
Insertar datos a la tabla de generos
Script Date: 03/10/2024 01:52:00 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Generos (nombreGenero, ultimaModificacionGenero)
VALUES 
('Masculino', GETDATE()),
('Femenino', GETDATE()),
('No binario', GETDATE()),
('Otro', GETDATE()); 



/******
Insertar datos a la tabla de roles
Script Date: 03/10/2024 01:55:00 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO DetalleRol(nombreRol, ultimaModificacionDtRol)
VALUES 
('Cliente', GETDATE()),
('Vendedor', GETDATE()),
('Adminstrador', GETDATE());



/******
Insertar datos a la tabla de estilos
Script Date: 08/10/2024 02:38:47 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Estilo(nombreEstilo, ultimaModificacionEstilo)
VALUES
('Business', GETDATE()),
('Cocktail', GETDATE()),
('Gala', GETDATE()),
('Elegancia Atemporal', GETDATE()),
('Vintage', GETDATE()),
('Disfraces de Halloween', GETDATE()),
('Disfraces Temáticos', GETDATE()),
('Disfraces de Carnaval', GETDATE()),
('Togas', GETDATE()),
('Trajes Regionales', GETDATE()),
('Uniformes', GETDATE()),
('Casual', GETDATE()),
('Minimalista', GETDATE()),
('Ropa de Baile', GETDATE())



/******
Insertar datos a la tabla de tallas
Script Date: 12/10/2024 06:50:01 p. m. 
Autor: Moisés Jael Hernández Calva
Contacto: moyhc2204gamer@outlook.com
******/

INSERT INTO Tallas(nombreTalla, ultimaModificacionTalla)
VALUES
('XS Petite', GETDATE()),
('S Petite', GETDATE()),
('M Petite', GETDATE()),
('L Petite', GETDATE()),
('XS',GETDATE()),
('S', GETDATE()),
('M', GETDATE()),
('S', GETDATE()),
('L', GETDATE()),
('XL', GETDATE()),
('XXL', GETDATE()),
('XXXL', GETDATE()),
('4XL', GETDATE()),
('5XL', GETDATE()),
('SM', GETDATE()),
('ML', GETDATE()),
('L-LX', GETDATE()),
('M Tall', GETDATE()),
('L Tall', GETDATE()),
('XL Tall', GETDATE()),
('S Maternity', GETDATE()),
('M Maternity', GETDATE()),
('L Maternity', GETDATE());