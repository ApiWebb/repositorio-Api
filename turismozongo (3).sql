-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2023 a las 22:00:00
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `turismozongo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id_admin` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta_turistica`
--

CREATE TABLE `ruta_turistica` (
  `id_ruta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `coord_lat` varchar(50) NOT NULL,
  `coord_long` varchar(50) NOT NULL,
  `rs_facebook` varchar(500) NOT NULL,
  `rs_whatsapp` varchar(500) NOT NULL,
  `rs_inst` varchar(500) NOT NULL,
  `thumbnail` longblob NOT NULL,
  `fotografia` longblob NOT NULL,
  `des_foto` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta_turistica_galeria`
--

CREATE TABLE `ruta_turistica_galeria` (
  `id_galeria` int(11) NOT NULL,
  `galeria` longblob NOT NULL,
  `des_galeria` varchar(500) NOT NULL,
  `ext_archivo` varchar(10) NOT NULL,
  `id_ruta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(5000) NOT NULL,
  `coord_lat` varchar(50) NOT NULL,
  `coord_long` varchar(50) NOT NULL,
  `horarios` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `rs_facebook` varchar(500) NOT NULL,
  `rs_whatsapp` varchar(500) NOT NULL,
  `rs_inst` varchar(500) NOT NULL,
  `rs_pweb` varchar(500) NOT NULL,
  `logo` longblob NOT NULL,
  `categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios_galeria`
--

CREATE TABLE `servicios_galeria` (
  `id_galeria` int(11) NOT NULL,
  `foto` longblob NOT NULL,
  `des_foto` varchar(500) NOT NULL,
  `ext_archivo` varchar(10) NOT NULL,
  `id_servicio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_turista`
--

CREATE TABLE `usuario_turista` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `paswd` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `ruta_turistica`
--
ALTER TABLE `ruta_turistica`
  ADD PRIMARY KEY (`id_ruta`);

--
-- Indices de la tabla `ruta_turistica_galeria`
--
ALTER TABLE `ruta_turistica_galeria`
  ADD PRIMARY KEY (`id_galeria`),
  ADD KEY `galeria_ruta_fk` (`id_ruta`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`);

--
-- Indices de la tabla `servicios_galeria`
--
ALTER TABLE `servicios_galeria`
  ADD PRIMARY KEY (`id_galeria`),
  ADD KEY `id_servicio` (`id_servicio`) USING BTREE;

--
-- Indices de la tabla `usuario_turista`
--
ALTER TABLE `usuario_turista`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ruta_turistica`
--
ALTER TABLE `ruta_turistica`
  MODIFY `id_ruta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ruta_turistica_galeria`
--
ALTER TABLE `ruta_turistica_galeria`
  MODIFY `id_galeria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios_galeria`
--
ALTER TABLE `servicios_galeria`
  MODIFY `id_galeria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario_turista`
--
ALTER TABLE `usuario_turista`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ruta_turistica_galeria`
--
ALTER TABLE `ruta_turistica_galeria`
  ADD CONSTRAINT `galeria_ruta_fk` FOREIGN KEY (`id_ruta`) REFERENCES `ruta_turistica` (`id_ruta`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `servicios_galeria`
--
ALTER TABLE `servicios_galeria`
  ADD CONSTRAINT `servicio_galeria_fk` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
