USE [RentOutfit]
GO


/******
Creación de Stored procedure para consultar vestimentas
Script Date: 07/10/2024 12:20:01 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_vestimenta]
(
@nombrePrenda VARCHAR(50) = NULL,
@estilo VARCHAR(50) = NULL,
@talla VARCHAR(50) = NULL,
@establecimiento VARCHAR(50) = NULL,
@pagina INT = 1
)
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';
  DECLARE @registrosPorPagina INT  = 25;
  DECLARE @offset INT;

  BEGIN TRY

      SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  SELECT
	  V.nombrePrenda,
	  V.precioPorDia,
	  V.vestimentaEstatus,

	  -- Pruebas

	  T.nombreTalla,
	  ES.nombreEstilo,
	  E.nombreEstablecimiento

	  FROM Vestimentas V
	    INNER JOIN Estilo ES WITH(NOLOCK) ON V.estiloID = ES.estiloID
		INNER JOIN Tallas T WITH(NOLOCK) ON V.tallaID = T.tallaID
		INNER JOIN Establecimientos E WITH(NOLOCK) ON V.establecimientoID = E.establecimientosID
	  WHERE (V.nombrePrenda = @nombrePrenda OR  
	         T.nombreTalla = @talla OR 
			 ES.nombreEstilo = @estilo OR
			 E.nombreEstablecimiento = @establecimiento)
	  ORDER BY V.nombrePrenda
	  OFFSET @offset ROWS
	  FETCH NEXT @registrosPorPagina ROWS ONLY;
	  
	  COMMIT TRANSACTION;

	 SET @tipoError = 0;
	 SET @mensaje = 'Consulta de vestimenta exitosa.';
	 SELECT @tipoError AS tipoError, @mensaje AS mensaje;

  END TRY
  BEGIN CATCH
   
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 1;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;
   
  END CATCH
END

