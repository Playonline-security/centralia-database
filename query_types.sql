/* ===========================================================
	Comandos DDL (Data Definition Language)
   =========================================================== */

-- RENOMBRAR TABLA: cambiar el nombre de 'cliente' a 'usuario'
RENAME TABLE sede TO ubicacion_oficina;

-- ELIMINAR TABLA: eliminar la tabla 'sede' si ya no es necesaria
DROP TABLE IF EXISTS ubicacion_oficina;

-- ELIMINAR BASE DE DATOS: eliminar la base de datos Centralia
DROP DATABASE IF EXISTS centralia;

/* ===========================================================
	Comandos DML (Data Manipulation Language)
   =========================================================== */

-- INSERT: añadir datos de prueba
INSERT INTO cliente (nombre, apellido, tipo_documento, numero_documento, celular, correo) 
VALUES ('Juan', 'Pérez', 'CC', '12345678', '3001234567', 'juan.perez@mail.com');

INSERT INTO cliente (nombre, apellido, tipo_documento, numero_documento, celular, correo) 
VALUES ('Johanna', 'González', 'CC', '87654321', '3109876543', 'johanna.gonzalez@mail.com');

INSERT INTO proveedor (nombre, servicio, celular, correo)
VALUES ('Viajes XYZ', 'Transporte', '3101234567', 'contacto@viajesxyz.com');

-- INSERT: añadir un paquete turístico para la demostración
INSERT INTO paquete_turistico (destino, fecha_inicio, fecha_fin, precio, disponibilidad, fk_paquete_turistico_id_proveedor)
VALUES ('Cartagena', '2025-10-01', '2025-10-07', 1500000.00, 1, 1);

INSERT INTO paquete_turistico (destino, fecha_inicio, fecha_fin, precio, disponibilidad, fk_paquete_turistico_id_proveedor)
VALUES ('San Andrés', '2025-10-10', '2025-10-15', 3500000.00, 1, 1);

-- UPDATE: cambiar disponibilidad de un paquete
UPDATE paquete_turistico
SET disponibilidad = 0
WHERE id_paquete = 1;

-- DELETE: eliminar un cliente de prueba
DELETE FROM cliente
WHERE id_cliente = 1;

/* ===========================================================
	Comandos DCL (Data Control Language)
   =========================================================== */
   
-- Elimina el usuario 'usuario_test' si existe para evitar errores en la creación.
DROP USER IF EXISTS 'usuario_test'@'localhost';

-- Crear un usuario con permisos específicos
CREATE USER 'usuario_test'@'localhost' IDENTIFIED BY 'contraseña123';

-- Conceder permisos al usuario
GRANT SELECT, INSERT, UPDATE ON centralia.* TO 'usuario_test'@'localhost';

-- Revocar permisos
REVOKE INSERT ON centralia.* FROM 'usuario_test'@'localhost';

/* ===========================================================
	Otros comandos en MySQL
   =========================================================== */

-- Mostrar todas las bases de datos disponibles
SHOW DATABASES;

-- Seleccionar la base de datos Centralia
USE centralia;

-- Mostrar todas las tablas dentro de la base de datos actual
SHOW TABLES;

-- Ver la estructura de una tabla específica, por ejemplo 'cliente'
DESCRIBE cliente;

-- Alternativa para mostrar detalles más completos de la tabla
SHOW CREATE TABLE cliente;

-- Ejemplo de SELECT
SELECT * FROM cliente;

-- Ejemplo de SELECT con WHERE
-- Mostrar los datos de los clientes cuyo apellido sea 'González'
SELECT id_cliente, nombre, apellido, celular
FROM cliente
WHERE apellido = 'González';

-- Ejemplo de SELECT con condición sobre otra columna
-- Mostrar paquetes turísticos disponibles con precio menor a 2000000
SELECT id_paquete, destino, fecha_inicio, fecha_fin, precio
FROM paquete_turistico
WHERE disponibilidad = 1 AND precio < 2000000.00;