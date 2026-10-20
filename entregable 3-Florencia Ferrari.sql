CREATE DATABASE empresa;
use empresa;

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--Tabla categoría--
CREATE TABLE Categoria(
ID_Categoria int primary key,
Nombrecategoria VARCHAR(50) NOT NULL, 
Descripcion VARCHAR(200));

--Table clientes--
CREATE TABLE Clientes(
ID_Cliente INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
Ciudad VARCHAR(50),
Fecha_registro DATE NOT NULL);

--Tabla productos--
CREATE TABLE Productos(
ID_Productos INT PRIMARY KEY,
Nombreproducto VARCHAR(100) NOT NULL, 
ID_Categoria INT Foreign key references Categoria (ID_Categoria),
Precio decimal(10,2) not null,
stock INT DEFAULT(0),
activo BIT DEFAULT (1));
	
--Tabla Ventas--
CREATE TABLE Ventas(
ID_Ventas INT PRIMARY KEY,
ID_Cliente INT FOREIGN KEY REFERENCES Clientes(ID_Cliente),
ID_Productos INT FOREIGN KEY REFERENCES Productos(ID_Productos),
Cantidad INT NOT NULL,
PrecioUnitario DECIMAL(10,2) NOT NULL,
fechaVenta DATE NOT NULL);

--Insertar data--
INSERT INTO Categoria(ID_Categoria,Nombrecategoria,Descripcion)
VALUES 
(1,'Computacion','Laptops, PCs y monitores'),
(2,'Accesorios','Perifericos y complementarios'),
(3,'Audio','Auriculares y parlantes'),
(4,'almacenamiento','Discos y Memorias');

INSERT INTO Clientes(ID_Cliente,nombre,email,Ciudad,Fecha_registro)
VALUES
(1,'Maria Lopez','maria@mail.com','Buenos Aires','2024-01-05'),
(2,'Carlos Ruiz','Carlos@mail.com','Cordoba','2024-01-10'),
(3,'Ana Gomez','ana@mail.com','Rosario','2024-02-01'),
(4,'Pedro Sanz','pedro@mail.com','Mendoza','2024-02-15'),
(5,'Laura Torre','Laura@mail.com','Tucuman','2024-03-02');


INSERT INTO Productos(ID_Productos,Nombreproducto,ID_Categoria,Precio,stock,activo)
VALUES
(1,'laptop pro 15','1','1200','15','1'),
(2,'mouse inalambrico','2','28','80','1'),
(3,'monitor 4k 27','1','450','12','1'),
(4,'auriculares BT pro','3','120','35','1'),
(5,'SSD externo itb','4','130','18','1'),
(6,'teclado mecanico','2','95','40','1');

INSERT INTO Ventas(ID_Ventas,ID_Cliente,ID_Productos,Cantidad,PrecioUnitario,fechaVenta)
VALUES
(1,1,1,2,1200,'2024-03-05'),
(2,2,2,5,28,'2024-03-06'),
(3,3,3,1,450,'2024-03-07'),
(4,1,4,2,120,'2024-03-08'),
(5,4,5,3,130,'2024-03-10'),
(6,2,6,4,95,'2024-03-11'),
(7,5,1,1,1200,'2024-03-12'),
(8,3,2,8,28,'2024-03-13'),
(9,4,4,1,120,'2024-03-14'),
(10,5,3,2,450,'2024-03-15');

--Verificación de tablas--
SELECT * from Categoria;
SELECT * FROM Clientes;
SELECT * FROM Productos;
SELECT * FROM Ventas;

