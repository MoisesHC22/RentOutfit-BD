USE [RentOutfit]
GO

/****** 
Creación de Stored procedure para consultar las vestimentas de un establecimiento
Script Date: 27/10/2024 09:17:18 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_vestimentas_Establecimiento]
(
@establecimiento INT = NUll,
@usuario INT = NULL,
@pagina INT = 1,
@filtro NVARCHAR(255) = NULL
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

		IF @usuario IS NULL OR @establecimiento IS NULL
		 BEGIN
		   SET @tipoError = 1;
		   SET @mensaje = 'Aún no tienes Acceso.'

		   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
          RETURN;
		 END

		BEGIN TRANSACTION;

		IF EXISTS (
		   SELECT 1 FROM Establecimientos E
		    INNER JOIN Clientes C ON E.clienteID = C.clienteID
			INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		   WHERE U.usuarioID = @usuario and E.establecimientosID = @establecimiento
		)
		 BEGIN

		 DECLARE @totalRegistros INT;
		 
		 SELECT @totalRegistros = COUNT(*)
		 FROM Vestimentas V
		   INNER JOIN Establecimientos E ON V.establecimientoID = E.establecimientosID
		   INNER JOIN Clientes C ON E.clienteID = C.clienteID
		   INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		   INNER JOIN Tallas T WITH(NOLOCK) ON V.tallaID = T.tallaID
		   INNER JOIN ImagenesVes IMV WITH(NOLOCK) ON V.imagenesVesID = IMV.imagenesVesID
		   INNER JOIN Estilo ES WITH(NOLOCK) ON V.estiloID = ES.estiloID
		 WHERE U.usuarioID = @usuario AND E.establecimientosID = @establecimiento
		 AND(@filtro IS NULL OR V.nombrePrenda LIKE '%' + @filtro + '%')

		 SELECT
		    V.vestimentaID,
			V.nombrePrenda,
			V.precioPorDia,
			IMV.imagen1,
			T.nombreTalla,
			ES.nombreEstilo,
		    @totalRegistros AS totalRegistros
		 FROM Vestimentas V
		   INNER JOIN Establecimientos E ON V.establecimientoID = E.establecimientosID
		   INNER JOIN Clientes C ON E.clienteID = C.clienteID
		   INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		   INNER JOIN Tallas T WITH(NOLOCK) ON V.tallaID = T.tallaID
		   INNER JOIN ImagenesVes IMV WITH(NOLOCK) ON V.imagenesVesID = IMV.imagenesVesID
		   INNER JOIN Estilo ES WITH(NOLOCK) ON V.estiloID = ES.estiloID
		 WHERE U.usuarioID = @usuario AND E.establecimientosID = @establecimiento
		 AND(@filtro IS NULL OR V.nombrePrenda LIKE '%' + @filtro + '%')
		 ORDER BY V.nombrePrenda
		  OFFSET @offset ROWS
		 FETCH NEXT @registrosPorPagina ROWS ONLY;

		 COMMIT TRANSACTION;

		 END
		ELSE
	     BEGIN
	        
			SET @tipoError = 2;
	        SET @mensaje = 'Revisa tus datos.';
	   
	        ROLLBACK TRANSACTION;

        	SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    	  RETURN;
	     END

	 END TRY
	 BEGIN CATCH
   
     IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 1;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;
   
     END CATCH
 END