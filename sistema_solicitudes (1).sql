-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-03-2026 a las 23:01:25
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_solicitudes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `accion` varchar(50) NOT NULL,
  `id_solicitud` int(11) DEFAULT NULL,
  `detalle` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `usuario`, `accion`, `id_solicitud`, `detalle`, `fecha`) VALUES
(1, 'Administrador del Sistema', 'crear_solicitud', 21, NULL, '2026-03-12 15:09:57'),
(2, 'Administrador del Sistema', 'asignar', 21, 'asignado a: Ilder Antonio Lopez Asprilla', '2026-03-12 15:10:33'),
(3, 'Administrador del Sistema', 'eliminar', 21, NULL, '2026-03-12 15:10:55'),
(5, 'Ilder Antonio Lopez Asprilla', 'asignar', 9, 'asignado a: Ilder Antonio Lopez Asprilla', '2026-03-12 16:26:06'),
(6, 'Ilder Antonio Lopez Asprilla', 'asignar', 7, 'asignado a: Ilder Antonio Lopez Asprilla', '2026-03-12 16:26:07'),
(7, 'Sistema', 'editar_estado', 9, 'nuevo estado: en proceso', '2026-03-12 16:26:15'),
(8, 'Sistema', 'editar_estado', 9, 'nuevo estado: pendiente', '2026-03-12 16:26:18'),
(9, 'Sistema', 'editar_estado', 9, 'nuevo estado: en proceso', '2026-03-12 16:26:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

CREATE TABLE `solicitudes` (
  `id` int(255) NOT NULL,
  `cliente` varchar(500) NOT NULL,
  `persona_reporta` varchar(255) NOT NULL,
  `tipo_soporte` varchar(500) NOT NULL,
  `descripcion` text NOT NULL,
  `prioridad` varchar(100) NOT NULL,
  `fecha_reporte` datetime NOT NULL,
  `fecha_resuelto` datetime DEFAULT NULL,
  `fecha_asignado` datetime DEFAULT NULL,
  `asignado_a` varchar(255) DEFAULT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `solicitudes`
--

INSERT INTO `solicitudes` (`id`, `cliente`, `persona_reporta`, `tipo_soporte`, `descripcion`, `prioridad`, `fecha_reporte`, `fecha_resuelto`, `fecha_asignado`, `asignado_a`, `estado`) VALUES
(1, 'Supermercado Éxito', 'Administrador del Sistema', 'Software', 'Error en el módulo de inventarios', 'Alta', '2026-03-11 08:00:00', NULL, NULL, NULL, 'pendiente'),
(2, 'Clínica Salud Total', 'Administrador del Sistema', 'Hardware', 'Impresora térmica no imprime recibos', 'Media', '2026-03-11 08:30:00', NULL, NULL, NULL, 'pendiente'),
(3, 'Restaurante El Sabor', 'Administrador del Sistema', 'Otro', 'Asesoría técnica sobre nueva red', 'Baja', '2026-03-11 09:00:00', NULL, NULL, NULL, 'pendiente'),
(4, 'Banco Davivienda', 'Administrador del Sistema', 'Software', 'Actualización de parches de seguridad', 'Alta', '2026-03-11 09:15:00', NULL, NULL, NULL, 'pendiente'),
(5, 'Tienda Ara', 'Administrador del Sistema', 'Hardware', 'Monitor parpadea constantemente', 'Baja', '2026-03-11 09:45:00', NULL, NULL, NULL, 'pendiente'),
(6, 'Colegio San José', 'Administrador del Sistema', 'Software', 'No se pueden subir notas al portal', 'Media', '2026-03-11 10:00:00', NULL, NULL, NULL, 'pendiente'),
(7, 'Droguería Inglesa', 'Administrador del Sistema', 'Otro', 'Mantenimiento preventivo de racks', 'Baja', '2026-03-11 10:30:00', NULL, NULL, 'Ilder Antonio Lopez Asprilla', 'pendiente'),
(8, 'Almacenes Tierra Santa', 'Administrador del Sistema', 'Software', 'Error crítico al procesar pagos', 'Alta', '2026-03-11 11:00:00', NULL, NULL, NULL, 'pendiente'),
(9, 'Papelería El Lápiz', 'Administrador del Sistema', 'Hardware', 'Teclado y mouse no responden', 'Baja', '2026-03-11 11:15:00', '2026-03-12 09:16:46', NULL, 'Ilder Antonio Lopez Asprilla', 'en proceso'),
(10, 'Hotel La Riviera', 'Administrador del Sistema', 'Otro', 'Configuración de repetidores Wi-Fi', 'Media', '2026-03-11 11:45:00', '2026-03-11 16:39:59', NULL, 'Ilder', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(255) NOT NULL,
  `tipo` smallint(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `tipo`, `nombre`, `usuario`, `password`) VALUES
(3, 2, 'Antonio Asprilla', 'anto', '$2b$10$6UDo5PfxXbaB94bs5uAaAOgzN0cgqz9IoOs.3X8BRRyLIiB/L84ze'),
(4, 1, 'Administrador del Sistema', 'admin', '$2b$10$fLxTD5VxPE3E76LOtslhkOQbSAfbUlTB0t9/idohNcghm3wY/7KqK'),
(5, 2, 'Ilder Antonio Lopez Asprilla', 'Ilder15', '$2b$10$EdVXHA4pJa6lg9N4GtcRp.VSjL0Cvv3.wNd3tV6YBrQN5E/k6Kg52'),
(6, 2, 'Ilder', 'ilder', '$2b$10$gGQHnO4GaGwBQc6qT4FmWOw1VXph9CZlu8X8MXUn92Upgw/8zheoK');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resuelto_por` (`asignado_a`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `solicitudes`
--
ALTER TABLE `solicitudes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
