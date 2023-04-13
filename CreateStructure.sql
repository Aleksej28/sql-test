USE [TestDB]
GO

CREATE TABLE [dbo].[SKU](
	ID int IDENTITY(1,1),
	Code AS 's' + CAST(ID AS [nvarchar](50)),
	[Name] [nvarchar](50) NOT NULL
)
GO

ALTER TABLE SKU
ADD CONSTRAINT DF_SKU_ID PRIMARY KEY CLUSTERED (ID)
GO

ALTER TABLE SKU
ADD CONSTRAINT DF_SKU_Code_Unique UNIQUE (Code)
GO

INSERT INTO dbo.SKU (Name)
VALUES ('John');
GO

INSERT INTO dbo.SKU (Name)
VALUES ('Bob');
GO

INSERT INTO dbo.SKU (Name)
VALUES ('Mark');
GO

CREATE TABLE [dbo].[Family](
	ID int IDENTITY(1,1),
	SurName[nvarchar](50) NOT NULL,
	BudgetValue [nvarchar](50) NOT NULL
)
GO

ALTER TABLE Family
ADD CONSTRAINT DF_Family_ID PRIMARY KEY CLUSTERED (ID)
GO

INSERT INTO dbo.Family (SurName, BudgetValue)
VALUES ('Smith', 10000);
GO

INSERT INTO dbo.Family (SurName, BudgetValue)
VALUES ('Simpsons', 15000);
GO

INSERT INTO dbo.Family (SurName, BudgetValue)
VALUES ('Flanders', 12000);
GO

CREATE TABLE [dbo].[Basket](
	ID int IDENTITY(1,1),
	ID_SKU int NOT NULL,
	ID_Family int NOT NULL,
	Quantity int NOT NULL CONSTRAINT CHK_Basket_Quantity CHECK (Quantity > 0),
	[Value] int NOT NULL CONSTRAINT CHK_Basket_Value CHECK ([Value] > 0),
	PurchaseDate datetime NOT NULL,
	DiscountValue int NOT NULL
)
GO

ALTER TABLE Basket
WITH CHECK ADD CONSTRAINT FK_Basket_SKU FOREIGN KEY(ID_SKU)
REFERENCES SKU (ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE Basket
WITH CHECK ADD CONSTRAINT FK_Basket_Family FOREIGN KEY(ID_Family)
REFERENCES Family (ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE Basket
ADD CONSTRAINT DF_Basket_PurchaseDate_Default DEFAULT (getdate()) FOR PurchaseDate
GO

INSERT INTO dbo.Basket (ID_SKU, ID_Family, Quantity, Value, DiscountValue)
VALUES (3, 2, 5, 7, 35);
GO

INSERT INTO dbo.Basket (ID_SKU, ID_Family, Quantity, Value, DiscountValue)
VALUES (1, 3, 8, 73, 25);
GO