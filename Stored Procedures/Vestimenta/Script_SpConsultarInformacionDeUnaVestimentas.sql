USE [RentOutfit]
GO


/******
Creación de Stored procedure para mostrar la informacion de una vestimenta  
Script Date: 21/10/2024 03:20:24 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Informacion_Vestimenta]
(
  @vestimenta INT = NULL
)
AS
 BEGIN
  SET NOCOUNT ON;
  
  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';

  BEGIN TRY

  IF @vestimenta IS NULL
   BEGIN
	 SET @tipoError = 1;
     SET @mensaje = 'Necesitas una vestimenta.'

     SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    RETURN;
   END

   BEGIN TRANSACTION;

   SELECT
    V.vestimentaID,
    V.nombrePrenda,
	V.precioPorDia,
	V.stock,
	V.fechaDePublicacion,
	V.vestimentaEstatus,
	V.descripcion,
	IV.imagen1,
	ISNULL(IV.imagen2, '') AS imagen2,
	ISNULL(IV.imagen3, '') AS imagen3,
	ISNULL(IV.imagen4, '') AS imagen4,
	T.nombreTalla,
	E.nombreEstilo
   FROM Vestimentas V
    INNER JOIN ImagenesVes IV ON V.imagenesVesID = IV.imagenesVesID
	INNER JOIN Establecimientos ES ON V.establecimientoID = Es.establecimientosID
    INNER JOIN Tallas T ON V.tallaID = T.tallaID
    INNER JOIN Estilo E ON V.estiloID = E.estiloID
   WHERE V.vestimentaID = @vestimenta	

   COMMIT TRANSACTION;

  END TRY
  BEGIN CATCH
   
     IF @@TRANCOUNT > 0
	    ROLLBACK TRANSACTION;

		SET @tipoError = 1;
		SET @mensaje = ERROR_MESSAGE();
        SELECT @tipoError as tipoError, @mensaje as mensaje;
   
  END CATCH
 END
