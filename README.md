# 🌐 Centralia - Base de Datos

![MySQL](https://img.shields.io/badge/MySQL-4300C2?style=flat&logo=mysql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-00758F?style=flat&logo=sql&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

📌 Proyecto académico - Fundamentos de Bases de Datos
Corporación Universitaria Iberoamericana
Autores: Yeimy Nohemí Lozano Amaya – Jonathan Uzcátegui González

--

📖 Descripción

Centralia Database es un proyecto que implementa un modelo relacional para la agencia de viajes World Tour, diseñado con el fin de resolver problemas de gestión de datos como duplicidad de registros, pérdida de información y falta de trazabilidad.

El repositorio contiene el script SQL completo para la creación, gestión y control de la base de datos, aplicando los comandos de las principales familias de SQL:

DDL (Data Definition Language): definición de tablas, relaciones y restricciones.

DML (Data Manipulation Language): inserción, actualización y eliminación de datos.

DCL (Data Control Language): gestión de permisos y seguridad de acceso.

--

🗂️ Estructura del proyecto

/sql → Contiene el script principal con la creación de la base de datos y tablas.

/docs → Diagramas ER y relacional generados en DB Designer y Draw.io.

/examples → Consultas de ejemplo (DDL, DML y DCL) ejecutadas en MySQL Workbench.

⚙️ Requisitos

MySQL Server

MySQL Workbench

(Opcional) DB Designer
 para visualizar el modelo relacional

🚀 Instalación y uso

Clonar este repositorio:

git clone https://github.com/tu-usuario/Centralia-Database.git


Importar el script en MySQL Workbench:

Abrir MySQL Workbench.

Crear una nueva conexión.

Ejecutar el archivo centralia.sql.

Verificar la base de datos:

SHOW DATABASES;
USE centralia;
SHOW TABLES;

📊 Ejemplos de uso
Crear un cliente
INSERT INTO cliente (nombre, apellido, documento, celular, correo) 
VALUES ('María', 'López', 11223344, 3156789012, 'maria.lopez@mail.com');

Consultar paquetes disponibles
SELECT id_paquete, destino, precio 
FROM paquete_turistico 
WHERE disponibilidad = 1;

Gestionar permisos
GRANT SELECT, INSERT ON centralia.* TO 'usuario_test'@'localhost';

👨‍💻 Autores

Yeimy Nohemí Lozano Amaya

Jonathan Uzcátegui González

Docente: Wilson Joven Sarria
Programa: Fundamentos de Bases de Datos – Ingeniería de Software

📜 Licencia

Este proyecto es de carácter académico. El código y los diagramas pueden ser reutilizados con fines educativos citando la fuente.
