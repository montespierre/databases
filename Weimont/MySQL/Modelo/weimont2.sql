-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-09-2020 a las 04:57:14
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `weimont`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `idArticulo` int(11) NOT NULL,
  `descArticulo` varchar(100) NOT NULL,
  `precioUnit` float NOT NULL,
  `cantExis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`idArticulo`, `descArticulo`, `precioUnit`, `cantExis`) VALUES
(1, 'Lapicero', 3, 50),
(2, 'Regla', 2, 40),
(3, 'Tajador', 1, 55),
(4, 'Pizarra', 40, 30),
(5, 'Mochila', 100, 40);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `det_venta`
--

CREATE TABLE `det_venta` (
  `idDet_Venta` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cant` int(11) NOT NULL,
  `precioUnit` float NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `det_venta`
--

INSERT INTO `det_venta` (`idDet_Venta`, `idVenta`, `idArticulo`, `cant`, `precioUnit`, `importe`) VALUES
(1, 1, 2, 2, 3, 6),
(2, 1, 3, 2, 1, 2),
(3, 2, 2, 5, 3, 15),
(4, 2, 1, 2, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `nomEmp` varchar(45) NOT NULL,
  `puestoEmp` varchar(45) NOT NULL,
  `telEmp` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `nomEmp`, `puestoEmp`, `telEmp`) VALUES
(1, 'Waldir Saenz', 'Vendedor', '123456789'),
(2, 'Reimond Manco', 'Vendedor', '321654987'),
(3, 'Reimond', 'Manco', '234123432'),
(4, 'Johan Sotil', 'Vendedor', '345234126'),
(5, 'Messi', 'vendedor', '234234234'),
(6, 'Machito Gomez', 'vendedor', '234234234'),
(7, 'Nolberto Solano', 'vendedor', '234234234'),
(8, 'Cesar Cueto', 'vendedor', '234234234'),
(9, 'Flavio Maestri', 'Vendedor', '234234123'),
(10, 'Carlos Valderrama', 'vendedor', '987456345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `fechaVenta` date NOT NULL,
  `horaVenta` time NOT NULL,
  `unidTotales` int(11) DEFAULT NULL,
  `subTotal` float DEFAULT NULL,
  `igv` float DEFAULT NULL,
  `imporTotal` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `idEmpleado`, `fechaVenta`, `horaVenta`, `unidTotales`, `subTotal`, `igv`, `imporTotal`) VALUES
(1, 2, '2020-05-07', '10:00:00', 5, 8, 1.44, 9.44),
(2, 1, '2020-05-06', '09:00:00', 7, 21, 3.78, 24.78);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`idArticulo`);

--
-- Indices de la tabla `det_venta`
--
ALTER TABLE `det_venta`
  ADD PRIMARY KEY (`idDet_Venta`),
  ADD KEY `fk_Det_Venta_Ventas1_idx` (`idVenta`),
  ADD KEY `fk_Det_Venta_Articulos1_idx` (`idArticulo`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `fk_Ventas_Empleados_idx` (`idEmpleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `idArticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `det_venta`
--
ALTER TABLE `det_venta`
  MODIFY `idDet_Venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `det_venta`
--
ALTER TABLE `det_venta`
  ADD CONSTRAINT `fk_Det_Venta_Articulos1` FOREIGN KEY (`idArticulo`) REFERENCES `articulos` (`idArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Det_Venta_Ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_Ventas_Empleados` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
