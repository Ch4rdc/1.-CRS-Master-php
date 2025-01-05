-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-08-2021 a las 23:22:09
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id_departamento` int(255) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id_departamento`, `nombre`) VALUES
(1, 'Desarrollo Organizacional'),
(2, 'Desarollo humano'),
(3, 'Roperia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

CREATE TABLE `hoteles` (
  `id_hotel` int(150) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`id_hotel`, `nombre`) VALUES
(1, 'Nizuc'),
(2, 'Sunrise'),
(3, 'The Grand'),
(4, 'Campo Golf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion_problema` varchar(255) NOT NULL,
  `hotel_id` int(150) NOT NULL,
  `departamento_id` int(150) NOT NULL,
  `fecha` date NOT NULL,
  `ip_usuario` varchar(20) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `descripcion_solucion` varchar(255) DEFAULT NULL,
  `usuario_id` int(150) DEFAULT NULL,
  `usuario_tickets` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `nombre`, `descripcion_problema`, `hotel_id`, `departamento_id`, `fecha`, `ip_usuario`, `estado`, `descripcion_solucion`, `usuario_id`, `usuario_tickets`) VALUES
(1, 'Carlos', 'No tengo internet', 1, 1, '2021-07-29', '127.0.0.1', 'inactivo', 'Se cambió cable UTP', 5, '2'),
(2, 'Cecilia', 'La impresora no imprime', 1, 1, '2021-07-29', '127.0.0.1', 'inactivo', 'Se instalo drivers de la impresora', 5, '3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_nombre` int(150) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `apellidos` varchar(120) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_nombre`, `nombre`, `apellidos`, `email`, `password`, `rol`) VALUES
(1, 'S_admin', 'S_admin', 'Super@admin.com', '$2y$04$zIZ2QnYwHtz8UU39RULbue8tk/ml2LJt5r7sOHdFNysBEas35is6O', 'super_admin'),
(2, 'Carlos', 'DC', 'dc@dc.com', '$2y$04$BANFggU7bp0mDOaOSQ84iuEnMG0BGgveYVKndFOFz1GejZK0nPYle', 'user'),
(3, 'Cecilia', 'SC', 'sc@sc.com', '$2y$04$m1vh6nBjBBQBjXkfRcv2h.yvTBosVFILoqKCEHlP3rVyikEAZXRby', 'user'),
(4, 'prueba', 'prueba', 'prueba@prueba.com', '$2y$04$MF.T4upX5fcHZyh43HSc9.l.3J1A5895A5t7wRv8eFArFsWFxJ0ZW', 'admin'),
(5, 'Armando', 'Dominguez', 'dom@dom.com', '$2y$04$F2r8mETCjGOd1Hk90eDsdu4yhnil0fs5LfwWI7bmcG.gTtw078TR6', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indices de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`id_hotel`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_ticket_hotel` (`hotel_id`),
  ADD KEY `fk_ticket_departamento` (`departamento_id`),
  ADD KEY `fk_ticket_usuario` (`usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_nombre`),
  ADD UNIQUE KEY `uq_email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id_departamento` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  MODIFY `id_hotel` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_nombre` int(150) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `fk_ticket_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id_departamento`),
  ADD CONSTRAINT `fk_ticket_hotel` FOREIGN KEY (`hotel_id`) REFERENCES `hoteles` (`id_hotel`),
  ADD CONSTRAINT `fk_ticket_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id_nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
