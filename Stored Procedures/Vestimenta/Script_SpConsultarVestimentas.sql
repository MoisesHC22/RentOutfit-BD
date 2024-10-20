USE [RentOutfit]
GO


/******
Creación de Stored procedure para consultar vestimentas
Script Date: 15/10/2024 07:30:01 p. m.
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_vestimenta]
(
@nombrePrenda VARCHAR(50) = NULL,
@estilo VARCHAR(50) = NULL,
@talla VARCHAR(50) = NULL,
@establecimiento VARCHAR(50) = NULL,
@estado VARCHAR(50) = NULL,
@municipio VARCHAR(150) = NULL,
@usuarioID INT = NULL,
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

	  BEGIN TRANSACTION;

	  SELECT
	     V.vestimentaID AS Vestimenta,
	     V.nombrePrenda,
	     V.precioPorDia,
		 IMV.imagen1,
	     V.vestimentaEstatus,

	     -- Pruebas

	     T.nombreTalla,
	     ES.nombreEstilo,
	     E.nombreEstablecimiento
	  FROM Roles R
	     INNER JOIN Usuarios U ON R.usuarioID = U.usuarioID
		 INNER JOIN Clientes C ON C.usuarioID = U.usuarioID
	     INNER JOIN Establecimientos E ON C.clienteID = E.clienteID
		 INNER JOIN Vestimentas V ON E.establecimientosID = V.establecimientoID
		 INNER JOIN Tallas T WITH(NOLOCK) ON V.tallaID = T.tallaID
		 INNER JOIN ImagenesVes IMV WITH(NOLOCK) ON V.imagenesVesID = IMV.imagenesVesID
		 INNER JOIN Estilo ES WITH(NOLOCK) ON V.estiloID = ES.estiloID
		 INNER JOIN Direcciones D ON  E.direccionID = D.direccionID
		 INNER JOIN Estados EST ON D.estadoID = EST.estadoID
		 INNER JOIN Municipios M ON D.municipio	= M.nombreMunicipio
	   WHERE (@nombrePrenda IS NULL OR V.nombrePrenda LIKE '%' + @nombrePrenda + '%')
	     AND (@usuarioID IS NULL OR U.usuarioID = @usuarioID)
         AND (@talla IS NULL OR T.nombreTalla = @talla)
         AND (@estilo IS NULL OR ES.nombreEstilo = @estilo)
         AND (@establecimiento IS NULL OR E.nombreEstablecimiento LIKE '%' + @establecimiento + '%')
		 AND (@estado IS NULL OR EST.nombreEstado = @estado AND @municipio IS NULL OR M.nombreMunicipio = @municipio)
	  ORDER BY V.nombrePrenda
	  OFFSET @offset ROWS
	  FETCH NEXT @registrosPorPagina ROWS ONLY;
	  
	  COMMIT TRANSACTION;

	 SET @tipoError = 0;
	 SET @mensaje = 'Consulta de vestimenta exitosa.';

  END TRY
  BEGIN CATCH
   
      IF @@TRANCOUNT > 0
	     ROLLBACK TRANSACTION;

		 SET @tipoError = 1;
		 SET @mensaje = ERROR_MESSAGE();
         SELECT @tipoError as tipoError, @mensaje as mensaje;
   
  END CATCH
END
