# medisistema — Base de Datos SQL

Sistema de gestión médica con consultas para análisis de pacientes, médicos, horarios, sustituciones y vacaciones.

---

## Requisitos

- MySQL 8.0 o superior
- DBeaver (u otro cliente SQL)

---

## Estructura de tablas

| Tabla | Descripción |
|---|---|
| `Empleados` | Personal del sistema (médicos, administrativos, enfermeros) |
| `Medicos` | Datos médicos vinculados a empleados |
| `Pacientes` | Pacientes asignados a cada médico |
| `Horarios` | Días y horas de consulta por médico |
| `Sustituciones` | Registro de sustituciones entre médicos |
| `Vacaciones` | Vacaciones planificadas y disfrutadas por empleado |

---

## Cómo ejecutar en DBeaver

### 1. Crear la base de datos

Abre un nuevo script SQL y ejecuta el DDL completo:

```sql
CREATE DATABASE medisistema;
USE medisistema;
-- (resto del DDL...)
```

> ⚠️ Asegúrate de que la tabla `Horarios` **no tenga** los caracteres `__` en su definición.

### 2. Insertar los datos

Ejecuta el bloque de `INSERT` para poblar todas las tablas.

### 3. Seleccionar la base de datos

En DBeaver, selecciona **medisistema** en el menú desplegable de bases de datos (esquina superior derecha del editor SQL).

### 4. Ejecutar las consultas

Coloca el cursor **dentro** de la consulta que quieres ejecutar y presiona:

```
Ctrl + Enter   →  ejecuta solo esa consulta
Alt  + X       →  alternativa en algunos sistemas
```

> ⚠️ No selecciones todo el archivo con `Ctrl + A` antes de ejecutar, ya que intentará correr todas las consultas a la vez.

---

## Consultas disponibles

| # | Descripción |
|---|---|
| 1 | Número de pacientes por médico |
| 2 | Días de vacaciones planificadas y disfrutadas por empleado |
| 3 | Médicos con más horas de consulta en la semana |
| 4 | Sustituciones realizadas por cada médico sustituto |
| 5 | Médicos actualmente en sustitución (conteo) |
| 6 | Horas de consulta por médico y día de la semana |
| 7 | Médico con más pacientes asignados |
| 8 | Empleados con más de 10 días de vacaciones disfrutadas |
| 9 | Médicos que están realizando una sustitución hoy |
| 10 | Días de vacaciones por tipo de empleado |
| 11 | Total de pacientes por tipo de médico |
| 12 | Número de sustituciones por tipo de médico |
| 13 | Total de pacientes por médico y especialidad |
| 14 | Empleados con más de 20 días de vacaciones planificadas |
| 15 | Horas de consulta por especialidad y día de la semana |

---

## Notas

- Las consultas **2, 8, 10 y 14** requieren datos en la tabla `Vacaciones`. Los inserts de ejemplo no incluyen registros en esa tabla.
- Las consultas **5 y 9** usan `CURDATE()` para mostrar sustituciones activas en el día de hoy.