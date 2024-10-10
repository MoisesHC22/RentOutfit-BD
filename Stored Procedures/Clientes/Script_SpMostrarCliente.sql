USE [RentOutfit]
GO



/******
Creaci�n de Stored procedure para mostrar uno o m�s cliente.   
Script Date: 07/10/2024 02:22:55 p. m. 
Autor: Mois�s Jael Hern�ndez Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_cliente]
(
@usuarioID INT = NULL,
@pagina INT = 1
)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';
  DECLARE @registrosPorPagina INT  = 25;
  DECLARE @offset INT;
  DECLARE @detalleRolID INT;

  BEGIN TRY

	 IF @usuarioID IS NULL
	  BEGIN
	     SET @tipoError = 1;
		 SET @mensaje = 'A�n no tienes Acceso.'

		--  SELECT @tipoError AS tipoError, @mensaje AS mensaje;
         RETURN;
	  END

	  SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  IF EXISTS (SELECT 1 FROM Usuarios WHERE usuarioID = @usuarioID)
	    BEGIN

		   -- Obtener el rol
	     
		  SELECT @detalleRolID = DT.detalleRolID
	      FROM Usuarios U
	        INNER JOIN Roles R ON U.usuarioID = R.usuarioID
	        INNER JOIN DetalleRol DT ON R.detalleRolID = DT.detalleRolID
	      WHERE U.usuarioID = @usuarioID

	      SELECT
	       C.clienteID,
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
	      FROM Usuarios U
            INNER JOIN Clientes C ON U.usuarioID = C.usuarioID
		    INNER JOIN Roles R ON U.usuarioID = R.usuarioID
		    INNER JOIN Direcciones D ON C.direccionID = D.direccionID
		    INNER JOIN Estados E ON D.estadoID = E.estadoID
	   	    INNER JOIN Generos G ON C.generoID = G.generoID
		    INNER JOIN DetalleRol DT ON R.detalleRolID = DT.detalleRolID
	      WHERE (C.usuarioID = @usuarioID OR @detalleRolID = 3)

          ORDER BY C.clienteID
	      OFFSET CASE WHEN @detalleRolID = 3 THEN @offset ELSE 0 END ROWS
	      FETCH NEXT CASE WHEN @detalleRolID = 3  THEN @registrosPorPagina ELSE 1000 END ROWS ONLY;

     	  COMMIT TRANSACTION;

	      SET @tipoError = 0;
	      SET @mensaje = 'Consulta de cliente exitosa.';
	      -- SELECT @tipoError AS tipoError, @mensaje AS mensaje;
	    END
	  ELSE
	   BEGIN
	   SET @tipoError = 2;
	         SET @mensaje = 'Revisa tus datos.';
	   
	         ROLLBACK TRANSACTION;

        	 --SELECT @tipoError AS tipoError, @mensaje AS mensaje;
    	   RETURN;
	   END

	  

  END TRY
  BEGIN CATCH
    
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 3;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;

   END CATCH
END



/******
Testeo para mostrar uno o m�s clientes con el Stored procedure.   
Script Date: 07/10/2024 02:30:59 p. m. 
Autor: Mois�s Jael Hern�ndez Calva       
Contacto: moyhc2204gamer@outlook.com
******/

-- Si el usuario no tiene rol de administrador, solo va a poder ver su propia informaci�n.

   -- Ejemplo 1
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 1;

   -- Ejemplo 2
   EXEC [dbo].[sp_mostrar_cliente]
   @usuarioID = 2;



-- Si el usuario tiene el rol de administrador, va a poder ver todas las cuentas.
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 3;


-- Error de datos nulos
   EXEC [dbo].[sp_mostrar_cliente]

-- Error de datos inexistentes
  EXEC [dbo].[sp_mostrar_cliente]
  @usuarioID = 99;


-- Comprobar los registros en la base de datos
  SELECT*FROM Usuarios;
  SELECT*FROM Clientes;
  SELECT*FROM Roles;
  SELECT*FROM Direcciones;