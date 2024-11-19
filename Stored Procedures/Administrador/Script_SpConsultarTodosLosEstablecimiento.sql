USE [RentOutfit]
GO


/******
Creación de Stored procedure para mostrar todos los establecimientos
Script Date: 31/10/2024 05:53:16 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Todos_Los_Establecimientos]
(
@usuario INT = NULL,
@pagina INT = 1
)
AS
 BEGIN
   SET NOCOUNT ON;

   DECLARE @tipoError INT = 0;
   DECLARE @mensaje NVARCHAR(255) = '';
   DECLARE @registrosPorPagina INT  = 10;
   DECLARE @offset INT;

    BEGIN TRY
      SET @offset = (@pagina - 1) * @registrosPorPagina;

	  		IF @usuario IS NULL
		 BEGIN
		   SET @tipoError = 1;
		   SET @mensaje = 'Revisa tus datos.'

		   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
          RETURN;
		 END

	  BEGIN TRANSACTION;
	  	IF EXISTS (
		   SELECT 1 FROM Roles R
		   WHERE R.usuarioID = @usuario AND R.detalleRolID = 3
		)
		 BEGIN
	  SELECT
	    E.establecimientosID,
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
	  ORDER BY E.ultimaModificacionEstablecimiento DESC
	  OFFSET @offset ROWS
	  FETCH NEXT @registrosPorPagina ROWS ONLY;

	  COMMIT TRANSACTION;
	   END
		ELSE
	     BEGIN
	        
			SET @tipoError = 2;
	        SET @mensaje = 'No tienes acceso.';
	   
	        ROLLBACK TRANSACTION;

        	SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    	  RETURN;
	     END
   END TRY
      BEGIN CATCH
   
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 2;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;
   
   END CATCH
 END


 EXEC [dbo].[SP_Todos_Los_Establecimientos]
 @usuario = 1;

 EXEC [dbo].[SP_Todos_Los_Establecimientos]
 @usuario = 1,
 @pagina = 2;

SELECT*FROM Usuarios
SELECT*FROM Roles