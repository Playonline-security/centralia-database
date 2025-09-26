/* ===========================================================
   PROYECTO: Centralia
   AUTOR: Jonathan Uzcátegui González
   FECHA: 25 de Septiembre de 2025
   DESCRIPCIÓN: Script de creación de base de datos, tablas y
   relaciones con documentación detallada.
   =========================================================== */

-- Crear la base de datos del proyecto Centralia si no existe
CREATE DATABASE IF NOT EXISTS `centralia`;

-- Seleccionar la base de datos Centralia
USE `centralia`;

/* -----------------------------------------------------------
   Tabla CLIENTE:
   Almacena la información de los clientes que realizan reservas.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `cliente` (
	`id_cliente` int AUTO_INCREMENT NOT NULL UNIQUE,  -- Identificador único de cada cliente (PK)
	`nombre` varchar(255) NOT NULL,                  -- Nombre del cliente
	`apellido` varchar(255) NOT NULL,                -- Apellido del cliente
	`documento` bigint NOT NULL UNIQUE,                 -- Documento único de identificación
	`celular` bigint NOT NULL,                          -- Número de celular del cliente
	`correo` varchar(255) NOT NULL UNIQUE,           -- Correo electrónico único
	PRIMARY KEY (`id_cliente`)                       -- Definición de la clave primaria
);

/* -----------------------------------------------------------
   Tabla PROVEEDOR:
   Contiene los proveedores de los paquetes turísticos.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `proveedor` (
	`id_proveedor` int AUTO_INCREMENT NOT NULL UNIQUE,  -- Identificador único del proveedor (PK)
	`nombre` varchar(255) NOT NULL,                    -- Nombre del proveedor
	`servicio` varchar(255) NOT NULL,                  -- Tipo de servicio ofrecido (ej: transporte, hospedaje)
	`celular` bigint NOT NULL,                            -- Teléfono de contacto
	`correo` varchar(255) NOT NULL UNIQUE,             -- Correo electrónico único
	PRIMARY KEY (`id_proveedor`)
);

/* -----------------------------------------------------------
   Tabla SEDE:
   Representa las oficinas o sucursales de la agencia.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `sede` (
	`id_sede` int AUTO_INCREMENT NOT NULL UNIQUE,  -- Identificador de la sede (PK)
	`direccion` varchar(255) NOT NULL,             -- Dirección física de la sede
	`ciudad` varchar(255) NOT NULL,                -- Ciudad donde se ubica la sede
	PRIMARY KEY (`id_sede`)
);

/* -----------------------------------------------------------
   Tabla EMPLEADO:
   Guarda los datos de los empleados que atienden reservas.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `empleado` (
	`id_empleado` int AUTO_INCREMENT NOT NULL UNIQUE,  -- Identificador del empleado (PK)
	`nombre` varchar(255) NOT NULL,                   -- Nombre del empleado
	`apellido` varchar(255) NOT NULL,                 -- Apellido del empleado
	`cargo` varchar(255) NOT NULL,                    -- Cargo del empleado (ej: asesor, administrador)
	`celular` bigint NOT NULL,                           -- Número de contacto
	`correo` varchar(255) NOT NULL UNIQUE,            -- Correo único
	`fk_empleado_id_sede` int NOT NULL,               -- Relación con la sede donde trabaja
	PRIMARY KEY (`id_empleado`)
);

/* -----------------------------------------------------------
   Tabla PAQUETE_TURISTICO:
   Define los paquetes turísticos ofrecidos.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `paquete_turistico` (
	`id_paquete` int AUTO_INCREMENT NOT NULL UNIQUE,      -- Identificador único del paquete (PK)
	`destino` varchar(255) NOT NULL,                     -- Destino del viaje
	`fecha_inicio` date NOT NULL,                        -- Fecha de inicio del paquete
	`fecha_fin` date NOT NULL,                           -- Fecha de fin del paquete
	`precio` decimal(10,0) NOT NULL,                     -- Precio total
	`disponibilidad` BOOLEAN NOT NULL CHECK (`disponibilidad` IN (0,1)), -- Disponibilidad (1=disponible, 0=no)
	`fk_paquete_turistico_id_proveedor` int NOT NULL,    -- Relación con proveedor
	PRIMARY KEY (`id_paquete`)
);

/* -----------------------------------------------------------
   Tabla RESERVA:
   Relaciona clientes, paquetes y empleados.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `reserva` (
	`id_reserva` int AUTO_INCREMENT NOT NULL UNIQUE,  -- Identificador de la reserva (PK)
	`fecha_reserva` date NOT NULL,                   -- Fecha en la que se hizo la reserva
	`estado` BOOLEAN NOT NULL CHECK (`estado` IN (0,1)), -- Estado (1=activa, 0=cancelada)
	`fk_reserva_id_cliente` int NOT NULL,            -- Relación con cliente
	`fk_reserva_id_paquete` int NOT NULL,            -- Relación con paquete turístico
	`fk_reserva_id_empleado` int NOT NULL,           -- Relación con empleado que gestionó
	PRIMARY KEY (`id_reserva`)
);

/* -----------------------------------------------------------
   Tabla PAGO:
   Contiene los pagos realizados por cada reserva.
   ----------------------------------------------------------- */
CREATE TABLE IF NOT EXISTS `pago` (
	`id_pago` int AUTO_INCREMENT NOT NULL UNIQUE,    -- Identificador del pago (PK)
	`monto` decimal(10,0) NOT NULL,                  -- Valor del pago
	`fecha_pago` date NOT NULL,                      -- Fecha en que se realizó el pago
	`medio_pago` varchar(255) NOT NULL,              -- Medio de pago (ej: tarjeta, efectivo)
	`fk_pago_id_reserva` int NOT NULL,               -- Relación con reserva
	PRIMARY KEY (`id_pago`)
);

/* ===========================================================
   DEFINICIÓN DE LLAVES FORÁNEAS
   =========================================================== */

/* Relación: paquete turístico → proveedor */
ALTER TABLE `paquete_turistico`
  ADD CONSTRAINT `fk_paquete_proveedor`
  FOREIGN KEY (`fk_paquete_turistico_id_proveedor`) REFERENCES `proveedor`(`id_proveedor`);

/* Relación: reserva → cliente */
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_cliente`
  FOREIGN KEY (`fk_reserva_id_cliente`) REFERENCES `cliente`(`id_cliente`);

/* Relación: reserva → paquete turístico */
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_paquete`
  FOREIGN KEY (`fk_reserva_id_paquete`) REFERENCES `paquete_turistico`(`id_paquete`);

/* Relación: reserva → empleado */
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_reserva_empleado`
  FOREIGN KEY (`fk_reserva_id_empleado`) REFERENCES `empleado`(`id_empleado`);

/* Relación: pago → reserva */
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_reserva`
  FOREIGN KEY (`fk_pago_id_reserva`) REFERENCES `reserva`(`id_reserva`);

/* Relación: empleado → sede */
ALTER TABLE `empleado`
  ADD CONSTRAINT `fk_empleado_sede`
  FOREIGN KEY (`fk_empleado_id_sede`) REFERENCES `sede`(`id_sede`);
