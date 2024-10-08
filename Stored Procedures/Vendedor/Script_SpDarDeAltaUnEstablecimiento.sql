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
@noInt INT= NULL,
@noExt INT = NULL,
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

  BEGIN TRY
    BEGIN TRANSACTION;

	IF @usuarioID IS NULL
	   BEGIN
	    SET @tipoError = 1;
		SET @mensaje = 'No tienes acceso a esta funcion.'

		ROLLBACK TRANSACTION;
		SELECT @tipoError AS tipoError, @mensaje AS mensaje;
        RETURN;
	   END;

	IF @nombreEstablecimiento IS NULL OR @codigoPostal IS NULL OR @colonia IS NULL OR @calle IS NULL OR
		 @noInt IS NULL OR @noExt IS NULL OR @estadoID IS NULL OR @municipio IS NULL
    BEGIN
	     SET @tipoError = 2;
		 SET @mensaje = 'Uno o más campos requeridos están vacíos.';

		 ROLLBACK TRANSACTION;
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	 END



    IF EXISTS (SELECT 1 FROM Usuarios WHERE usuarioID = @usuarioID)
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

		 COMMIT TRANSACTION;

	     SET @tipoError = 0;
         SET @mensaje = 'Se dio de alta Establecimiento con exito.';
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		    
	   END
	   ELSE
	      BEGIN
        	
			SET @tipoError = 3;
	        SET @mensaje = 'No tienes acceso.';
	        
			ROLLBACK TRANSACTION;
			SELECT @tipoError AS tipoError, @mensaje AS mensaje;

	      END;

	END
	ElSE
	  BEGIN
    	
       SET @tipoError = 4;
	   SET @mensaje = 'El usuario no existe.';
	   
	    ROLLBACK TRANSACTION;

	   SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	   RETURN;
	  END;

  END TRY
  BEGIN CATCH

    IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 5;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
  
  END CATCH
END;



-- Testeo del Stored procedure incorrectamente
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 1,
     @nombreEstablecimiento = 'A toda facha',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'Ciudad Ejemplo';



-- Testeo del Stored procedure correctamente
EXEC [dbo].[sp_DarDeAlta_Establecimiento]
     @usuarioID = 2,
     @nombreEstablecimiento = 'A toda facha',
     @codigoPostal = '44445',
     @colonia = 'Centro',
     @calle = 'Segunda',
     @noInt = 59,
     @noExt = 654,
     @estadoID = 1,
     @municipio = 'Ciudad Ejemplo';



-- Comprobar los registros en la base de datos
SELECT * FROM Establecimientos;
SELECT * FROM Direcciones;
