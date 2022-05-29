USE [SEDC];

SELECT * FROM [Customer];
SELECT * FROM [Product];
SELECT * FROM [Order];

--01--
SELECT * FROM [Customer]
CROSS JOIN [Product]
WHERE [Customer].[Name] = 'Kam Ohrid';

--02--
SELECT * FROM [BusinessEntity]
LEFT JOIN [Order] ON [BusinessEntity].[Id] = [Order].[BusinessEntityId]
WHERE [Order].[BusinessEntityId] IS NOT NULL;

--03--
SELECT * FROM [BusinessEntity]
LEFT JOIN [Order] ON [BusinessEntity].[Id] = [Order].[BusinessEntityId]
WHERE [Order].[BusinessEntityId] IS NULL;

--04--
SELECT * FROM [Customer]
FULL JOIN [Order] ON [Customer].[Id] = [Order].[CustomerId]
WHERE [Order].[CustomerId] IS NULL;