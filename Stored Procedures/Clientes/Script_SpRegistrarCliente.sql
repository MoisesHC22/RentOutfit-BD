USE [RentOutfit]
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
@generoID INT = NULL

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
	     @apellidoPaterno IS NULL OR @apellidoMaterno IS NULL OR @telefono IS NULL OR @generoID IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	    
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


	      -- Insertar al cliente

	      INSERT INTO Clientes (nombreCliente, apellidoPaterno, apellidoMaterno, linkImagenPerfil, usuarioID, telefono, generoID, ultimaModificacionCliente)
	      VALUES (@nombreCliente, @apellidoPaterno, @apellidoMaterno, @linkImagenPerfil, @usuarioID, @telefono, @generoID, GETDATE())

  	      COMMIT TRANSACTION;

	      SET @tipoError = 0;
	      SET @mensaje = 'Se insertó el cliente de forma correcta.';
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
