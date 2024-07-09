-- Création de la base de données si elle n'existe pas
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'ClientDB')
CREATE DATABASE ClientDB;
GO

-- Utilisation de la base de données ClientDB
USE ClientDB;
GO

-- Création de la table Customers
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Customers')
CREATE TABLE Customers (
    id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL
);
GO

-- Insertion des clients avec des noms se terminant par 'Z'
INSERT INTO Customers (name) VALUES
('JohnZ'),
('CurtisZ'),
('PierreZ');
GO

-- Début de la transaction explicite
BEGIN TRANSACTION;
GO

-- Tronquage du 'Z' à la fin des noms en utilisant TRIM
UPDATE Customers
SET name = TRIM('Z' FROM name)
WHERE RIGHT(name, 1) = 'Z';
GO

-- Fin de la transaction explicite
COMMIT;
GO

-- Vérification des résultats
SELECT * FROM Customers;
GO