-- Crear base de datos
CREATE DATABASE IF NOT EXISTS dbVentaT;

-- Usar la base de datos
USE dbVentaT;

-- tabla encargados para el ingreso al login
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    adress VARCHAR(255),
    telephone VARCHAR(20),
    email VARCHAR(255) UNIQUE NOT NULL,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
select * from users;
drop table users;
-- Insertar un usuario con todos los datos
INSERT INTO users (user_name, password, adress, telephone, email)
VALUES ('usuario1', 'clave123', 'Calle Principal 123', '123-456-7890', 'usuario1@example.com');

-- Insertar otro usuario sin número de teléfono
INSERT INTO users (user_name, password, adress, email)
VALUES ('usuario2', 'contraseña456', 'Avenida Secundaria 456', 'usuario2@example.com');

INSERT INTO users (user_name, password, adress, telephone, email)
VALUES ('admin', 'admin', 'Calle Principal 222', '123-456-7777', 'admin@example.com');

-- Tabla Productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    descripcion TEXT,
    img1 VARCHAR(255),
    img2 VARCHAR(255),
    img3 VARCHAR(255),
    stockMax INT,
    stockMin INT,
    stock INT,
    createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

drop table productos;

-- Insertar datos en la tabla Productos
INSERT INTO productos (nombre, precio, descripcion, img1, img2, img3, stockMax, stockMin, stock, createdAt, updatedAt) VALUES
('Tela de Algodón', 15.99, 'Tela de algodón 100% de alta calidad, ideal para confección de ropa y manualidades.', 'algodon1.jpg', 'algodon2.jpg', 'algodon3.jpg', 500, 50, 300, '2023-02-01 08:00:00', '2023-02-01 08:00:00'),
('Tela de Lino', 20.49, 'Tela de lino natural, perfecta para trajes y decoraciones.', 'lino1.jpg', 'lino2.jpg', 'lino3.jpg', 400, 40, 200, '2023-02-05 09:30:00', '2023-02-05 09:30:00'),
('Tela de Seda', 35.75, 'Tela de seda suave y elegante, ideal para vestidos y ropa de noche.', 'seda1.jpg', 'seda2.jpg', 'seda3.jpg', 300, 30, 150, '2023-02-10 11:15:00', '2023-02-10 11:15:00'),
('Tela de Poliéster', 10.99, 'Tela de poliéster resistente y duradera, perfecta para uniformes y ropa deportiva.', 'poliester1.jpg', 'poliester2.jpg', 'poliester3.jpg', 600, 60, 400, '2023-02-15 10:45:00', '2023-02-15 10:45:00'),
('Tela de Lana', 25.50, 'Tela de lana cálida y confortable, ideal para abrigos y suéteres.', 'lana1.jpg', 'lana2.jpg', 'lana3.jpg', 350, 35, 175, '2023-02-20 13:00:00', '2023-02-20 13:00:00');


-- Tabla Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Puesto VARCHAR(255),
    FechaContratacion DATE
);

INSERT INTO Empleados (Nombre, Apellido, Puesto, FechaContratacion) VALUES
('Pedro', 'García', 'Vendedor', '2022-01-15'),
('Sofía', 'Ramírez', 'Encargada de almacén', '2021-11-22'),
('Miguel', 'Fernández', 'Gerente', '2020-03-10'),
('Laura', 'Herrera', 'Asistente administrativa', '2021-07-18'),
('Jorge', 'Mendoza', 'Vendedor', '2022-05-23');

-- Tabla Maquinaria
CREATE TABLE IF NOT EXISTS Maquinaria (
    MaquinariaID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion TEXT,
    FechaAdquisicion DATE,
    Estado VARCHAR(50)
);

-- Insertar datos en la tabla Maquinaria
INSERT INTO Maquinaria (Nombre, Descripcion, FechaAdquisicion, Estado) VALUES
('Máquina de coser', 'Máquina de coser industrial', '2021-05-10', 'Operativa'),
('Telar', 'Telar manual', '2020-08-15', 'Operativa'),
('Cortadora de tela', 'Cortadora de alta precisión', '2021-12-01', 'En reparación'),
('Máquina de bordar', 'Máquina de bordar electrónica', '2022-02-20', 'Operativa'),
('Planchadora', 'Planchadora industrial', '2021-03-30', 'Operativa');

-- Tabla Ventas
CREATE TABLE IF NOT EXISTS Ventas (
    VentaID INT PRIMARY KEY AUTO_INCREMENT,
    EmpleadoID INT,
    FechaVenta DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Insertar datos en la tabla Ventas
INSERT INTO Ventas (EmpleadoID, FechaVenta, Total) VALUES
(1, '2023-06-15', 250.75),
(2, '2023-06-16', 150.50),
(3, '2023-06-17', 325.00),
(4, '2023-06-18', 200.25),
(5, '2023-06-19', 175.00);

-- Tabla DetallesVentas
CREATE TABLE IF NOT EXISTS DetallesVentas (
    DetalleVentaID INT PRIMARY KEY AUTO_INCREMENT,
    VentaID INT,
    id INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (id) REFERENCES Productos(id)
);

drop table DetallesVentas;

-- Insertar datos en la tabla DetallesVentas
INSERT INTO DetallesVentas (VentaID, id, Cantidad, PrecioUnitario) VALUES
(1, 1, 10, 15.99),
(1, 2, 5, 20.49),
(2, 3, 2, 35.75),
(2, 4, 8, 10.99),
(3, 5, 3, 25.50),
(3, 1, 6, 15.99),
(4, 2, 7, 20.49),
(4, 3, 1, 35.75),
(5, 4, 12, 10.99),
(5, 5, 4, 25.50);


-- Tabla Cotizaciones
CREATE TABLE IF NOT EXISTS Cotizaciones (
    CotizacionID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteNombre VARCHAR(255) NOT NULL,
    FechaCotizacion DATE NOT NULL,
    Total DECIMAL(10, 2) NOT NULL
);

-- Insertar datos en la tabla Cotizaciones
INSERT INTO Cotizaciones (ClienteNombre, FechaCotizacion, Total) VALUES
('Cliente A', '2023-06-15', 300.75),
('Cliente B', '2023-06-16', 250.50),
('Cliente C', '2023-06-17', 400.00),
('Cliente D', '2023-06-18', 275.25),
('Cliente E', '2023-06-19', 150.00);

-- Tabla DetallesCotizaciones
CREATE TABLE IF NOT EXISTS DetallesCotizaciones (
    DetalleCotizacionID INT PRIMARY KEY AUTO_INCREMENT,
    CotizacionID INT,
    id INT,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CotizacionID) REFERENCES Cotizaciones(CotizacionID),
    FOREIGN KEY (id) REFERENCES Productos(id)
);
drop table DetallesCotizaciones;

-- Insertar datos en la tabla DetallesCotizaciones
INSERT INTO DetallesCotizaciones (CotizacionID, id, Cantidad, PrecioUnitario) VALUES
(1, 1, 20, 15.99),
(1, 2, 10, 20.49),
(2, 3, 5, 35.75),
(2, 4, 15, 10.99),
(3, 5, 8, 25.50),
(3, 1, 12, 15.99),
(4, 2, 14, 20.49),
(4, 3, 3, 35.75),
(5, 4, 25, 10.99),
(5, 5, 6, 25.50);

-- Tabla SeguimientoCarga
CREATE TABLE IF NOT EXISTS SeguimientoCarga (
    SeguimientoID INT PRIMARY KEY AUTO_INCREMENT,
    VentaID INT,
    Estado VARCHAR(50) NOT NULL,
    FechaActualizacion DATE NOT NULL,
    UbicacionActual VARCHAR(255),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID)
);

-- Insertar datos en la tabla SeguimientoCarga
INSERT INTO SeguimientoCarga (VentaID, Estado, FechaActualizacion, UbicacionActual) VALUES
(1, 'En tránsito', '2023-06-16', 'Centro de distribución'),
(2, 'Entregado', '2023-06-17', 'Almacén del cliente'),
(3, 'En preparación', '2023-06-18', 'Fábrica'),
(4, 'En tránsito', '2023-06-19', 'Centro de distribución'),
(5, 'Entregado', '2023-06-20', 'Almacén del cliente');