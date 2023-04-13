IF OBJECT_ID('dbo.vw_SKUPrice') IS NOT NULL
 DROP VIEW dbo.vw_SKUPrice;
GO
CREATE VIEW dbo.vw_SKUPrice
AS
SELECT ID, Code, Name
FROM dbo.SKU
GO

SELECT ID, Code, Name
FROM dbo.SKU 
GO