USE [RentOutfit]
GO


/******
Creación de Stored procedure para consultar las tallas.   
Script Date: 13/10/2024 12:15:19 a. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_consultar_tallas]
AS
BEGIN
   SELECT 
     tallaID,
     nombreTalla
   FROM Tallas
END
