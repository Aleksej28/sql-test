IF OBJECT_ID('dbo.udf_GetSKUPrice') IS NOT NULL
 DROP FUNCTION dbo.udf_GetSKUPrice;
GO
CREATE FUNCTION dbo.udf_GetSKUPrice
 (@ID_SKU AS int) RETURNS TABLE
AS
RETURN
 SELECT CAST (CAST (SUM(Value) AS decimal(18, 2))/SUM(Quantity) AS decimal(18, 2)) AS SKU_Price
 FROM Basket
 WHERE ID_SKU = @ID_SKU;
GO

SELECT SKU_Price
FROM dbo.udf_GetSKUPrice(2) AS O