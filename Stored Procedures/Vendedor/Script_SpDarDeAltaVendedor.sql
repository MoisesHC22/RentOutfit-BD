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