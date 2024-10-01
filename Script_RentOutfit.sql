USE [RentOutfit]
GO





/******
Creación de tabla de calificaciones      Script Date: 30/09/2024 10:48:34 p. m.
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de chats               Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de clasificaciones     Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificacion](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[nombreTipo] [varchar](50) NOT NULL,
	[ultimaModificacionClasificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Clasificacion] PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO








/****** 
Creación de tabla de clientes            Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de detalle Roles       Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleRol](
	[detalleRolID] [int] IDENTITY(1,1) NOT NULL,
	[NombreRol] [varchar](50) NOT NULL,
	[ultimaModificacionDtRol] [datetime] NOT NULL,
 CONSTRAINT [PK_DetalleRol] PRIMARY KEY CLUSTERED 
(
	[detalleRolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO







/****** 
Creación de tabla de detalle ventas       Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de direcciones         Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
	[municipio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[direccionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO







/****** 
Creación de tabla de establecimientos    Script Date: 30/09/2024 10:48:34 p. m.
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de estados             Script Date: 30/09/2024 10:48:34 p. m.
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[estadoID] [int] NOT NULL,
	[nombreEstado] [varchar](50) NOT NULL,
	[ultimaModificacionEstado] [datetime] NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[estadoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO








/****** 
Creación de tabla de generos             Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de incidentes          Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencias](
	[incidenciaID] [int] IDENTITY(1,1) NOT NULL,
	[fechaIncidencia] [datetime] NOT NULL,
	[descripcion] [text] NOT NULL,
	[IncidenciaEstatus] [bit] NOT NULL,
	[ultimaModificacionIncidencia] [datetime] NOT NULL,
 CONSTRAINT [PK_Incidencias] PRIMARY KEY CLUSTERED 
(
	[incidenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO









/******
Creación de tabla de mensajes            Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de municipios          Script Date: 30/09/2024 10:48:34 p. m.
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[municipioID] [int] IDENTITY(1,1) NOT NULL,
	[nombreMunicipio] [varchar](50) NOT NULL,
	[estadoID] [int] NOT NULL,
	[ultimaModificacionMunicipio] [datetime] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[municipioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO








/****** 
Creación de tabla de pedidos             Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedidos](
	[pedidoID] [int] IDENTITY(1,1) NOT NULL,
	[fechaPedido] [date] NOT NULL,
	[clienteID] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[PedidosEstatus] [bit] NOT NULL,
	[ultimaModifiacionPedido] [datetime] NOT NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[pedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO








/******
Creación de tabla de roles               Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de tallas              Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
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
Creación de tabla de usuarios            Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva       Contacto: moyhc2204gamer@outlook.com
******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[contraseña] [varchar](15) NOT NULL,
	[rolID] [int] NOT NULL,
	[token] [varchar](50) NOT NULL,
	[tokenValidacion] [varchar](50) NOT NULL,
	[ultimaModificacionUsuario] [datetime] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO







/****** 
Creación de tabla de vestimentas            Script Date: 30/09/2024 10:48:34 p. m. 
Autor: Moisés Jael Hernández Calva          Contacto: moyhc2204gamer@outlook.com
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
	[tipoID] [int] NOT NULL,
	[linkImagenVes] [varchar](250) NOT NULL,
	[tallaID] [int] NOT NULL,
	[establecimientoID] [int] NOT NULL,
	[ultimaModificacionVestimenta] [datetime] NOT NULL,
	[VestimentaEstatus] [bit] NOT NULL,
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
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Clasificacion] FOREIGN KEY([tipoID])
REFERENCES [dbo].[Clasificacion] ([tipoID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Clasificacion]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Establecimientos] FOREIGN KEY([establecimientoID])
REFERENCES [dbo].[Establecimientos] ([establecimientosID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Establecimientos]
GO
ALTER TABLE [dbo].[Vestimentas]  WITH CHECK ADD  CONSTRAINT [FK_Vestimentas_Tallas] FOREIGN KEY([tallaID])
REFERENCES [dbo].[Tallas] ([tallaID])
GO
ALTER TABLE [dbo].[Vestimentas] CHECK CONSTRAINT [FK_Vestimentas_Tallas]
GO
