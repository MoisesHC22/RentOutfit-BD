
/******
Creación del stored procedure para consultar Estados
Script Date: 04/10/2024 05:50:34 p. m.																		
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/


CREATE OR ALTER PROC [dbo].[sp_consultar_estados]
AS
BEGIN
  SELECT 
    estadoID,
	nombreEstado
  FROM Estados
END

-- Comando para ejecutar el stored procedure para consultar todos los municipios
EXEC [dbo].[sp_consultar_estados];
