USE [RentOutfit]
GO



/******
Creación de Stored procedure para mostrar uno o más cliente.   
Script Date: 04/10/2024 3:20:57 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_cliente]
(
@detalleRolID INT = NULL,
@usuarioID INT = NULL
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';

  BEGIN TRY

	 IF @detalleRolID IS NULL OR @usuarioID IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'Aún no tienes Acceso.'

		 SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	  BEGIN TRANSACTION;

	  SELECT
		C.nombreCliente,
		C.apellidoMaterno,
		C.apellidoPaterno,
		C.linkImagenPerfil,
		C.telefono,
		G.nombreGenero AS genero,
		D.calle,
		D.noExt,
		D.noInt,
		D.colonia,
		D.codigoPostal,
		D.municipio,
		E.nombreEstado AS estado,
		U.email,
		U.contrasena
	  FROM Clientes C
        INNER JOIN Usuarios U ON C.usuarioID = U.usuarioID
	    INNER JOIN Direcciones D ON C.direccionID = D.direccionID
        INNER JOIN Estados E ON D.estadoID = E.estadoID
        INNER JOIN Generos G ON C.generoID = G.generoID
	    INNER JOIN Roles R ON U.rolID = R.rolID
	    INNER JOIN DetalleRol DR ON R.detalleRolID = DR.detalleRolID
	  WHERE (C.usuarioID = @usuarioID OR @detalleRolID = 3 )

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



/******
Testeo para mostrar uno o más clientes con el Stored procedure.   
Script Date: 04/10/2024 3:25:11 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Si el usuario no tiene rol de administrador, solo va a poder ver su propia información.

   -- Ejemplo 1
   EXEC [dbo].[sp_mostrar_cliente]
   @detalleRolID = 2,
   @usuarioID = 3;

   -- Ejemplo 2
   EXEC [dbo].[sp_mostrar_cliente]
   @detalleRolID = 1,
   @usuarioID = 2;



-- Si el usuario tiene el rol de administrador, va a poder ver todas las cuentas.
  EXEC [dbo].[sp_mostrar_cliente]
  @detalleRolID = 3,
  @usuarioID = 1;