USE [RentOutfit]
GO


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


