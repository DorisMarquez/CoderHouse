-- BASE DE DATOS: AGENCIA DE MARKETING 

-- REALIZADO POR: DORIS MARQUEZ  
-- PARA: PRIMERA PRE-ENTREGA, COMISION 53180 CODERHOUSE 
-- FECHA: 23 MARZO 2024

-- Creación de la base de datos
DROP DATABASE IF EXISTS agencia_marketing;
CREATE DATABASE agencia_marketing;
USE agencia_marketing;

-- Creación de la tabla clientes
CREATE TABLE clientes (
	id_cliente 			INT PRIMARY KEY AUTO_INCREMENT 
,  	nombre_cliente 		VARCHAR(100) NOT NULL
,  	email_cliente 		VARCHAR(100) UNIQUE NOT NULL
,   telefono_cliente	VARCHAR(20)
) 
COMMENT "Almacena información de los clientes";

-- Creación de la tabla campanias
CREATE TABLE campanias (
	id_campania     	INT PRIMARY KEY AUTO_INCREMENT
,  	nombre_campania 	VARCHAR(100) NOT NULL
,	fecha_inicio 		DATE NOT NULL
,	fecha_fin 	 		DATE
,   presupuesto 		DECIMAL(10,2) NOT NULL
,	id_cliente			INT NOT NULL
) 
COMMENT "Contiene los detalles de las campañas de marketing";

-- Creación de la tabla empleados
CREATE TABLE empleados (
    id_empleado 		INT PRIMARY KEY AUTO_INCREMENT
,   dni					VARCHAR(20) NOT NULL
,	nombre_empleado 	VARCHAR(100) NOT NULL
,	email_empleado		VARCHAR(100) UNIQUE NOT NULL
,	telefono_empleado	VARCHAR(20)
,   cargo 				VARCHAR(100) NOT NULL
) 
COMMENT "Registra los empleados de la agencia"; 

-- Creación de la tabla servicios
CREATE TABLE servicios (
	id_servicio 		INT PRIMARY KEY AUTO_INCREMENT   
,  	nombre_servicio 	VARCHAR(100) UNIQUE NOT NULL
,  	descripcion 		VARCHAR(255) NOT NULL
,  	tarifa 				DECIMAL(10,2) NOT NULL
) 
COMMENT "Detalla los servicios ofrecidos por la agencia";

-- Creación de la tabla intermedia asignación_empleados
CREATE TABLE asignacion_empleados (
	PRIMARY KEY (id_campania, id_empleado)
,	id_campania 		INT NOT NULL
,	id_empleado 		INT NOT NULL
) 
COMMENT "Tabla intermedia que registra los empleados asignados a cada campañas";

-- Creación de la tabla intermedia aignacion_servicios
CREATE TABLE asignacion_servicios (
	PRIMARY KEY (id_campania, id_servicio)
,   id_campania 		INT NOT NULL
,	id_servicio 		INT NOT NULL
) 
COMMENT "Tabla intermedia que registra los servicios asignados a cada campañas";

-- Agregar constraints 

-- FK id_cliente en tabla campanias
ALTER TABLE campanias
	ADD CONSTRAINT FK_campanias_clientes 
	FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente);

-- FK id_campania en tabla asignacion_empleados
ALTER TABLE asignacion_empleados
	ADD CONSTRAINT FK_asignacion_empleados_campanias 
	FOREIGN KEY (id_campania) REFERENCES campanias (id_campania);

-- FK id_empleado en tabla asignacion_empleados
ALTER TABLE asignacion_empleados
	ADD CONSTRAINT FK_asignacion_empleados_empleados 
	FOREIGN KEY (id_empleado) REFERENCES empleados (id_empleado);

-- FK id_campania en tabla asignacion_servicios
ALTER TABLE asignacion_servicios
	ADD CONSTRAINT FK_asignacion_servicios_campanias 
	FOREIGN KEY (id_campania) REFERENCES campanias (id_campania);

-- FK id_servicio en tabla asignacion_servicios
ALTER TABLE asignacion_servicios
	ADD CONSTRAINT FK_asignación_servicios_servicios 
	FOREIGN KEY (id_servicio) REFERENCES servicios (id_servicio);


