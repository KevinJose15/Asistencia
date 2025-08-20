-- Crear la base de datos
CREATE DATABASE sistema_educativo;

-- Usar la base de datos para crear las tablas dentro de ella
USE sistema_educativo;

-- Tabla: docentes
CREATE TABLE docentes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    telefono VARCHAR(255) NOT NULL,
    escuela VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Tabla: grupos
CREATE TABLE grupo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Tabla intermedia: docentes_grupos (ManyToMany con atributos extra)
CREATE TABLE docentes_grupos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    docente_id INT NOT NULL,
    grupo_id INT NOT NULL,
    anio INT NOT NULL,
    ciclo VARCHAR(255) NOT NULL,
    FOREIGN KEY (docente_id) REFERENCES docentes(id),
    FOREIGN KEY (grupo_id) REFERENCES grupo(id)
) ENGINE=InnoDB;

-- Tabla: roles
CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Tabla: usuarios
CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(255) NOT NULL,
    clave VARCHAR(255) NOT NULL,
    status INT NOT NULL
) ENGINE=InnoDB;

-- Tabla intermedia: usuario_rol
CREATE TABLE usuario_rol (
    usuario_id INT NOT NULL,
    rol_id INT NOT NULL,
    PRIMARY KEY (usuario_id, rol_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(id),
    FOREIGN KEY (rol_id) REFERENCES rol(id)
) ENGINE=InnoDB;