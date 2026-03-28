CREATE DATABASE medisistema;

USE medisistema;

CREATE TABLE Empleados (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    tipo_empleado ENUM('medico', 'administrativo', 'enfermero') NOT NULL,
    fecha_contratacion DATE
);

CREATE TABLE Medicos (
    id_medico INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    especialidad VARCHAR(50),
    tipo_medico ENUM('titular', 'interino', 'sustituto') NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);

CREATE TABLE Pacientes (
	id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    fecha_nacimiento DATE,
    id_medico INT,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    dia_semana ENUM('lunes','martes','miercoles','jueves','viernes') NOT NULL,
    hora_inicio TIME,
    hora_fin TIME,
    FOREIGN KEY (id_medico) REFERENCES Medicos(id_medico)
);

CREATE TABLE Sustituciones (
 id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
 id_medico_sustituido INT NOT NULL,
 id_medico_sustituto INT NOT NULL,
 fecha_inicio DATE,
 fecha_fin DATE,
 FOREIGN KEY (id_medico_sustituido) REFERENCES Medicos(id_medico),
 FOREIGN KEY (id_medico_sustituto) REFERENCES Medicos(id_medico)
);

CREATE TABLE Vacaciones (
    id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    tipo ENUM('planificada', 'disfrutada') NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id_empleado)
);