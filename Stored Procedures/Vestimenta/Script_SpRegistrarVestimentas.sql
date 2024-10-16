USE [RentOutfit]
GO


/******
Creación de Stored procedure para registrar una vestimenta.   
Script Date: 15/10/2024 06:55:10 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_registrar_vestimenta]
(
-- Vestimenta
@usuarioID INT = NULL,
@nombre VARCHAR(50) = NULL,
@precio DECIMAL(18,2) = NULL,
@stock INT = NULL,
@tallaID INT = NULL,
@estiloID INT = NULL,
@descripcion VARCHAR(500) = NULL,

-- ImagenesVes
@imagen1 VARCHAR(250) = NULL,
@imagen2 VARCHAR(250) = NULL,
@imagen3 VARCHAR(250) = NULL,
@imagen4 VARCHAR(250) = NULL
)
AS
 BEGIN
    SET NOCOUNT ON;

	DECLARE @tipoError INT = NULL;
	DECLARE @mensaje NVARCHAR(255);

	BEGIN TRY

	   BEGIN TRANSACTION;
	   
	   IF @usuarioID IS NULL OR @nombre IS NULL OR @precio IS NULL OR
	      @stock IS NULL OR @tallaID IS NULL OR @estiloID IS NULL OR  @imagen1 IS NULL OR
		  @descripcion IS NULL
	   BEGIN
	      SET @tipoError = 1;
		  SET @mensaje = 'Uno o más campos requeridos están vacios';

		  ROLLBACK TRANSACTION;
		  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
		  RETURN;
	   END

	   IF EXISTS(
	     SELECT 1 FROM Establecimientos E
		   INNER JOIN Clientes C ON E.clienteID = C.clienteID
		   INNER JOIN Usuarios U ON C.clienteID = u.usuarioID
		 WHERE U.usuarioID =  @usuarioID  
	   )
	    BEGIN

		   DECLARE @imagenesVesID INT;
		     INSERT INTO ImagenesVes (imagen1, imagen2, imagen3, imagen4, ultimaModificacionImgVes)
		     VALUES(@imagen1, @imagen2, @imagen3, @imagen4, GETDATE());
		   SET @imagenesVesID = SCOPE_IDENTITY();


		   DECLARE @establecimientoID INT;
		   SELECT 
		     @establecimientoID = e.establecimientosID
		   FROM Establecimientos E
		     INNER JOIN Clientes C ON E.clienteID = C.clienteID
		     INNER JOIN Usuarios U ON C.clienteID = u.usuarioID
		   WHERE U.usuarioID =  @usuarioID 
		   

		   INSERT INTO Vestimentas (nombrePrenda, precioPorDia, stock, fechaDePublicacion, tallaID, establecimientoID, ultimaModificacionVestimenta, vestimentaEstatus, imagenesVesID, estiloID, descripcion)
		   VALUES(@nombre, @precio, @stock, GETDATE(), @tallaID, @establecimientoID, GETDATE(), 1, @imagenesVesID, @estiloID, @descripcion)

		   COMMIT TRANSACTION;

		   SET @tipoError = 0;
		   SET @mensaje = 'Se agrego la vestimenta con exito';
	       SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	     RETURN;
		END
	   ELSE 
	    BEGIN
	       SET @tipoError = 2;
		   SET @mensaje = 'No tienes acceso aún.';

	       ROLLBACK TRANSACTION;

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