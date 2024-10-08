USE [RentOutfit]
GO


/******
Creación de Stored procedure para calificar una vestimenta
Script Date: 07/10/2024 12:00:33 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_calificar_vestimenta]
(
@usuarioID INT = NULL,
@vestimentaID INT = NULL,
@puntuacion INT = NULL,
@comentario VARCHAR(250) = NULL
)
AS
BEGIN
   SET NOCOUNT ON;
   DECLARE @tipoError INT = 0;
   DECLARE @mensaje NVARCHAR(255)= '';

   BEGIN TRY
      BEGIN TRANSACTION;

	  IF @usuarioID IS NULL OR @vestimentaID IS NULL OR
	     @puntuacion IS NULL OR @comentario IS NULL
	  BEGIN
	  	 SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	  IF EXISTS (SELECT * FROM Usuarios WHERE usuarioID = @usuarioID)
	  BEGIN
	      
		 IF EXISTS(SELECT * FROM Vestimentas WHERE vestimentaID = @vestimentaID)
		 BEGIN

		  INSERT INTO Calificaciones (usuarioID, vestimentaID, fechaCalificada, comentario, puntuacion, ultimaModificacionCalificacion)
		         VALUES (@usuarioID, @vestimentaID, GETDATE(), @comentario, @puntuacion, GETDATE())
		  
		  COMMIT TRANSACTION;

	      SET @tipoError = 0;
          SET @mensaje = 'Se califico la vestimenta correctamente.';
          SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		  
		 END;
		 ELSE
		 BEGIN
		 	
			SET @tipoError = 2;
	        SET @mensaje = 'La vestimenta no se encontro.';
	        
			ROLLBACK TRANSACTION;
			SELECT @tipoError AS tipoError, @mensaje AS mensaje;

		 END;

	  END
	  ELSE
	  BEGIN
	    SET @tipoError = 3;
	    SET @mensaje = 'Usuario no encontrado.';
	        
	    ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;

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


