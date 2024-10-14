USE [RentOutfit]
GO


/******
Creación de Stored procedure para consultar los estilos
Script Date: 13/10/2024 02:59:43 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_estilos]
AS
BEGIN
   SELECT 
     estiloID,
	 nombreEstilo
   FROM Estilo
END
