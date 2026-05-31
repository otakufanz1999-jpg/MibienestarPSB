-- Active: 1706052104901@@127.0.0.1@3306@sysrepjac
CREATE DATABASE IF NOT EXISTS sysrepjac;
USE sysrepjac;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `tipo_identificacion` varchar(5) DEFAULT NULL,
  `num_identificacion` varchar(20) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `ciudad` varchar(200) DEFAULT NULL,
  `departamento` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,  
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `authorities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `authority` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_authority` (`user_id`,`authority`),
  CONSTRAINT `FK_authorities_users_usuarioId` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando estructura para tabla sysrepjac.empresas
CREATE TABLE IF NOT EXISTS empresas (
  `id_empresa`  int(11) NOT NULL AUTO_INCREMENT,
  `tipo`       varchar(255) NULL,
  `nombre`     varchar(255) NOT NULL,
  `tipo_identificacion` varchar(5) DEFAULT NULL,
  `num_identificacion` varchar(20) DEFAULT NULL,
  `ciudad`     varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `direccion`  varchar(255) DEFAULT NULL,
  `email`      varchar(255) DEFAULT NULL,
  `logo`       varchar(255) DEFAULT NULL,
  `telefono`   varchar(255) DEFAULT NULL,
  `personeria_juridica`   varchar(255) NOT NULL,
  `fec_per_juridica`   DATETIME NOT NULL,
  `norte_terr_limite`   varchar(255) NOT NULL,
  `sur_terr_limite`   varchar(255) NOT NULL,
  `oriente_terr_limite`   varchar(255) NOT NULL,
  `occidente_terr_limite`   varchar(255) NOT NULL,
  `id_afiliado_presidente` int(11) DEFAULT NULL,
  `id_afiliado_secretario` int(11) DEFAULT NULL,
  `licencia`   varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS depuraciones (
	`id_depuracion` INT(11) NOT NULL AUTO_INCREMENT,
	`id_empresa`  int(11) NOT NULL,
	`id_user` int(11) NOT NULL,
	`fecha` date DEFAULT NULL,
	PRIMARY KEY (`id_depuracion`) USING BTREE,
	CONSTRAINT `FK_depuraciones_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_depuraciones_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `afiliados` (
  `id_afiliado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `fec_afiliacion` date DEFAULT NULL,
  `tipo_identificacion` varchar(5) DEFAULT NULL,
  `num_identificacion` varchar(20) DEFAULT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `ciudad` varchar(200) DEFAULT NULL,
  `departamento` varchar(200) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ocupacion` varchar(150) DEFAULT NULL,
  `fec_nacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `comision_trabajo` varchar(150) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_depuracion` int(11) DEFAULT NULL,
  `discapacidad` varchar(150) DEFAULT NULL,
  `lgt_biq` varchar(150) DEFAULT NULL,
  `grupo_etnico` varchar(150) DEFAULT NULL,
  `huella` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_afiliado`),
  UNIQUE KEY `num_identificacion` (`num_identificacion`),
  KEY `FK_afiliado_depuracion` (`id_depuracion`),
  KEY `FK_afiliado_empresa` (`id_empresa`),
  CONSTRAINT `FK_afiliado_depuracion` FOREIGN KEY (`id_depuracion`) REFERENCES `depuraciones` (`id_depuracion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_afiliado_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

alter table empresas add KEY `FK_empresas_afiliado_presidente` (`id_afiliado_presidente`);
alter table empresas add KEY `FK_empresas_afiliado_secretario` (`id_afiliado_secretario`);
alter table empresas add CONSTRAINT `FK_empresas_afiliado_presidente` FOREIGN KEY (`id_afiliado_presidente`) REFERENCES `afiliados` (`id_afiliado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
alter table empresas add CONSTRAINT `FK_empresas_afiliado_secretario` FOREIGN KEY (`id_afiliado_secretario`) REFERENCES `afiliados` (`id_afiliado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE IF NOT EXISTS `reuniones` (
  `id_Reunion` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `departamento` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `fec_convocatoria` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Reunion`) USING BTREE,
  KEY `FK_reunion_empresa` (`id_empresa`) USING BTREE,
  CONSTRAINT `FK_reunion_empresa` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `ordendia` (
  `id_orden_dia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `texto` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`id_orden_dia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `reunionordendia` (
  `id_reunion_orden_dia` int(11) NOT NULL AUTO_INCREMENT,
  `id_orden_dia` int(11) NOT NULL,
  `id_Reunion` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id_reunion_orden_dia`),
  UNIQUE KEY `id_orden_dia_id_Reunion` (`id_orden_dia`,`id_Reunion`),
  CONSTRAINT `FKOrdenDia` FOREIGN KEY (`id_orden_dia`) REFERENCES `ordendia` (`id_orden_dia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FKReunion` FOREIGN KEY (`id_Reunion`) REFERENCES `reuniones` (`id_Reunion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Tabla para relacionar reuniones con ordenes del dia (muchos a muchos)';

-- Volcando estructura para tabla sysrepjac.actareuniones
CREATE TABLE IF NOT EXISTS `actareuniones` (
  `id_acta_reunion` int(11) NOT NULL AUTO_INCREMENT,
  `id_reunion` int(11) NOT NULL,
  `ano` int(11) NOT NULL,
  `numero_acta` int(11) DEFAULT NULL,
  `afiliados` int(11) DEFAULT 0,
  `quorum50mas1primero` int(11) DEFAULT 0,
  `inicia50mas1primero` int(11) DEFAULT 0, #--0 NO, 1 SI
  `fec50mas1primero` TIMESTAMP NULL DEFAULT NULL,
  `asistentes` int(11) DEFAULT 0,
  `id_afiliado_presidente` int(11) DEFAULT NULL,
  `id_afiliado_secretario` int(11) DEFAULT NULL,
  `aprobado_orden_dia` int(11) 0,
  PRIMARY KEY (`id_acta_reunion`) USING BTREE,
  UNIQUE KEY `ano_consecutivo` (`ano`,`numero_acta`) USING BTREE,
  KEY `FK_acta_reunion` (`id_reunion`),
  KEY `FK_acta_afiliado_presidente` (`id_afiliado_presidente`),
  KEY `FK_acta_afiliado_secretario` (`id_afiliado_secretario`),
  CONSTRAINT `FK_acta_afiliado_presidente` FOREIGN KEY (`id_afiliado_presidente`) REFERENCES `afiliados` (`id_afiliado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_acta_afiliado_secretario` FOREIGN KEY (`id_afiliado_secretario`) REFERENCES `afiliados` (`id_afiliado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_acta_reunion` FOREIGN KEY (`id_reunion`) REFERENCES `reuniones` (`id_Reunion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `actaordendia` (
  `id_acta_orden_dia` int(11) NOT NULL AUTO_INCREMENT,
  `id_acta_reunion` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `texto` varchar(1024) DEFAULT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`id_acta_orden_dia`),
  INDEX `FK_actaOrdenDia_actaReunion` (`id_acta_reunion`) USING BTREE,
  CONSTRAINT `FK_actaOrdenDia_actaReunion` FOREIGN KEY (`id_acta_reunion`) REFERENCES `actareuniones` (`id_acta_reunion`) ON UPDATE NO ACTION ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

