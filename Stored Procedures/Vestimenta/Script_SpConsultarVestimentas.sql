USE [RentOutfit]
GO


/******
Creaci�n de Stored procedure para consultar vestimentas
Script Date: 15/10/2024 07:30:01 p. m.
Autor: Mois�s Jael Hern�ndez Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_mostrar_vestimenta]
(
@estado VARCHAR(50) = NULL,
@municipio VARCHAR(150) = NULL,
@pagina INT = 1,
@filtro NVARCHAR(255) = NULL,
@categoria INT = NULL,
@tallas INT = NULL
)
AS
BEGIN
  SET NOCOUNT ON;
  
  DECLARE @tipoError INT = 0;
  DECLARE @mensaje NVARCHAR(255) = '';
  DECLARE @registrosPorPagina INT  = 9;
  DECLARE @offset INT;

  BEGIN TRY

      SET @offset = (@pagina - 1) * @registrosPorPagina;

	  BEGIN TRANSACTION;

	  DECLARE @totalRegistros INT;

	  SELECT @totalRegistros = COUNT(*)
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
	  WHERE (V.vestimentaEstatus = 1 AND EST.nombreEstado = @estado AND M.nombreMunicipio  = @municipio)
	  AND(@filtro IS NULL OR V.nombrePrenda LIKE '%' + @filtro + '%')
	  AND(@categoria IS NULL OR V.estiloID = @categoria)
	  AND(@tallas IS NULL OR V.tallaID = @tallas)

	  SELECT
	     V.vestimentaID,
	     V.nombrePrenda,
	     V.precioPorDia,
		 IMV.imagen1,

	     T.nombreTalla,
	     ES.nombreEstilo,
	     E.nombreEstablecimiento,
		 @totalRegistros AS totalRegistros
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
	  WHERE (V.vestimentaEstatus = 1 AND EST.nombreEstado = @estado AND M.nombreMunicipio  = @municipio)
	  AND(@filtro IS NULL OR V.nombrePrenda LIKE '%' + @filtro + '%')
	  AND(@categoria IS NULL OR V.estiloID = @categoria)
	  AND(@tallas IS NULL OR V.tallaID = @tallas)
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


EXEC [dbo].[sp_mostrar_vestimenta]
@estado = 'Hidalgo',
@municipio = 'Tula de Allende',
@categoria = 1

Select*From Vestimentas

SELECT*FROM Estilo
SELECT*FROM Tallas
