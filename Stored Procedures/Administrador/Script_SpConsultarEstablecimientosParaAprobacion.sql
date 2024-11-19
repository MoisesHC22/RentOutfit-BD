USE [RentOutfit]
GO


/****** 
Creación de Stored procedure para consultar las peticiones para aprobar establecimientos
Script Date: 27/10/2024 10:19:00 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Mostrar_Peticiones_Establecimientos]
(
@usuario INT = NULL,
@pagina INT = 1,
@filtro NVARCHAR(255) = NULL,
@orden NVARCHAR(50) = 'reciente'
)
AS
 BEGIN
    SET NOCOUNT ON;

      DECLARE @tipoError INT = 0;
      DECLARE @mensaje NVARCHAR(255) = '';
      DECLARE @registrosPorPagina INT = 10;
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
		    INNER JOIN Usuarios U ON R.usuarioID = U.usuarioID
		   WHERE U.usuarioID = @usuario AND R.detalleRolID = 3
		)
		 BEGIN
         
		 DECLARE @totalRegistros INT;

		 SELECT @totalRegistros = COUNT(*)
         FROM Establecimientos E
           INNER JOIN Clientes C ON E.clienteID = C.clienteID
           INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
         WHERE E.aprobacionEst = 0
		 AND (@filtro IS NULL OR E.nombreEstablecimiento LIKE '%' + @filtro + '%');

		 SELECT
		   E.establecimientosID,
		   E.nombreEstablecimiento,
		   E.linkImagenEstablecimiento,
	       E.ultimaModificacionEstablecimiento,
		   @totalRegistros AS totalRegistros
		 FROM Establecimientos E
		   INNER JOIN Clientes C ON E.clienteID = C.clienteID
		   INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		 WHERE E.aprobacionEst = 0
		 AND(@filtro IS NULL OR E.nombreEstablecimiento LIKE '%' + @filtro + '%')
		 ORDER BY 
		    CASE
			  WHEN @orden = 'reciente' THEN E.ultimaModificacionEstablecimiento 
			  ELSE NULL
			END DESC,
			CASE
			  WHEN @orden = 'antiguo' THEN E.ultimaModificacionEstablecimiento
			  ELSE NULL
			END ASC
	     OFFSET @offset ROWS
	     FETCH NEXT @registrosPorPagina ROWS ONLY;

		 COMMIT TRANSACTION;

		 END
		ELSE
	     BEGIN
	        
			SET @tipoError = 2;
	        SET @mensaje = 'Aún no tienes Acceso.';
	   
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



/****** 
Creación de Stored procedure para aprobar establecimientos
Script Date: 27/10/2024 10:40:49 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

 CREATE OR ALTER PROC [dbo].[sp_Aprobar_Establecimiento]
 (
 @establecimiento INT = NULL
 )
 AS
   BEGIN
     SET NOCOUNT ON;

      DECLARE @tipoError INT = 0;
      DECLARE @mensaje NVARCHAR(255) = '';
	  DECLARE @email NVARCHAR(50) = '';

	 BEGIN TRY
	   
		IF @establecimiento IS NULL
		 BEGIN
		   SET @tipoError = 1;
		   SET @mensaje = 'Revisa tus datos.'

		   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
          RETURN;
		 END

		BEGIN TRANSACTION;

		IF EXISTS (
		   SELECT 1 FROM Establecimientos E
		   WHERE E.establecimientosID = @establecimiento AND E.aprobacionEst = 0
		)
		 BEGIN
        
		 UPDATE Establecimientos
		  SET aprobacionEst = 1
		 WHERE establecimientosID = @establecimiento 

		 SELECT
		  @email = U.email
		 FROM Establecimientos E
		 INNER JOIN Clientes C ON E.clienteID = C.clienteID
		 INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		 WHERE E.establecimientosID = @establecimiento
		 
         SET @tipoError = 0;
         SET @mensaje = 'Se aprobó con éxito.';
         SELECT @tipoError AS tipoError, @mensaje AS mensaje, @email AS email;

		 COMMIT TRANSACTION;

		 END
		ELSE
	     BEGIN
	        
			SET @tipoError = 2;
	        SET @mensaje = 'Aún no tienes Acceso.';
	   
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



 /****** 
Creación de Stored procedure para negar la publicacion del establecimientos
Script Date: 28/10/2024 10:51:01 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

 CREATE OR ALTER PROC [dbo].[sp_Denegar_Establecimiento]
 (
 @establecimiento INT = NULL
 )
 AS
   BEGIN
     SET NOCOUNT ON;

      DECLARE @tipoError INT = 0;
      DECLARE @mensaje NVARCHAR(255) = '';
	  DECLARE @email NVARCHAR(50) = '';

	 BEGIN TRY
	   
		IF @establecimiento IS NULL
		 BEGIN
		   SET @tipoError = 1;
		   SET @mensaje = 'Revisa tus datos.'

		   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
          RETURN;
		 END

		BEGIN TRANSACTION;
	
	    DECLARE @usuario INT;

		IF EXISTS (
		   SELECT 1 FROM Establecimientos E
		    INNER JOIN Clientes C ON E.clienteID = C.clienteID
			INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		   WHERE E.establecimientosID = @establecimiento AND E.aprobacionEst = 0
		)
		 BEGIN
        
		 SELECT @usuario = U.usuarioID
		 FROM Establecimientos E
		    INNER JOIN Clientes C ON E.clienteID = C.clienteID
			INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		 WHERE E.establecimientosID = @establecimiento AND E.aprobacionEst = 0;

		 SELECT
		  @email = U.email
		 FROM Establecimientos E
		 INNER JOIN Clientes C ON E.clienteID = C.clienteID
		 INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
		 WHERE E.establecimientosID = @establecimiento
		 

		 DELETE FROM Establecimientos
		 WHERE establecimientosID = @establecimiento 

		 
         SET @tipoError = 0;
         SET @mensaje = 'Se elimino exitosamente.';
         SELECT @tipoError AS tipoError, @mensaje AS mensaje, @email AS email;

		 COMMIT TRANSACTION;

		 END
		ELSE
	     BEGIN
	        
			SET @tipoError = 2;
	        SET @mensaje = 'Aún no tienes Acceso.';
	   
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