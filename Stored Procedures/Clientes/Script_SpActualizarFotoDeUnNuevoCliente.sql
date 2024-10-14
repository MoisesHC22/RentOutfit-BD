USE [RentOutfit]
GO


/******
Creación de Stored procedure para actualizar la foto de perfil de un cliente nuevo.   
Script Date: 14/10/2024 02:42:57 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_actualizar_fotoDePefil]
(
@email VARCHAR(50) = NULL,
@linkImagenPerfil VARCHAR(250) = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';
  DECLARE @usuarioID INT = NULL;

BEGIN TRY

IF @email IS NULL OR @linkImagenPerfil IS NULL
  BEGIN
      SET @tipoError = 1;
	  SET @mensaje = 'Uno o más campos requeridos están vacíos.';

	  ROLLBACK TRANSACTION;
      SELECT @tipoError AS tipoError, @mensaje AS mensaje;
      RETURN;
  END

  SELECT
   @usuarioID = usuarioID 
  FROM Usuarios
  WHERE email = @email

  UPDATE Clientes
  SET linkImagenPerfil = @linkImagenPerfil
  WHERE usuarioID = @usuarioID

   SET @tipoError = 0;
   SET @mensaje = 'Se inserto la imagen de forma correcta.';
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
