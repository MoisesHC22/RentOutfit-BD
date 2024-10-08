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