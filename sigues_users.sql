-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-12-2012 a las 07:52:06
-- Versión del servidor: 5.5.8
-- Versión de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de datos: `sigues_users`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sigues`
--

CREATE TABLE IF NOT EXISTS `sigues` (
  `idsigues` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(65) NOT NULL,
  `encryption_key` varchar(255) NOT NULL,
  `dominio` varchar(65) NOT NULL,
  `perfil` int(11) NOT NULL DEFAULT '3',
  `db_usuario` varchar(45) DEFAULT NULL,
  `db_contrasena` varchar(45) DEFAULT NULL,
  `db_base` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idsigues`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `sigues`
--

INSERT INTO `sigues` (`idsigues`, `usuario`, `contrasena`, `encryption_key`, `dominio`, `perfil`, `db_usuario`, `db_contrasena`, `db_base`) VALUES
(1, 'siguesweb', '38fdfa8526ff9c18a9e7cf44d6699fe3', '3Evawru6', 'siguesweb', 3, 'root', NULL, 'sigues_core'),
(2, 'siguesweb', '38fdfa8526ff9c18a9e7cf44d6699fe3', '3Evawru6', 'siguesweb', 3, 'root', NULL, 'sigues_core');
