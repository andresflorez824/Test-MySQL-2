USE medisistema;

INSERT INTO Empleados (nombre, apellido, tipo_empleado, fecha_contratacion) VALUES
('Carlos', 'Ramirez', 'medico', '2018-03-15'),
('Laura', 'Gomez', 'medico', '2019-07-22'),
('Pedro', 'Torres', 'medico', '2020-01-10'),
('Sofia', 'Herrera', 'medico', '2017-11-05'),
('Andres', 'Lopez', 'medico', '2021-04-18'),
('Jorge', 'Salazar', 'administrativo', '2019-03-10'),
('Maria', 'Fuentes', 'enfermero', '2020-07-15');

INSERT INTO Medicos (id_empleado, especialidad, tipo_medico) VALUES
(1, 'Medicina General', 'titular'),
(2, 'Pediatria', 'titular'),
(3, 'Cardiologia', 'titular'),
(4, 'Dermatologia', 'interino'),
(5, 'Medicina General', 'sustituto');

INSERT INTO Pacientes (nombre, apellido, fecha_nacimiento, id_medico) VALUES
('Juan', 'Perez', '1985-04-12', 1),
('Marta', 'Diaz', '1990-08-23', 1),
('Roberto', 'Silva', '2010-02-15', 2),
('Antonio', 'Garcia', '1975-06-05', 3),
('Carmen', 'Jimenez', '1995-03-27', 4),
('Elena', 'Navarro', '2001-12-01', 5),
('David', 'Romero', '1970-05-20', 5);

INSERT INTO Horarios (id_medico, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'lunes', '08:00:00', '12:00:00'),
(1, 'miercoles', '08:00:00', '12:00:00'),
(2, 'martes', '09:00:00', '13:00:00'),
(3, 'lunes', '07:00:00', '12:00:00'),
(4, 'jueves', '10:00:00', '14:00:00'),
(5, 'viernes', '08:00:00', '13:00:00');

INSERT INTO Sustituciones (id_medico_sustituido, id_medico_sustituto, fecha_inicio, fecha_fin) VALUES
(1, 5, '2024-01-10', '2024-01-25'),
(2, 5, '2024-03-01', '2024-03-15'),
(3, 5, CURDATE() - INTERVAL 5 DAY, CURDATE() + INTERVAL 10 DAY),
(4, 5, '2024-06-01', '2024-06-15');