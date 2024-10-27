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
				U.usuarioID,
                C.nombreCliente,
				C.apellidoPaterno,
				C.apellidoMaterno,
                C.linkImagenPerfil
			  FROM Usuarios U
			    INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
			    INNER JOIN Roles R ON U.usuarioID = R.usuarioID
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
