USE [RentOutfit]
GO


/******
Creación de Stored procedure para dar de alta un establecimiento  
Script Date: 06/10/2024 01:58:16 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_DarDeAlta_Establecimiento]
(
@usuarioID INT = NULL,

-- Establecimiento

@nombreEstablecimiento VARCHAR(50) = NULL,

-- Direcciones

@codigoPostal VARCHAR(5) = NULL,
@colonia VARCHAR(50) = NULL,
@calle VARCHAR(50) = NULL,
@noInt VARCHAR(5) = NULL,
@noExt VARCHAR(5) = NULL,
@estadoID INT = NULL,
@municipio VARCHAR(150) = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255)= '';
  DECLARE @direccionID INT;
  DECLARE @clienteID INT;
  DECLARE @detalleRolID INT;
  DECLARE @establecimientoID INT;

  BEGIN TRY
    BEGIN TRANSACTION;

	IF @usuarioID IS NULL OR @nombreEstablecimiento IS NULL OR @codigoPostal IS NULL OR @colonia IS NULL OR
	   @calle IS NULL OR @noInt IS NULL OR @noExt IS NULL OR @estadoID IS NULL OR @municipio IS NULL
     BEGIN
	     
		 SET @tipoError = 1;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	 END

    IF EXISTS (SELECT 1 FROM Usuarios WHERE usuarioID = @usuarioID)
	 BEGIn
  
       IF EXISTS(
	   SELECT 
		  M.municipioID,
		  M.estadoID,
		  E.nombreEstado
	   FROM Estados E
	     INNER JOIN Municipios M ON E.estadoID = M.estadoID
	   WHERE M.nombreMunicipio = @municipio AND E.estadoID = @estadoID)
	    BEGIN
		 
		 SELECT 
	           @clienteID = C.clienteID,
	           @detalleRolID = R.detalleRolID
	     FROM Roles R
	       INNER JOIN Usuarios U WITH(NOLOCK) ON R.usuarioID = U.usuarioID
		   INNER JOIN Clientes C WITH(NOLOCK) ON R.usuarioID = C.usuarioID
	     WHERE R.usuarioID = @usuarioID;


	   IF @detalleRolID = 2
	      BEGIN

	         INSERT INTO Direcciones (codigoPostal, colonia, calle, noInt, noExt, ultimaModificacionDireccion, estadoID, municipio)
		        VALUES (@codigoPostal, @colonia, @calle, @noInt, @noExt, GETDATE() ,@estadoID, @municipio)
	         SET @direccionID = SCOPE_IDENTITY();

	         INSERT INTO Establecimientos (clienteID, nombreEstablecimiento, direccionID, ultimaModificacionEstablecimiento)
	         VALUES (@clienteID, @nombreEstablecimiento, @direccionID, GETDATE())
			 SET @establecimientoID = SCOPE_IDENTITY();
			 
  		   COMMIT TRANSACTION;

           SET @tipoError = 0;
           SET @mensaje = 'Se dio de alta Establecimiento con exito.';
          SELECT @tipoError AS tipoError, @mensaje AS mensaje, @establecimientoID AS establecimientoID;
            

		 END
        ElSE
 	      BEGIN
    	
             SET @tipoError = 2;
	          SET @mensaje = 'No tienes acceso a esta funcion.';
	   
	          ROLLBACK TRANSACTION;

	          SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	        RETURN;
	      END;
		END
	   ELSE
	    BEGIN
            
		    SET @tipoError = 3;
	        SET @mensaje = 'El estado y municipio con coinciden.'

	        ROLLBACK TRANSACTION;

	        SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	      RETURN;
		END
	 END
	ELSE
	 BEGIn
        	
	    SET @tipoError = 4;
	    SET @mensaje = 'No tienes acceso.';
	        
	    ROLLBACK TRANSACTION;
	    SELECT @tipoError AS tipoError, @mensaje AS mensaje;

	 END
  END TRY
  BEGIN CATCH

    IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 6;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END;
