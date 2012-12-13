-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-12-2012 a las 07:53:37
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `sigues_core`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE IF NOT EXISTS `grado` (
  `idgrado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `nivel_idnivel` int(11) NOT NULL,
  PRIMARY KEY (`idgrado`,`nivel_idnivel`),
  KEY `fk_grado_nivel1` (`nivel_idnivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `grado`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `idgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `grado_idgrado` int(11) NOT NULL,
  PRIMARY KEY (`idgrupo`,`grado_idgrado`),
  KEY `fk_grupo_grado` (`grado_idgrado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de grupos' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `grupo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hora`
--

CREATE TABLE IF NOT EXISTS `hora` (
  `idhora` int(11) NOT NULL AUTO_INCREMENT,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `dia` int(11) DEFAULT NULL,
  PRIMARY KEY (`idhora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `hora`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripcion`
--

CREATE TABLE IF NOT EXISTS `inscripcion` (
  `idinscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_idusuario` int(11) NOT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  `plantel_idplantel` int(11) NOT NULL,
  `periodo_idperiodo` int(11) NOT NULL,
  `turno_idturno` int(11) NOT NULL,
  PRIMARY KEY (`idinscripcion`),
  KEY `fk_inscripcion_usuario1` (`usuario_idusuario`),
  KEY `fk_inscripcion_grupo1` (`grupo_idgrupo`),
  KEY `fk_inscripcion_plantel1` (`plantel_idplantel`),
  KEY `fk_inscripcion_periodo1` (`periodo_idperiodo`),
  KEY `fk_inscripcion_turno1` (`turno_idturno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que registra las inscripciones de los alumnos a los gripos, por ciclo' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `inscripcion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE IF NOT EXISTS `materia` (
  `idmateria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idmateria`),
  KEY `fk_materia_grupo1` (`grupo_idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `materia`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_hora_plan`
--

CREATE TABLE IF NOT EXISTS `materia_hora_plan` (
  `idmateria_hora_plan` int(11) NOT NULL,
  `materia_idmateria` int(11) NOT NULL,
  `hora_idhora` int(11) NOT NULL,
  `plan_idplan` int(11) NOT NULL,
  PRIMARY KEY (`idmateria_hora_plan`),
  KEY `fk_materia_hora_plan_materia1` (`materia_idmateria`),
  KEY `fk_materia_hora_plan_hora1` (`hora_idhora`),
  KEY `fk_materia_hora_plan_plan1` (`plan_idplan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `materia_hora_plan`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

CREATE TABLE IF NOT EXISTS `nivel` (
  `idnivel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  PRIMARY KEY (`idnivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de niveles o carreras' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `nivel`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `idperfil` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `perfil`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_has_permiso`
--

CREATE TABLE IF NOT EXISTS `perfil_has_permiso` (
  `perfil_idperfil` int(11) NOT NULL,
  `permiso_permiso` int(11) NOT NULL,
  PRIMARY KEY (`perfil_idperfil`,`permiso_permiso`),
  KEY `fk_perfil_has_permiso_permiso1` (`permiso_permiso`),
  KEY `fk_perfil_has_permiso_perfil1` (`perfil_idperfil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `perfil_has_permiso`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodo`
--

CREATE TABLE IF NOT EXISTS `periodo` (
  `idperiodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePeriodo` varchar(255) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idperiodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla de periodos, ciclos escolares, semestres, cuatrimestres, cursos, etc.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `periodo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodoevaluacion`
--

CREATE TABLE IF NOT EXISTS `periodoevaluacion` (
  `idperiodoEvaluacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `mes` varchar(45) DEFAULT NULL COMMENT 'id del mes al que pertenece 1 - Enero ... 12 - Diciembre',
  PRIMARY KEY (`idperiodoEvaluacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene los periodos de evaluacion, por lo general son los meses' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `periodoevaluacion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `permiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `permiso`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE IF NOT EXISTS `plan` (
  `idplan` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `turno_idturno` int(11) NOT NULL,
  `grupo_idgrupo` int(11) NOT NULL,
  PRIMARY KEY (`idplan`),
  KEY `fk_plan_turno1` (`turno_idturno`),
  KEY `fk_plan_grupo1` (`grupo_idgrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `plan`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantel`
--

CREATE TABLE IF NOT EXISTS `plantel` (
  `idplantel` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idplantel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `plantel`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantel_has_nivel`
--

CREATE TABLE IF NOT EXISTS `plantel_has_nivel` (
  `plantel_idplantel` int(11) NOT NULL,
  `nivel_idnivel` int(11) NOT NULL,
  PRIMARY KEY (`plantel_idplantel`,`nivel_idnivel`),
  KEY `fk_plantel_has_nivel_nivel1` (`nivel_idnivel`),
  KEY `fk_plantel_has_nivel_plantel1` (`plantel_idplantel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `plantel_has_nivel`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE IF NOT EXISTS `turno` (
  `idturno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idturno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `turno`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del usuario',
  `nombre` varchar(65) DEFAULT NULL,
  `apellidoPaterno` varchar(65) DEFAULT NULL,
  `apellidoMaterno` varchar(65) DEFAULT NULL,
  `perfil` int(11) NOT NULL DEFAULT '1' COMMENT '1 - Alumno, 2 - Tutor, 3 - Maestro, 4 - Administrador, 5 - Editor',
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(65) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellidoPaterno`, `apellidoMaterno`, `perfil`, `usuario`, `contrasena`) VALUES
(1, 'admin', 'admin', 'admin', 1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'admin', 'admin', 'admin', 1, 'admin1', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_materia_hora_plan`
--

CREATE TABLE IF NOT EXISTS `usuario_has_materia_hora_plan` (
  `usuario_idusuario` int(11) NOT NULL,
  `materia_hora_plan_idmateria_hora_plan` int(11) NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`materia_hora_plan_idmateria_hora_plan`),
  KEY `fk_usuario_has_materia_hora_plan_materia_hora_plan1` (`materia_hora_plan_idmateria_hora_plan`),
  KEY `fk_usuario_has_materia_hora_plan_usuario1` (`usuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabla que contiene las incripciones de alumnos a materias y los maestros a materias';

--
-- Volcar la base de datos para la tabla `usuario_has_materia_hora_plan`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_perfil`
--

CREATE TABLE IF NOT EXISTS `usuario_has_perfil` (
  `usuario_idusuario` int(11) NOT NULL,
  `perfil_idperfil` int(11) NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`perfil_idperfil`),
  KEY `fk_usuario_has_perfil_perfil1` (`perfil_idperfil`),
  KEY `fk_usuario_has_perfil_usuario1` (`usuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `usuario_has_perfil`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_has_permiso`
--

CREATE TABLE IF NOT EXISTS `usuario_has_permiso` (
  `usuario_idusuario` int(11) NOT NULL,
  `permiso_permiso` int(11) NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`permiso_permiso`),
  KEY `fk_usuario_has_permiso_permiso1` (`permiso_permiso`),
  KEY `fk_usuario_has_permiso_usuario1` (`usuario_idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcar la base de datos para la tabla `usuario_has_permiso`
--


--
-- Filtros para las tablas descargadas (dump)
--

--
-- Filtros para la tabla `grado`
--
ALTER TABLE `grado`
  ADD CONSTRAINT `fk_grado_nivel1` FOREIGN KEY (`nivel_idnivel`) REFERENCES `nivel` (`idnivel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `fk_grupo_grado` FOREIGN KEY (`grado_idgrado`) REFERENCES `grado` (`idgrado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `inscripcion`
--
ALTER TABLE `inscripcion`
  ADD CONSTRAINT `fk_inscripcion_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_periodo1` FOREIGN KEY (`periodo_idperiodo`) REFERENCES `periodo` (`idperiodo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_plantel1` FOREIGN KEY (`plantel_idplantel`) REFERENCES `plantel` (`idplantel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_turno1` FOREIGN KEY (`turno_idturno`) REFERENCES `turno` (`idturno`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_inscripcion_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia`
--
ALTER TABLE `materia`
  ADD CONSTRAINT `fk_materia_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `materia_hora_plan`
--
ALTER TABLE `materia_hora_plan`
  ADD CONSTRAINT `fk_materia_hora_plan_hora1` FOREIGN KEY (`hora_idhora`) REFERENCES `hora` (`idhora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materia_hora_plan_materia1` FOREIGN KEY (`materia_idmateria`) REFERENCES `materia` (`idmateria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materia_hora_plan_plan1` FOREIGN KEY (`plan_idplan`) REFERENCES `plan` (`idplan`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perfil_has_permiso`
--
ALTER TABLE `perfil_has_permiso`
  ADD CONSTRAINT `fk_perfil_has_permiso_perfil1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfil_has_permiso_permiso1` FOREIGN KEY (`permiso_permiso`) REFERENCES `permiso` (`permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `fk_plan_grupo1` FOREIGN KEY (`grupo_idgrupo`) REFERENCES `grupo` (`idgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plan_turno1` FOREIGN KEY (`turno_idturno`) REFERENCES `turno` (`idturno`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `plantel_has_nivel`
--
ALTER TABLE `plantel_has_nivel`
  ADD CONSTRAINT `fk_plantel_has_nivel_nivel1` FOREIGN KEY (`nivel_idnivel`) REFERENCES `nivel` (`idnivel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_plantel_has_nivel_plantel1` FOREIGN KEY (`plantel_idplantel`) REFERENCES `plantel` (`idplantel`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_materia_hora_plan`
--
ALTER TABLE `usuario_has_materia_hora_plan`
  ADD CONSTRAINT `fk_usuario_has_materia_hora_plan_materia_hora_plan1` FOREIGN KEY (`materia_hora_plan_idmateria_hora_plan`) REFERENCES `materia_hora_plan` (`idmateria_hora_plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_materia_hora_plan_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_perfil`
--
ALTER TABLE `usuario_has_perfil`
  ADD CONSTRAINT `fk_usuario_has_perfil_perfil1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_perfil_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario_has_permiso`
--
ALTER TABLE `usuario_has_permiso`
  ADD CONSTRAINT `fk_usuario_has_permiso_permiso1` FOREIGN KEY (`permiso_permiso`) REFERENCES `permiso` (`permiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_permiso_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
