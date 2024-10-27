USE [RentOutfit]
GO


/******
Creación de Stored procedure para mostrar establecimientos cercanos 
Script Date: 21/10/2024 03:50:01 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Establecimientos_Cercanos]
(
@estado VARCHAR(50) = NULL,
@municipio VARCHAR(150) =NULL,
@pagina INT = 1
)
AS
 BEGIN
   SET NOCOUNT ON;

   DECLARE @tipoError INT = 0;
   DECLARE @mensaje NVARCHAR(255) = '';
   DECLARE @registrosPorPagina INT  = 6;
   DECLARE @offset INT;

   BEGIN TRY
      SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  SELECT
	    E.nombreEstablecimiento,
		E.linkImagenEstablecimiento,
		D.calle,
		D.codigoPostal,
		D.colonia,
		ES.nombreEstado,
		M.nombreMunicipio
	  FROM Establecimientos E
	    INNER JOIN Direcciones D ON E.direccionID = D.direccionID
		INNER JOIN Estados ES ON D.estadoID = ES.estadoID
		INNER JOIN Municipios M ON D.municipio = M.nombreMunicipio
	  WHERE (@estado IS NULL OR ES.nombreEstado = @estado)
	    AND (@municipio IS NULL OR M.nombreMunicipio = @municipio)
	  ORDER BY E.nombreEstablecimiento
	  OFFSET @offset ROWS
	  FETCH NEXT @registrosPorPagina ROWS ONLY;

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