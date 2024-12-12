--create database AlquilerVehiculos

--use AlquilerVehiculos

--CREATE TABLE Cliente (
--    Cedula VARCHAR(20) PRIMARY KEY,
--    Nombre NVARCHAR(100) NOT NULL,
--    Telefono1 VARCHAR(15) NOT NULL,
--    Telefono2 VARCHAR(15) NULL
--)

--CREATE TABLE Carro (
--    Placa VARCHAR(20) PRIMARY KEY,
--    Marca NVARCHAR(50) NOT NULL,
--    Modelo NVARCHAR(50) NOT NULL,
--    Costo DECIMAL(10, 2) NOT NULL,
--    Disponible BIT NOT NULL
--)

--CREATE TABLE Alquiler (
--    IdAlquiler INT IDENTITY(1,1) PRIMARY KEY,
--    CedulaCliente VARCHAR(20) NOT NULL,
--    PlacaCarro VARCHAR(20) NOT NULL,
--    Fecha DATE NOT NULL,
--    Tiempo INT NOT NULL, -- Tiempo en dias
--    ValorTotal DECIMAL(10, 2) NOT NULL,
--    Saldo DECIMAL(10, 2) NOT NULL,
--    AbonoInicial DECIMAL(10, 2) NOT NULL,
--    Devuelto BIT NOT NULL,
--    FOREIGN KEY (CedulaCliente) REFERENCES Cliente(Cedula),
--    FOREIGN KEY (PlacaCarro) REFERENCES Carro(Placa)
--)

--CREATE TABLE Pagos (
--    IdPago INT IDENTITY(1,1) PRIMARY KEY,
--    IdAlquiler INT NOT NULL,
--    Fecha DATE NOT NULL,
--    Valor DECIMAL(10, 2) NOT NULL,
--    FOREIGN KEY (IdAlquiler) REFERENCES Alquiler(IdAlquiler)
--)

--SELECT * FROM INFORMATION_SCHEMA.TABLES


--select * from INFORMATION_SCHEMA.TABLES

--DECLARE @PlacaCarro VARCHAR(20) = 'ABC123'
--DECLARE @FechaInicio DATE = '2024-01-01'

--SELECT 
--    COUNT(*) AS TotalAlquileres
--FROM 
--    Alquiler
--WHERE 
--    PlacaCarro = @PlacaCarro
--    AND Fecha >= CAST(@FechaInicio AS DATE)

--DECLARE @FechaEspecifica DATE = '2024-01-15'

--SELECT 
--    SUM(Saldo) AS TotalSaldo
--FROM 
--    Alquiler
--WHERE 
--    Fecha = @FechaEspecifica

--SELECT 
--    c.Cedula,
--    c.Nombre,
--    a.Fecha AS 'Fecha Alquiler',
--    a.Tiempo AS TiempoAlquilado,
--    a.Saldo,
--    car.Placa,
--    car.Marca
--FROM 
--    Cliente c
--INNER JOIN 
--    Alquiler a ON c.Cedula = a.CedulaCliente
--INNER JOIN 
--    Carro car ON a.PlacaCarro = car.Placa

--DECLARE @FechaInicio DATE = '2024-01-01'
--DECLARE @FechaFin DATE = '2024-12-31'

--SELECT 
--    c.Cedula,
--    c.Nombre
--FROM 
--    Cliente c
--LEFT JOIN 
--    Alquiler a ON c.Cedula = a.CedulaCliente AND a.Fecha BETWEEN @FechaInicio AND @FechaFin
--WHERE 
--    a.IdAlquiler IS NULL


--DECLARE @FechaInicio DATE = '2024-01-01'
--SELECT 
--    a.Fecha AS FechaAlquiler,
--    COUNT(p.IdPago) AS CuantosPagos,
--    SUM(p.Valor) AS TotalPagado,
--    MAX(p.Valor) AS MaximoValor
--FROM 
--    Alquiler a
--INNER JOIN 
--    Pagos p ON a.IdAlquiler = p.IdAlquiler
--WHERE 
--    a.Fecha >= @FechaInicio

--GROUP BY 
--    a.Fecha

--DECLARE @FechaInicio DATE = '2024-01-01'
--DECLARE @FechaFin DATE = '2024-12-31'

--SELECT 
--    car.Placa AS CodCarro,
--    car.Modelo,
--    car.Marca,
--    car.Costo,
--    COUNT(a.IdAlquiler) AS CuantosAlquileres,
--    SUM(a.Saldo) AS TotalEnAlquileres
--FROM 
--    Carro car
--INNER JOIN 
--    Alquiler a ON car.Placa = a.PlacaCarro
--WHERE 
--    a.Fecha BETWEEN @FechaInicio AND @FechaFin
--GROUP BY 
--    car.Placa, car.Modelo, car.Marca,car.Costo

--SELECT TOP 1 * 
--FROM Alquiler
--WHERE CedulaCliente = '961214565' 
--ORDER BY Fecha ASC