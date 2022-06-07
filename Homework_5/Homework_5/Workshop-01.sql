--Workshop 01.1--
GO
CREATE PROCEDURE CreateOrder 
(
	@ID INT,
	@OrderDate DATE,
	@Status SMALLINT,
	@BusinessEntityID INT,
	@CustomerID INT,
	@EmployeeID INT,
	@TotalPrice DECIMAL(18, 2),
	@Comment NVARCHAR(MAX),
	@TotalNumberOfOrders INT OUTPUT,
	@TotalNumOrderCustBusiness INT OUTPUT
)
AS
BEGIN
	INSERT INTO [Order] 
	VALUES (@ID, @OrderDate, @Status, @BusinessEntityID, @CustomerID, @EmployeeID, @TotalPrice, @Comment);

	SET @TotalNumberOfOrders = 
	(
		SELECT COUNT(*) FROM [Order]
		WHERE [Order].CustomerId = @CustomerID
	); 

	SET @TotalNumOrderCustBusiness = 
	(
		SELECT COUNT(*) FROM [Order]
		WHERE [Order].CustomerId = @CustomerID AND [Order].BusinessEntityId = @BusinessEntityID
	); 
END

--Workshop 01.2
GO
CREATE PROCEDURE CreateOrderDetail
(
	@ID INT,
	@OrderID INT,
	@ProductID INT,
	@Quantity INT
)
AS
BEGIN
	DECLARE @Price INT;
	SET @Price = 
	(
		SELECT Price FROM [Product] 
		WHERE @ProductID = [Product].Id
	);

	IF EXISTS (SELECT 1 FROM [OrderDetails] WHERE Id = @ID)
	BEGIN
     UPDATE [OrderDetails] 
     SET Quantity = Quantity + @Quantity
     WHERE Id = @ID;
	END
	ELSE
	BEGIN
     INSERT INTO [OrderDetails]
     VALUES (@ID, @OrderID, @ProductID, @Quantity, @Price);
	END

	UPDATE [Order]
	SET TotalPrice = TotalPrice + @Price
	WHERE Id = @OrderID;

	SELECT [Product].[Name], ([Product].Price * [OrderDetails].Quantity) AS TotalPrice  FROM [Product] 
	LEFT JOIN [OrderDetails] ON [Product].Id = [OrderDetails].ProductId
	GROUP BY [Product].[Name], [Product].Price, [OrderDetails].Quantity;
END
