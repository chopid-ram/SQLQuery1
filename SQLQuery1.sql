USE ser;
GO

-- Table persona
CREATE TABLE persona (
  id_persona INT IDENTITY(1,1) NOT NULL,
  nombres VARCHAR(45) NULL,
  apellidos VARCHAR(45) NULL,
  fecha_nacimiento DATE NULL,
  numero_documento VARCHAR(45) NULL,
  tipo_documento VARCHAR(45) NULL,
  estado TINYINT NULL,
  PRIMARY KEY (id_persona)
);

-- Table usuario
CREATE TABLE usuario (
  id_usuario INT IDENTITY(1,1) NOT NULL,
  id_persona INT NOT NULL,
  email VARCHAR(45) NULL,
  password VARCHAR(45) NULL,
  rol VARCHAR(45) NULL,
  estado TINYINT NULL,
  PRIMARY KEY (id_usuario, id_persona),
  CONSTRAINT fk_usuario_persona
    FOREIGN KEY (id_persona)
    REFERENCES persona (id_persona)
);

-- Table categoria
CREATE TABLE categoria (
  id_categoria INT IDENTITY(1,1) NOT NULL,
  nombre VARCHAR(45) NULL,
  estado TINYINT NULL,
  PRIMARY KEY (id_categoria)
);

-- Table servicio
CREATE TABLE servicio (
  id_servicio INT IDENTITY(1,1) NOT NULL,
  id_categoria INT NOT NULL,
  id_persona INT NOT NULL,
  nombre VARCHAR(45) NULL,
  descripcion VARCHAR(500) NULL,
  precio FLOAT NULL,
  fecha_publicacion DATETIME NULL,
  fecha_modificacion DATETIME NULL,
  estado TINYINT NULL
  
);

-- Table chat
CREATE TABLE chat (
  id_chat INT IDENTITY(1,1) NOT NULL,
  id_servicio INT NOT NULL,
  fecha_creacion DATETIME NULL,
  estado INT NULL

);

-- Table conversacion
CREATE TABLE conversacion (
  id_conversacion INT IDENTITY(1,1) NOT NULL,
  id_persona INT NOT NULL,
  id_chat INT NOT NULL,
  fecha DATETIME NULL,
  mensaje VARCHAR(200) NULL
 
);

-- Table persona_chat
CREATE TABLE persona_chat (
  id_persona_chat INT IDENTITY(1,1) NOT NULL,
  id_persona INT NOT NULL,
  id_chat INT NOT NULL
);

-- Table calificacion
CREATE TABLE  calificacion (
  id_calificacion INT IDENTITY(1,1) NOT NULL,
  id_servicio INT NOT NULL,
  id_chat INT NOT NULL,
  porcentaje INT NULL,
  fecha DATETIME NULL,
  estado TINYINT NULL
);
