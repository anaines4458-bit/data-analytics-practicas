-- ==========================================
-- SECCIÓN 0: CREACIÓN Y SELECCIÓN DE BASE
-- ==========================================
--    CREE LA BASE VENTAS_TECH_DB Y LA ACTIVE, NO ESPECIFEQUE LOS PASOS POR QUE NO LO PIDE
-- ==========================================
--Sección 1 — DROP TABLES
-- ==========================================
--Arrancá el script eliminando las tablas si ya existen, en orden inverso a las dependencias, para no violar las foreign keys. Esto hace que el script sea repetible: lo podés correr las veces que quieras sin errores.

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
GO
-- ==========================================
-- SECCIÓN 2: CREATE TABLES
-- ==========================================
--Creá las cuatro tablas en este orden (primero las que no dependen de nadie)EN ESTE ORDEN: CATEGORIAS,CLIENTES,PRODUCTOS,VENTAS 
CREATE TABLE CATEGORIAS (
    id_categoria INT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE CLIENTES (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(50),
    fecha_registro DATE NOT NULL
);
CREATE TABLE PRODUCTOS (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    id_categoria INT FOREIGN KEY REFERENCES CATEGORIAS(id_categoria),
    precio DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    activo BIT DEFAULT 1
);
CREATE TABLE VENTAS (
    id_venta INT PRIMARY KEY,
    id_cliente INT FOREIGN KEY  REFERENCES CLIENTES(id_cliente),
    id_producto INT FOREIGN KEY REFERENCES PRODUCTOS(id_producto),
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    fecha_venta DATE NOT NULL     
);
-- ==========================================
-- SECCIÓN 3: INSERT DATA
-- ==========================================
--Cargá exactamente estos 25 registros, en este orden (primero las tablas sin dependencias). 
--las columnas van explicitadas: es buena práctica, porque si mañana alguien
--agrega una columna a la tabla tu INSERT sigue funcionando.
--3.1 INSERT DATA TABLE CATEGORIAS 

INSERT INTO categorias (id_categoria, nombre_categoria, descripcion) VALUES
  (1, 'Computación',    'Laptops, PCs y monitores'),
  (2, 'Accesorios',     'Periféricos y complementos'),
  (3, 'Audio',          'Auriculares y parlantes'),
  (4, 'Almacenamiento', 'Discos y memorias');

  --3.2 INSERT DATA TABLE clientes — 5 registros
  INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro) VALUES
  (1, 'María López',  'maria@mail.com',  'Buenos Aires', '2024-01-05'),
  (2, 'Carlos Ruiz',  'carlos@mail.com', 'Córdoba',      '2024-01-10'),
  (3, 'Ana Gómez',    'ana@mail.com',    'Rosario',      '2024-02-01'),
  (4, 'Pedro Sanz',   'pedro@mail.com',  'Mendoza',      '2024-02-15'),
  (5, 'Laura Torres', 'laura@mail.com',  'Tucumán',      '2024-03-01');

  --3.3 INSERT DATA TABLE productos — 6 registros
  INSERT INTO productos (id_producto, nombre_producto, id_categoria, precio, stock, activo) VALUES
  (1, 'Laptop Pro 15',      1, 1200.00, 15, 1),
  (2, 'Mouse Inalámbrico',  2,   28.00, 80, 1),
  (3, 'Monitor 4K 27',      1,  450.00, 12, 1),
  (4, 'Auriculares BT Pro', 3,  120.00, 35, 1),
  (5, 'SSD Externo 1TB',    4,  130.00, 18, 1),
  (6, 'Teclado Mecánico',   2,   95.00, 40, 1);

  --3.4 INSERT DATA TABLE ventas — 10 registros

  INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta) VALUES
  ( 1, 1, 1, 2, 1200.00, '2024-03-05'),
  ( 2, 2, 2, 5,   28.00, '2024-03-06'),
  ( 3, 3, 3, 1,  450.00, '2024-03-07'),
  ( 4, 1, 4, 2,  120.00, '2024-03-08'),
  ( 5, 4, 5, 3,  130.00, '2024-03-10'),
  ( 6, 2, 6, 4,   95.00, '2024-03-11'),
  ( 7, 5, 1, 1, 1200.00, '2024-03-12'),
  ( 8, 3, 2, 8,   28.00, '2024-03-13'),
  ( 9, 4, 4, 1,  120.00, '2024-03-14'),
  (10, 5, 3, 2,  450.00, '2024-03-15');

  -- ==========================================
-- SECCIÓN 4: VALIDACIÓN DE LAS 4 TABLAS
-- ==========================================

SELECT * FROM categorias;   -- esperado: 4 filas
SELECT * FROM clientes;     -- esperado: 5 filas
SELECT * FROM productos;    -- esperado: 6 filas
SELECT * FROM ventas;       -- esperado: 10 filas