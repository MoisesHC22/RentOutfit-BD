USE [RentOutfit]


/******
Creación de Stored procedure para actualizar la imagen de un establecimiento 
Script Date: 18/10/2024 06:24:46 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Actualizar_FotoDeEstablecimiento]
(
@usuarioID INT = NULL,
@establecimientoID INT = NULL,
@linkImagenEstablecimiento VARCHAR(250) = NULL
)
AS
  BEGIN
    SET NOCOUNT ON;

    DECLARE @tipoError INT = 0;
    DECLARE @mensaje NVARCHAR(255)= '';

	BEGIN TRY
	    BEGIN TRANSACTION;

	    IF @usuarioID IS NULL OR @linkImagenEstablecimiento IS NULL
		 BEGIN
		    SET @tipoError = 1;
	        SET @mensaje = 'Uno o más campos requeridos están vacíos.';

	        ROLLBACK TRANSACTION;
            SELECT @tipoError AS tipoError, @mensaje AS mensaje;
            RETURN;
		END

		IF EXISTS (
		    SELECT 1 FROM
			Establecimientos E
			  INNER JOIN Clientes C ON E.clienteID = C.clienteID
			  INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID 
			WHERE U.usuarioID = @usuarioID 
		)
		 BEGIN
		  UPDATE Establecimientos
        	SET linkImagenEstablecimiento = @linkImagenEstablecimiento
          WHERE clienteID  = (SELECT clienteID FROM Clientes WHERE usuarioID = @usuarioID) 
		  AND  establecimientosID = @establecimientoID ;


		  COMMIT TRANSACTION;

          SET @tipoError = 0;
          SET @mensaje = 'Se inserto la imagen de forma correcta.';
          SELECT @tipoError AS tipoError, @mensaje AS mensaje;

		 END
		ELSE
		 BEGIN
		  
		    SET @tipoError = 2;
	        SET @mensaje = 'No tienes acceso a esta función.'

	        COMMIT TRANSACTION;

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
