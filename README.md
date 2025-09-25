# 🌐 Centralia - Base de Datos

![MySQL](https://img.shields.io/badge/MySQL-4300C2?style=flat&logo=mysql&logoColor=white) ![SQL](https://img.shields.io/badge/SQL-00758F?style=flat&logo=sql&logoColor=white) ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)

## 📖 Descripción del proyecto
Centralia es un **sistema de gestión de información para agencias de viajes**, enfocado en la administración de:

- Clientes 🧑‍💼  
- Paquetes turísticos 🌴  
- Reservas 📅  
- Pagos 💰  
- Proveedores 🚚  
- Empleados 👩‍💼  
- Sedes 🏢  

Este repositorio contiene el **script SQL documentado**, que implementa el **modelo relacional** desarrollado a partir de la **Actividad 2 - Instrumentos de levantamiento de información y modelado de bases de datos**. En dicha actividad se realizó la **identificación del problema**, la definición de objetivos, la construcción de un cronograma y entrevistas semiestructuradas, lo que permitió definir un **modelo ER y relacional sólido**.

---

## 🗂 Contenido del repositorio
- `centralia_script.sql` 📜 : Script SQL completo con:
  - Creación de la base de datos `Centralia`.
  - Creación de tablas con llaves primarias y foráneas.
  - Restricciones de integridad (`UNIQUE`, `CHECK`) y normalización.
  - Comentarios detallados explicando cada tabla y relación.
  - Ejemplos de comandos DDL, DML y DCL.

- `docs/` 🖼 : Carpeta opcional con **diagramas ER y relacionales**.

---

## 🛠 Herramientas utilizadas
| Herramienta | Uso |
|-------------|-----|
| **DB Designer** | Modelado ER y relacional |
| **MySQL Workbench & MySQL** | Ejecución de script y manipulación de datos |
| **Git & GitHub** | Control de versiones y documentación |

---

## 🏗 Estructura de la base de datos
- **Tablas principales**: `cliente`, `proveedor`, `sede`, `empleado`, `paquete_turistico`, `reserva`, `pago`.  
- **Relaciones y llaves foráneas**: garantizan integridad referencial.  
- **Restricciones adicionales**: `UNIQUE`, `CHECK` y tipos de datos adecuados.  

---

## 🚀 Cómo ejecutar el script
1. Clonar el repositorio:  
```bash
git clone https://github.com/tu_usuario/centralia-database.git
