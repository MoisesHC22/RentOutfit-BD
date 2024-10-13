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
	[linkImagenPerfil] [varchar](250) NOT NULL,
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
	[noInt] [int] NOT NULL,
	[noExt] [int] NOT NULL,
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
Script Date: 10/10/2024 04:09:11 a. m.
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
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
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
	[tokenValidacion] [varchar](255) NULL,
	[ultimaModificacionUsuario] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** 
Creación de tabla de vestimentas            
Script Date: 10/10/2024 04:09:11 a. m.
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
	[estiloID] [int] NOT NULL,
	[linkImagenVes] [varchar](250) NOT NULL,
	[tallaID] [int] NOT NULL,
	[establecimientoID] [int] NOT NULL,
	[ultimaModificacionVestimenta] [datetime] NOT NULL,
	[vestimentaEstatus] [bit] NOT NULL,
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
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Tallas] FOREIGN KEY([tallaID])
REFERENCES [dbo].[Tallas] ([tallaID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Tallas]
GO

USE [RentOutfit]
GO


/******
Creación de Stored procedure para crear un cliente.   
Script Date: 03/10/2024 11:10:05 a. m. 
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
@noInt INT = NULL,
@noExt INT = NULL,
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
	  IF @email IS NULL OR @contrasena IS NULL OR @token IS NULL OR
	     @nombreCliente IS NULL OR @apellidoPaterno IS NULL OR @apellidoMaterno IS NULL OR @linkImagenPerfil IS NULL OR
		 @telefono IS NULL OR @generoID IS NULL OR @codigoPostal IS NULL OR @colonia IS NULL OR @calle IS NULL OR
		 @noInt IS NULL OR @noExt IS NULL OR @estadoID IS NULL OR @municipio IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

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
Testeo de errores para Store procedure para registrar un nuevo cliente.
Script Date: 03/10/2024 11:48:14 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Validar los requerimientos nulos
   EXEC [dbo].[sp_registrar_cliente]
       -- @email = 'cliente@ejemplo.com', -- Se omite el email
       @contrasena = 'contrasena123',
       @token = 'token123',
       @nombreCliente = 'Juan',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'González',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234567',
       @generoID = 1,
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'Ciudad Ejemplo';

-- Validar un requerimiento inexistente
   EXEC [dbo].[sp_registrar_cliente]
       @email = 'cliente@ejemplo.com',
       @contrasena = 'contrasena123',
       @token = 'token123',
       @tokenValidacion = 'validacion123',
       @nombreCliente = 'Juan',
       @apellidoPaterno = 'Pérez',
       @apellidoMaterno = 'González',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234567',
       @generoID = 999, -- Valor inexistente en la tabla Géneros
       @codigoPostal = '12345',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'Ciudad Ejemplo';



/******
Testeo para insertar un registro correcto en el Stored procedure para registrar un nuevo cliente.
Script Date: 03/10/2024 12:00:36 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

   EXEC [dbo].[sp_registrar_cliente]
       @email = 'cliente@ejemplo.com',
       @contrasena = 'contrasena456',
       @token = 'token456',
       @tokenValidacion = 'validacion456',
       @nombreCliente = 'Carlos',
       @apellidoPaterno = 'Gomez',
       @apellidoMaterno = 'Peña',
       @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
       @telefono = '5551234599',
       @generoID = 1,
       @codigoPostal = '55657',
       @colonia = 'Centro',
       @calle = 'Primera',
       @noInt = 101,
       @noExt = 202,
       @estadoID = 1,
       @municipio = 'Ciudad Ejemplo';

-- Comprobar los registros en la base de datos

SELECT * FROM [dbo].[Clientes]
SELECT * FROM [dbo].[Roles]
SELECT * FROM [dbo].[Direcciones]
SELECT * FROM [dbo].[Usuarios]
SELECT * FROM [dbo].[DetalleRol]


/******
Reinicio de las IDs y eliminación de todos los registros de las tablas: Clientes, Roles, Direcciones y Usuarios.
Script Date: 03/10/2024 11:10:05 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

DELETE FROM Clientes
DBCC CHECKIDENT ('Clientes', RESEED, 0);

DELETE FROM Roles
DBCC CHECKIDENT ('Roles', RESEED, 0);

DELETE FROM Direcciones
DBCC CHECKIDENT ('Direcciones', RESEED, 0);

DELETE FROM Usuarios
DBCC CHECKIDENT ('Usuarios', RESEED, 0);


USE [RentOutfit]
GO



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

		--  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
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
	       C.clienteID,
		   C.nombreCliente,
		   C.apellidoMaterno,
		   C.apellidoPaterno,
		   C.linkImagenPerfil,
		   C.telefono,
		   G.nombreGenero AS genero,
		   D.calle,
		   D.noExt,
		   D.noInt,
		   D.colonia,
		   D.codigoPostal,
		   D.municipio,
		   E.nombreEstado AS estado,
		   U.email,
		   U.contrasena
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

        	 --SELECT @tipoError AS tipoError, @mensaje AS mensaje;
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
Testeo para mostrar uno o más clientes con el Stored procedure.   
Script Date: 07/10/2024 02:30:59 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Si el usuario no tiene rol de administrador, solo va a poder ver su propia información.

   -- Ejemplo 1
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 1;

   -- Ejemplo 2
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 2;



-- Si el usuario tiene el rol de administrador, va a poder ver todas las cuentas.
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 3;


-- Error de datos nulos
   EXEC [dbo].[sp_mostrar_cliente]

-- Error de datos inexistentes
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 99;


-- Comprobar los registros en la base de datos
  SELECT*FROM Usuarios;
  SELECT*FROM Clientes;
  SELECT*FROM Roles;
  SELECT*FROM Direcciones;


  USE [RentOutfit]
GO


/******
Creación de Stored procedure para actualizar un cliente.   
Script Date: 05/10/2024 07:21:56 p. m. 																	
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_actualizar_cliente]
(

--Usuarios

@clienteID INT = NULL,
@email VARCHAR(50),
@contrasena VARCHAR(255),
@token VARCHAR(50),
@tokenValidacion VARCHAR(50),

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

  BEGIN TRY
    BEGIN TRANSACTION;

	-- Validación del campo
	IF @clienteID IS NULL
	  BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'Debe proporcionar al menos un ID para actualizar.';

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	  END

	IF EXISTS (SELECT 1 FROM Clientes
	  WHERE clienteID = @clienteID
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
	    WHERE clienteID = @clienteID;
	 END



	 DECLARE @contrasenaNuevaEncryptada VARBINARY(64) = NULL;
	   IF @contrasena IS NOT NULL
	   SET @contrasenaNuevaEncryptada = HASHBYTES('SHA2_256', @contrasena);
	   
	IF EXISTS (SELECT 1 FROM Usuarios U
	   INNER JOIN Clientes C WITH(NOLOCK) ON U.usuarioID = C.usuarioID
		WHERE C.clienteID = @clienteID
		AND (email <> @email OR 
		     contrasena <> @contrasenaNuevaEncryptada OR 
			 token <> @token OR
			 tokenValidacion <> @tokenValidacion))
      BEGIN
	    UPDATE Usuarios
	    SET email = @email,
	        contrasena = @contrasenaNuevaEncryptada,
		    token = @token,
		    tokenValidacion = @tokenValidacion,
		    ultimaModificacionUsuario = GETDATE()
	    WHERE usuarioID = (SELECT usuarioID FROM Clientes WHERE clienteID = @clienteID);
	  END

	IF EXISTS (SELECT 1 FROM Direcciones D
	   INNER JOIN Clientes C WITH(NOLOCK) ON D.direccionID = C.direccionID
	   WHERE C.clienteID = @clienteID
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
	   WHERE direccionID = (SELECT direccionID FROM Clientes WHERE clienteID = @clienteID);
	 END

	COMMIT TRANSACTION;

	SET @tipoError = 0;
	SET @mensaje = 'Actualización exitosa.';
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
Testeo del Store procedure para actualizar un cliente.
Script Date: 04/10/2024 03:43:56 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

EXEC [dbo].[sp_actualizar_cliente]
  @clienteID = 2,
  @email = 'juanP@ejemplo.com',
  @contrasena = 'contrasena567',
  @token = 'token789',
  @tokenValidacion = 'validacion755',
  @nombreCliente = 'Carlos',
  @apellidoPaterno = 'Gomez',
  @apellidoMaterno = 'Peña',
  @linkImagenPerfil = 'http://imagen.com/perfil.jpg',
  @telefono = '7715679167',
  @generoID = 1,
  @codigoPostal = '78942',
  @colonia = 'Centro',
  @calle = 'Primera',
  @noInt = 101,
  @noExt = 202,
  @estadoID = 1,
  @municipio = 'Ciudad Ejemplo';

-- Comprobar los registros en la base de datos

SELECT * FROM [dbo].[Clientes]
SELECT * FROM [dbo].[Roles]
SELECT * FROM [dbo].[Direcciones]
SELECT * FROM [dbo].[Usuarios]



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

-- Comando para ejecutar el stored procedure para consultar todos los generos
EXEC [dbo].[sp_consultar_generos]


USE [RentOutfit]
GO



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



-- Testeo correcto del Stored procedure
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'cliente@ejemplo.com',
@contrasena = 'contrasena123'



-- Testeo incorrecto del Stored procedure

-- Correo incorrecto
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'cliente@ejemplo.co',
@contrasena = 'contrasena123'

-- Contraseña incorrecta
EXEC [dbo].[sp_Iniciar_Sesion]
@email = 'cliente@ejemplo.com',
@contrasena = 'contrasena12'


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

-- Comando para ejecutar el stored procedure para consultar todos los municipios
EXEC [dbo].[sp_consultar_estados];





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


/*
Comando para ejecutar el stored procedure para consultar los municipio de un 
estado en especifico
*/ 

EXEC [dbo].[sp_consultar_municipios]
@estadoID = 19;

USE [RentOutfit]
GO



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



-- Testeo del Stored procedure incorrectamente
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 1,
     @nombreEstablecimiento = 'A toda facha',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'Ciudad Ejemplo';



-- Testeo del Stored procedure correctamente
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 2,
     @nombreEstablecimiento = 'A toda facha',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'Ciudad Ejemplo';



-- Comprobar los registros en la base de datos
SELECT * FROM Establecimientos;
SELECT * FROM Direcciones;



USE [RentOutfit]
GO


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


-- Testeo del Stored procedure correctamente

EXEC [dbo].[sp_DardeAlta_Vendedor]
@usuarioID = 2

--Testeo de un registro inexistente

EXEC [dbo].[sp_DardeAlta_Vendedor]
@usuarioID = 99