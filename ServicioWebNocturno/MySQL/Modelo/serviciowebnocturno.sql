-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 06-06-2020 a las 04:50:50
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `serviciowebnocturno`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `CodigoAlu` char(5) NOT NULL,
  `NombreAlu` varchar(50) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `EstadoCivil` varchar(30) NOT NULL,
  `PasUsu` varchar(20) NOT NULL,
  PRIMARY KEY (`CodigoAlu`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`CodigoAlu`, `NombreAlu`, `Ciudad`, `EstadoCivil`, `PasUsu`) VALUES
('A0001', 'Jose Perez Diaz', 'Popayan', 'Soltero', '123456'),
('A0002', 'Maria Ruiz Ruiz', 'Cali', 'Casado', '112233'),
('A0003', 'Johan Manuel Collazos', 'Medellin', 'Soltero', '333333'),
('A0004', 'Elver Galarga', 'Pasto', 'Soltero', '142536');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
CREATE TABLE IF NOT EXISTS `ciclo` (
  `Ciclo` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`Ciclo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciclo`
--

INSERT INTO `ciclo` (`Ciclo`, `Descripcion`) VALUES
(1, 'Primero'),
(2, 'Segundo'),
(3, 'Tercero'),
(4, 'Cuarto'),
(5, 'Quinto'),
(6, 'Sexto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE IF NOT EXISTS `cursos` (
  `CodigoCurso` char(6) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`CodigoCurso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`CodigoCurso`, `Descripcion`) VALUES
('C00001', 'Programacion I'),
('C00002', 'Introduccion a la Informatica'),
('C00003', 'Algoritmos'),
('C00004', 'Estructura de Datos'),
('C00005', 'Base de Datos I'),
('C00006', 'Base de Datos II'),
('C00007', 'Analisis y Diseño I'),
('C00008', 'POO I'),
('C00009', 'Desarrollo Movil'),
('C00010', 'Desarrollo Web'),
('C00011', 'Historia'),
('C00012', 'Base de Datos III'),
('C00013', 'Analisis y Diseño II'),
('C00014', 'POO II'),
('C00015', 'Desarrollo Movil Avanzado'),
('C00016', 'Desarrollo Web con BoosTrap');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

DROP TABLE IF EXISTS `registro`;
CREATE TABLE IF NOT EXISTS `registro` (
  `CodigoAlu` char(5) NOT NULL,
  `CodigoCurso` char(6) NOT NULL,
  `Ciclo` int(11) NOT NULL,
  `Promedio` int(11) NOT NULL,
  PRIMARY KEY (`CodigoAlu`,`CodigoCurso`,`Ciclo`),
  KEY `CodigoCurso` (`CodigoCurso`),
  KEY `Ciclo` (`Ciclo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`CodigoAlu`, `CodigoCurso`, `Ciclo`, `Promedio`) VALUES
('A0001', 'C00001', 1, 14),
('A0001', 'C00002', 1, 9),
('A0001', 'C00003', 1, 14),
('A0001', 'C00004', 1, 16),
('A0001', 'C00005', 1, 17),
('A0001', 'C00008', 2, 14),
('A0001', 'C00009', 2, 16),
('A0001', 'C00010', 2, 17),
('A0001', 'C00012', 2, 17),
('A0001', 'C00013', 3, 14),
('A0001', 'C00014', 3, 9),
('A0001', 'C00015', 3, 14),
('A0001', 'C00016', 3, 16),
('A0002', 'C00001', 1, 19),
('A0002', 'C00002', 1, 5),
('A0002', 'C00003', 1, 8),
('A0002', 'C00004', 1, 12),
('A0002', 'C00005', 1, 5),
('A0002', 'C00006', 1, 8),
('A0002', 'C00007', 2, 12),
('A0002', 'C00008', 2, 5),
('A0002', 'C00009', 2, 8),
('A0002', 'C00010', 2, 12),
('A0003', 'C00001', 1, 13),
('A0003', 'C00002', 1, 14),
('A0003', 'C00003', 1, 13),
('A0003', 'C00004', 1, 14),
('A0003', 'C00005', 1, 13),
('A0003', 'C00006', 2, 14),
('A0003', 'C00007', 2, 13),
('A0003', 'C00008', 2, 14),
('A0004', 'C00001', 1, 9),
('A0004', 'C00002', 1, 14),
('A0004', 'C00003', 1, 16),
('A0004', 'C00004', 1, 18),
('A0004', 'C00005', 1, 9),
('A0004', 'C00006', 1, 14),
('A0004', 'C00007', 2, 16),
('A0004', 'C00008', 2, 18),
('A0004', 'C00009', 2, 9),
('A0004', 'C00010', 2, 14),
('A0004', 'C00011', 3, 16),
('A0004', 'C00012', 3, 18);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
