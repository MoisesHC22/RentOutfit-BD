USE [RentOutfit]
GO



/******
Creación de Stored procedure para buscar información de una vestimenta
Script Date: 18/11/2024 10:03:49 p. m. 
Autor: Moisés Jael Hernández Calva       
Contacto: moyhc2204gamer@outlook.com
******/

CREATE OR ALTER PROC [dbo].[sp_Buscar_Inf_Vestimenta]
(
@vestimentaID INT = NULL
)
AS
 BEGIN
   SELECT
   nombrePrenda,
   precioPorDia,
   stock
   FROM Vestimentas WHERE vestimentaID = @vestimentaID
 END

 EXEC [dbo].[sp_Buscar_Inf_Vestimenta]
 @vestimentaID = 1