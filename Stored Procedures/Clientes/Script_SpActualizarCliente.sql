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
  DECLARE @emailActual VARCHAR(50) = NULL;

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

      SELECT @emailActual = U.email
	  FROM Usuarios U
	    INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
	  WHERE C.clienteID = @clienteID;

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