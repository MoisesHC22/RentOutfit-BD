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
@tokenValidacion VARCHAR(50) = NULL,

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
	  IF @email IS NULL OR @contrasena IS NULL OR @token IS NULL OR @tokenValidacion IS NULL OR
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
     	  INSERT INTO Usuarios (email, contrasena, token, tokenValidacion, ultimaModificacionUsuario)
	      VALUES (@email, @contrasenaEncryptada, @token, @tokenValidacion, GETDATE());
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
       @tokenValidacion = 'validacion123',
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