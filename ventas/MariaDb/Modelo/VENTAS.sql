-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 06-02-2021 a las 03:14:32
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
-- Base de datos: `VENTAS`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CATEGORIA`
--

CREATE TABLE `CATEGORIA` (
  `idcat` int(11) NOT NULL COMMENT 'Identificador de categoría.',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre de categoría.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de categorías.';

--
-- Volcado de datos para la tabla `CATEGORIA`
--

INSERT INTO `CATEGORIA` (`idcat`, `nombre`) VALUES
(1, 'LINEA BLANCA'),
(2, 'MENAJE'),
(3, 'CAMA'),
(4, 'MUEBLES'),
(5, 'ROPA DE DAMAS'),
(6, 'ROPA DE CABALLEROS'),
(7, 'ROPA DE SEÑORITAS'),
(8, 'ROPA DE NIÑOS'),
(9, 'ROPA DE NIÑAS'),
(10, 'ELECTRODOMESTICOS'),
(11, 'COMPUTO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `DETALLE`
--

CREATE TABLE `DETALLE` (
  `iddetalle` int(11) NOT NULL COMMENT 'Identificador del detalle.',
  `idventa` int(11) NOT NULL COMMENT 'Identificador de venta.',
  `idprod` int(11) NOT NULL COMMENT 'Identificador de producto.',
  `cant` decimal(10,0) NOT NULL COMMENT 'Cantidad vendida.',
  `precio` decimal(10,2) NOT NULL COMMENT 'Precio de venta.',
  `subtotal` decimal(10,2) DEFAULT NULL COMMENT 'Subtotal de la venta.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de detalle de ventas.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADO`
--

CREATE TABLE `EMPLEADO` (
  `idemp` int(11) NOT NULL COMMENT 'Identificador del empleado.',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del empleado.',
  `apellido` varchar(50) NOT NULL COMMENT 'Apellido del empleado.',
  `email` varchar(50) NOT NULL COMMENT 'Email del empleado.',
  `telefono` varchar(20) DEFAULT NULL COMMENT 'Teléfono del empleado.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de empleados.';

--
-- Volcado de datos para la tabla `EMPLEADO`
--

INSERT INTO `EMPLEADO` (`idemp`, `nombre`, `apellido`, `email`, `telefono`) VALUES
(1001, 'CLAUDIA', 'RAMOS', 'cramos@gmail.com', NULL),
(1002, 'ANGELICA', 'TORRES', 'atorres@gmail.com', '967345634'),
(1003, 'KARLA', 'GUTIERREZ', 'kgutierrez@gmail.com', '995466783'),
(1004, 'LEONOR', 'CARRASCO', 'lcarrasco@gmail.com', '986754373');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PAGO`
--

CREATE TABLE `PAGO` (
  `idpago` int(11) NOT NULL COMMENT 'Identificador del pago.',
  `idventa` int(11) NOT NULL COMMENT 'Identificador de venta.',
  `idtipo` int(11) NOT NULL COMMENT 'Identificador del tipo de pago.',
  `detalle` varchar(100) NOT NULL COMMENT 'Descripción del pago.',
  `importe` decimal(10,2) NOT NULL COMMENT 'Importe del pago.',
  `obs` varchar(1000) NOT NULL COMMENT 'Campo para comentarios adicionales.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de pagos.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTO`
--

CREATE TABLE `PRODUCTO` (
  `idprod` int(11) NOT NULL COMMENT 'Identificador de producto.',
  `idcat` int(11) NOT NULL COMMENT 'Identificador de categoría.',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre de producto.',
  `precio` decimal(10,2) NOT NULL COMMENT 'Precio del producto.',
  `stock` int(11) NOT NULL COMMENT 'Stock del producto.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de productos.';

--
-- Volcado de datos para la tabla `PRODUCTO`
--

INSERT INTO `PRODUCTO` (`idprod`, `idcat`, `nombre`, `precio`, `stock`) VALUES
(1, 1, 'COCINA SUPER', '900.00', 456),
(2, 7, 'PANTALON', '150.00', 4567),
(3, 1, 'REFRIGERADORA', '1300.00', 690),
(4, 7, 'POLO DE VERANO', '95.00', 150),
(5, 6, 'CAMISA COLOR VERDE', '140.00', 250),
(6, 6, 'CAMISA DE CUADROS PEQUEÑOS', '140.00', 350),
(7, 6, 'PANTALON MODELO A1', '1180.00', 450),
(8, 11, 'COMPUTADORA I7', '6000.00', 100),
(12, 1, 'MICROONDAS', '400.00', 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sq_producto`
--

CREATE TABLE `sq_producto` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sq_producto`
--

INSERT INTO `sq_producto` (`next_val`) VALUES
(18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPO_PAGO`
--

CREATE TABLE `TIPO_PAGO` (
  `idtipo` int(11) NOT NULL COMMENT 'Identificador del tipo de pago.',
  `nombre` varchar(50) NOT NULL COMMENT 'Nombre del tipo de pago.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de tipos de pago.';

--
-- Volcado de datos para la tabla `TIPO_PAGO`
--

INSERT INTO `TIPO_PAGO` (`idtipo`, `nombre`) VALUES
(1, 'EFECTIVO'),
(2, 'TARJETA CREDITO'),
(3, 'TARJETA DE DEBITO'),
(4, 'CHEQUE'),
(5, 'NOTA DE CREDITO'),
(6, 'BONO EFECTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `idemp` int(11) NOT NULL COMMENT 'Identificador del empleado.',
  `usuario` varchar(20) NOT NULL COMMENT 'Cuenta de usuario asociado al empleado.',
  `clave` varchar(40) NOT NULL COMMENT 'Clave del usuario.',
  `estado` decimal(2,0) NOT NULL COMMENT 'Estado del usuario: 1 - Activo 0 - Inactivo'
) ;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`idemp`, `usuario`, `clave`, `estado`) VALUES
(1002, 'atorres', '38ea2969155dc3b534271971753347a680ca572e', '1'),
(1003, 'kgutierrez', 'f92e29bc0f5dce40d7045a1fc3fa5495612c1093', '1'),
(1004, 'lcarrasco', 'ed4b248ce0d0bd5158df63ad7ad1351009a9e3dd', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VENTA`
--

CREATE TABLE `VENTA` (
  `idventa` int(11) NOT NULL COMMENT 'Identificador de venta.',
  `idemp` int(11) NOT NULL COMMENT 'Identificador del empleado.',
  `cliente` varchar(100) NOT NULL COMMENT 'Nombre del cliente.',
  `fecha` date NOT NULL COMMENT 'Fecha de venta.',
  `importe` decimal(10,2) NOT NULL COMMENT 'Importe de la venta.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabla de ventas.';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CATEGORIA`
--
ALTER TABLE `CATEGORIA`
  ADD PRIMARY KEY (`idcat`);

--
-- Indices de la tabla `DETALLE`
--
ALTER TABLE `DETALLE`
  ADD PRIMARY KEY (`iddetalle`),
  ADD UNIQUE KEY `U_DETALLE` (`idventa`,`idprod`),
  ADD KEY `FK_DETALLE_PRODUCTO` (`idprod`);

--
-- Indices de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD PRIMARY KEY (`idemp`);

--
-- Indices de la tabla `PAGO`
--
ALTER TABLE `PAGO`
  ADD PRIMARY KEY (`idpago`),
  ADD UNIQUE KEY `U_PAGO_UNIQUE` (`idventa`,`idtipo`),
  ADD KEY `FK_PAGO_TIPO_PAGO` (`idtipo`);

--
-- Indices de la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD PRIMARY KEY (`idprod`),
  ADD KEY `FK_PRODUCTO_CATEGORIA` (`idcat`);

--
-- Indices de la tabla `TIPO_PAGO`
--
ALTER TABLE `TIPO_PAGO`
  ADD PRIMARY KEY (`idtipo`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`idemp`);

--
-- Indices de la tabla `VENTA`
--
ALTER TABLE `VENTA`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `FK_VENTA_USUARIO` (`idemp`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `DETALLE`
--
ALTER TABLE `DETALLE`
  MODIFY `iddetalle` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del detalle.';

--
-- AUTO_INCREMENT de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  MODIFY `idemp` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del empleado.', AUTO_INCREMENT=1005;

--
-- AUTO_INCREMENT de la tabla `PAGO`
--
ALTER TABLE `PAGO`
  MODIFY `idpago` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del pago.';

--
-- AUTO_INCREMENT de la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  MODIFY `idprod` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de producto.', AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `VENTA`
--
ALTER TABLE `VENTA`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de venta.';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `DETALLE`
--
ALTER TABLE `DETALLE`
  ADD CONSTRAINT `FK_DETALLE_PRODUCTO` FOREIGN KEY (`idprod`) REFERENCES `PRODUCTO` (`idprod`),
  ADD CONSTRAINT `FK_DETALLE_VENTA` FOREIGN KEY (`idventa`) REFERENCES `VENTA` (`idventa`);

--
-- Filtros para la tabla `PAGO`
--
ALTER TABLE `PAGO`
  ADD CONSTRAINT `FK_PAGO_TIPO_PAGO` FOREIGN KEY (`idtipo`) REFERENCES `TIPO_PAGO` (`idtipo`),
  ADD CONSTRAINT `FK_PAGO_VENTA` FOREIGN KEY (`idventa`) REFERENCES `VENTA` (`idventa`);

--
-- Filtros para la tabla `PRODUCTO`
--
ALTER TABLE `PRODUCTO`
  ADD CONSTRAINT `FK_PRODUCTO_CATEGORIA` FOREIGN KEY (`idcat`) REFERENCES `CATEGORIA` (`idcat`);

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD CONSTRAINT `fk_usuario_empleado` FOREIGN KEY (`idemp`) REFERENCES `EMPLEADO` (`idemp`);

--
-- Filtros para la tabla `VENTA`
--
ALTER TABLE `VENTA`
  ADD CONSTRAINT `FK_VENTA_USUARIO` FOREIGN KEY (`idemp`) REFERENCES `USUARIO` (`idemp`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
