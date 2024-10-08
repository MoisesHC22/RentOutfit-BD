
/******
Creación del stored procedure para consultar los generos
Script Date: 04/10/2024 06:58:19 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_generos]
AS
BEGIN
  SELECT 
  generoID,
  nombreGenero
  FROM Generos
END

-- Comando para ejecutar el stored procedure para consultar todos los generos
EXEC [dbo].[sp_consultar_generos]