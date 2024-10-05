


/******
Creación de un stored procedure para consular los municipios de un estado especifico
Script Date: 04/10/2024 06:20:29 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_visualizar_municipios]
(
@estadoID INT = NULL
)
AS
BEGIN
   SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';

BEGIN TRY
   IF @estadoID IS NULL
    BEGIN
	  SET @tipoError = 1;
	  SET @mensaje = 'Necesitas seleccionar un estados.'
	  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	  RETURN;
	END

	BEGIN TRANSACTION;

	IF NOT EXISTS (
	 SELECT 1 FROM Estados WHERE estadoID = @estadoID
	)
	BEGIN
	   SET @tipoError = 1;
	   SET @mensaje = 'El estado no existe.';

	     ROLLBACK TRANSACTION;

         SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
      END

	SELECT
	 M.municipioID,
	 M.nombreMunicipio
	FROM Municipios M
	 INNER JOIN Estados E ON M.estadoID = E.estadoID
	 WHERE E.estadoID = @estadoID;

	COMMIT TRANSACTION;

	SET @tipoError = 0;
	SET @mensaje = 'Operación exitosa.';
	SELECT @tipoError AS tipoError, @mensaje AS mensaje;

END TRY
  BEGIN CATCH
    
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 2;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;

   END CATCH
END


/*
Comando para ejecutar el stored procedure para consultar los municipio de un 
estado en especifico
*/ 

EXEC [dbo].[sp_visualizar_municipios]
@estadoID = 19;