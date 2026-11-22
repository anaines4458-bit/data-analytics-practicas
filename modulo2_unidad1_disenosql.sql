create database modulo2_unidad1_disenosql;
go
use modulo2_unidad1_disenosql
create table clientes (
id_cliente int not null,
nombre varchar(100),
perfil_bio text,
fecha_registro date
)
select*from clientes

cREATE TABLE productos(
id_producto int,
descripcion varchar(255),
precio Decimal (10,2),
esta_activo varchar(5)
)
select*from productos

-- esta_activo varchar(5) , varchar por que no se va calculos aritmeticos con este dato
-- perfil_bio text, para permitir Texto largo para una breve biografía o notas
-- el resto ya el nombre de la columna ayuda a elegir el tipo de dato