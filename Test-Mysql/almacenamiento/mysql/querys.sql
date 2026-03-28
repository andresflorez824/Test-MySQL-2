-- 1. Número de pacientes atendidos por cada médico
SELECT 
    e.nombre, e.apellido, COUNT(p.id_paciente) AS total_pacientes
FROM Medicos m
JOIN Empleados e ON m.id_empleado = e.id_empleado
LEFT JOIN Pacientes p ON m.id_medico = p.id_medico
GROUP BY m.id_medico, e.nombre, e.apellido;

-- 2. Total de días de vacaciones planificadas y disfrutadas por cada empleado
SELECT 
    e.nombre, e.apellido, v.tipo,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS total_dias
FROM Empleados e
JOIN Vacaciones v ON e.id_empleado = v.id_empleado
GROUP BY e.id_empleado, e.nombre, e.apellido, v.tipo;

-- 3. Médicos con mayor cantidad de horas de consulta en la semana
SELECT 
    e.nombre, e.apellido,
    SUM(TIMESTAMPDIFF(HOUR, h.hora_inicio, h.hora_fin)) AS total_horas_semana
FROM Medicos m
JOIN Empleados e ON m.id_empleado = e.id_empleado
JOIN Horarios h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, e.nombre, e.apellido
ORDER BY total_horas_semana DESC;

-- 4. Número de sustituciones realizadas por cada médico sustituto
SELECT 
    e.nombre, e.apellido, COUNT(s.id_sustitucion) AS total_sustituciones
FROM Sustituciones s
JOIN Medicos m ON s.id_medico_sustituto = m.id_medico
JOIN Empleados e ON m.id_empleado = e.id_empleado
GROUP BY s.id_medico_sustituto, e.nombre, e.apellido;

-- 5. Número de médicos que están actualmente en sustitución
SELECT COUNT(DISTINCT id_medico_sustituido) AS medicos_en_sustitucion
FROM Sustituciones
WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin;

-- 6. Horas totales de consulta por médico por día de la semana
SELECT 
    e.nombre, e.apellido, h.dia_semana,
    SUM(TIMESTAMPDIFF(HOUR, h.hora_inicio, h.hora_fin)) AS horas_dia
FROM Medicos m
JOIN Empleados e ON m.id_empleado = e.id_empleado
JOIN Horarios h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, e.nombre, e.apellido, h.dia_semana
ORDER BY e.apellido, h.dia_semana;

-- 7. Médico con mayor cantidad de pacientes asignados
SELECT 
    e.nombre, e.apellido, COUNT(p.id_paciente) AS total_pacientes
FROM Medicos m
JOIN Empleados e ON m.id_empleado = e.id_empleado
JOIN Pacientes p ON m.id_medico = p.id_medico
GROUP BY m.id_medico, e.nombre, e.apellido
ORDER BY total_pacientes DESC
LIMIT 1;

-- 8. Empleados con más de 10 días de vacaciones disfrutadas
SELECT 
    e.nombre, e.apellido,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS dias_disfrutados
FROM Empleados e
JOIN Vacaciones v ON e.id_empleado = v.id_empleado
WHERE v.tipo = 'disfrutada'
GROUP BY e.id_empleado, e.nombre, e.apellido
HAVING dias_disfrutados > 10;

-- 9. Médicos que actualmente están realizando una sustitución
SELECT DISTINCT
    e.nombre, e.apellido, m.especialidad, m.tipo_medico,
    s.fecha_inicio, s.fecha_fin
FROM Sustituciones s
JOIN Medicos m ON s.id_medico_sustituto = m.id_medico
JOIN Empleados e ON m.id_empleado = e.id_empleado
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;

-- 10. Total de días de vacaciones planificadas y disfrutadas por tipo de empleado
SELECT 
    e.tipo_empleado, v.tipo,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS total_dias
FROM Empleados e
JOIN Vacaciones v ON e.id_empleado = v.id_empleado
GROUP BY e.tipo_empleado, v.tipo;

-- 11. Total de pacientes por cada tipo de médico
SELECT 
    m.tipo_medico, COUNT(p.id_paciente) AS total_pacientes
FROM Medicos m
LEFT JOIN Pacientes p ON m.id_medico = p.id_medico
GROUP BY m.tipo_medico;

-- 12. Número de sustituciones por tipo de médico (del sustituto)
SELECT 
    m.tipo_medico, COUNT(s.id_sustitucion) AS total_sustituciones
FROM Sustituciones s
JOIN Medicos m ON s.id_medico_sustituto = m.id_medico
GROUP BY m.tipo_medico;

-- 13. Total de pacientes por médico y por especialidad
SELECT 
    e.nombre, e.apellido, m.especialidad,
    COUNT(p.id_paciente) AS total_pacientes
FROM Medicos m
JOIN Empleados e ON m.id_empleado = e.id_empleado
LEFT JOIN Pacientes p ON m.id_medico = p.id_medico
GROUP BY m.id_medico, e.nombre, e.apellido, m.especialidad;

-- 14. Empleados y médicos con más de 20 días de vacaciones planificadas
SELECT 
    e.nombre, e.apellido, e.tipo_empleado,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio)) AS dias_planificados
FROM Empleados e
JOIN Vacaciones v ON e.id_empleado = v.id_empleado
WHERE v.tipo = 'planificada'
GROUP BY e.id_empleado, e.nombre, e.apellido, e.tipo_empleado
HAVING dias_planificados > 20;

-- 15. Total de horas de consulta por especialidad y día de la semana
SELECT 
    m.especialidad, h.dia_semana,
    SUM(TIMESTAMPDIFF(HOUR, h.hora_inicio, h.hora_fin)) AS total_horas
FROM Medicos m
JOIN Horarios h ON m.id_medico = h.id_medico
GROUP BY m.especialidad, h.dia_semana
ORDER BY m.especialidad, h.dia_semana;