-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2022 a las 22:20:17
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fpslapaz6`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivos`
--

CREATE TABLE `archivos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tamanio1` decimal(20,2) DEFAULT NULL,
  `tamanio` int(11) DEFAULT NULL,
  `archivotable_id` bigint(20) UNSIGNED NOT NULL,
  `archivotable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `categoria_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marca` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `modelo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chofer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asignado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cars`
--

INSERT INTO `cars` (`id`, `codigo`, `descripcion`, `fechaingreso`, `tipo`, `estado`, `marca`, `modelo`, `placa`, `chofer`, `asignado`, `status`, `url`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 'FPS-010340', 'AMBULANCIA TOYOTA COLOR BLANCO MODELO LAND CRUISER AÑO 2009 MOTOR 1FZ-0798824 CHASIS JTERJ71J800004247 COMBUSTIBLE GASOLINA', '2018-03-13', 'Ambulancia', 'regular', 'TOYOTA', '2009', ' 4728 IEF', 'Marco Antonio Yanarico Villegas', 'RUAT, SOAT 2022, Minuta de Transferencia, Inspección vehicular 2021, todos en fotocopia simple', 'activo', NULL, '', NULL, NULL),
(2, 'FPS-004011', 'CAMIONETA TOYOTA MOD:HILUX CHASIS:MR0FX22G6F1129392 MOTOR:2TR7805083 TRACCIÓN:4X4 PLOMO OSCURO AÑO:2015 PLACA:4105ULP C.C.2694', '2015-12-18', 'Camioneta', 'regular', 'TOYOTA', '2015', '4105 ULP', 'Marco Antonio Yanarico Villegas', 'RUAT, SOAT 2022, Inspeccion vehícular 2021, todos  en fotocopia simple', 'activo', NULL, NULL, NULL, NULL),
(3, 'FPS-004014', 'CAMIONETA TOYOTA MOD:HILUX CHASIS:MR0FX22G0E1106012 MOTOR:2TR7608431 TRACCIÓN:4X4 PLATA METAL AÑO:2014 PLACA:3455SLG C.C.2694', '2013-12-26', 'Camioneta', 'regular', 'TOYOTA', '2014', '3455 SLG', 'Dennis Oscar Alvarez', 'RUAT, SOAT 2022, Inspeccion vehícular 2021, todos  en fotocopia simple', 'activo', NULL, NULL, NULL, NULL),
(4, 'FPS-009972', 'CAMIONETA TOYOTA  MOD:HILUX 4538CHASIS:8AJFX8CD8J1967226 MOTOR:2TRA296725 TRACCIÓN:4X4 (DOBLE) PLATA METAL  AÑO:2018 PLACA: 4538 ACR C.C.2695', '2017-09-13', 'Camioneta', 'regular', 'TOYOTA', '2018', '4538 ACR', 'Rosmery Julia Santalla Acarapi', 'RUAT, SOAT 2022, Inspeccion vehícular 2021, todos  en fotocopia simple', 'activo', NULL, NULL, NULL, NULL),
(5, '00000', 'CAMIONETA NISSAN FRONTIER, CUATRO PUERTAS COLOR BLANCO', '2012-05-29', 'Camioneta', 'regular', 'NISSAN', '2007', '1687 KYR', 'Agustín Huanca Alcalá', 'RUAT, Inspeccion vehícular 2021, todos  en fotocopia simple', 'activo', NULL, 'Como propietario está Aministradora Boliviana de Carreteras ABC. Asimismo  la Oficina Central en 2019 no tenía espacio físico para el parqueo, por este motivo acude al parqueo de la Departamental de La Paz y en su momento se hizo la solicitud de transfere', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'PROYECTO A DISEÑO FINAL', NULL, NULL),
(2, 'CONTRATO', NULL, NULL),
(3, 'ACTA DE CIERRE', NULL, NULL),
(4, 'INSTITUCIONAL', NULL, NULL),
(5, 'CAPACITACION VIDEOS', NULL, NULL),
(6, 'CONVENIOS', NULL, NULL),
(7, 'PROGRAMAS', NULL, NULL),
(8, 'VARIOS', NULL, NULL),
(9, 'SIN CATEGORIA', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigos`
--

CREATE TABLE `codigos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `codigos`
--

INSERT INTO `codigos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'FPS-02-0005724', '2022-02-01 10:35:23', '2022-02-01 10:35:23'),
(2, 'FPS-02-0005679', '2022-02-01 10:41:31', '2022-02-01 10:41:31'),
(3, 'FPS-02-0005945', '2022-02-03 13:29:04', '2022-02-03 13:29:04'),
(4, 'FPS-02-0005941', '2022-02-03 13:29:20', '2022-02-03 13:29:20'),
(5, 'FPS-02-0005912', '2022-02-03 13:29:49', '2022-02-03 13:29:49'),
(6, 'FPS-02-0005910', '2022-02-03 13:29:58', '2022-02-03 13:29:58'),
(7, 'FPS-02-0005911', '2022-02-03 13:30:07', '2022-02-03 13:30:07'),
(8, 'FPS-02-0005908', '2022-02-03 13:30:27', '2022-02-03 13:30:27'),
(9, 'FPS-02-0005909', '2022-02-03 13:30:37', '2022-02-03 13:30:37'),
(10, 'FPS-02-0005940', '2022-02-03 13:31:15', '2022-02-03 13:31:15'),
(11, 'FPS-02-0005928', '2022-02-03 13:31:32', '2022-02-03 13:31:32'),
(12, 'FPS-02-0005937', '2022-02-03 13:31:45', '2022-02-03 13:31:45'),
(13, 'FPS-02-0005939', '2022-02-03 13:31:58', '2022-02-03 13:31:58'),
(14, 'FPS-02-0005946', '2022-02-03 13:33:43', '2022-02-03 13:33:43'),
(15, 'FPS-02-00004594', '2022-02-14 12:08:55', '2022-02-14 12:08:55'),
(16, 'FPS-02-00004578', '2022-02-21 10:43:51', '2022-02-21 10:43:51'),
(17, 'FPS-02-00005943', '2022-02-21 10:47:57', '2022-02-21 10:47:57'),
(18, 'FPS-02-00005734', '2022-02-23 08:41:07', '2022-02-23 08:41:07'),
(19, 'FPS-02-00005679', '2022-02-23 11:46:41', '2022-02-23 11:46:41'),
(20, 'FPS-05-00005248', '2022-03-07 11:38:46', '2022-03-07 11:38:46'),
(21, 'FPS-05-00005249', '2022-03-07 11:38:59', '2022-03-07 11:38:59'),
(22, 'FPS-05-00005250', '2022-03-07 11:39:09', '2022-03-07 11:39:09'),
(23, 'FPS-02-00005928', '2022-03-11 09:52:53', '2022-03-11 09:52:53'),
(24, 'FPS-0200005937', '2022-03-11 11:28:23', '2022-03-11 11:28:23'),
(25, 'FPS-02-00005937', '2022-03-11 11:28:45', '2022-03-11 11:28:45'),
(26, 'FPS-02-00005939', '2022-03-15 11:39:24', '2022-03-15 11:39:24'),
(27, 'FPS-08-00004592', '2022-03-22 11:16:05', '2022-03-22 11:16:05'),
(28, 'FPS-02-00005950', '2022-04-04 10:07:53', '2022-04-04 10:07:53'),
(29, 'FPS-02-00005940', '2022-04-11 10:31:03', '2022-04-11 10:31:03'),
(30, 'FPS-02-00005946', '2022-04-11 10:31:26', '2022-04-11 10:31:26'),
(31, 'FPS-02-00005726', '2022-04-12 11:29:15', '2022-04-12 11:29:15'),
(32, '4118712', '2022-04-12 11:34:38', '2022-04-12 11:34:38'),
(33, 'FPS-02-00005951', '2022-04-19 09:23:08', '2022-04-19 09:23:08'),
(34, 'FPS-02-00004590', '2022-04-21 11:11:59', '2022-04-21 11:11:59'),
(35, 'FPS-02-00005697', '2022-04-22 10:49:36', '2022-04-22 10:49:36'),
(36, 'FPS-02-00005701', '2022-04-22 10:50:02', '2022-04-22 10:50:02'),
(37, 'FPS-02-00005724', '2022-04-25 10:11:49', '2022-04-25 10:11:49'),
(38, 'FPS-02-00005952', '2022-05-03 09:20:52', '2022-05-03 09:20:52'),
(39, 'FPS-02-00005731', '2022-05-09 09:01:29', '2022-05-09 09:01:29'),
(40, 'FPS-02-00005908', '2022-05-17 10:26:30', '2022-05-17 10:26:30'),
(41, 'FPS-02-00005912', '2022-05-17 12:18:25', '2022-05-17 12:18:25'),
(42, 'FPS-02-00005911', '2022-05-17 12:18:38', '2022-05-17 12:18:38'),
(43, 'FPS-02-00005910', '2022-05-17 12:18:51', '2022-05-17 12:18:51'),
(44, 'FPS-02-00005909', '2022-05-17 12:20:22', '2022-05-17 12:20:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `codigo_proyecto`
--

CREATE TABLE `codigo_proyecto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `codigo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `codigo_proyecto`
--

INSERT INTO `codigo_proyecto` (`id`, `proyecto_id`, `codigo_id`, `created_at`, `updated_at`) VALUES
(1, 117, 1, NULL, NULL),
(2, NULL, 2, NULL, NULL),
(3, 119, 2, NULL, NULL),
(4, 116, 3, NULL, NULL),
(5, 116, 4, NULL, NULL),
(6, 115, 5, NULL, NULL),
(7, 115, 6, NULL, NULL),
(8, 115, 7, NULL, NULL),
(9, 114, 8, NULL, NULL),
(10, 114, 9, NULL, NULL),
(11, 113, 10, NULL, NULL),
(12, 112, 11, NULL, NULL),
(13, 111, 12, NULL, NULL),
(14, 110, 13, NULL, NULL),
(15, 108, 1, NULL, NULL),
(16, 107, 14, NULL, NULL),
(17, 106, 3, NULL, NULL),
(18, 120, 15, NULL, NULL),
(19, 121, 16, NULL, NULL),
(20, NULL, 17, NULL, NULL),
(21, 123, 18, NULL, NULL),
(22, 124, 19, NULL, NULL),
(23, 125, 16, NULL, NULL),
(24, 126, 16, NULL, NULL),
(25, 127, 20, NULL, NULL),
(26, 127, 21, NULL, NULL),
(27, 127, 22, NULL, NULL),
(28, 128, 23, NULL, NULL),
(30, 129, 25, NULL, NULL),
(31, 130, 23, NULL, NULL),
(32, 131, 26, NULL, NULL),
(33, 132, 27, NULL, NULL),
(34, 133, 17, NULL, NULL),
(35, 134, 28, NULL, NULL),
(36, 135, 2, NULL, NULL),
(37, 136, 29, NULL, NULL),
(38, 136, 30, NULL, NULL),
(39, 137, 28, NULL, NULL),
(40, 138, 28, NULL, NULL),
(41, 139, 31, NULL, NULL),
(43, 140, 28, NULL, NULL),
(44, 141, 29, NULL, NULL),
(45, 141, 30, NULL, NULL),
(46, 142, 33, NULL, NULL),
(47, 143, 34, NULL, NULL),
(48, 144, 35, NULL, NULL),
(49, 144, 36, NULL, NULL),
(50, 145, 37, NULL, NULL),
(51, 146, 33, NULL, NULL),
(52, 146, 38, NULL, NULL),
(53, 147, 38, NULL, NULL),
(54, 148, 39, NULL, NULL),
(55, 149, 27, NULL, NULL),
(56, 150, 40, NULL, NULL),
(58, 151, 41, NULL, NULL),
(59, 151, 42, NULL, NULL),
(60, 151, 43, NULL, NULL),
(61, 150, 44, NULL, NULL),
(62, 152, 17, NULL, NULL),
(63, 153, 18, NULL, NULL),
(64, 154, 39, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contratos`
--

CREATE TABLE `contratos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigos` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seguimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `programa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaini` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `plus` int(11) DEFAULT NULL,
  `montobs` decimal(10,2) DEFAULT NULL,
  `montosus` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proyecto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `contratos`
--

INSERT INTO `contratos` (`id`, `nombre`, `codigos`, `departamento`, `seguimiento`, `programa`, `numero`, `fechaini`, `fechafin`, `duracion`, `plus`, `montobs`, `montosus`, `status`, `observacion`, `proyecto_id`, `created_at`, `updated_at`) VALUES
(6, 'ACOMPA?AMIENTO Y ATI. SIST. RIEGO COM. VILAQUE (STGO. DE CALLAPA)', NULL, NULL, 'FPS/GDLP/MI RIEGO', NULL, '01-2022', NULL, NULL, 0, 90, '0.00', NULL, 'VIGENTE', NULL, 104, '2022-05-30 20:19:21', '2022-05-30 20:19:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cvs`
--

CREATE TABLE `cvs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `persona_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'ORURO', NULL, NULL),
(2, 'LA PAZ', NULL, NULL),
(3, 'POTOSI', NULL, NULL),
(4, 'COCHABAMBA', NULL, NULL),
(5, 'SANTA CRUZ', NULL, NULL),
(6, 'BENI', NULL, NULL),
(7, 'PANDO', NULL, NULL),
(8, 'CHUQUISACA', NULL, NULL),
(9, 'TARIJA', NULL, NULL),
(10, 'CENTRAL', NULL, NULL),
(11, 'EXTRANGERO', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle1s`
--

CREATE TABLE `detalle1s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oficial` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle1_id` bigint(20) UNSIGNED NOT NULL,
  `detalle1_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrato_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalle1s`
--

INSERT INTO `detalle1s` (`id`, `observacion`, `categoria`, `oficial`, `detalle1_id`, `detalle1_type`, `contrato_id`, `created_at`, `updated_at`) VALUES
(3, NULL, NULL, NULL, 633, 'App\\Models\\Persona', NULL, NULL, NULL),
(4, NULL, NULL, NULL, 636, 'App\\Models\\Persona', NULL, NULL, NULL),
(13, NULL, NULL, NULL, 13, 'App\\Models\\Empresa', NULL, NULL, NULL),
(16, NULL, NULL, NULL, 631, 'App\\Models\\Persona', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

CREATE TABLE `detalles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle_id` bigint(20) UNSIGNED NOT NULL,
  `detalle_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `proyecto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `tiempo`, `num`, `descripcion`, `tipo`, `monto`, `observacion`, `detalle_id`, `detalle_type`, `proyecto_id`, `created_at`, `updated_at`) VALUES
(7, NULL, NULL, NULL, NULL, '250000.00', NULL, 92, 'App\\Models\\Sociedad', 117, NULL, NULL),
(8, NULL, NULL, NULL, NULL, '250000.00', NULL, 186, 'App\\Models\\Empresa', 117, NULL, NULL),
(9, NULL, NULL, NULL, NULL, '250000.00', NULL, 141, 'App\\Models\\Empresa', 117, NULL, NULL),
(10, NULL, NULL, NULL, NULL, '250000.00', NULL, 40, 'App\\Models\\Empresa', 117, NULL, NULL),
(11, NULL, NULL, NULL, NULL, '250000.00', NULL, 321, 'App\\Models\\Empresa', 117, NULL, NULL),
(12, NULL, NULL, NULL, NULL, '250000.00', NULL, 322, 'App\\Models\\Empresa', 117, NULL, NULL),
(15, NULL, NULL, NULL, NULL, '4899920.30', NULL, 324, 'App\\Models\\Empresa', 119, NULL, NULL),
(16, NULL, NULL, NULL, NULL, '6102966.42', NULL, 160, 'App\\Models\\Empresa', 119, NULL, NULL),
(17, NULL, NULL, NULL, NULL, '6571155.34', NULL, 94, 'App\\Models\\Sociedad', 119, NULL, NULL),
(18, NULL, NULL, NULL, NULL, '5700466.99', NULL, 216, 'App\\Models\\Empresa', 119, NULL, NULL),
(19, NULL, NULL, NULL, NULL, '5780261.82', NULL, 95, 'App\\Models\\Sociedad', 119, NULL, NULL),
(20, NULL, NULL, NULL, NULL, '6062264.72', NULL, 137, 'App\\Models\\Empresa', 119, NULL, NULL),
(21, NULL, NULL, NULL, NULL, '6600781.96', NULL, 325, 'App\\Models\\Empresa', 119, NULL, NULL),
(22, NULL, NULL, NULL, NULL, '6001124.52', NULL, 136, 'App\\Models\\Empresa', 119, NULL, NULL),
(23, NULL, NULL, NULL, NULL, '5894734.38', NULL, 97, 'App\\Models\\Sociedad', 119, NULL, NULL),
(24, NULL, NULL, NULL, NULL, '6613891.90', NULL, 3, 'App\\Models\\Empresa', 119, NULL, NULL),
(25, NULL, NULL, NULL, NULL, '6816939.96', NULL, 24, 'App\\Models\\Empresa', 119, NULL, NULL),
(26, NULL, NULL, NULL, NULL, '5561703.35', NULL, 164, 'App\\Models\\Empresa', 119, NULL, NULL),
(27, NULL, NULL, NULL, NULL, '5901630.49', NULL, 98, 'App\\Models\\Sociedad', 119, NULL, NULL),
(28, NULL, NULL, NULL, NULL, '6672413.75', NULL, 99, 'App\\Models\\Sociedad', 119, NULL, NULL),
(29, NULL, NULL, NULL, NULL, '6245321.11', NULL, 100, 'App\\Models\\Sociedad', 119, NULL, NULL),
(30, NULL, NULL, NULL, NULL, '0.00', NULL, 499, 'App\\Models\\Persona', 116, NULL, NULL),
(31, NULL, NULL, NULL, NULL, '0.00', NULL, 67, 'App\\Models\\Persona', 116, NULL, NULL),
(32, NULL, NULL, NULL, NULL, '0.00', NULL, 481, 'App\\Models\\Persona', 116, NULL, NULL),
(33, NULL, NULL, NULL, NULL, '0.00', NULL, 427, 'App\\Models\\Persona', 116, NULL, NULL),
(34, NULL, NULL, NULL, NULL, '0.00', NULL, 500, 'App\\Models\\Persona', 116, NULL, NULL),
(35, NULL, NULL, NULL, NULL, '0.00', NULL, 298, 'App\\Models\\Persona', 116, NULL, NULL),
(36, NULL, NULL, NULL, NULL, '0.00', NULL, 421, 'App\\Models\\Persona', 116, NULL, NULL),
(37, NULL, NULL, NULL, NULL, '0.00', NULL, 501, 'App\\Models\\Persona', 116, NULL, NULL),
(38, NULL, NULL, NULL, NULL, '0.00', NULL, 502, 'App\\Models\\Persona', 116, NULL, NULL),
(39, NULL, NULL, NULL, NULL, '0.00', NULL, 503, 'App\\Models\\Persona', 116, NULL, NULL),
(40, NULL, NULL, NULL, NULL, '0.00', NULL, 504, 'App\\Models\\Persona', 116, NULL, NULL),
(41, NULL, NULL, NULL, NULL, '0.00', NULL, 345, 'App\\Models\\Persona', 116, NULL, NULL),
(42, NULL, NULL, NULL, NULL, '0.00', NULL, 35, 'App\\Models\\Persona', 116, NULL, NULL),
(43, NULL, NULL, NULL, NULL, '0.00', NULL, 348, 'App\\Models\\Persona', 116, NULL, NULL),
(44, NULL, NULL, NULL, NULL, '0.00', NULL, 505, 'App\\Models\\Persona', 116, NULL, NULL),
(45, NULL, NULL, NULL, NULL, '0.00', NULL, 302, 'App\\Models\\Persona', 116, NULL, NULL),
(46, NULL, NULL, NULL, NULL, '0.00', NULL, 475, 'App\\Models\\Persona', 116, NULL, NULL),
(47, NULL, NULL, NULL, NULL, '0.00', NULL, 225, 'App\\Models\\Persona', 116, NULL, NULL),
(48, NULL, NULL, NULL, NULL, '0.00', NULL, 327, 'App\\Models\\Persona', 116, NULL, NULL),
(49, NULL, NULL, NULL, NULL, '0.00', NULL, 506, 'App\\Models\\Persona', 116, NULL, NULL),
(50, NULL, NULL, NULL, NULL, '1918195.86', NULL, 338, 'App\\Models\\Empresa', 120, NULL, NULL),
(51, NULL, NULL, NULL, NULL, '1626275.16', NULL, 339, 'App\\Models\\Empresa', 120, NULL, NULL),
(52, NULL, NULL, NULL, NULL, '1683227.37', NULL, 17, 'App\\Models\\Sociedad', 120, NULL, NULL),
(53, NULL, NULL, NULL, NULL, '1669022.64', NULL, 123, 'App\\Models\\Empresa', 120, NULL, NULL),
(54, NULL, NULL, NULL, NULL, '1660746.27', NULL, 101, 'App\\Models\\Sociedad', 120, NULL, NULL),
(55, NULL, NULL, NULL, NULL, '1476274.68', NULL, 14, 'App\\Models\\Sociedad', 120, NULL, NULL),
(56, NULL, NULL, NULL, NULL, '1798122.40', NULL, 344, 'App\\Models\\Empresa', 120, NULL, NULL),
(57, NULL, NULL, NULL, NULL, '1883098.41', NULL, 7, 'App\\Models\\Empresa', 120, NULL, NULL),
(58, NULL, NULL, NULL, NULL, '1998274.82', NULL, 102, 'App\\Models\\Sociedad', 120, NULL, NULL),
(59, NULL, NULL, NULL, NULL, '1708341.30', NULL, 347, 'App\\Models\\Empresa', 120, NULL, NULL),
(60, NULL, NULL, NULL, NULL, '1977926.96', NULL, 103, 'App\\Models\\Sociedad', 121, NULL, NULL),
(61, NULL, NULL, NULL, NULL, '2000124.48', NULL, 104, 'App\\Models\\Sociedad', 121, NULL, NULL),
(62, NULL, NULL, NULL, NULL, '1935599.19', NULL, 352, 'App\\Models\\Empresa', 121, NULL, NULL),
(63, NULL, NULL, NULL, NULL, '2126269.13', NULL, 353, 'App\\Models\\Empresa', 121, NULL, NULL),
(64, NULL, NULL, NULL, NULL, '2148865.96', NULL, 105, 'App\\Models\\Sociedad', 121, NULL, NULL),
(65, NULL, NULL, NULL, NULL, '1989010.43', NULL, 301, 'App\\Models\\Empresa', 121, NULL, NULL),
(66, NULL, NULL, NULL, NULL, '2053317.72', NULL, 355, 'App\\Models\\Empresa', 121, NULL, NULL),
(67, NULL, NULL, NULL, NULL, '2027844.97', NULL, 106, 'App\\Models\\Sociedad', 121, NULL, NULL),
(68, NULL, NULL, NULL, NULL, '2053148.71', NULL, 53, 'App\\Models\\Empresa', 121, NULL, NULL),
(69, NULL, NULL, NULL, NULL, '1851846.57', NULL, 357, 'App\\Models\\Empresa', 121, NULL, NULL),
(70, NULL, NULL, NULL, NULL, '1979727.60', NULL, 14, 'App\\Models\\Sociedad', 121, NULL, NULL),
(71, NULL, NULL, NULL, NULL, '1995722.33', NULL, 102, 'App\\Models\\Empresa', 121, NULL, NULL),
(72, NULL, NULL, NULL, NULL, '1882729.82', NULL, 24, 'App\\Models\\Empresa', 121, NULL, NULL),
(73, NULL, NULL, NULL, NULL, '1908102.58', NULL, 49, 'App\\Models\\Sociedad', 121, NULL, NULL),
(74, NULL, NULL, NULL, NULL, '2053099.47', NULL, 175, 'App\\Models\\Empresa', 121, NULL, NULL),
(75, NULL, NULL, NULL, NULL, '2054243.67', NULL, 7, 'App\\Models\\Empresa', 121, NULL, NULL),
(76, NULL, NULL, NULL, NULL, '2123283.73', NULL, 107, 'App\\Models\\Sociedad', 121, NULL, NULL),
(77, NULL, NULL, NULL, NULL, '2119516.37', NULL, 146, 'App\\Models\\Empresa', 121, NULL, NULL),
(78, NULL, NULL, NULL, NULL, '2111013.27', NULL, 190, 'App\\Models\\Empresa', 121, NULL, NULL),
(79, NULL, NULL, NULL, NULL, '2370050.68', NULL, 108, 'App\\Models\\Sociedad', 121, NULL, NULL),
(80, NULL, NULL, NULL, NULL, '10960090.71', NULL, 362, 'App\\Models\\Empresa', 123, NULL, NULL),
(81, NULL, NULL, NULL, NULL, '10281584.89', NULL, 109, 'App\\Models\\Sociedad', 123, NULL, NULL),
(82, NULL, NULL, NULL, NULL, '10369999.66', NULL, 110, 'App\\Models\\Sociedad', 123, NULL, NULL),
(83, NULL, NULL, NULL, NULL, '9940228.55', NULL, 366, 'App\\Models\\Empresa', 123, NULL, NULL),
(84, NULL, NULL, NULL, NULL, '10699342.20', NULL, 139, 'App\\Models\\Empresa', 123, NULL, NULL),
(85, NULL, NULL, NULL, NULL, '12570659.35', NULL, 367, 'App\\Models\\Empresa', 123, NULL, NULL),
(86, NULL, NULL, NULL, NULL, '12611252.74', NULL, 368, 'App\\Models\\Empresa', 123, NULL, NULL),
(87, NULL, NULL, NULL, NULL, '320000.00', NULL, 369, 'App\\Models\\Empresa', 124, NULL, NULL),
(88, NULL, NULL, NULL, NULL, '320000.00', NULL, 40, 'App\\Models\\Empresa', 124, NULL, NULL),
(89, NULL, NULL, NULL, NULL, '320000.00', NULL, 111, 'App\\Models\\Sociedad', 124, NULL, NULL),
(90, NULL, NULL, NULL, NULL, '320000.00', NULL, 371, 'App\\Models\\Empresa', 124, NULL, NULL),
(91, NULL, NULL, NULL, NULL, '320000.00', NULL, 243, 'App\\Models\\Empresa', 124, NULL, NULL),
(92, NULL, NULL, NULL, NULL, '320000.00', NULL, 322, 'App\\Models\\Empresa', 124, NULL, NULL),
(93, NULL, NULL, NULL, NULL, '320000.00', NULL, 112, 'App\\Models\\Sociedad', 124, NULL, NULL),
(94, NULL, NULL, NULL, NULL, '320000.00', NULL, 373, 'App\\Models\\Empresa', 124, NULL, NULL),
(95, NULL, NULL, NULL, NULL, '0.00', NULL, 327, 'App\\Models\\Persona', 125, NULL, NULL),
(96, NULL, NULL, NULL, NULL, '0.00', NULL, 426, 'App\\Models\\Persona', 125, NULL, NULL),
(97, NULL, NULL, NULL, NULL, '0.00', NULL, 277, 'App\\Models\\Persona', 125, NULL, NULL),
(98, NULL, NULL, NULL, NULL, '0.00', NULL, 130, 'App\\Models\\Persona', 125, NULL, NULL),
(99, NULL, NULL, NULL, NULL, '0.00', NULL, 528, 'App\\Models\\Persona', 125, NULL, NULL),
(100, NULL, NULL, NULL, NULL, '0.00', NULL, 529, 'App\\Models\\Persona', 125, NULL, NULL),
(101, NULL, NULL, NULL, NULL, '0.00', NULL, 48, 'App\\Models\\Persona', 125, NULL, NULL),
(102, NULL, NULL, NULL, NULL, '0.00', NULL, 433, 'App\\Models\\Persona', 125, NULL, NULL),
(103, NULL, NULL, NULL, NULL, '0.00', NULL, 11, 'App\\Models\\Persona', 125, NULL, NULL),
(104, NULL, NULL, NULL, NULL, '0.00', NULL, 466, 'App\\Models\\Persona', 125, NULL, NULL),
(105, NULL, NULL, NULL, NULL, '0.00', NULL, 384, 'App\\Models\\Persona', 125, NULL, NULL),
(106, NULL, NULL, NULL, NULL, '0.00', NULL, 310, 'App\\Models\\Persona', 125, NULL, NULL),
(107, NULL, NULL, NULL, NULL, '0.00', NULL, 215, 'App\\Models\\Persona', 125, NULL, NULL),
(108, NULL, NULL, NULL, NULL, '0.00', NULL, 530, 'App\\Models\\Persona', 125, NULL, NULL),
(109, NULL, NULL, NULL, NULL, '0.00', NULL, 494, 'App\\Models\\Persona', 125, NULL, NULL),
(110, NULL, NULL, NULL, NULL, '0.00', NULL, 531, 'App\\Models\\Persona', 125, NULL, NULL),
(111, NULL, NULL, NULL, NULL, '0.00', NULL, 74, 'App\\Models\\Persona', 125, NULL, NULL),
(112, NULL, NULL, NULL, NULL, '0.00', NULL, 302, 'App\\Models\\Persona', 125, NULL, NULL),
(113, NULL, NULL, NULL, NULL, '0.00', NULL, 532, 'App\\Models\\Persona', 125, NULL, NULL),
(114, NULL, NULL, NULL, NULL, '0.00', NULL, 92, 'App\\Models\\Persona', 125, NULL, NULL),
(115, NULL, NULL, NULL, NULL, '0.00', NULL, 533, 'App\\Models\\Persona', 125, NULL, NULL),
(116, NULL, NULL, NULL, NULL, '0.00', NULL, 320, 'App\\Models\\Persona', 125, NULL, NULL),
(117, NULL, NULL, NULL, NULL, '0.00', NULL, 534, 'App\\Models\\Persona', 125, NULL, NULL),
(118, NULL, NULL, NULL, NULL, '0.00', NULL, 437, 'App\\Models\\Persona', 126, NULL, NULL),
(119, NULL, NULL, NULL, NULL, '0.00', NULL, 478, 'App\\Models\\Persona', 126, NULL, NULL),
(120, NULL, NULL, NULL, NULL, '0.00', NULL, 535, 'App\\Models\\Persona', 126, NULL, NULL),
(121, NULL, NULL, NULL, NULL, '0.00', NULL, 536, 'App\\Models\\Persona', 126, NULL, NULL),
(122, NULL, NULL, NULL, NULL, '0.00', NULL, 537, 'App\\Models\\Persona', 126, NULL, NULL),
(123, NULL, NULL, NULL, NULL, '0.00', NULL, 408, 'App\\Models\\Persona', 126, NULL, NULL),
(124, NULL, NULL, NULL, NULL, '0.00', NULL, 538, 'App\\Models\\Persona', 126, NULL, NULL),
(125, NULL, NULL, NULL, NULL, '0.00', NULL, 539, 'App\\Models\\Persona', 126, NULL, NULL),
(126, NULL, NULL, NULL, NULL, '0.00', NULL, 161, 'App\\Models\\Persona', 126, NULL, NULL),
(127, NULL, NULL, NULL, NULL, '0.00', NULL, 540, 'App\\Models\\Persona', 126, NULL, NULL),
(128, NULL, NULL, NULL, NULL, '0.00', NULL, 290, 'App\\Models\\Persona', 126, NULL, NULL),
(129, NULL, NULL, NULL, NULL, '0.00', NULL, 27, 'App\\Models\\Persona', 126, NULL, NULL),
(130, NULL, NULL, NULL, NULL, '0.00', NULL, 386, 'App\\Models\\Persona', 126, NULL, NULL),
(131, NULL, NULL, NULL, NULL, '0.00', NULL, 541, 'App\\Models\\Persona', 126, NULL, NULL),
(132, NULL, NULL, NULL, NULL, '0.00', NULL, 542, 'App\\Models\\Persona', 127, NULL, NULL),
(133, NULL, NULL, NULL, NULL, '0.00', NULL, 456, 'App\\Models\\Persona', 127, NULL, NULL),
(134, NULL, NULL, NULL, NULL, '0.00', NULL, 543, 'App\\Models\\Persona', 127, NULL, NULL),
(135, NULL, NULL, NULL, NULL, '0.00', NULL, 544, 'App\\Models\\Persona', 127, NULL, NULL),
(136, NULL, NULL, NULL, NULL, '0.00', NULL, 308, 'App\\Models\\Persona', 128, NULL, NULL),
(137, NULL, NULL, NULL, NULL, '0.00', NULL, 535, 'App\\Models\\Persona', 128, NULL, NULL),
(138, NULL, NULL, NULL, NULL, '0.00', NULL, 215, 'App\\Models\\Persona', 128, NULL, NULL),
(139, NULL, NULL, NULL, NULL, '0.00', NULL, 473, 'App\\Models\\Persona', 128, NULL, NULL),
(140, NULL, NULL, NULL, NULL, '0.00', NULL, 310, 'App\\Models\\Persona', 128, NULL, NULL),
(141, NULL, NULL, NULL, NULL, '0.00', NULL, 348, 'App\\Models\\Persona', 128, NULL, NULL),
(142, NULL, NULL, NULL, NULL, '0.00', NULL, 545, 'App\\Models\\Persona', 128, NULL, NULL),
(143, NULL, NULL, NULL, NULL, '0.00', NULL, 546, 'App\\Models\\Persona', 128, NULL, NULL),
(144, NULL, NULL, NULL, NULL, '0.00', NULL, 302, 'App\\Models\\Persona', 128, NULL, NULL),
(145, NULL, NULL, NULL, NULL, '0.00', NULL, 347, 'App\\Models\\Persona', 128, NULL, NULL),
(146, NULL, NULL, NULL, NULL, '0.00', NULL, 212, 'App\\Models\\Persona', 128, NULL, NULL),
(147, NULL, NULL, NULL, NULL, '0.00', NULL, 392, 'App\\Models\\Persona', 128, NULL, NULL),
(148, NULL, NULL, NULL, NULL, '0.00', NULL, 547, 'App\\Models\\Persona', 128, NULL, NULL),
(149, NULL, NULL, NULL, NULL, '0.00', NULL, 62, 'App\\Models\\Persona', 128, NULL, NULL),
(150, NULL, NULL, NULL, NULL, '0.00', NULL, 548, 'App\\Models\\Persona', 128, NULL, NULL),
(151, NULL, NULL, NULL, NULL, '0.00', NULL, 531, 'App\\Models\\Persona', 128, NULL, NULL),
(152, NULL, NULL, NULL, NULL, '0.00', NULL, 277, 'App\\Models\\Persona', 128, NULL, NULL),
(153, NULL, NULL, NULL, NULL, '0.00', NULL, 549, 'App\\Models\\Persona', 128, NULL, NULL),
(154, NULL, NULL, NULL, NULL, '0.00', NULL, 534, 'App\\Models\\Persona', 128, NULL, NULL),
(155, NULL, NULL, NULL, NULL, '0.00', NULL, 550, 'App\\Models\\Persona', 128, NULL, NULL),
(156, NULL, NULL, NULL, NULL, '0.00', NULL, 103, 'App\\Models\\Persona', 128, NULL, NULL),
(157, NULL, NULL, NULL, NULL, '0.00', NULL, 12, 'App\\Models\\Persona', 128, NULL, NULL),
(158, NULL, NULL, NULL, NULL, '0.00', NULL, 535, 'App\\Models\\Persona', 129, NULL, NULL),
(159, NULL, NULL, NULL, NULL, '0.00', NULL, 203, 'App\\Models\\Persona', 129, NULL, NULL),
(160, NULL, NULL, NULL, NULL, '0.00', NULL, 161, 'App\\Models\\Persona', 129, NULL, NULL),
(161, NULL, NULL, NULL, NULL, '0.00', NULL, 161, 'App\\Models\\Persona', 130, NULL, NULL),
(162, NULL, NULL, NULL, NULL, '0.00', NULL, 551, 'App\\Models\\Persona', 130, NULL, NULL),
(163, NULL, NULL, NULL, NULL, '0.00', NULL, 357, 'App\\Models\\Persona', 130, NULL, NULL),
(164, NULL, NULL, NULL, NULL, '0.00', NULL, 552, 'App\\Models\\Persona', 130, NULL, NULL),
(165, NULL, NULL, NULL, NULL, '0.00', NULL, 553, 'App\\Models\\Persona', 130, NULL, NULL),
(166, NULL, NULL, NULL, NULL, '0.00', NULL, 554, 'App\\Models\\Persona', 130, NULL, NULL),
(167, NULL, NULL, NULL, NULL, '0.00', NULL, 555, 'App\\Models\\Persona', 130, NULL, NULL),
(168, NULL, NULL, NULL, NULL, '0.00', NULL, 556, 'App\\Models\\Persona', 130, NULL, NULL),
(169, NULL, NULL, NULL, NULL, '0.00', NULL, 557, 'App\\Models\\Persona', 130, NULL, NULL),
(170, NULL, NULL, NULL, NULL, '0.00', NULL, 419, 'App\\Models\\Persona', 130, NULL, NULL),
(171, NULL, NULL, NULL, NULL, '0.00', NULL, 558, 'App\\Models\\Persona', 130, NULL, NULL),
(172, NULL, NULL, NULL, NULL, '0.00', NULL, 559, 'App\\Models\\Persona', 130, NULL, NULL),
(173, NULL, NULL, NULL, NULL, '0.00', NULL, 535, 'App\\Models\\Persona', 131, NULL, NULL),
(174, NULL, NULL, NULL, NULL, '0.00', NULL, 357, 'App\\Models\\Persona', 131, NULL, NULL),
(175, NULL, NULL, NULL, NULL, '0.00', NULL, 560, 'App\\Models\\Persona', 131, NULL, NULL),
(176, NULL, NULL, NULL, NULL, '0.00', NULL, 553, 'App\\Models\\Persona', 131, NULL, NULL),
(177, NULL, NULL, NULL, NULL, '0.00', NULL, 557, 'App\\Models\\Persona', 131, NULL, NULL),
(178, NULL, NULL, NULL, NULL, '0.00', NULL, 419, 'App\\Models\\Persona', 131, NULL, NULL),
(179, NULL, NULL, NULL, NULL, '0.00', NULL, 559, 'App\\Models\\Persona', 131, NULL, NULL),
(180, NULL, NULL, NULL, NULL, '0.00', NULL, 61, 'App\\Models\\Persona', 131, NULL, NULL),
(181, NULL, NULL, NULL, NULL, '0.00', NULL, 561, 'App\\Models\\Persona', 131, NULL, NULL),
(182, NULL, NULL, NULL, NULL, '0.00', NULL, 562, 'App\\Models\\Persona', 131, NULL, NULL),
(183, NULL, NULL, NULL, NULL, '0.00', NULL, 563, 'App\\Models\\Persona', 131, NULL, NULL),
(184, NULL, NULL, NULL, NULL, '2678335.48', NULL, 69, 'App\\Models\\Empresa', 132, NULL, NULL),
(185, NULL, NULL, NULL, NULL, '26895982.82', NULL, 374, 'App\\Models\\Empresa', 133, NULL, NULL),
(186, NULL, NULL, NULL, NULL, '26895703.08', NULL, 113, 'App\\Models\\Sociedad', 133, NULL, NULL),
(187, NULL, NULL, NULL, NULL, '27614571.78', NULL, 114, 'App\\Models\\Sociedad', 133, NULL, NULL),
(188, NULL, NULL, NULL, NULL, '24363890.84', NULL, 379, 'App\\Models\\Empresa', 133, NULL, NULL),
(189, NULL, NULL, NULL, NULL, '27838838.72', NULL, 82, 'App\\Models\\Sociedad', 133, NULL, NULL),
(190, NULL, NULL, NULL, NULL, '27356580.62', NULL, 45, 'App\\Models\\Sociedad', 133, NULL, NULL),
(191, NULL, NULL, NULL, NULL, '24953054.05', NULL, 127, 'App\\Models\\Empresa', 133, NULL, NULL),
(192, NULL, NULL, NULL, NULL, '26354577.51', NULL, 115, 'App\\Models\\Sociedad', 133, NULL, NULL),
(193, NULL, NULL, NULL, NULL, '27876455.81', NULL, 116, 'App\\Models\\Sociedad', 133, NULL, NULL),
(194, NULL, NULL, NULL, NULL, '26814504.50', NULL, 117, 'App\\Models\\Sociedad', 133, NULL, NULL),
(195, NULL, NULL, NULL, NULL, '27296186.94', NULL, 118, 'App\\Models\\Sociedad', 133, NULL, NULL),
(196, NULL, NULL, NULL, NULL, '27134910.22', NULL, 119, 'App\\Models\\Sociedad', 133, NULL, NULL),
(197, NULL, NULL, NULL, NULL, '27739562.82', NULL, 120, 'App\\Models\\Sociedad', 133, NULL, NULL),
(198, NULL, NULL, NULL, NULL, '906470.37', NULL, 393, 'App\\Models\\Empresa', 134, NULL, NULL),
(199, NULL, NULL, NULL, NULL, '835809.55', NULL, 394, 'App\\Models\\Empresa', 134, NULL, NULL),
(200, NULL, NULL, NULL, NULL, '860533.18', NULL, 131, 'App\\Models\\Empresa', 134, NULL, NULL),
(201, NULL, NULL, NULL, NULL, '849585.55', NULL, 280, 'App\\Models\\Empresa', 134, NULL, NULL),
(202, NULL, NULL, NULL, NULL, '806302.97', NULL, 83, 'App\\Models\\Empresa', 134, NULL, NULL),
(203, NULL, NULL, NULL, NULL, '916846.08', NULL, 395, 'App\\Models\\Empresa', 134, NULL, NULL),
(204, NULL, NULL, NULL, NULL, '890406.34', NULL, 121, 'App\\Models\\Sociedad', 134, NULL, NULL),
(205, NULL, NULL, NULL, NULL, '896984.27', NULL, 253, 'App\\Models\\Empresa', 134, NULL, NULL),
(206, NULL, NULL, NULL, NULL, '877269.08', NULL, 80, 'App\\Models\\Empresa', 134, NULL, NULL),
(207, NULL, NULL, NULL, NULL, '827474.56', NULL, 344, 'App\\Models\\Empresa', 134, NULL, NULL),
(208, NULL, NULL, NULL, NULL, '964105.73', NULL, 37, 'App\\Models\\Empresa', 134, NULL, NULL),
(209, NULL, NULL, NULL, NULL, '921825.50', NULL, 24, 'App\\Models\\Sociedad', 134, NULL, NULL),
(210, NULL, NULL, NULL, NULL, '881547.56', NULL, 397, 'App\\Models\\Empresa', 134, NULL, NULL),
(211, NULL, NULL, NULL, NULL, '320000.00', NULL, 186, 'App\\Models\\Empresa', 135, NULL, NULL),
(212, NULL, NULL, NULL, NULL, '320000.00', NULL, 122, 'App\\Models\\Sociedad', 135, NULL, NULL),
(213, NULL, NULL, NULL, NULL, '320000.00', NULL, 175, 'App\\Models\\Empresa', 135, NULL, NULL),
(214, NULL, NULL, NULL, NULL, '320000.00', NULL, 6, 'App\\Models\\Sociedad', 135, NULL, NULL),
(215, NULL, NULL, NULL, NULL, '320000.00', NULL, 112, 'App\\Models\\Sociedad', 135, NULL, NULL),
(216, NULL, NULL, NULL, NULL, '320000.00', NULL, 40, 'App\\Models\\Empresa', 135, NULL, NULL),
(217, NULL, NULL, NULL, NULL, '0.00', NULL, 564, 'App\\Models\\Persona', 136, NULL, NULL),
(218, NULL, NULL, NULL, NULL, '0.00', NULL, 48, 'App\\Models\\Persona', 136, NULL, NULL),
(219, NULL, NULL, NULL, NULL, '0.00', NULL, 67, 'App\\Models\\Persona', 136, NULL, NULL),
(220, NULL, NULL, NULL, NULL, '0.00', NULL, 302, 'App\\Models\\Persona', 136, NULL, NULL),
(221, NULL, NULL, NULL, NULL, '0.00', NULL, 565, 'App\\Models\\Persona', 136, NULL, NULL),
(222, NULL, NULL, NULL, NULL, '0.00', NULL, 348, 'App\\Models\\Persona', 136, NULL, NULL),
(223, NULL, NULL, NULL, NULL, '0.00', NULL, 35, 'App\\Models\\Persona', 136, NULL, NULL),
(224, NULL, NULL, NULL, NULL, '0.00', NULL, 566, 'App\\Models\\Persona', 136, NULL, NULL),
(225, NULL, NULL, NULL, NULL, '0.00', NULL, 567, 'App\\Models\\Persona', 136, NULL, NULL),
(226, NULL, NULL, NULL, NULL, '0.00', NULL, 78, 'App\\Models\\Persona', 136, NULL, NULL),
(227, NULL, NULL, NULL, NULL, '0.00', NULL, 333, 'App\\Models\\Persona', 137, NULL, NULL),
(228, NULL, NULL, NULL, NULL, '0.00', NULL, 67, 'App\\Models\\Persona', 137, NULL, NULL),
(229, NULL, NULL, NULL, NULL, '0.00', NULL, 321, 'App\\Models\\Persona', 137, NULL, NULL),
(230, NULL, NULL, NULL, NULL, '0.00', NULL, 487, 'App\\Models\\Persona', 137, NULL, NULL),
(231, NULL, NULL, NULL, NULL, '0.00', NULL, 568, 'App\\Models\\Persona', 137, NULL, NULL),
(232, NULL, NULL, NULL, NULL, '0.00', NULL, 455, 'App\\Models\\Persona', 137, NULL, NULL),
(233, NULL, NULL, NULL, NULL, '0.00', NULL, 130, 'App\\Models\\Persona', 137, NULL, NULL),
(234, NULL, NULL, NULL, NULL, '0.00', NULL, 24, 'App\\Models\\Persona', 137, NULL, NULL),
(235, NULL, NULL, NULL, NULL, '0.00', NULL, 102, 'App\\Models\\Persona', 137, NULL, NULL),
(236, NULL, NULL, NULL, NULL, '0.00', NULL, 569, 'App\\Models\\Persona', 137, NULL, NULL),
(237, NULL, NULL, NULL, NULL, '0.00', NULL, 103, 'App\\Models\\Persona', 137, NULL, NULL),
(238, NULL, NULL, NULL, NULL, '0.00', NULL, 263, 'App\\Models\\Persona', 137, NULL, NULL),
(239, NULL, NULL, NULL, NULL, '0.00', NULL, 430, 'App\\Models\\Persona', 137, NULL, NULL),
(240, NULL, NULL, NULL, NULL, '0.00', NULL, 393, 'App\\Models\\Persona', 137, NULL, NULL),
(241, NULL, NULL, NULL, NULL, '0.00', NULL, 570, 'App\\Models\\Persona', 137, NULL, NULL),
(242, NULL, NULL, NULL, NULL, '0.00', NULL, 100, 'App\\Models\\Persona', 137, NULL, NULL),
(243, NULL, NULL, NULL, NULL, '0.00', NULL, 571, 'App\\Models\\Persona', 137, NULL, NULL),
(244, NULL, NULL, NULL, NULL, '0.00', NULL, 572, 'App\\Models\\Persona', 137, NULL, NULL),
(245, NULL, NULL, NULL, NULL, '0.00', NULL, 117, 'App\\Models\\Persona', 137, NULL, NULL),
(246, NULL, NULL, NULL, NULL, '0.00', NULL, 247, 'App\\Models\\Persona', 137, NULL, NULL),
(247, NULL, NULL, NULL, NULL, '0.00', NULL, 289, 'App\\Models\\Persona', 138, NULL, NULL),
(248, NULL, NULL, NULL, NULL, '0.00', NULL, 97, 'App\\Models\\Persona', 138, NULL, NULL),
(249, NULL, NULL, NULL, NULL, '0.00', NULL, 573, 'App\\Models\\Persona', 138, NULL, NULL),
(250, NULL, NULL, NULL, NULL, '0.00', NULL, 574, 'App\\Models\\Persona', 138, NULL, NULL),
(251, NULL, NULL, NULL, NULL, '0.00', NULL, 575, 'App\\Models\\Persona', 138, NULL, NULL),
(252, NULL, NULL, NULL, NULL, '0.00', NULL, 289, 'App\\Models\\Persona', 139, NULL, NULL),
(253, NULL, NULL, NULL, NULL, '0.00', NULL, 567, 'App\\Models\\Persona', 139, NULL, NULL),
(254, NULL, NULL, NULL, NULL, '0.00', NULL, 573, 'App\\Models\\Persona', 139, NULL, NULL),
(255, NULL, NULL, NULL, NULL, '0.00', NULL, 574, 'App\\Models\\Persona', 139, NULL, NULL),
(256, NULL, NULL, NULL, NULL, '0.00', NULL, 575, 'App\\Models\\Persona', 139, NULL, NULL),
(257, NULL, NULL, NULL, NULL, '0.00', NULL, 39, 'App\\Models\\Persona', 139, NULL, NULL),
(258, NULL, NULL, NULL, NULL, '0.00', NULL, 576, 'App\\Models\\Persona', 139, NULL, NULL),
(259, NULL, NULL, NULL, NULL, '0.00', NULL, 409, 'App\\Models\\Persona', 139, NULL, NULL),
(260, NULL, NULL, NULL, NULL, '0.00', NULL, 98, 'App\\Models\\Persona', 139, NULL, NULL),
(261, NULL, NULL, NULL, NULL, '0.00', NULL, 79, 'App\\Models\\Persona', 139, NULL, NULL),
(262, NULL, NULL, NULL, NULL, '0.00', NULL, 577, 'App\\Models\\Persona', 139, NULL, NULL),
(263, NULL, NULL, NULL, NULL, '0.00', NULL, 403, 'App\\Models\\Persona', 139, NULL, NULL),
(264, NULL, NULL, NULL, NULL, '0.00', NULL, 234, 'App\\Models\\Persona', 139, NULL, NULL),
(265, NULL, NULL, NULL, NULL, '0.00', NULL, 41, 'App\\Models\\Persona', 139, NULL, NULL),
(266, NULL, NULL, NULL, NULL, '0.00', NULL, 60, 'App\\Models\\Persona', 139, NULL, NULL),
(267, NULL, NULL, NULL, NULL, '0.00', NULL, 14, 'App\\Models\\Persona', 139, NULL, NULL),
(268, NULL, NULL, NULL, NULL, '0.00', NULL, 115, 'App\\Models\\Persona', 139, NULL, NULL),
(269, NULL, NULL, NULL, NULL, '0.00', NULL, 354, 'App\\Models\\Persona', 139, NULL, NULL),
(270, NULL, NULL, NULL, NULL, '0.00', NULL, 571, 'App\\Models\\Persona', 139, NULL, NULL),
(271, NULL, NULL, NULL, NULL, '0.00', NULL, 288, 'App\\Models\\Persona', 139, NULL, NULL),
(272, NULL, NULL, NULL, NULL, '0.00', NULL, 572, 'App\\Models\\Persona', 139, NULL, NULL),
(273, NULL, NULL, NULL, NULL, '0.00', NULL, 578, 'App\\Models\\Persona', 139, NULL, NULL),
(274, NULL, NULL, NULL, NULL, '0.00', NULL, 579, 'App\\Models\\Persona', 139, NULL, NULL),
(275, NULL, NULL, NULL, NULL, '0.00', NULL, 580, 'App\\Models\\Persona', 139, NULL, NULL),
(276, NULL, NULL, NULL, NULL, '0.00', NULL, 581, 'App\\Models\\Persona', 139, NULL, NULL),
(277, NULL, NULL, NULL, NULL, '0.00', NULL, 32, 'App\\Models\\Persona', 139, NULL, NULL),
(278, NULL, NULL, NULL, NULL, '0.00', NULL, 582, 'App\\Models\\Persona', 139, NULL, NULL),
(279, NULL, NULL, NULL, NULL, '0.00', NULL, 410, 'App\\Models\\Persona', 139, NULL, NULL),
(280, NULL, NULL, NULL, NULL, '0.00', NULL, 289, 'App\\Models\\Persona', 140, NULL, NULL),
(281, NULL, NULL, NULL, NULL, '0.00', NULL, 244, 'App\\Models\\Persona', 140, NULL, NULL),
(282, NULL, NULL, NULL, NULL, '0.00', NULL, 120, 'App\\Models\\Persona', 140, NULL, NULL),
(283, NULL, NULL, NULL, NULL, '0.00', NULL, 420, 'App\\Models\\Persona', 140, NULL, NULL),
(284, NULL, NULL, NULL, NULL, '0.00', NULL, 288, 'App\\Models\\Persona', 140, NULL, NULL),
(285, NULL, NULL, NULL, NULL, '0.00', NULL, 583, 'App\\Models\\Persona', 140, NULL, NULL),
(286, NULL, NULL, NULL, NULL, '0.00', NULL, 584, 'App\\Models\\Persona', 140, NULL, NULL),
(287, NULL, NULL, NULL, NULL, '0.00', NULL, 585, 'App\\Models\\Persona', 139, NULL, NULL),
(288, NULL, NULL, NULL, NULL, '0.00', NULL, 20, 'App\\Models\\Persona', 139, NULL, NULL),
(289, NULL, NULL, NULL, NULL, '0.00', NULL, 441, 'App\\Models\\Persona', 139, NULL, NULL),
(290, NULL, NULL, NULL, NULL, '0.00', NULL, 586, 'App\\Models\\Persona', 139, NULL, NULL),
(291, NULL, NULL, NULL, NULL, '0.00', NULL, 39, 'App\\Models\\Persona', 138, NULL, NULL),
(292, NULL, NULL, NULL, NULL, '0.00', NULL, 576, 'App\\Models\\Persona', 138, NULL, NULL),
(293, NULL, NULL, NULL, NULL, '0.00', NULL, 413, 'App\\Models\\Persona', 138, NULL, NULL),
(294, NULL, NULL, NULL, NULL, '0.00', NULL, 409, 'App\\Models\\Persona', 138, NULL, NULL),
(295, NULL, NULL, NULL, NULL, '0.00', NULL, 98, 'App\\Models\\Persona', 138, NULL, NULL),
(296, NULL, NULL, NULL, NULL, '0.00', NULL, 79, 'App\\Models\\Persona', 138, NULL, NULL),
(297, NULL, NULL, NULL, NULL, '0.00', NULL, 577, 'App\\Models\\Persona', 138, NULL, NULL),
(298, NULL, NULL, NULL, NULL, '0.00', NULL, 403, 'App\\Models\\Persona', 138, NULL, NULL),
(299, NULL, NULL, NULL, NULL, '0.00', NULL, 234, 'App\\Models\\Persona', 138, NULL, NULL),
(300, NULL, NULL, NULL, NULL, '0.00', NULL, 41, 'App\\Models\\Persona', 138, NULL, NULL),
(301, NULL, NULL, NULL, NULL, '0.00', NULL, 60, 'App\\Models\\Persona', 138, NULL, NULL),
(302, NULL, NULL, NULL, NULL, '0.00', NULL, 14, 'App\\Models\\Persona', 138, NULL, NULL),
(303, NULL, NULL, NULL, NULL, '0.00', NULL, 115, 'App\\Models\\Persona', 138, NULL, NULL),
(304, NULL, NULL, NULL, NULL, '0.00', NULL, 354, 'App\\Models\\Persona', 138, NULL, NULL),
(305, NULL, NULL, NULL, NULL, '0.00', NULL, 571, 'App\\Models\\Persona', 138, NULL, NULL),
(306, NULL, NULL, NULL, NULL, '0.00', NULL, 288, 'App\\Models\\Persona', 138, NULL, NULL),
(307, NULL, NULL, NULL, NULL, '0.00', NULL, 572, 'App\\Models\\Persona', 138, NULL, NULL),
(308, NULL, NULL, NULL, NULL, '0.00', NULL, 579, 'App\\Models\\Persona', 138, NULL, NULL),
(309, NULL, NULL, NULL, NULL, '0.00', NULL, 587, 'App\\Models\\Persona', 138, NULL, NULL),
(310, NULL, NULL, NULL, NULL, '0.00', NULL, 582, 'App\\Models\\Persona', 138, NULL, NULL),
(311, NULL, NULL, NULL, NULL, '0.00', NULL, 578, 'App\\Models\\Persona', 138, NULL, NULL),
(312, NULL, NULL, NULL, NULL, '0.00', NULL, 588, 'App\\Models\\Persona', 138, NULL, NULL),
(313, NULL, NULL, NULL, NULL, '0.00', NULL, 244, 'App\\Models\\Persona', 141, NULL, NULL),
(314, NULL, NULL, NULL, NULL, '0.00', NULL, 535, 'App\\Models\\Persona', 141, NULL, NULL),
(315, NULL, NULL, NULL, NULL, '0.00', NULL, 589, 'App\\Models\\Persona', 141, NULL, NULL),
(316, NULL, NULL, NULL, NULL, '0.00', NULL, 590, 'App\\Models\\Persona', 141, NULL, NULL),
(317, NULL, NULL, NULL, NULL, '0.00', NULL, 484, 'App\\Models\\Persona', 141, NULL, NULL),
(318, NULL, NULL, NULL, NULL, '0.00', NULL, 591, 'App\\Models\\Persona', 141, NULL, NULL),
(319, NULL, NULL, NULL, NULL, '0.00', NULL, 98, 'App\\Models\\Persona', 141, NULL, NULL),
(320, NULL, NULL, NULL, NULL, '0.00', NULL, 592, 'App\\Models\\Persona', 141, NULL, NULL),
(321, NULL, NULL, NULL, NULL, '0.00', NULL, 593, 'App\\Models\\Persona', 141, NULL, NULL),
(322, NULL, NULL, NULL, NULL, '0.00', NULL, 563, 'App\\Models\\Persona', 141, NULL, NULL),
(323, NULL, NULL, NULL, NULL, '0.00', NULL, 594, 'App\\Models\\Persona', 141, NULL, NULL),
(324, NULL, NULL, NULL, NULL, '253886.48', NULL, 11, 'App\\Models\\Empresa', 142, NULL, NULL),
(325, NULL, NULL, NULL, NULL, '258584.87', NULL, 401, 'App\\Models\\Empresa', 142, NULL, NULL),
(326, NULL, NULL, NULL, NULL, '235529.31', NULL, 32, 'App\\Models\\Empresa', 142, NULL, NULL),
(327, NULL, NULL, NULL, NULL, '220984.24', NULL, 51, 'App\\Models\\Sociedad', 142, NULL, NULL),
(328, NULL, NULL, NULL, NULL, '224499.37', NULL, 402, 'App\\Models\\Empresa', 142, NULL, NULL),
(329, NULL, NULL, NULL, NULL, '0.00', NULL, 595, 'App\\Models\\Persona', 143, NULL, NULL),
(330, NULL, NULL, NULL, NULL, '0.00', NULL, 244, 'App\\Models\\Persona', 143, NULL, NULL),
(331, NULL, NULL, NULL, NULL, '0.00', NULL, 596, 'App\\Models\\Persona', 143, NULL, NULL),
(332, NULL, NULL, NULL, NULL, '0.00', NULL, 597, 'App\\Models\\Persona', 143, NULL, NULL),
(333, NULL, NULL, NULL, NULL, '0.00', NULL, 598, 'App\\Models\\Persona', 143, NULL, NULL),
(334, NULL, NULL, NULL, NULL, '0.00', NULL, 599, 'App\\Models\\Persona', 143, NULL, NULL),
(335, NULL, NULL, NULL, NULL, '0.00', NULL, 600, 'App\\Models\\Persona', 143, NULL, NULL),
(336, NULL, NULL, NULL, NULL, '0.00', NULL, 601, 'App\\Models\\Persona', 143, NULL, NULL),
(337, NULL, NULL, NULL, NULL, '0.00', NULL, 602, 'App\\Models\\Persona', 143, NULL, NULL),
(338, NULL, NULL, NULL, NULL, '0.00', NULL, 603, 'App\\Models\\Persona', 143, NULL, NULL),
(339, NULL, NULL, NULL, NULL, '0.00', NULL, 290, 'App\\Models\\Persona', 143, NULL, NULL),
(340, NULL, NULL, NULL, NULL, '0.00', NULL, 604, 'App\\Models\\Persona', 143, NULL, NULL),
(341, NULL, NULL, NULL, NULL, '0.00', NULL, 594, 'App\\Models\\Persona', 143, NULL, NULL),
(342, NULL, NULL, NULL, NULL, '0.00', NULL, 605, 'App\\Models\\Persona', 143, NULL, NULL),
(343, NULL, NULL, NULL, NULL, '0.00', NULL, 409, 'App\\Models\\Persona', 143, NULL, NULL),
(344, NULL, NULL, NULL, NULL, '0.00', NULL, 606, 'App\\Models\\Persona', 143, NULL, NULL),
(345, NULL, NULL, NULL, NULL, '0.00', NULL, 607, 'App\\Models\\Persona', 143, NULL, NULL),
(346, NULL, NULL, NULL, NULL, '0.00', NULL, 20, 'App\\Models\\Persona', 143, NULL, NULL),
(347, NULL, NULL, NULL, NULL, '0.00', NULL, 441, 'App\\Models\\Persona', 143, NULL, NULL),
(348, NULL, NULL, NULL, NULL, '0.00', NULL, 23, 'App\\Models\\Persona', 143, NULL, NULL),
(349, NULL, NULL, NULL, NULL, '0.00', NULL, 581, 'App\\Models\\Persona', 144, NULL, NULL),
(350, NULL, NULL, NULL, NULL, '0.00', NULL, 47, 'App\\Models\\Persona', 144, NULL, NULL),
(351, NULL, NULL, NULL, NULL, '0.00', NULL, 608, 'App\\Models\\Persona', 144, NULL, NULL),
(352, NULL, NULL, NULL, NULL, '0.00', NULL, 354, 'App\\Models\\Persona', 144, NULL, NULL),
(353, NULL, NULL, NULL, NULL, '0.00', NULL, 120, 'App\\Models\\Persona', 144, NULL, NULL),
(354, NULL, NULL, NULL, NULL, '0.00', NULL, 291, 'App\\Models\\Persona', 144, NULL, NULL),
(355, NULL, NULL, NULL, NULL, '0.00', NULL, 98, 'App\\Models\\Persona', 144, NULL, NULL),
(356, NULL, NULL, NULL, NULL, '0.00', NULL, 420, 'App\\Models\\Persona', 144, NULL, NULL),
(357, NULL, NULL, NULL, NULL, '0.00', NULL, 554, 'App\\Models\\Persona', 144, NULL, NULL),
(358, NULL, NULL, NULL, NULL, '0.00', NULL, 605, 'App\\Models\\Persona', 144, NULL, NULL),
(359, NULL, NULL, NULL, NULL, '0.00', NULL, 91, 'App\\Models\\Persona', 144, NULL, NULL),
(360, NULL, NULL, NULL, NULL, '0.00', NULL, 588, 'App\\Models\\Persona', 144, NULL, NULL),
(361, NULL, NULL, NULL, NULL, '0.00', NULL, 61, 'App\\Models\\Persona', 144, NULL, NULL),
(362, NULL, NULL, NULL, NULL, '0.00', NULL, 576, 'App\\Models\\Persona', 144, NULL, NULL),
(363, NULL, NULL, NULL, NULL, '0.00', NULL, 41, 'App\\Models\\Persona', 144, NULL, NULL),
(364, NULL, NULL, NULL, NULL, '0.00', NULL, 239, 'App\\Models\\Persona', 144, NULL, NULL),
(365, NULL, NULL, NULL, NULL, '0.00', NULL, 177, 'App\\Models\\Persona', 144, NULL, NULL),
(366, NULL, NULL, NULL, NULL, '250000.00', NULL, 141, 'App\\Models\\Empresa', 145, NULL, NULL),
(367, NULL, NULL, NULL, NULL, '250000.00', NULL, 40, 'App\\Models\\Empresa', 145, NULL, NULL),
(368, NULL, NULL, NULL, NULL, '250000.00', NULL, 6, 'App\\Models\\Sociedad', 145, NULL, NULL),
(369, NULL, NULL, NULL, NULL, '250000.00', NULL, 403, 'App\\Models\\Empresa', 145, NULL, NULL),
(370, NULL, NULL, NULL, NULL, '250000.00', NULL, 404, 'App\\Models\\Empresa', 145, NULL, NULL),
(371, NULL, NULL, NULL, NULL, '250000.00', NULL, 220, 'App\\Models\\Empresa', 145, NULL, NULL),
(372, NULL, NULL, NULL, NULL, '250000.00', NULL, 135, 'App\\Models\\Empresa', 145, NULL, NULL),
(373, NULL, NULL, NULL, NULL, '250000.00', NULL, 405, 'App\\Models\\Empresa', 145, NULL, NULL),
(374, NULL, NULL, NULL, NULL, '0.00', NULL, 287, 'App\\Models\\Persona', 146, NULL, NULL),
(375, NULL, NULL, NULL, NULL, '0.00', NULL, 609, 'App\\Models\\Persona', 146, NULL, NULL),
(376, NULL, NULL, NULL, NULL, '0.00', NULL, 501, 'App\\Models\\Persona', 146, NULL, NULL),
(377, NULL, NULL, NULL, NULL, '0.00', NULL, 481, 'App\\Models\\Persona', 146, NULL, NULL),
(378, NULL, NULL, NULL, NULL, '0.00', NULL, 610, 'App\\Models\\Persona', 146, NULL, NULL),
(379, NULL, NULL, NULL, NULL, '0.00', NULL, 611, 'App\\Models\\Persona', 146, NULL, NULL),
(384, NULL, NULL, NULL, NULL, '0.00', NULL, 502, 'App\\Models\\Persona', 146, NULL, NULL),
(385, NULL, NULL, NULL, NULL, '0.00', NULL, 612, 'App\\Models\\Persona', 146, NULL, NULL),
(386, NULL, NULL, NULL, NULL, '0.00', NULL, 613, 'App\\Models\\Persona', 146, NULL, NULL),
(387, NULL, NULL, NULL, NULL, '0.00', NULL, 278, 'App\\Models\\Persona', 146, NULL, NULL),
(388, NULL, NULL, NULL, NULL, '0.00', NULL, 348, 'App\\Models\\Persona', 146, NULL, NULL),
(389, NULL, NULL, NULL, NULL, '0.00', NULL, 347, 'App\\Models\\Persona', 146, NULL, NULL),
(390, NULL, NULL, NULL, NULL, '0.00', NULL, 104, 'App\\Models\\Persona', 146, NULL, NULL),
(391, NULL, NULL, NULL, NULL, '0.00', NULL, 614, 'App\\Models\\Persona', 146, NULL, NULL),
(392, NULL, NULL, NULL, NULL, '0.00', NULL, 11, 'App\\Models\\Persona', 146, NULL, NULL),
(393, NULL, NULL, NULL, NULL, '0.00', NULL, 503, 'App\\Models\\Persona', 146, NULL, NULL),
(394, NULL, NULL, NULL, NULL, '0.00', NULL, 35, 'App\\Models\\Persona', 146, NULL, NULL),
(395, NULL, NULL, NULL, NULL, '0.00', NULL, 615, 'App\\Models\\Persona', 146, NULL, NULL),
(396, NULL, NULL, NULL, NULL, '0.00', NULL, 616, 'App\\Models\\Persona', 146, NULL, NULL),
(397, NULL, NULL, NULL, NULL, '0.00', NULL, 383, 'App\\Models\\Persona', 146, NULL, NULL),
(398, NULL, NULL, NULL, NULL, '0.00', NULL, 225, 'App\\Models\\Persona', 146, NULL, NULL),
(399, NULL, NULL, NULL, NULL, '0.00', NULL, 617, 'App\\Models\\Persona', 146, NULL, NULL),
(400, NULL, NULL, NULL, NULL, '0.00', NULL, 138, 'App\\Models\\Persona', 146, NULL, NULL),
(401, NULL, NULL, NULL, NULL, '0.00', NULL, 293, 'App\\Models\\Persona', 146, NULL, NULL),
(402, NULL, NULL, NULL, NULL, '0.00', NULL, 618, 'App\\Models\\Persona', 146, NULL, NULL),
(403, NULL, NULL, NULL, NULL, '0.00', NULL, 91, 'App\\Models\\Persona', 146, NULL, NULL),
(404, NULL, NULL, NULL, NULL, '0.00', NULL, 619, 'App\\Models\\Persona', 146, NULL, NULL),
(405, NULL, NULL, NULL, NULL, '0.00', NULL, 263, 'App\\Models\\Persona', 146, NULL, NULL),
(406, NULL, NULL, NULL, NULL, '0.00', NULL, 620, 'App\\Models\\Persona', 146, NULL, NULL),
(407, NULL, NULL, NULL, NULL, '0.00', NULL, 36, 'App\\Models\\Persona', 146, NULL, NULL),
(408, NULL, NULL, NULL, NULL, '0.00', NULL, 621, 'App\\Models\\Persona', 146, NULL, NULL),
(409, NULL, NULL, NULL, NULL, '0.00', NULL, 327, 'App\\Models\\Persona', 146, NULL, NULL),
(410, NULL, NULL, NULL, NULL, '0.00', NULL, 73, 'App\\Models\\Persona', 146, NULL, NULL),
(411, NULL, NULL, NULL, NULL, '0.00', NULL, 622, 'App\\Models\\Persona', 146, NULL, NULL),
(412, NULL, NULL, NULL, NULL, '0.00', NULL, 229, 'App\\Models\\Persona', 146, NULL, NULL),
(413, NULL, NULL, NULL, NULL, '0.00', NULL, 623, 'App\\Models\\Persona', 146, NULL, NULL),
(414, NULL, NULL, NULL, NULL, '3010998.22', NULL, 123, 'App\\Models\\Sociedad', 147, NULL, NULL),
(415, NULL, NULL, NULL, NULL, '2884886.08', NULL, 124, 'App\\Models\\Sociedad', 147, NULL, NULL),
(416, NULL, NULL, NULL, NULL, '2822163.93', NULL, 408, 'App\\Models\\Empresa', 147, NULL, NULL),
(417, NULL, NULL, NULL, NULL, '10033052.33', NULL, 37, 'App\\Models\\Sociedad', 148, NULL, NULL),
(418, NULL, NULL, NULL, NULL, '8031836.68', NULL, 125, 'App\\Models\\Sociedad', 148, NULL, NULL),
(419, NULL, NULL, NULL, NULL, '8530503.09', NULL, 126, 'App\\Models\\Sociedad', 148, NULL, NULL),
(420, NULL, NULL, NULL, NULL, '8707956.77', NULL, 13, 'App\\Models\\Empresa', 148, NULL, NULL),
(421, NULL, NULL, NULL, NULL, '0.00', NULL, 620, 'App\\Models\\Persona', 149, NULL, NULL),
(422, NULL, NULL, NULL, NULL, '0.00', NULL, 624, 'App\\Models\\Persona', 149, NULL, NULL),
(423, NULL, NULL, NULL, NULL, '0.00', NULL, 543, 'App\\Models\\Persona', 149, NULL, NULL),
(424, NULL, NULL, NULL, NULL, '0.00', NULL, 625, 'App\\Models\\Persona', 149, NULL, NULL),
(425, NULL, NULL, NULL, NULL, '0.00', NULL, 357, 'App\\Models\\Persona', 150, NULL, NULL),
(426, NULL, NULL, NULL, NULL, '0.00', NULL, 339, 'App\\Models\\Persona', 150, NULL, NULL),
(427, NULL, NULL, NULL, NULL, '0.00', NULL, 626, 'App\\Models\\Persona', 150, NULL, NULL),
(428, NULL, NULL, NULL, NULL, '0.00', NULL, 60, 'App\\Models\\Persona', 150, NULL, NULL),
(429, NULL, NULL, NULL, NULL, '0.00', NULL, 266, 'App\\Models\\Persona', 150, NULL, NULL),
(430, NULL, NULL, NULL, NULL, '0.00', NULL, 291, 'App\\Models\\Persona', 150, NULL, NULL),
(431, NULL, NULL, NULL, NULL, '0.00', NULL, 269, 'App\\Models\\Persona', 150, NULL, NULL),
(432, NULL, NULL, NULL, NULL, '0.00', NULL, 420, 'App\\Models\\Persona', 150, NULL, NULL),
(433, NULL, NULL, NULL, NULL, '0.00', NULL, 357, 'App\\Models\\Persona', 151, NULL, NULL),
(434, NULL, NULL, NULL, NULL, '0.00', NULL, 339, 'App\\Models\\Persona', 151, NULL, NULL),
(435, NULL, NULL, NULL, NULL, '0.00', NULL, 626, 'App\\Models\\Persona', 151, NULL, NULL),
(436, NULL, NULL, NULL, NULL, '0.00', NULL, 266, 'App\\Models\\Persona', 151, NULL, NULL),
(437, NULL, NULL, NULL, NULL, '0.00', NULL, 269, 'App\\Models\\Persona', 151, NULL, NULL),
(438, NULL, NULL, NULL, NULL, '0.00', NULL, 420, 'App\\Models\\Persona', 151, NULL, NULL),
(439, NULL, NULL, NULL, NULL, '0.00', NULL, 291, 'App\\Models\\Persona', 151, NULL, NULL),
(440, NULL, NULL, NULL, NULL, '0.00', NULL, 627, 'App\\Models\\Persona', 151, NULL, NULL),
(441, NULL, NULL, NULL, NULL, '0.00', NULL, 628, 'App\\Models\\Persona', 151, NULL, NULL),
(442, NULL, NULL, NULL, NULL, '800000.00', NULL, 230, 'App\\Models\\Empresa', 152, NULL, NULL),
(443, NULL, NULL, NULL, NULL, '800000.00', NULL, 127, 'App\\Models\\Sociedad', 152, NULL, NULL),
(444, NULL, NULL, NULL, NULL, '800000.00', NULL, 128, 'App\\Models\\Sociedad', 152, NULL, NULL),
(445, NULL, NULL, NULL, NULL, '800000.00', NULL, 415, 'App\\Models\\Empresa', 152, NULL, NULL),
(446, NULL, NULL, NULL, NULL, '800000.00', NULL, 9, 'App\\Models\\Sociedad', 152, NULL, NULL),
(447, NULL, NULL, NULL, NULL, '800000.00', NULL, 419, 'App\\Models\\Empresa', 152, NULL, NULL),
(448, NULL, NULL, NULL, NULL, '800000.00', NULL, 321, 'App\\Models\\Empresa', 152, NULL, NULL),
(449, NULL, NULL, NULL, NULL, '800000.00', NULL, 129, 'App\\Models\\Sociedad', 152, NULL, NULL),
(450, NULL, NULL, NULL, NULL, '800000.00', NULL, 130, 'App\\Models\\Sociedad', 152, NULL, NULL),
(451, NULL, NULL, NULL, NULL, '0.00', NULL, 629, 'App\\Models\\Persona', 153, NULL, NULL),
(452, NULL, NULL, NULL, NULL, '0.00', NULL, 458, 'App\\Models\\Persona', 153, NULL, NULL),
(453, NULL, NULL, NULL, NULL, '0.00', NULL, 630, 'App\\Models\\Persona', 153, NULL, NULL),
(454, NULL, NULL, NULL, NULL, '0.00', NULL, 631, 'App\\Models\\Persona', 153, NULL, NULL),
(455, NULL, NULL, NULL, NULL, '0.00', NULL, 632, 'App\\Models\\Persona', 153, NULL, NULL),
(456, NULL, NULL, NULL, NULL, '0.00', NULL, 633, 'App\\Models\\Persona', 153, NULL, NULL),
(457, NULL, NULL, NULL, NULL, '0.00', NULL, 634, 'App\\Models\\Persona', 153, NULL, NULL),
(458, NULL, NULL, NULL, NULL, '0.00', NULL, 635, 'App\\Models\\Persona', 153, NULL, NULL),
(459, NULL, NULL, NULL, NULL, '0.00', NULL, 636, 'App\\Models\\Persona', 153, NULL, NULL),
(461, NULL, NULL, NULL, NULL, '0.00', NULL, 637, 'App\\Models\\Persona', 154, NULL, NULL),
(463, NULL, NULL, NULL, NULL, '0.00', NULL, 216, 'App\\Models\\Persona', 154, NULL, NULL),
(464, NULL, NULL, NULL, NULL, '0.00', NULL, 397, 'App\\Models\\Persona', 154, NULL, NULL),
(465, NULL, NULL, NULL, NULL, '0.00', NULL, 318, 'App\\Models\\Persona', 154, NULL, NULL),
(466, NULL, NULL, NULL, NULL, '0.00', NULL, 638, 'App\\Models\\Persona', 154, NULL, NULL),
(467, NULL, NULL, NULL, NULL, '0.00', NULL, 639, 'App\\Models\\Persona', 154, NULL, NULL),
(468, NULL, NULL, NULL, NULL, '0.00', NULL, 302, 'App\\Models\\Persona', 154, NULL, NULL),
(469, NULL, NULL, NULL, NULL, '0.00', NULL, 309, 'App\\Models\\Persona', 154, NULL, NULL),
(470, NULL, NULL, NULL, NULL, '0.00', NULL, 67, 'App\\Models\\Persona', 154, NULL, NULL),
(471, NULL, NULL, NULL, NULL, '0.00', NULL, 11, 'App\\Models\\Persona', 154, NULL, NULL),
(472, NULL, NULL, NULL, NULL, '0.00', NULL, 277, 'App\\Models\\Persona', 154, NULL, NULL),
(473, NULL, NULL, NULL, NULL, '0.00', NULL, 505, 'App\\Models\\Persona', 154, NULL, NULL),
(474, NULL, NULL, NULL, NULL, '0.00', NULL, 212, 'App\\Models\\Persona', 154, NULL, NULL),
(475, NULL, NULL, NULL, NULL, '0.00', NULL, 102, 'App\\Models\\Persona', 154, NULL, NULL),
(476, NULL, NULL, NULL, NULL, '0.00', NULL, 5, 'App\\Models\\Persona', 154, NULL, NULL),
(477, NULL, NULL, NULL, NULL, '0.00', NULL, 327, 'App\\Models\\Persona', 154, NULL, NULL),
(478, NULL, NULL, NULL, NULL, '0.00', NULL, 531, 'App\\Models\\Persona', 154, NULL, NULL),
(479, NULL, NULL, NULL, NULL, '0.00', NULL, 34, 'App\\Models\\Persona', 154, NULL, NULL),
(480, NULL, NULL, NULL, NULL, '0.00', NULL, 494, 'App\\Models\\Persona', 154, NULL, NULL),
(481, NULL, NULL, NULL, NULL, '0.00', NULL, 54, 'App\\Models\\Persona', 154, NULL, NULL),
(482, NULL, NULL, NULL, NULL, '0.00', NULL, 314, 'App\\Models\\Persona', 154, NULL, NULL),
(483, NULL, NULL, NULL, NULL, '0.00', NULL, 77, 'App\\Models\\Persona', 154, NULL, NULL),
(484, NULL, NULL, NULL, NULL, '0.00', NULL, 622, 'App\\Models\\Persona', 154, NULL, NULL),
(485, NULL, NULL, NULL, NULL, '0.00', NULL, 70, 'App\\Models\\Persona', 154, NULL, NULL),
(486, NULL, NULL, NULL, NULL, '0.00', NULL, 12, 'App\\Models\\Persona', 154, NULL, NULL),
(487, NULL, NULL, NULL, NULL, '0.00', NULL, 214, 'App\\Models\\Persona', 154, NULL, NULL),
(488, NULL, NULL, NULL, NULL, '0.00', NULL, 564, 'App\\Models\\Persona', 154, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombreEmpresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreLegal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NINGUNA',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombreEmpresa`, `nit`, `nombreLegal`, `direccion`, `fono1`, `fono2`, `email`, `departamento`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 'ETIBOL S.R.L.', '120805028', 'MICHELLE KATTERINE GONZALES ZEBALLOS', 'LA PAZ, CALLE 6 N? 55 ZONA BAJO LLOJETA', '72525763', '72023062', 'ETIBOLIVIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'EMPRESA CONSTRUCTORA MUNDIAL S.R.L.', '120813027', 'SEVERINO HUGO QUISPE NINA', 'LA PAZ, AV. KOLLASUYO N? 1515', '77778481', '2381488', 'CONSTRUCMUNDIAL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'CONSTRUCTORA BARROS S.R.L.', '120867022', 'GARY ARTURO LEDEZMA BARROS', 'LA PAZ, C. CAP RAVELO 2411 ED. ALICANTE DP 105', '2441243', '', 'GLEDEZMABARROS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'EMPRESA MINERA ELECTRICA Y CONSTRUCCION SRL MINELCO SRL', '123323026', 'JOSE DAVID ARZE TORREZ', '@', '0', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'EMPRESA CONSTRUCTORA INPROSUR SRL', '126487021', 'WILFREDO CELIER PALAGUERRA PERALTA', 'SUCRE CHUNKA KINSAYOC S/N ZONA VILLA', '71175926', '', 'ELIANA.BM.CIV@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'EMPRESA CONSTRUCTORA RAVEL S.R.L.', '133627028', 'JULIO MODESTO RAMOS QUENTA', 'GENARO SANJINEZ EDIF. LIBERTAD PISO 7  OF. 708', '68022240', '77544810', 'RAVEL1336@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'BRAEL LTDA', '133641021', 'JORGE LUIS FERNANDEZ FLORES', 'LA PAZ, Z/ ROSEDAL VENTILLA AV/ JUAN DE RODRIGUEZ N? 5390', '76205200', NULL, 'JORGE-BRAEL@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:45:22'),
(8, 'SERVICIOS INTEGRALES DE CONSTRUCCIONES AVANZADAS S.R.L. SIDCA S.R.L.', '133741029', 'LEONIDAS FERRUFINO CARRASCO', 'ISAAC TAMAYO N? 729 ZONA ROSARIO', '2711873', '72027794', 'LFERRUFINO@SIDCASRL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'SLIKER S.R.L.', '136179021', 'CRISTIAN ALBERTOKELLET ANTEZANA', 'AV. 20 DE OCTUBRE N? 1763 ED. PAN DE VIDA, PISO 3  OFICINA 303', '70118899', '', 'CHKELLERTA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'EMPRESA CONSTRUCTORA ARSENAL S.R.L.', '138461021', 'EDUARDO MAMANI QUISPE', 'LA PAZ CALLE EUCALIPTOS N? 1495 ZONA VILLA SALOME SECTOR GRAFICO', '2263064', '70103512', 'EDUMAMANI_Q@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'COSIG & ASOCIADOS CONSTRUCCIONES & SERVICIOS DE INGENIERIA EN GENERAL', '138835025', 'TEODOCIO GUIVER CALLE CHOQUE', 'EL ALTO, CALLE ARZABE Nro 78', '72516149', '79531512', 'CONST_COSIG@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-19 11:50:48'),
(12, 'SOCIEDAD INTERNACIONAL DE LA CONSTRUCCION S.R.L.', '143711029', 'HERNAN LOBO ACOSTA', 'CALLE BAILON MERCADO N? 370 ALTO SAN ANTONIO', '2816717', '74086410', 'HLALOBO@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'OBRAS CIVILES E INDUSTRIALES OCIS S.R.L.', '146066029', 'ALVARO TAPIA CAMPOS', 'LA PAZ, AV. 6 DE AGOSTO N? 2700 OF. 1001', '2912462', '79649049', 'MARIO.FLORES22@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'ESTRATO LTDA', '146734026', 'BORIS OSAVALDO NOGALES CAMACHO', 'CBBA, AV. GRAL GALINDO N? 1189', '4792674', '71736748', 'ESTRATOLTDA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'FRANKLIN\'S S.R.L.', '151194029', 'FRANKLIN MALDONADO MARTINEZ', 'CALLE VIOLETAS N? 9 ZONA PARADA A TARABUCO - CIUDAD SUCRE', '71162041', '71162042', 'FRANKLINS_SRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'EMPRESA CONOCIV & SAN S.R.L.', '152074021', 'SABINO WALTER VELASQUEZ ROMERO', 'TARIJA, CALLE TOPATER N? 197 SAN GERONIMO TARIJA', '71891490', '', 'CONOCIV.SAN@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'PROYECTO DE INGENIERIA CIVIL Y OBRAS CAHUANA Y GONZALES S.R.L.', '152512023', 'JULIETA LURDES GONZALES NINA', 'LA PAZ, AV. TOKIO N? 2010', '2914868', '71973676', 'PROINGECOCYG.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'CONSTRUCCIONES Y SERVICIOS HNOS CAHUANA ANDIA LTDA.', '156674022', 'ORLANDO CAHUANA ANDIA', 'CBBA. AV. REPUBLICA 1021 Y CALLE 16 DE JULIO ZONA SAN MIGUEL', '67598238', '71769229', 'HCL.LIMITADA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'EMPRESA CONSTRUCTORA SANK\'A S.R.L.', '158324021', 'JUAN ANTONIO CHOQUE CADENA', 'LA PAZ, ACHACACHI CALLE PACAJES N? 160 UV S/N  MZNO : S/N ZONA MASAYA', '71249630', '', 'JUANJOCHOQUEC@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'PROYECTOS Y CONSTRUCCION ARAMAYO PROCOAR S.R.L.', '159022024', 'STEVE RAFAEL CHAMBI ARAMAYO', 'AV. JAVIER DEL GRANADO URB. FRANCIA CALLE B N? 2 ZONA ACHUMANI', '2714269', '73080655', 'RAFAEL.CHAMBI.ARAMAYO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'EMPRESA UNIPERSONAL MARIA GUZMAN CLAROS', '160449013', 'MARIA GUZMAN CLAROS', 'AV. PORTALES N? 445', '4230030', '70754056', 'woimport@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'CONSTRUCTORA CONSULTORA DEGALLARDOS S.R.L.', '160554025', 'FAUSTO HUMBERTO LIMACHI DELGADO', 'POTOSI, CALLE BOLIVAR N? 836 UV. S/N MANZANO S/N EDIFICIO SHOPING AMERICA PISO 3, OFICINA 33, ZONA CENTRAL', '74540969', '77873776', 'RITAVERONICA75@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'ORIANA SERVICIOS DE INGENIERIA SRL.', '160574021', 'JUAN MARCELO ZUBIETA VARGAS', 'C. LAURELES N? 151 ZONA ALTO ARANJUEZ', '4460314', '', 'INFO@ORIANASRL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'EMPRESA CONSTRUCTORA PROGRESIVA S.R.L.', '161416024', 'JOSE GONZALO ASBUN MARTINEZ', 'LA PAZ, CALLE GRAL ARMAZA N? 2948', '2417775', '71543284', 'EMPRESA.PROGRESIVA@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-04 11:13:34'),
(25, 'CODECI S.R.L.', '161516022', 'RODRIGO ALEJANDRO NOGALES ANDRADE', 'CALL CA. HUGO ESTRADA N? 1354 EDIF. OLIMPIA PISO 3 OF 304', '2225947', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'ARMEN INGENIERIA & CONSTRUCCIONES S.R.L.', '161772025', 'RUBEN FLORES CHAVEZ', 'LA PAZ, AV. JAIMES FREYRE N? 2913 SOPOCACHI', '2911247', '67004488', 'ARMENSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'CONSTRUCTORA SULLCANI BALTAZAR S.R.L. CONSUBAL S.R.L.', '162952026', 'RUBEN SULLCANI APAZA', 'AV. VILLAZON KM 10 CALLE INNOMINADA S/N ZONA HUAYLLANI', '4725951', '71717994', 'CONSUBAL.SRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'SOL TOTAL S.R.L.', '163344027', 'WALTER BRUNO CALLA CARDENAS', 'LA PAZ, MARISCAL SANTA CRUZ N? 1351 ZONA CENTRAL', '72596929', '', 'SOLTOTALSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'CONSULTORA CONSTRUCTORA TAMBOR VARGAS S.R.L.', '163366023', 'MARCELINO MAMANI INCA', 'CBBA, AV. CAPITAN VICTOR USTARIZ KM 5 1/2  ZONA PAMPA GRANDE', '4048037', '72268575', 'SANIPAYA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'GRANDPRO S.R.L.', '163806027', 'MARCELO NATANIEL CALIZAYA CHOQUE', 'AV. SIMON LOPEZ N? 2154', '71410430', '', 'MARCECALIZAYA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'CONSTRUCTORA CONSULTORA DE INGENIERIA EN GENERAL ROSPI & TABOADA S.R.L.', '164636025', 'ROLANDO JUAN ROSPILLOSO TABOADA', 'SUCRE, MIGUEL GONZALES N? 33', '71158659', '', 'CONSTRCONSULROSPI@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'EMPRESA CONSTRUCTORA CALLE LAURA ASOCIADOS S.R.L.', '165572022', 'WALTER CALLE LAURA', 'LA PAZ, CRUCE LAYURI Nro 100', '78980137', NULL, 'WCALLELAURA@HOTMAIL.COM', NULL, 'NINGUNA', '0000-00-00 00:00:00', '2022-04-19 12:00:07'),
(33, 'INGENIERIA Y CONSTRUCCION VENITEC S.R.L.', '167594026', 'LUIS LAYME SIRPA', 'EL ALTO, AV. GUADALQUIVIR N? 201 Z. NUEVOS HORIZONTES CONVIFAC', '79145418', '', 'JAGQ_VENITEC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'ASOCIACION ACCIDENTAL CONITAR - EMROLL', '168292026', 'ADOLFO COSS GUILLEN', 'CALLE CAMPO N? 296 EDIF EL CIPRES OF. 7A', '73277600', '', 'info@conitar.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'EMPRESA CONSTRUCTORA GASATEL S.R.L.', '170774024', 'TOMAS AGUILAR QUISPE', 'EL ALTO, CALLE MARCELO QUIROGA  N? 5504 UV: S/N MZNO', ' S/N ZONA URB. 21 DE OCTUBRE;73535100', '', 'WWW.GASATELSRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'CONSTRUCTORA AYNISUMA S.R.L.', '171626022', 'MICHAELA VALDEZ ARZABIA', 'CALLE FELICIANO KANTUTA CONDOMINIO WHIPALA BLOQUE ROJO PISO 9 DEPTO B.', '76567215', '68109073', 'AYNISUMA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'EMPRESA DE SERVICIOS EN OBRAS CIVILES Y MAQUINARIA \'LTDA\'', '175152020', 'CARLOS CALLE CALDERON', 'LA PAZ, ACHOCALLA CALLE PABLO VEGA N? 115', '72516551', '', 'ESOCMAQ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'EMPRESA DE CONSTRUCCIONES Y SERVICIOS TECNICOS \'PATRIAS\' S.R.L.', '178828025', 'PATRICIO CONDORI LLANQUI', 'EL ALTO, CALLE 7 N? 108 ZONA SAN LUIS TASA', '2833810', '71231492', 'PATRICIO.CON@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'EABOL S.R.L.', '179056028', 'ROGER RAMOS COLQUE', 'ORURO, CALLE WALTER ZEBALLOS N? 7 ENTRE AV. AL VALLE Y MICAELA BASTIDOS', '5212657', '', 'EABOLSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'MCB LTDA MEGACONSTRUCCIONES BOLIVIA LTDA.', '179154028', 'JUAN PABLO DEL CARPIO CARREÑO', 'LA PAZ, CALLE 16 N 801 UV. S/N MZNO S/N EDIFICIO CENTRO COMERCIAL OBRAJES PISO 4 OFICINA 401', '76763011', '76591757', 'MEGACONSTRUCCIONESBOLIVIA@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-07 11:56:39'),
(41, 'COSTA DEL SOL S.R.L.', '180072024', 'EDUARDO YOHNY MAMANI ARUQUIPA', 'AV. AROMA N? 68 ZONA VILLA EXALTACION EL ALTO', '70110230', '69856607', 'COSTADELSOLSRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'IZ-CON S..R.L. SERVICIOS Y CONSTRUCCIONES', '180382025', 'MATHAN MIQUEAS ALCON TRONCOSO', 'CALLE VISCARRA N? 14 - EL ALTO VILLA SAN ANTONIO', '2230921', '', 'NALCONTR@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'CONSULTORA Y CONSTRUCCIONES SECCION SIETE SRL', '181464024', 'FELIX COCA CAISARI', 'CBBA, C/ SAN LORENZO 327-A COLCAPIRHUA', '73737409', '67408430', 'YAS7070@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'EMPRESA ERIKO CONSULTORES SRL', '182336029', 'BISMARK PERCY ESPEJO SEMPERTEGUI', 'LA PAZ, C/LEON DE LA BARRA N? 956, ZONA GRAN PODER', '62583253', '', 'ERIKO.CONSULTORES@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'SOBOCO S.R.L.', '183082021', 'RICHARD LUIS CASTILLO MALLEA', 'PSAJE TUPIZA N? 140 Z. SAN SEBASTIAN', '73718095', '', 'RICMALLEA@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'EMPRESA CONSULTORA Y CONSTRUCTORA FRANOMA S.R.L.', '184104025', 'FRANKLIN OMAR MAMANI ORELLANA', 'CALLE 23 DE CALACOTO, EDIF. TORRE EMPRESARIAL TITANIUM N? 105 PISO 5 OFC 1', '71530469', '71530426', 'FRANOMASRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'ASOCIACION ACCIDENTAL BALA NEGRA', '187340026', 'PABLO ISRAEL LANDIVAR BANEGAS', 'AV. SAAVEDRA N? 1158, ZONA MIRAFLORES', '71592135', '', 'empresabala@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'EMPRESA CONSTRUCTORA LKI S.R.L.', '189928027', 'ADOLFO DAVID LORIA CANEDO', 'LA PAZ, CALLE PINTO TELLERIA N? 102 EDIF. VALLE DE IRPA VI PISO 4 DEPTO 401, ZONA IRPAVI BAJO', '2721361', NULL, 'EMP.LKI.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-23 10:52:41'),
(49, 'ALZA INGENIEROS S.R.L.', '190464027', 'JHONNY QUELCA QUISPE', 'AV. ALFREDO FRANCO VALLE EDIF. ALIANZA N? 50 PISO 3 OFICINA 310. ZONA 12 DE OCTUBRE', '73073763', '76868238', 'ALZA_INGENIEROS@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'ENRIL S.R.L.', '190592024', 'CATALINA HILARI CAPARICONA', 'EL ALTO, CALLE GUAJARAMERIN N? 1084-A ZONA BRASIL RIO SECO', '2866048', '70667149', 'ENRILSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'CONSTRUCTORA AGUI ZABA S.R.L.', '191864028', 'LUIS GASPAR AGUILAR TORREZ', 'LA PAZ, CALLE BENI N? 8 URBANIZACION 1RO DE MAYO, ESQ. AVENIDA MARISCAL SANTA CRUZ PLAN 41 A MANZANO W', '2831301', '', 'AGUIZABA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'EMPRESA CONSTRUCTORA CONDE ZAMBRANA S.R.L.', '192942023', 'ANTONIO CONDE LAIME', 'LA PAZ, CALLE ESTADOS UNIDOS N? 747', '74266609', '', 'CONDEZAMBRANA.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'ICASA S.R.L. INGENIERIA DE CASAS S.R.L.', '194588020', 'JAVIER RICHARD TINTA TINTA', 'LA PAZ, CALLE ABDON SAAVEDRA N? 2050', '241882', '732787880', 'LCASASRL.12@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:21:13'),
(54, 'EMPRESA CONSTRUCTORA \'DAYA S.R.L.\'', '195516021', 'GUSTAVO ROBERTO TORREZ CARI', 'LA PAZ, AVENIDA LAS AMERICAS EDIFICIO N? 271 PISO 3, ZONA VILLA FATIMA', '2902238', '', 'DAYA_SRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'EMPRESA CONSTRUCTORA CURITIVA INGENIERIA LTDA', '197696029', 'ALFREDO MAMANI QUISPE', 'EL ALTO, C/ GUILLIN PINTO N? 1194 Z/ SAN LUIS 2DO CHARAPAQUI', '71966647', '', 'CURITIVAINGENIERIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'EMPRESA MULTIDISCIPLINARI SENICON S.R.L.', '198838025', 'SERGIO ISRAEL MORALES GOMEZ', 'S/N', '72466280', '78798797', 'INGMORALITOS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'EMPRESA CONSTRUCTORA \'HERLUF S.R.L.\'', '198894025', 'HERNAN PACO SAUCEDO', 'CALLE 10 N? 12 ZONA ALTO 27 DE MAYO', '68165666', '72581013', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'URZAGASTE & MUNOZ CONSTRUCCIONES LDA.', '205356022', 'RUBEN URZAASTE PANTOJA', 'LA PAZ, C. PEDRO SALAZAR N? 602 SOPOCACHI', '71597901', '', 'URZAGASTEPR@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'ALVARADO BURGOS S.R.L.', '210530021', 'PATRICIA ANGHELA ALVARADO BURGOS', 'LA PAZ, OBRAJES CALLE 10 PASAJE D N? 166', '67010977', '67010978', 'ALVARADOBURGOS.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'CONSULTORA Y CONSTRUCTORA CORITIN S.R.L.', '228802025', 'GERMAN FAUSTO RIOS TINTA', 'CALLE CARANGAS N? 4815, ZONA SAN FELIPE DE SEKE 2', '74074006', '', 'coritin@outlook.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'CONSTRUCTORA P Y T BOLIVIA S.A.', '232430023', 'DANIEL RIVERO HAYDAR', 'CALLE JUAN DE LA RIVA N? 1503 INTERIOR ALTOS OFICINA 2', '71533439', '', 'PYTBOLIVIA@PUENTESYTORONES.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'EMPRESA CONSULTORA Y CONSULTORA Y CONSTRUCTORA OBSERC S.R.L.', '232642023', 'ROBERTO CARLOS CRUZ TUPA', 'QUINTANA AESQ. ALDANA N? 24', '68248252', '67059954', 'OBSERC_SRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'CONSTRUCCIONES Y CONSULTORA RONDIL S.R.L.', '234500029', 'MACARIO QUISPE BURGOA', 'CALLE MONRROY N? 75 ZONA ALTO LIMA 3RA SECCION SUD ENTRE AVENIDAS 10 Y 11', '2840880', '73309115', 'ECO_RONDIL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'CONSTRUCTORA UNTRES S.R.L', '236008027', 'BORIS ABAD ZUBIETA GUEVARA', 'TARIJA, BARRIO FATIMA CALLE EJERCITO N? 506 ESQ. BELGRANO', '46672300', '72986606', 'CONSTRUCTORA_UNTRES@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'EMCONASSITEC S.R.L.', '244724021', 'JUAN PABLO ALVAREZ VERDUGUEZ', 'AVENIDA CARLOS MEDINACELLI N? 650 EDIFICIO HONGOL PISO 2, OFICINA 1, ZONA CALA CALLA.', '79950303', '', 'EMCONASSITEC200@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'EMPRESA \'FESACO S.R.L.\'', '269362028', 'INES FRIDA CHUQUIMIA CASTRO', 'AV. JORGE RIOS DALENCE N? 1025 Z/ SAN NICOLAS', '71253560', '71987059', 'ICHUQUIMIA2007@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'ASOCIACION ACCIDENTAL INTEGRACION', '269448020', 'MARTIN GONZALO DEHEZA MENESES', 'CALLE SEGUNDO CRUCERO N? 45, ZONA AGUA DE LA VIDA', '3526919', '', 'martin_deheza@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ATOLON SRL CONSULTORA Y CONSTRUCTORA', '280196027', 'NICOLAS EDUARDO QUISPE TARQUI', 'CALLE COLON N? 330, EDIFICIO COLON PISO 2 OFICINA 203 ZONA CENTRAL', '73273636', '', 'ATOLONSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'CONSTRUCTORA Y CONSULTORA ANGELA ATAHUACHI BAUTISTA SRL', '281948020', 'ANGELA ATAHUACHI BAUTISTA', 'LA PAZ, ZONA LLOJETA SECTOR  VERGELITO CALLE 1 N? 252', '2501680', '75860364', 'ATAHUACHI@YAHOO.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-03-22 11:38:19'),
(70, 'PLANITECO INGENIERIA Y CONSTRUCCIONES SRL.', '283124021', 'LIZANDRA ALCONCER AGUILA', 'CBBA, TIQUIPAYA ZONA VILLA ESPERANZA CALLE MANANTIAL S/N', '7981539', '', 'PLANITECO24@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'DAFCOR S.RL.', '284040025', 'DELIA DAZA GARCIA', 'C/FELIPE ECHAZU N? 155  BARRIO OSCAR ALFARO', '46643170', '72989040', 'DELIADAZAGARCIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'HOLIMETRICA S.R.L.', '286048023', 'RAFAEL LAURA ZEGARRA', 'EL ALTO, AV.  ALAMOS ESQ. PUERTO DE ILO N? 1374 ZONA PORVENIR', '2852409', '78897732', 'HOLIMETRICA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'FABMACONS S.R.L', '286344026', 'JOSE CORRAL ROMERO', 'POTOSI, CALLE FINAL CHUQUISACA N? 51', '71822081', '', 'JCORRAL@FABMACONSSRL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'CONSTRUCTORA Y CONSULTORA DURAN Y BRAVO INGENIEROS S.R.L.', '288614028', 'LOURDES QUISBERT BRAVO', 'EL ALTO, CALLE 1 N? 4 ZONA VILLA EXALTACION 1RA SECCION', '73218629', '', 'DURANYBRAVO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'CONSTRUCTORA Y CONSULTORA VELAURZ S.R.L.', '289664028', 'ROMAN VELASQUEZ ALIAGA', 'EL ALTO, CALLE JOSE ARZABE N? 2585 UV. S/N MZNO  S/N OFICINA:1 ZONA 16 DE JULIO', '70538092', '', 'ING.R.VELASQUEZ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'SOCIEDAD ACCIDENTAL RIO VERDE', '292782021', 'GERARDO ALBERTO MACEDA VALDEZ', 'CALLE 21 DE ACHUMANI N? 100', '77225008', '2900442', 'macedagerardo@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'EYSERGES S.R.L.', '294752027', 'SERGIO JAIME CHAVEZ LOZANO', 'LA PAZ, CALLE 26 N? 30 Z. COTA COTA', '2785780', '', 'EYSERGES@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'FORTILEON S.R.L.', '295902020', 'SABINO COTA MAMANI', 'EL ALTO, AV. RODOLFO PALENQUE N? 2 ZONA 12 DE OCTUBRE  BARRIO MINERO', '2823863', '74084167', 'FORTILEON@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'CONSTRUCTORA Y CONSULTORA PEUR S.R.L.', '296348026', 'JOSE LUIS ARCE LAURA', 'LA PAZ PLAZA BADEN POWEL N? 95 MIRAFLORES', '2227459', '', 'CONSULTORAPEUR@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'MENDOZA & DIAZ ASOCIADOS S.R.L.', '300860025', 'MERY PACO CASTRO', 'CALLE GUAQUI N? 10 Z/16 DE JULIO', '2843022', '72061095', 'MENDOZAYDIAZSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'EMPRESA CONSTRUCTORA Y CONSULTORA ADYNAELL SRL', '304210023', 'ALEX SANDRO CHOQUELA LUNA', 'CBBA  - AV. CAPITAN ARZABE N? 755', '77918280', '8047790', 'CHOQUELA21@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'FC-SERVIC S.R.L.', '304930027', 'CHRISTIAN BORIS SERRUDO TARRAGA', 'AV. POTOSI N? 950 B/ LA PAMPA - TARIJA', '71891069', '', 'cbs.serrudo@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'CONSTRUCTORA CHERQUIN SRL', '305054027', 'AMERICO RUBEN HILAQUITA RAMOS', 'EL ALTO, CALLE CACHI No 1094 ZONA SAN PEDRO II', '68087688', '76281602', 'CONST.CHERQUIN@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-04 10:45:37'),
(84, 'ASOCIACION ACCIDENTAL TOLIS & ROCAFRA', '305552022', 'ISIDRO MAMANI TITO', 'CALLE 29 N? 122 CAPINOTA-VILLA TUNARI', '73026148', '76733048', 'tolissrl@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'CTM S.R.L.', '308492022', 'SUSANA ALARCON MORALES', 'SANTA CRUZ, CALLE LA RIVA 459', '3323783', '', 'CENTRAL@CTM.COM.BO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'EMPRESA CONSTRUCTORA \'RUBEN Q.Z.\' S.R.L.', '309090025', 'ROBERTO QUISPE ZULETA', 'CALLE SANTA ROSA N? 4 ZONA ALTO TACAGUA', '73030174', '', 'QUISPEROBERTO85@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'MACHA - CONST S.R.L.', '309342029', 'JUAN TOMAS CHEVEZ PAUCARA', 'CALLE UNION N? 77 (BELLA VISTA)', '77530662', '', 'JUAN_ARQ_69@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'VISOTRAC S.R.L. INGENIERIA & SERVICIOS', '309580029', 'ELMER YAMIL SOLIS SALAZAR', 'CBBA, AV. VILLAZON KM 1', '70313377', '74828272', 'visotracsrl@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'ASOCIACION ACCIDENTAL TRIOVAL Y CIA', '315290020', 'GUSTAVO ALBERTO VALDIVIESO FERREIRA', 'CALLE LOAYZA N? 233 EDIF. MCAL DE AYACUCHO PISO 4 OF. 405', '2200854', '2202061', 'TRIOVALYCIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'CODOVISA INGENIERIA & CONSTRUCCION S.R.L.', '320614022', 'BAILON TICONA OSCO', 'AV. SAN ANTONIO N? 6345 ZONA JESUS DE NAZARET- EL ALTO', '71265181', '', 'BAILONTICONAOSCO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'CONSTRUCTORA & CONSULTORA PAYE ROJAS S.R.L.', '322076023', 'GARY PAYE ROJAS', 'CALLE WLATER FERNANDEZ N? 1075 UV: S/N MAZNO S/N ZONA SAN LUIS II CHARAPAQUI', '79126466', '', 'PAYEROJASRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'TRANSIRE S.R.L.', '327894022', 'JAIME RAUL CORONEL SILVA', 'CALLE I N? 10 ZONA DE OBRAJES', '72082686', '2786207', 'JAIME_CORONEL_SILVA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'NAYJAMA CONSTRUCCIONES SRL.', '328080020', 'RODOLFO RODRIGO RODRIGUEZ SAENZ', 'LA PAZ, AV. 6 DE AGOSTO CALLE CAMPOS TORRE CADECO N? 2700 PISO 7 OF. 701', '63076717', '71566360', 'NAYJAMA.CONS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'EMPRESA CONSTRUCTORA FUNDY S.R.L.', '329018025', 'NESTOR YUJRA QUISPE', 'EL ALTO, CALLE M N? 706-B ZONA PUERTO MEJILLONES', '71519989', '', 'NESTOR.YQ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'HUCAF S.R.L.', '329922021', 'FEDERICO HUARINA CHAMBI', 'LA PAZ, C/ CAJAMARCA N? 1175 Z. SAN JOSE DE YUNGUYO', '68010319', '', 'HUACAFSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'CONSTRUCTORA Y CONSULTORA CIVPE S.R.L.', '330408028', 'PABLO QUISPE MAMANI', 'AV. MARCELO QUIROGA SANTA CRUZ N? 911-A, ZONA PASAKERI', '2503055', '', 'PABLOQM100@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'EMPRESA CONSTRUCTORA SODECOIM S.R.L.', '331032021', 'MIRIAN MAMANI NINA', 'EL ALTO, AV, LARECAJA N? 1064 URBANIZACION VILLA ADELA ALEMANIA', '71299661', '', 'SODECOIM.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'SUAREZ CONSULTORA Y CONSTRUCCIONES S.R.L.', '333114029', 'NESTOR SUAREZ GIL', 'TRINIDAD, CALLE SUCRE N? 687 ZONA CENTRAL', '70711655', '', 'SUAREZSRL2017@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'JPCORPO TECNOLOGIA AVANZADA S.R.L.', '334218026', 'DENIS VLADIMIR JALDIN PRADO', 'SALAMANCA N? 560 ESQ. LANZA', '4521059', '', 'gerencia@jpcorpo.net', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'PRODUCCION Y DISTRIBUCION DATAMARK S.R.L.', '335898027', 'MIGUEL ANGEL  TOLAVA ORTEGA', 'LA PAZ, AV. VICTOR AGUSTIN UGARTE N? 105 ZONA ALTO SOPOCACHI', '77270492', '75283498', 'DATAMARKSRL@YAHOO.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'EMPRESA DE CONSTRUCCIONES E INGENIERIA SUKAT S.R.L.', '343366029', 'JOSE LUIS HAYVAR PINTO', 'AV, JUAN JOSE TORREZ N? 702', '73074881', '', 'INGENIERIA.SUKAT@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'ORDENES CONSTRUCCIONES S.R.L.', '346300027', 'FRANCISCO RAFAEL ORDENES SOTELO', 'LA PAZ, CALLE 6 Nº 241 URB. SAID ZONA PAMPAHASI', '62400032', '72024561', 'ORDECONS.SRL@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:27:21'),
(103, 'LOBATON & CARVAJAL INGENIERIA Y CONSTRUCCION S.R.L.', '346693025', 'ALEJANDRA NICOLE CARVAJAL CASTILLO', 'LA PAZ, AV. SANCHEZ LIMA N? 2557, TORRE CODES, PISO 14 OFICINA B', '76760601', '', 'LYC.INGENIERIAYCONSTRUCCION@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'CONSTRUCTORA Y CONSULTORA \'ILUSION\' S.R.L.', '346909024', 'DELIA MORALES ROSAS', 'CALLE OBLITAS N? 100, ESQ. VASQUEZ', '72491414', NULL, '22markol@gmai.com', NULL, 'NINGUNA', '0000-00-00 00:00:00', '2022-02-16 11:07:24'),
(105, 'CONSTRUCCIONES JCF & MTT S.R.L', '352032025', 'MIGUEL ANGEL TORRICO TRUJILLO', 'CBBA, N? 368 CALLE TUMUSLA ESQ. JOSE MARTI', '70360211', '60712127', 'CONSTRUCCIONES.JCF.MTT.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'ASOCIACION ACCIDDENTAL COSMOS', '356273024', 'EDGAR ORLANDO BORDA APAZA', 'CALLE LOAYZA Y MERCADO EDIF ALBORADA PISO 9 OF. 907', '67005030', '', 'borda7872@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'EMPRESA CONSTRUCTORA ROXANA RIVA GUANCA S.R.L.', '356554021', 'ROXANA RIVA GUANCA', 'EL ALTO, CALLE NATANIEL AGUIERRE N? 3015 Z. VIRGEN DE COPACABANA', '71556101', '', 'EDRIVA1411@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'COMPA?IA DE SERVICIOS DIPAUL S.R.L.', '361464029', 'MARINA CALLISAYA MAMANI', 'CALLE PASCOE N? 3423', '71967505', '77763720', 'CIASERDIPAUL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'ALPHACONST S.R.L.', '366748021', 'NESTOR GONZALO TORREZ MONTALVO', 'LA PAZ, ZONA VILLA CONCEPCION CALLE JUAN BAUTISTA N? 1514', '22850717', '', 'ALPHACONST.T@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'CONSTRUCTORA POMCOR S.R.L.', '369192029', 'CRISTIAN MOLLO PARI', 'LA PAZ, CALLE G N? 310 ZONA BELLA VISTA ENTRE CALLE 4 Y 5', '70510110', '', 'POMCOR.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'AISCONS SRL', '373597022', 'DANITZA NINET GONZALES CONDORI', 'CALLE PEDRO MIRANDA N? 5, ZONA LA PORTADA', '395440', '60678037', 'vivicita31@yahoo.com', NULL, 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:41:01'),
(112, 'EMPRESA CONSTRUCTORA CONSULTORA ONAIROL S.R.L.', '375889023', 'ROLY YUJRA TAPIA', 'EL ALTO, CALLE M N? 706-B ZONA PUERTO MEJILLONES', '68136853', '', 'YUJRA02@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'CONSTRUCTORA Y CONSULTORA ECOTOVIP S.R.L.', '376425027', 'MARTIN MACHACA CHURA', 'EL ALTO, CALLE OJOS DEL SALADO N? 1034 ZONA NUEVA ASUNCION', '74000202', '', 'MACHACACHURAMARTIN@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'PROINTECBL S.R.L.', '376712020', 'JAHEL JANNETT BUEZO GARCIA', 'LA PAZ, CALLE 6 N? 5 ZONA COTA COTA, ESQUINA DE LA CALLE PROLONGACION', '79116664', '79666326', 'CONSULTORABL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'ASOCIACION ACCIDENTAL ZURIEL', '380582027', 'ROBERTINA MAMANI MAMANI', 'CALLE ROBERTO PRUDENCIO N? 1915, ZONA CESAR AUGUSTO', '60569046', '', 'mamani13roberta@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'EMPRESA CONSTRUCTORA & CONSULTORA \'PREMOLCA\' S.R.L.', '383236024', 'MILAN CALLE LAURA', 'EL ALTO, - VILLA ADELA PLAN 44B N?7', '75878565', '', 'CALLEMLAURA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'ASOCIACION ACCIDENTAL GRUPO ICA', '383286029', 'JORGE MAURICIO DULON LOPEZ', 'CALLE F N? 772 SECTOR SAN RAMON, ZONA ACHUMANI', '70550780', '71563131', 'altarsrl@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'MATKIA CONSULTORIA & CONSTRUCCION', '383306028', 'ALEJANDRA CLAROS MEDINA', 'AV. SANTA ANA #1098', '4381609', '72238750', 'ALEJANDRACLAROSM@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'ASOCIACION ACCIDENTAL CPC', '385728027', 'CARLOS ANDREI CORONEL SILVA', 'CALLE I N? 10, ZONA OBRAJES', '72018063', '', 'carloscoronelsilva@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'OCOTAVI S.R.L.', '386021021', 'PAMELA RAMOS COLQUE', 'ORURO,CALLE 10 N? 7 ENTRE AV. AL VALLE', '5212657', '', 'PAMELARAMOSCOLQUE@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'AKRONTTE INGENIEROS S.R.L.', '388839022', 'JAMIL JULIO ANGLES RODRIGUEZ', 'CALLE ALCOCHE N? 232 - VILLA FATIMA', '69795320', '77720184', 'INFO.AKRONTTE@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'ASOCIACION ACCIDENTAL INNOVA', '392028026', 'SERGIO DANIEL ALTAMIRANO ALVAREZ', 'AV. COSTANERA N? 30, ZONA ACHUMANI', '76761737', '', 'sergio.altamirano@alma-ingenieria.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'CONSTRUCTORA ORBANCO S.R.L.', '392125025', 'LADY ELIANA MARIÑO FLORES', 'LA PAZ, CAP. RAVELO EDIF. PAOLA DANIELA N? 2097 PISO 1 OFIC. \'A\'', '78899600', '2433466', 'ORBANCO.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-16 10:53:52'),
(124, 'ASOCIACION ACCIDENTAL MACROTEC - ARES', '392850029', 'FERNANDO GUILLERMO ZEGARRA CANO', 'CALLE BRAULIO VERA N? 6580, ZONA IRPAVI', '72549393', '77505174', 'fezegarra@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'COMPAÑIA DE INGENIEROS TORREZARMAZA S.R.L.', '402038023', 'ARIEL ARMAZA OLIVARES', 'LA PAZ, CALLE B Nro195 VILLA FATIMA', '2902238', '79100100', 'TORREZARMAZA@GMAIL.COM', NULL, 'NINGUNA', '0000-00-00 00:00:00', '2022-03-28 11:38:20'),
(126, 'ASOCIACION ACCIDENTAL ECONALPA Y ASOCIADOS', '404718027', 'DIEGO ARIEL AVENDA?O CANO', 'TARIJA -B/ SIMON BOLIVAR AV. HEROES DEL CHACO', '75141825', '', 'ECONALPASRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'EMPRESA CONSTRUCTORA TORREZ S.R.L.', '406012021', 'NESTOR GONZALO TORREZ MONTALVO', 'LA PAZ, Z/ VILLA CONCEPCION C/ JUAN BAUTISTA N? 1514', '67114675', NULL, 'CONSTRUCTORA.ETC.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-03-28 11:24:44'),
(128, 'EMPRESA DE INGENIERIA Y CONSTRUCCION EQUIMAQ HIC SRL', '407307023', 'HECTOR VLADIMIR IRIARTE CARDONA', 'PASAJE, LOS ALAMOS N? 70 CALACOTO, SAN MIGUEL', '2790959', '71565960', 'EQUIMAQ.HIC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'EMPRESA UNIPERSONAL ARCOLA ESTUDIOS Y CONSTRUCCIONES ARMANDO AUGUSTO CORTEZ LOAYZA', '423824019', 'ARMANDO AUGUSTO CORTEZ LOAYZA', 'AV. 3 N? 24 AUQUISAMA?A', '2770984', '79619649', 'armcortez@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'CONSTRUCTORA CONVLAS', '441757014', 'DOROTEA MARTHA URAQUIRI DE SI?ANI', 'AV. ?ANCAHUASU N? 1004 UV.: 2 MNZO:1 ZONA: VILLA INGENIO', '79538092', '78950015', 'CONSTRUCTORA.CONVLAS@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'EMPRESA CONSTRUCTORA CONSULTORA \'KAPQUEQUI\'', '488577019', 'RONALD HUMBERTO KAPQUEQUI SAMO', 'VILLA COPACABANA C/316 NRO 916', '67049845', '73038942', 'ING.KAPQUEQUI@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-04 10:41:18'),
(132, 'EMPRESA DE OBRAS CIVILES \'EMOCI\'', '665973018', 'GERMAN JORGE RIOJA ARZE', 'AV. 24 DE JUNIO N? 200', '5278201', '', 'EMOCI2010@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'PETROMAAAS SRL. MEDIO AMBIENTE Y ACCION SOCIAL', '1000551024', 'WALTER ORLANDO CESPEDES ZARDAN', 'SUCRE, CALLE JA MARTINEZ N? 250', '4640009', '', 'PETROMAAS@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'EMPRESA CONSTRUCTORA GISHAY S.R.L.', '1001097022', 'NOEL GONZALO MANCILLA SLVIA', 'LA PAZ, ACHUMANI  CALLE 3 N? 348', '2799648', '2793298', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'EMPRESA CONSULTORA ARGOS S.R.L.', '1001177026', 'ANGEL WILBERTO CALDERON BALLESTEROS', 'CALLE FEDERICO ZUAZO N? 1885 EDIFICIO EL ALCAZAR TORRE CORDOVA PISO 8 OFICINA C', '76767235', '75704040', 'CONSULTORA.ARGOS.SRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'CONSTRUCTORA POLITECNICA BOLIVIANA SRL', '1001217025', 'LUIS ENRIQUE FLORES ANDRADE', 'LA PAZ, PLAZA ALONZO DE MENDOZA EDIF, FUNDADOR N? 180 PISO 2 OF. 16', '2456533', '', 'CPB_BOLIVIA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'RIVECO CONSTRUCCIONES S.R.L.', '1001399028', 'ANGELA MARIA COPAJA VELASCO', 'LA PAZ, AV. 16 DE JULIO EDIFICIO 16 DE JULIO, PISO 9, OFICINA 906', '2319752', '73012111', 'RIVECO_SRL@YAHOO.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'EMPRESA NACIONAL DE CONSTRUCCIONES ENACO LTDA', '1001793029', 'ROSSANA ZAPATA ESCOBAR', 'LA PAZ, CALLE JAIME MENDOZA (BLOQUE M) N? 916 ZONA SAN MIGUEL', '2799632', '', 'ENACO@ENTELNET.BO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'ICARO CONSTRUCCIONES SRL', '1002211026', 'JULIO CATALAN ESCOBAR ROJAS', 'CALLE JUAN MANUEL LOZA Nº 1997', '2229232', '77740011', 'diddierg@gmail.com', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-23 11:09:50'),
(140, 'EMPRESA CONSTRUCTORA VIA?A DE RESPONSABILIDAD LIMITADA (VIP SRL)', '1002723020', 'ARACELY DENISSE PE?A ARAOZ', 'CALLE 22 DE CALACOTO N? 1773 EDIFICIO O-22 PISO 6 OFICINA 6B', '2795578', '76737700', 'PENA.DENISSE@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'MENDIETA Y ASOCIADOS S.R.L.', '1002903027', 'PEDRO VASQUEZ RAMIREZ', 'LA PAZ, CALLE PROL. 59 N? 27 ZONA CHASQUIPAMAPA', '76797011', '', 'PEDROVASQUEZ1962@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'CONSTRUCTORA ARCOIN SRL', '1005149029', 'PEDRO VASQUEZ RAMIREZ', 'LA PAZ, CALLE 52, N? 100 ZONA DE CHASQUIPAMPA.', '76797011', '', 'ARCOINSRL@YAHOO.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'CONSTRUCTORA AGUA ANDINA S.R.L.', '1005197028', 'JUAN JOSE ORTU?O VILLAROEL', 'LA PAZ, ACHUMANI CALLE 31 N? 770', '2713255', '77234096', 'AGUA_ANDINA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'EMPRESA MULTIDISCIPLINARIA ADU S.R.L.', '1005373029', 'ALDO IVAN ANDRADE VENEROS', 'OBRAJES CALLE 3 N? 217 DPTO 102', '2788912', '77241203', 'INFO@EMADSRL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'EMPRESA CONSTRUCTORA GUARACHI LDA', '1006111024', 'JOSE GUARACHI MAMANI', 'LA PAZ, PEDRO MIRANDA N? 5 LA PORTADA', '2394832', '', 'CARLOS.GCHAVEZ@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'EMPRESA CONSTRUCTORA BRASIL S.R.L.', '1006389021', 'RENE GAMBOA GUZMAN', 'LA PAZ, ZONA SOPOCACHI CALLE MONTEVIDEO NRO. 254', '71933874', NULL, 'BRASILSRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:57:08'),
(147, 'SUD S.R.L.', '1006651023', 'WALTER ANDRADE BUSTAMANTE', 'CALLE ALOE, N? 35 ZONA EL ROSAL COMPLEJO LLOJETA', '70599128', '70150089', 'WANDRADE.SANDOVAL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'CENTRO DE ASERORAMIENTO EMPRESARIAL MULTIDISCIPLINARIO (CAEM LTDA)', '1006809029', 'EDGAR COSS ZELAYA', 'AV. 16 DE JULIO  N? 1479, EDIF. SAN PABLO PISO 15 DEPTO 1507 OFICINA 1507', '2360703', '2902384', 'SUPERVISIONCAEM@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'EMPRESA CONSTRUCTORA TAURO S.A.', '1006817021', 'MARCO ANTONIO AYALA ARNEZ', 'LA PAZ, AV. GUIDO CAPRA N? 1350 OBRAJES EDIFICIO TAURO PB', '2751140', '2751168', 'MAYALA@CONSTAURO.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'PROYECTO DISE?O Y CONSTRUCCION PRODICON S.R.L.', '1008963024', 'CARLOS JAVIER HERBAS TEDESQUI', 'CBBA, CALLE REQUE N? 1530 ZONA SARCO', '67403471', '67403470', 'PRODICON.ADM@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'INGENIEROS TECNICOS EN CONSULTORIA ITEC SRL', '1009745022', 'GALO ABRAHAM CHOQUE GODOY', 'ORURO, BOLIVAR N? 1038 ZONA ESTE', '73808993', '67200725', 'MARCIALCHOQUE@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'CONSTRUCTORA PANIAGUA ARROYO CONSPAR-S.R.L.', '1010195025', 'ROBERTO PANIAGUA ARROLLO', 'ORURO, AV. AL VALLE ENTRE CALLE 6 Y 7 N? 40', '71881234', '', 'ROBERTOPANIAGUA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'MULTIDISCIPLINARY CONSULTANCIES FOR THE DEVELOPMENT SRL - MCOD SRL', '1010395020', 'WILLIAMS NIEVES SANDI', 'PASAJE II N? 147 ENTRE VICU?A Y KENNEDY ZONA SUD', '71180852', '', 'NIVICOMCOD@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'EMPRESA CONSTRUCTORA CATARI S.R.L. ECOCAT S.R.L.', '1011361029', 'CIRO CATARI ZEGARRA', 'TARIJA, CALLE MEXICO N? 1163', '6638697', '', 'ECOCATSRL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'CONSTRUCTORA ORTHON S.R.L.', '1016343023', 'JOSE VELASQUEZ DELGADO', 'LA PAZ, SOPOCACHI  N? 2458 C. MELCHOR PEREZ DE HOLGUIN', '2417919', '70612662', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'EMPRESA UNIPERSONAL MEXBOL - IMPORTACIONES', '1016703027', 'DANIEL PEREZ ARCE', 'CALLE CUBA 1406', '73030854', '', 'arq_dpa@yshoo.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'EMPRESA CONSTRUCTORA ALTO LTDA', '1017679028', 'ROBERTO TORREZ PONCE DE LEON', 'LA PAZ, CALLE MERCADI N? 1328 EDIFICIO MARISCAL BALLIVIAN PISO 11 OF. 1101', '2201761', '62569960', 'ALTOLTDA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'ASOCIACION ACCIDENTAL BELMONTE - CCB', '1018435022', 'MIGUEL FERNANDO GRANDI MOLINA', 'CALLE MU?OZ CORNEJO N? 2737, SOPOCACHI', '22117876', '', 'belmonteingenieros@belmonteingenieros.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'CONSTRUCTORA VALDIVIESO S.R.L. CONSVAL LTDA', '1018881025', 'GUSTAVO ALBERTO VALDIVIESO FERREIRA', 'LA PAZ, CALLE LOAYZA N? 233 EDIFICIO MARISCAL DE AYACUCHO PISO 4 OF. 405', '2200854', '2202061', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'ECOFER S.R.L.', '1020151024', 'VICTOR MIGUEL FERNANDEZ SALAZAR', 'C. HUGO ESTRADA Nº 1354 PISO 2 OF. 3', '76754519', '76280697', 'EQOFER@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-03 10:51:48'),
(161, 'SOCIEDAD COMERCIAL E INDUSTRIAL HANSA LIMITADA', '1020343027', 'CARLOS JOSE VASQUEZ GRANDCHANT', 'CALLE YANACOCHA ESQUINA MERCADO N? 1004', '69773180', '73708075', 'LMIRANDA@HANSA.COM.BO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'IC RIMAC S.R.L. INGENIEROS CONSULTORES EN RIEGO INGENIERIA MEDIO AMBIENTE Y CARRETERAS', '1022903020', 'NORMA SANTIESTEVEZ LOZA', 'CBBA, AV. CIRCUNVALACION N? 0-1992', '72787928', '67491818', 'JUANCARLOSSOZA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'CONSULTORA INTEGRAL TARIJA S.R.L. COINTAR S.R.L.', '1024607020', 'JUAN JOSE CHOQUE HERBAL', 'AV. CAPITAN CASTELLON N? 1539 ZONA NARCISO CAMPERO', '72985525', '71864069', 'JJCHHTJA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'CONSTRUCTORA TORRES CUELLAR', '1029009020', 'JORGE EMILIO CUELLAR TORREZ', 'SUCRE, CALLE AYACUCHO N? 622', '6440147', '68666345', 'JORGECUELLARTORREZ@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'LIMARC CONSTRUCCIONES S.R.L.', '1029693029', 'SAMUEL LIMACHI QUISPE', 'EL ALTO, C/8 N? ZPMA TUPAC KATARI', '71533362', '', 'LIMARCC@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'EMPRESA PEDESTAL S.R.L.', '1030039029', 'BLANCA ARIAS CHINCHE', 'ORURO, AV DEL MINERO N? 1053 ENTRE WHASINGTON Y CAMACHO', '71888093', '71882528', 'PEDESTAL.SRL.OR@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'ALDEBOL', '1034912018', 'BERNARDO DE LA FUENTE MUSZYNSKI', 'PLAZA AGUIRRE N?100 CALACOTO', '2799408', '', 'aldebollapaz@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'CENTRO DE CONSTRUCCIONES Y CONSTRUCTORES DE OBRAS OSVALDO - C.C.O.O.', '1060138017', 'OSVALDO WALTER CHAMBI CALIZAYA', 'AV LOS SARGENTOS N? 329 ZONA BAJO LLOJETA', '78820903', '71489041', 'OSVALDOWALTERCHAMBC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'EMPRESA CONSTRUCTORA MOSCOSO', '1141893013', 'FRANZ CARMELO MOSCOSO CORONADO', 'LA PAZ, AV. ROMA N? 6723 ZONA OBRAJES', '2780383', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'CONSTRUCCIONES Y CONSULTORIA SERCCLA DE GERMAN LAURA CALIZAYA', '1274208013', 'OVIDIO CRISTHIAN AGRADA QUIROGA', 'AV. 11 DE FEBRERO N? 387 BARRIO LURDES TARIJA BOLIVIA', '46655558', '71836288', 'GERMANLAURA_3@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'HEBERT VACA MEDINA - SICTECRUZ CONSTRUCCIONES', '1541650015', 'HEBERT VACA MEDINA', 'MANUEL IGNACIO SALVATIERRA NO 1023', '72644389', '', 'TUICHA_TEKOHVM@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'EFRAIN CONSTRUCCIONES EFRACO', '1867704010', 'EFRAIN JESUS ALVARADO FERNANDEZ', 'TARIJA, AV. JAIME PAZ ZAMORA N? 2168', '67383710', '', 'EFRACO-@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'EMPRESA CONSTRUCTORA MOICO', '1878739014', 'MOISES PONCE PEREZ', 'TARIJA CALLE 6 DE ENTRE A Y B', '46660465', '', 'YARODRIGUEZ173@GAMIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'LUIS GONZALO ARTEAGA TRILLO', '2014122018', 'LUIS GONZALO ARTEAGA TRIGO', 'SOPOCACHI, AV. 6 DE AGOSTO N? 2464 EDIF. LOS JARDINES PISO  8 OF. F.', '2441926', '77226372', 'GONARTEAGA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'INGENIERIA V.V.C. Y SERV.', '2040797010', 'VICTOR VARGAS COAQUIRA', 'CALLE RUPERTO JURADO N? 1830 Z. EL TEJAR', '2473037', '68225422', 'VICVARCOA@GMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:42:50'),
(176, 'VICTOR CRUZ RODRIGUEZ', '2213218013', 'VICTOR CRUZ RODRIGUEZ', 'LA PAZ, AV. REG. CASTRILLO N? 622 ZONA SAN ANTONIO BAJO', '73596904', '72544308', 'CONSTRUCTORA.JLO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'EMPRESA UNIPERSONAL NEMTALA IMPOTANCIONES', '2249104013', 'JUAN CARLOS MEMTALA BALLON', 'CALLE GENARO SANJINES N? 348', '77238081', '72052720', 'nemtala_prod@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'EMPRESA CONSTRUCTORA MADELEINE', '2326986017', 'VICTOR H CORBAN RIVERO', 'LA PAZ, CALLE 3  BARRIO FERROVIARIO N? 32 Z/PURA PURA', '75222584', '', 'VICOCORBAN@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'CONSTRUCCIONES SEBRA', '2354347010', 'WLATER L. MENDOZA QUISBERT', 'C/DIEGO DE PERALTA N? 202', '71219743', '', 'CONSTSEBRA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'EMPRESA CONTRUCTORA ABRAHAM VILLAROEL', '2371193013', 'FELIX ABRAHAM VILLARROEL CRESPO', 'SUCRE, DESTACAMENTO 220 N? 417', '75761856', '', 'SAMUSDITO@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'EMPRESA CONSULTORA UNIPERSONAL UTA UMA  JAKA?A', '2524591018', 'JUAN CARLOS INCHAUSTI AVILES', 'AV. SANCHEZ LIMA N? 2512 PISO 8', '22410296', '', 'UMAJAKANA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'VICENTE HERMOGENES RUIZ CONDORI', '2623121013', 'VICENTE HERMOGENES RUIZ CONDORI', 'EL ALTO CALLE 8 DE DICIEMBRE N?  UV. B MZNO 54 ZONA URB. ALTO CHIJINI', '71972944', '', 'VICENTERUIZ_@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'EMPRESA CONSTRUCTORA GAMAOR', '2661698015', 'ORLANDO OROPEZA MERCADO', 'CALLE MERCADO, EDIF BALLIVIAN, PISO 2 OFICINA 205', '70114466', '', 'ISRAELNOVEMBER@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'CONSTRUCTORA EN OBRAS CIVILES CH\'AMA', '2703789011', 'GONZALO YUJRA CHIPANA', 'EL ALTO, CALLE N?2, 365 ZONA TUPAC KATARI', '71961484', '', 'CONSTRUCTORACHAMA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'VIABLE C.OR.P  DE CARLOS ORLANDO PE?ALOZA QUIROZ', '2710873010', 'CARLOS ORLANDO PE?ALOZA QUIROZ', 'CALLE LOAYZA N? 349, EDIF. LOAYZA, PB - OF. 5 ZONA CENTRAL', '77534900', '', 'CPENALOZA@VIABLECORP.COM.BO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'EMPRESA CONSTRUCTORA Y CONSULTORA LUNA APAZA', '2763591012', 'FELIX LUNA APAZA', 'ORURO, AV. SOLDADO BOLIVIANO URUS Y TUPAC AMARU N? 4 BARRIO KANTUTA', '5243678', '71884866', 'CONST_LUNA@HOTMAIL.ES', 'ORURO', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-07 11:41:44'),
(187, 'GUSTAVO RICARDO AGUAYO CAMACHO (SERVICIOS INTEGRALES DE CONSTRUCCION E INGENIERIA AGUAYO CAMACHO)', '2890865014', 'GUSTAVO RICARDO AGUAYO CAMACHO', 'CCBBA C/INNOMINADA N? 110 Z. TACKOLOMA', '4494300', '77421714', 'GUSTAVOAGUAYO1979@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'CONSTRUCTORA DPF MULTIDISCIPLINARIA', '3056470016', 'DANEIL PARICAGUA FLORES', '6 DE OCTUBRE ESQUINA TENIETNE VILLA', '78981058', '72548848', 'DANICITO61@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'ZANBLUC CONSULTORA - CONSTRUCTORA', '3063560013', 'LAURA CAROLINA BUSTOS CALLE', '12 DE OCTUBRE N? 1666 MADRID Y BULLAIN', '73809565', '', 'LAURABUSTOSC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'CONSTRUCTORA \'TECONST\' DE TITO GONZALES GUTIERREZ', '3106333018', 'TITO GONZALES GUTIERREZ', 'ORURO, URB. PEDRO FERRARI LOTE 5-A MANZANO B-30', '67206310', NULL, 'TITO_GONZALES3170@GMAIL.COM', 'ORURO', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:59:13'),
(191, 'EMPRESA CONSULTORA RAMIRO CALLISAYA GUTIERREZ - INGENIERIA', '3323720014', 'RAMIRO CALLISAYA GUTIERREZ', 'EL ALTO, SENKATA URB. PARCOPATA PLAZA 2 DE FEBRERO N? 315', '73577825', '', 'CONSULTORESENING2021@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'ASOCIACION ACCIDENTAL CONSORCIO LOZA & MONTEVILLA', '3335733014', 'HUGO ROLANDO LOZA MOLINA', 'CALLE CAMPOS N? 1212 EDIF. ARTEMIS PLANTA BAJA OF. 5', '22434806', '', 'hlozaconst@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'ASOCIACION ACCIDENTAL SVENSKA CONSTRUCTORA Y CONSULTORA - THAQUI S.R.L.', '3375495012', 'RAY ALFONSO ANZA PEREZ', 'CALLE JORGE ROUMA N? 1038 ZONA ALTO OBRAJES SECTOR B', '2734132', '77749933', 'svenka.constructora@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'DANIELA OROPEZA MERCADO', '3396773010', 'DANIEL OROPEZA MERCADO', 'CALLE  MERCADO, EDIF. BALLIVIA, PISO 2 OFICINA 205', '70114466', '', 'ISRAELNOVEMBER@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'ESCARLUC', '3403616010', 'CATALINA ESCARCE LUCERO', 'EL ALTO, CALLE NISTHAUS N? 100 ZONA 16 DE JULIO', '79674864', '', 'CATALINAESLU@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'CONSTRUCTORA LOSECRET', '3419018010', 'ALEJANDRO PALACIOS V', 'LA PAZ, AVENIDA JAVIER DEL GRANADO ENTRE CALLE SIN SALIDA N? 3 ZONA LAS LOMAS', '78900520', '', 'ALE_PALAVILLA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'ASOCIACION ACCIDENTAL KARNINCIC Y ASOCIADOS', '3445322011', 'MARCO ANTONIO KARNINCIC FIGUEREDO', 'CALLE 1 N? 510 ZONA VALLE HERMOSO', '71966960', '2229232', 'maka.bo@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'EMPRESA CONSULTORA Y CONSTRUCTORA INGENIERIA GENERAL MULTIDISCIPLINARIA EF. IGM', '3461615010', 'EFRAIN CUARITY MAMANI', 'CALLE CHIMAN IGNACIO N? 4065 Z/ VILLA INGENIO', '6323553', '', 'ECUARITY1@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'OBRAS CIVILES E INGENIERIA ASKI EMPRESA CONSTRUCTORA', '3469586010', 'JESUS NILO ITURRY URQUIZO', 'LA PAZ, C. GUATEMALA 1415 ED. LOS CISNES OF. MZ C-3', '2243277', '71990751', 'ASKI.CONSTRUCTORA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'EMPRESA DE SERVICIOS EN INGENIERIA LEGOS', '3498846012', 'ALBERTO SEBORGA CARDENAS', 'AV. HEROES DEL PACIFICO # 1221', '2223813', '', 'BETOSEBORGA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'ASOCIACION ACCIDENTAL MICHELLE ASOCIADOS', '3505106013', 'HUMBERTO RUBEN MOLLO CATARI', 'URB. MILENIUN MANZANO N3 L-12 S/N', '25235185', '72450990', 'constructoramichelle_50@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'CONISA CONSTRUCTORA EN INGENIERIA SAINZ', '3510273015', 'JUAN CARLOS SOLIZ SAINZ', 'ORURO, CALLE WHASHINGTON N? 1480 , ENTRE ADOLFO MIER Y JUNIN', '25239554', '70650902', 'JCSOLIZSAINZ@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'DANCON DANIELA CONSTRUCCIONES', '3515930015', 'RAMIRO IVAN NOGALES FLORES', 'ORURO, AYACUCHO N? 371 Y BRASIL', '62760585', '', 'IVANNOGALES321@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `empresas` (`id`, `nombreEmpresa`, `nit`, `nombreLegal`, `direccion`, `fono1`, `fono2`, `email`, `departamento`, `observacion`, `created_at`, `updated_at`) VALUES
(204, 'MILDAR EMPRESA CONSULTORA CONSTRUCTORA MULTIDISCIPLINARIA', '3516494012', 'MILTON LOPEZ CACERES', 'URB. LA AURORA N? 871 ZONA NOROESTE', '71887949', '5249028', 'MILDAMULTIDISIPLINARIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'CEPRING CONSULTORIA EN ELABORACION DE PROYECTOS DE INGENIERIA', '3519776018', 'DELMA NOGALES AJUACHO', 'URQUIDI 332 TOMAS FRIAS Y RENGEL', '73801807', '25212617', 'MEGANCITADELMA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'EMPRESA CONSULTORA Y CONSTRUCTORA HICONS', '3536668016', 'GUSTAVO HIDALGO MARTINEZ', 'CALLE CA?ADA STRONGEST N? 48 AV. BARRIENTOS Y MENACHO', '5244848', '72468326', 'gustavohidalgo@yahoo.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'ASOCIACION ACCIDENTAL OCSA MANOCA', '3550907011', 'FERNANDO OCSA AJHUACHO', 'CALLE E. CONDARCO S/N', '4433541', '69573501', 'constructoraocsanishiki@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'CONSTRUCTORA Y CONSULTORA JOSJER', '3551286019', 'JOSE LUIS LOPEZ CHURQUI', 'ORURO, C/M. RAMALLO N? 26 PROL. TTE LEON Y A. DE IBA?EZ', '72355876', '', 'JOSE-HIPO12@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'ASOCIACION ACCIDENTAL PICAM', '3637720027', 'CARLOS ANDREI CORONEL SILVA', 'CALLE I N? 10, ZONA OBRAJES', '72018063', '', 'carloscoronelsilva@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'EMPRESA CONSTRUCTORA SAMUEL BENITO TORRES ROMERO ECOSAT', '3650537012', 'SANUEL BENITO TORRES ROMERO', 'SUCRE, CALLE PERU N? 48', '72886941', '', 'SATOROMERO@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'EMPRESA UNIPERSONAL OSWALDO MAIZARES CALAPI?A (RIGHT TR.AS.ING.)', '3672910014', 'FREDDY CARRAZANA M.', 'URBANIZACION VELA CALLE N? 1 S/N ZONA TORRECILLAS', '65828530', '72951593', 'OSWALDOMAIZARESC@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'ASOCIACION ACCIDENTAL HIDRO & VIA Y ASOCIADOS', '3710680013', 'MARCO ANTONIO GOMEZ MENDIVIL', 'LA PAZ, CALLE 6 DE OBRAJES', '72400668', '', 'HIDROYVIA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'COMPA?IA DE SERVICIOS Y ARQUITECTURA I&A', '3974815016', 'CHARLY ROGER FLORES ARAMAYO', 'TARIJA, CALLE DELFIN PINO N? 155', '72978175', '', 'CHARLYROGERFLORES@YAHOO.COM.AR', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'DECCO -PLAN', '3999342018', 'LUIS RICARDO VILLCA MERCADO', 'AV. GUIDO VILLAGOMEZ N? 257', '46420969', '74425248', 'LUISRVM05@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'CONSULTORA CONSTRUCTORA CATIM', '4000385017', 'FREDDY HERNAN MAMANI MOYA', 'PERALTA SORUCO N?26 BUSTAMANTE Y CONDARCO', '71853324', '', 'FHONDDY_14@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'CONSTRUCTORA ATRALID', '4034917016', 'EVER RAMOS BAZAN', 'ORURO, CALLE 10 DE NOVIEMBRE N? 104 ZONA NORTE', '5240454', '72463268', 'ATRALID@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'EMPRESA CONSTRUTORA EMUSLA', '4037689016', 'ROBERT RUBEN LAZARTE POMA', 'ORURO, CALLE 20 N? 4 CALLE K Y AV. SORA', '72488336', '', 'EMUSLA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'CONSULTORA CONSTRUCTORA NICOBERNO', '4048709011', 'ALVARO JAEN KRAVAROVIC', 'CALLE ALDANA  N? 397 ENTRE POTOSI Y PAGADOR', '5280140', '70420015', 'ALVAROJK@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'CONSTRUCTORA Y CONSULTORA CONSIBOL', '4056781012', 'HENRY CHOQUE CANAVIRI', 'ORURO, AV. AMERICA N? 9 KASSO Y OVANDO', '72350079', '', 'HENRY_CHOQUE_C@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'CONSTRUCTORA ROCATESA', '4058067013', 'ROGER CUTILE ESCALANTE', 'EL ALTO, CALLE EMBOL # 8282, ZONA SAN FELIPE DE SEKE', '78879097', '73005064', 'rcutileescalante@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'EMPRESA CONSTRUCTORA Y CONSULTORA LOVA', '4059979017', 'ARIEL OSVALDO LOPEZ BELMONTE', 'JOSE AGUIRRE ACHA 1558 DPTO 2-G', '71850668', '', 'CYCLOVA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'MAGFERCONS CONSULTORES Y CONSTRUCTORES', '4064168012', 'FERNANDO SAMUEL MACHACA MAMANI', 'C. POTOSI N? 1376 ENTRE CALLE LOAYZA', '67348707', '', 'FERNANDO.SAMUEL.MM@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'CONSTRUCTORA ASCENDENTE', '4066010011', 'SILVIA EUGENIA BERRIOS VIDAL', 'CALLE 10 DE NOVIEMBRE AV. CIRCUNVALACION N? 14.', '72463268', '', 'EUGENIA_3891@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'INCOFER', '4095631013', 'FERNANDO RIVERA CABALLERO', 'AV LAS AMERICAS N? 282', '72879997', '', 'INCOFER@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'EMPRESA CONSTRUCTORA CLAROSBOZA', '4115407018', 'CLAROS BOZA LUIS FERNANDO', 'SUCRE, BAHAMAS N? 76', '73442514', '', 'CLAROSBOZA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'PASCUAL VELASQUEZ OSORIO', '4136916014', 'PASCUAL VELASQUEZ OSORIO', 'TARIJA BARRIO 3 DE MAYO AV. FROILAN TEJERINA N? 2252', '72996114', '', 'PASCUAL_VELASQUEZ@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'EROBO', '4141749012', 'LINO SALOMON MEDINA SULLCA', 'AV. INDEPENDIENTE BARRIJO SAN MARTIN NRO 899', '72988571', '', 'LINO_MEDINA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'SERVICIOS DE INGENIERIA FERNANDEZ VARGAS', '4143448011', 'RONALD FERNANDEZ APARICIO', 'TARIJA, C/ ADEL CORTES PASAJE N? 3 CASA N? 2441', '6634511', '', 'RONFERAPA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'ASOCIACION ACCIDENTAL JAYLI', '4145301010', 'RODRIGO TEOFILO HERRERA AYARDE', 'CALLE GRANADA N? 342 BARRIO ANDALUCIA', '71898669', '73480755', 'EMPRESATRIASUR@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'TERRASUR', '4156351018', 'MARCO ANTONIO CARDOZO BURGOS', 'CALLE POTOSI N? 35', '72987106', '', 'MACBLIC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'EMPRESA CONSTRUCTORA LUCONS - EMPRESA UNIPERSONAL', '4240246010', 'NIRMA ALTINA TERRAZAS CARTAJENA', 'LA PAZ, AVENIDA PEDRO MARBAN N? 1357 Z. ACHACHICALA', '72004506', '', 'NELSONLUCONS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'CONSTRUCTORA ELDER', '4243748011', 'ROBERTO ROBERT MAMANI PILCO', 'VIACHA-CALLE JOSE MANUEL LINARES N? 1395 UV S/N MZNO S/N ZONA SANTA CRUZ', '70568285', '70162801', 'PILCOR@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'DANIEL RAMIRO IRAOLA TELLEZ', '4244783015', 'DANIEL RAMIRO IRAOLA TELLEZ', 'CALLE MURILLO EDIF. ORURO II PISO 11 OF. 11 Z/ CENTRAL', '60135352', '73706277', 'DANYIRAOLA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'GE & SERCO', '4268016011', 'GONZALO CAZAS CARVAJAL', 'LA PAZ, COMPI ZONA CENTRAL S/N CARRETERA COPACABANA', '71213060', '', 'GE-SERCO@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'GREGORIO TOMA MAMANI', '4272539015', 'GREGORIO TOMA MAMANI', 'EL ALTO, CALLE 1 N? 93 ZONA BARRIO SAN JUAN', '71983591', '77226661', 'NO REGISTRO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'EMPRESA UNIPERSONAL JJES  CONSTRUCIONES', '4276959011', 'JUAN JOSE LIMACHI TARQUI', 'LA PAZ, Z. LA PORTADA CALLE 4 N? 444', '71297506', '', 'JJES_CONSTRUCCIONES@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'EMPRESA CONSTRUCTORA ANGELINO CANAVIRI MAMANI', '4292331010', 'ANGELINO CANAVIRI MAMANI', 'AV. KOLLASUYO N? 6035 ZONA TAHANTINSUYO EL ALTO', '2862534', '68073627', 'ANGELINOCANAVIRI@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'TAHUICHI CONSTRUCTORA Y CONSULTORA DE NESTOR ATAHUACHI MEJIA', '4293842019', 'NESTOR ATAHUACHI MEJIA', 'LA PAZ, ZONA LLOJETA, CALLE 1 N? 252', '2501680', '', 'TAHICHICONS@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'HUGO PABON CHURA', '4309477019', 'HUGO PABON CHURA', 'ALTO CALACOTO, AV. LITORAL N? 577', '22701498', '', 'HBPINGENIEROS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'EMPRESA UNIPERSONAL DIETER OVIDIO LLANQUI AJATA', '4320572012', 'DIETER OVIDIO LLANQUI AJATA', 'EL ALTO, CALLE ARZABE N? 36 ZONA LOS ANDES', '71533009', '', 'DIT_LLANQUI@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'ASOCIACION ACCIDENTAL PE?A FESACO', '4325111019', 'JOSE JUIS PE?A ANDRADE', 'CALLE 16 DE OBRAJES N? 220 EDIF. CENTRO DE NEGOCIOS OBRAJES PISO 5 OF. 509', '73274565', '71987059', 'jlpa.civil@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'EDWIN JOSE RAMOS MIRANDA', '4378731010', 'EDWIN JOSE RAMOS MIRANDA', 'VILLA ESTHER CALLE LOS GLADIOLOS N? 1744', '74060441', '22833102', 'EDWIN_RAMALLOM@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'EMPRESA CONSULTORA COLAF', '4402317012', 'GONZALO XAVIER LA FUENTE NERY', 'C. MECAPAQUE?A N? 2449', '4307344', '72210008', 'COLAFSRL@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'CONSTRUCTOR Y CONSULTOR UNIPERSOAL JOHNATHAN ERICK VARGAS GONZALES', '4504137014', 'JOHNATHAN ERICK VARGAS GONZALES', 'CBBA, URB. LOS CEIBOS II S/N TIRANI', '44579009', '67404663', 'VARGAS-GONZALES-CONST@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'ZARATE CONSTRUCTORA CONSULTORA ZARCO', '4630469017', 'FABIO ZARATE DURAN', 'DESTACAMENTO 317 N? 1132', '77117000', '', 'LUISPADILLAVASQUEZ@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'CONSTRUCTORA ALANOCA MAMANI ROSA', '4746196017', 'RASA ALANOCA MAMANI', 'ZONA, HUAYNA POTOSI CALLE MISQUE N? 270', '71227144', '', 'ROSAALANOCA150@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'APAZA JIMENEZ TOMAS JOSE', '4746638015', 'TOMAS JOSE APAZA JIMENEZ', 'CALLE MARTINEZ MONJE N? 1172 ZONA VILLA NUEVO POTOSI', '72502525', '77755951', 'THOMMJZ@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'VENA CONSTRUCCION CONSULTORIA Y SERVICIOS', '4750346013', 'EDWIN  MARTIN CHAVEZ TITO', 'ZONA SAN PEDRO C/23 DE MARZO EDIF. NILVITA N? 1755', '7323399', '', 'VENA.CCS@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'INGENIERIA Y CONSTRUCCIONES M3', '4773437017', 'MIGUEL ARANIBAR MAMANI', 'EL ALTO, AV. JOSE AGUSTIN N? 1886 CIUDAD SATELITE', '71211001', '', 'M3MIGUELMIGUEL@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'EMPRESA CONSTRUCTORA DE HIPOLITO MILTON KANTUTA HUANCA', '4776006019', 'HIPOLITO MILTON KANTUTA HUANCA', 'EL ALTO, CALLE H N? 270 ZONA HUAYNA POTOSI', '68187247', '', 'HIPOLITOKANTUTA1975@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'AVM CONSTRUCCIONES Y CONSULTORA VARGAS MU?OZ', '4809677019', 'ALVARO GONZALO VARGAS MU?OZ', 'CBBA, ALCIBIADEZ GUZMAN N? 352', '4459746', '', 'AVMCASO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'INGENIERIA & CONSTRUCCIONES YATLEE.COF', '4815738012', 'ELIAS CONDORI QUISPE', 'EL ALTO, C/ SAN LORENZO N? 2442 ZONA  SAN MIGUEL ARCANGEL', '67087012', '', 'WWW.YATLEE.COF@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'SILLO CALLE CONSTRUCCIONES', '4816959019', 'CALLE SALUSTIANO SILLO', 'EL ALTO AV. ANIMAS N? 1841 Z. GERMAN BUSH', '72081720', '', 'SULLOCALLE@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'CONSULTORA CONSTRUCTORA BEKO', '4850051011', 'EMY DEYKO VERA CORONEL', 'AV. AREC TORRE MULTICINE PISO 8 OF. 809', '70524444', NULL, 'consbeko@hotmail.com', NULL, 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:52:56'),
(255, 'CONSTRUCTORA CONSULTORA KAPQUEQUI', '4888577019', 'RONALD HUMBERTO KAPQUEQUI SAMO', 'LA PAZ, CALLE 316 N? 916 ZONA VILLA COPACABANA', '69732712', '67049845', 'ING.KAPQUEQUI@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'CONSTRUCTORA PAZ ESTEN', '4905153017', 'GUALBERTO PAZ ESTEN KAISER', 'AV. FIDELIA CRUZ N? 1050 ZONA SAN LUIS 1? DE MAYO', '71229797', '', 'PAZ_ESTEN1CONSTRUCTORA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'PROYECTOS DE DESARROLLO EN VIAS SISTEMAS DE AGUA ANTISUYO PDVSA', '4912233012', 'YABANI VICTOR SEGURA MARCANI', 'AV. CBBA, N? 3464 ZONA URB. VILLA ALINA ENTRE CALLES 1 Y 2', '79544022', '68063762', 'PDVSAA44@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'EMPRESA UNIPERSONAL DEYNA CONSTRUCTORA Y CONSULTORA', '4921057018', 'RAMIRO CHINO CONDORI', 'LA PAZ, CHACALTAYA N? 407 ZONA ACHACHICALA', '73201877', '', 'NO REGISTRO', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'CONSTRUCTORA RALIUGA', '4926597012', 'TOMAS AGUILAR QUISPE', 'CALLE JUAN DE SAAVEDRA N? 423, ZONA ACHACHICALA', '73535100', '', 'www.raliuga@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'SERVICIOS DE INGENIERIA - RGZ', '4928675013', 'HELMER BLADIMIR RODRIGUEZ YUCRA', 'CALLE ANTONIO GALLARDO, N? 1332 ZONA ALTO CHIJINI', '73012567', '', 'INGEHELMER2@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'ASOCIACION ACCIDENTAL MC', '4936330016', 'AMERICO RUBEN HILAQUITA RAMOS', 'LA PAZ AV. NACIONES UNIDAS N? 500 ZONA RINCON LA PORTADA.', '76281602', '', 'AMERICO_HILAQUITA@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'CONSTRUCCIONES - ECONSEQ', '4966549010', 'DELFIN QUELCA QUISPE', 'ZONA LAS DELICIAS II CALLE HINOJOSA N? 1645', '68161132', '63204032', 'DELFOQUELCA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'EMPRESA CONSTRUCTORA EAP EULOGIO AJACOPA ?IRUMANI', '4977739018', 'EULOGIO AJACOPA PAIRUMANI', 'EL ALTO, Z. ALTO DE ALIANZA RET. CAMARONES N? 76', '71574319', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'MA. TA. EMPRESA CONSTRUCTORA UNIPERSONAL', '4989544014', 'MARTIN JAIME TAPIA CABRERA', 'EL ALTO, CALLE NICOLAS CHAVEZ Y SECTOR B 4124 AZONA E.A. JUNTUHUMA TARAPACA', '67066281', '', '', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'CONSULTORA Y CONSTRUCTORA EL GRETO', '4999052016', 'GREGORIO R. ANGULO HUAMPU', 'EL ALTO, CALLE 22 N? 128 ZONA VILLA TUNARI', '77246468', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'IPAC CONSTRUCTORES CONSULTORES DE PAMELA SEBORGA POZO', '5085077012', 'PAMELA SEBORGA POZO', 'CALLE CARRASCO EDIF. EILENN PISO 1, DEP. N?102', '76761404', '', 'PAMELASEBORGAPOZO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'EMPRESA UNIPERSONAL CAUJE', '5189181018', 'JUAN PABLO ALERE VELIZ', 'CBBA, AV. BLANCO GALINDO KM 11', '73402774', '', 'CONSTRUTORACAUJE@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'ASOCIACION ACCIDENTAL CORTEZ & CANTUTA', '5244942017', 'ELVIS CORTEZ CANTUTA', 'CALLE MIZQUE N? 270, ZONA HUAYNA POTOSI', '75287793', '71426735', 'ecortezc21@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'CONSTRUCCIONES TORRICO RODRIGUEZ', '5298907014', 'ALFREDO TORRICO RODRIGUEZ', 'CBBA, PACATA BAJA C7 GARDENIAS N? 147', '4299587', '', 'AFREDO_TORRICO@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'CONSULTORA Y CONSTRUCTORA CHAMBICONS', '5484810011', 'JOSE LUIS CHAMBI CHUQUICHAMBI', 'EL ALTO, VILLA SANTIAGO II/CA??E 7 N? 258', '71573935', '', 'CHAMBICONS@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'ESTANISLAO GONZALES AGUIRRE', '5489381014', 'ESTANISLAO GONZALES AGUIRRE', 'EL ALTO, CALLE TUPAK CATARI N? 7023 URBANIZACION COPACABANA PLAN 3000', '67022032', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'EMPRESA UNIPERSONAL CONSTRUCTORA LIFONZO', '5513727019', 'SEVERO ARUSQUIPA LIFONZO', 'FUNDICION S/N, ZONA CENTRAL - POTOSI', '75422711', '', 'Djs_v_7@yahoo.es', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'EMPRESA CONSULTORA Y CONSTRUCTORA MULTIYEC', '5545098018', 'YECID MAGNE JIMENEZ', 'POTOSI, CALLE RENE BARRIENTOS N? 22', '67066672', '72532013', 'EDGARMAJI1@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'CONSTRUCTORA Y CONSULTORA WILBER WILSON AVALOS OJEDA', '5656247018', 'WILBER WILSON AVALOS OJEDA', 'AV. DEL EJERCITO 901', '74413024', '', 'INGWILBERAVALOS36@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'CONSTRUCTORA EFFORT', '5693486018', 'NICOLAS TOMAS TORREZ PACO', 'CALLE MANURIPI # 97 ZONA MORRO', '69692218', '60307719', 'TORREZPACONINICOLAS85@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'ECOLETTI', '5797541019', 'MARVIN ADRIAN PERALTA RODAS', 'YACUIBA- CALLE GUAYABILLAS S/N ZONA LOS LAPACHOS.', '79289632', '', 'EMPRESAECOLETTI@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'EDUARDO MARZANA COLQUE', '5924660018', 'EDUARDO MARZANA COLQUE', 'CBBA, VILLA CANDELARIA - CALLE OCHOA S/N', '71784766', '', 'CONSTRUCTO.EDUARDOMARZANA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'MARY CORAITA COAQUIRA CONSTRUCTORA COARITA', '5989098013', 'EMMA CORI COARITA', 'LA PAZ, AV. PERIFERICA CALLE 3  N? 22 ZONA CUPILUPACA', '0', '0', 'EMMACORI555@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'YOLO FERNANDEZ FLORES', '6003824012', 'YOLO FERNANDEZ FLORES', 'QUILLACOLLO CALLE 2 N? S/N ZONA BARRIO FORTALEZA', '63216442', '77289634', 'FERNANDEZYOLO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'EMPRESA CONSTRUCTORA MAYTA', '6005975013', 'FRANKLIN TORREZ MAYTA', 'CALLE CARLOS MONTENEGRO N? 7204 UV. S/N MZNO  ANEXO SAN PABLO', '74098001', '70503010', '123@132.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-04-04 10:43:28'),
(281, 'TORREZ GEMELAS EMPRESA CONSTRUCTORA Y CONSULTORA', '6008275019', 'CORNELIO TORREZ QUI?ONES', 'EL ALTO, JANKO WILLKI NRO 2034 ZONA COSMOS 79 U.V.E. MZNO 27', '72514330', '', 'ARQ2@CORGMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'ASOCIACION ACCIDENTAL IDELING', '6022142016', 'IDELFONZO CORIA TORREZ', 'AV ROMA N? 31 ZONA VILLA EXALTACION - EL ALTO', '79606813', '', 'Idel_coria@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'DISTRIBUIDORA Y CONSTRUCTORA YOSUQUI', '6024717018', 'NANCY YOVANA SU?AGUA QUISPE', 'AV. NESTOR GALINDO N? 521 Z/ EL KENKO', '77767946', '', 'NANCYYOVANA1985@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'EMPRESA UNIPERSONAL COAR CHOQUE DE JHONNY ARCANI', '6028558018', 'JHONNY CHOQUE ARCANI', 'EL ALTO, CALLE PROLONGACION RAMOS GAVILAN N? 1124 S/N  ZONA 18 DE DICIEMBRE', '71929411', '', 'COARCHOQUE@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'CONSTRULIM JR', '6029344011', 'JUANA TI?INI ROJAS', 'LA PAZ, CALLE 2 N? 370 ZONA LLOJETA', '72549605', '79107282', 'GRUPOJUANA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'EMPRESA UNIPERSONAL PALNET\'S', '6049234017', 'FANNY PALMA MONASTERIOS', 'LA PAZ, CALLE GUAQUI N? 3225 ZONA SAN FRANCISCO DE ASIS', '70596812', '71934113', 'CONST_PALNET\'S@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'EMPRESA CONSTRUCTORA VIMAN SJ', '6050119015', 'VICTOR MAMANI MAMANI', 'CALLE INCA HUASCAR N? 2034 ZONA VILLA INGENIO EL ALTO BOLIVIA', '63237595', '', 'CONSTRUCTORAVIMANSJ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'ESTRUCTURAS MENDOZA ANDRADE SILVERIO', '6066492014', 'SILVERIO MENDOZA ANDRADE', 'ACHOCALLA, AV. SATURNINO VILLANUEVA N? 1150 UV. S/N ZONA TACAGUA', '71239148', '', 'CONSULTORESENING2021@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'EMPRESA CONSTRUCTORA G.O.C.', '6081810019', 'FAVIO MONTALVO TORREZ', 'EL ALTO, CALLE 14, ZONA COSMOS 78', '2850717', '72092733', 'CONST_GOC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'JESUS HERRERA FLORES', '6082944011', 'JESUS HERRERA FLORES', 'CBBA, AV. RENE BARRIENTOS N? 0 UV S/N MZNO S/N ZONA CERRO VERDE', '71774571', '', 'ALEXDJB@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'CONSTRUCTORA FRANSMAR', '6086520016', 'FRANCO DAVID ADUVIRI PAREDES', 'CALLE 11 ESQ. SANCHEZ BUSTAMANTE N? 487 EDIF. CBC II SS. OF. 7, ZONA CALACOTO', '77701740', '', 'CONSTRUCTORAFRANSMAR@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'EMPRESA UNIPERSONAL RONNY WILMER CONDE MACHICADO', '6120012011', 'RONNY WILMER CONDE MACHICADO', 'CALLE MAURICIO MANCILLA N? 876, ZONA LOS ANDES', '73031063', '', 'cmrw_lp@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'JOSE ANDRES RAMOS ALARCON', '6143449019', 'JOSE ANDRES RAMOS ALARCON', 'VILLA PABON, CAP. USTARIZ ESQ. EMILIO AGUIRRE N? 385', '2281380', '68066990', 'ING.ANDRESRAMOS@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'CONSTRUCTORA CONSULTORA IN.TA.VE.', '6638933018', 'BISMAR JHONNY TAPIA VELASQUEZ', 'ORURO, URB. ENTRE RIOS MZ 7-D LOTE 5', '72320533', '', 'CONSTRUCTORAINTAVE@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'DAFROBI DE DAVID HERNAN KAMA TORREZ', '6722008016', 'DAVID HERNAN KAMA TORREZ', 'EL ALTO CALLE KELCA N? 3004 UV, MZNO: S/N ZONA 25 DE JULIO', '71226131', '', 'DAVID.KAMATORREZ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'ADOLFO ACARAPI COPA', '6732555014', 'ADOLFO ACARAPI COPA', 'EL ALTO, AV. FLORIDA N? 2925 MZNO V. ZONA ECOLOGICO LOS PINOS', '68034800', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'CONSULTORA Y CONSTRUCTORA J-316', '6760213018', 'JORGE ALEJANDRO LUNA CANTUTA', 'VIACHA, CARRETERA VIACHA (LADISLAO CABRERA- AV. HACIA EL MAR) N? 2854 URBANIZACION URKUPI?A II, ESQUINA CALLE XXII', '63099840', '67300646', 'J.316.ALEJO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'ASOCIACION ACCIDENTAL CONSTRUCTORA CHAUPIORKO', '6782337019', 'MARTINA ARANCIBIA VEDIA', 'CALLE LOURDES N? 2125 ZONA MUNAYPATA', '67012171', '71227144', 'martinaarancibiavedia@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'EMPRESA CONSTRUCTORA CATSAN', '6784136015', 'OMAR ELIO SANTOS MAMANI', 'EL ALTO, CALLE PACAJES N? 1120 ZONA 27 DE SEPTIEMBRE', '73503100', '7674704', 'CATSAN2010@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'EMPRESA UNIPERSONAL GERMAN MARCELO NIETO CARVAJAL', '6792266016', 'GERMAN MARCELO NIETO CARVAJAL', 'AV. PERIFICA N? 40, ZONA VILLA DE LA CRUZ', '76285092', '72564150', 'Germarcn83@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'CONSTRUCTORA CONSULTORA GLONAS-TOP LTDA', '6806324018', 'ERICK SIMON SANTANDER PEÑA', 'LA PAZ, CALLE ESCALON Y AGUERO N? 230 ZONA VILLATEJADA RECTANGULAR', '2813087', '72581744', 'ESSP2426@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '0000-00-00 00:00:00', '2022-02-22 11:10:57'),
(302, 'INGENIERIA TOOPOGRAFIA  ARQUITECTURA DIGITALIZADA', '6814077011', 'LUIS EDUARDO ACARAPI QUELCA', 'CALLE LOAYZA N? 233, EDIFICIO AYACUCHO, MEZANINE, OFICINA N? 2 ZONA CENTRAL', '67322421', '', 'LUISDXEDU66@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'EMPRESA UNIPERSONAL JOSE FLORES BUSTAMANTE', '6922947019', 'JOSE FLORES BUSTAMANTE', 'LA PAZ, EL ALTO CALLE PAJCHANI N? 1034 UV. S/N MZNO S/N ZONA ANEXO HUAYNA POTOSI', '74008282', '', 'FLORESBUSTAMANTE@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'POMO CONSTRUCCIONES Y SERVICIOS', '6979312019', 'CILDA VERONICA MORALES MIRO', 'LA PAZ, CALLE 2 N? 1065 A. VILLA TEJADA, RECTANGULAR EL ALTO', '76766551', '', 'CILDAVERONICAMORALESMIRO@YAHOO.ES', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'EMPRESA CONSTRUCTORA EDS CONST', '7012662010', 'EDSON ERIK COYLA TORPO', 'LA PAZ, AV. A-3 N? 2915 ZONA PARAISO (EL ALTO)', '70540521', '63116679', 'EDSON_D_G@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'EMPRESA CONSTRUCTORA CONSADY', '7024468017', 'SANDRO MAMANI MAMANI', 'EL ALTO, CALLE MANUELA PAGADORA DE GRANEROS N? 7085 UV. 1-3 MZNO. S/N ZONA VILLA INGENIO', '74849085', '', 'SANDROMM666@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'DANTECONST', '7115918012', 'JOSE LUIS MAMANI IPORRE', 'AV. ARCE N? 2529 UV. S/N MZNO: S/N EDIFICIO: SANTA ISRAEL ZONA:SAN JORGE', '68681288', '', 'WIISBX36@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'CONSTRUCTORA CHICAL SERVICIOS Y CONSTRUCCIONES', '7221784019', 'LEONARDO CHIRILLA CANAZA', 'VILLAMONTES, CALLE SBTTE VILLANUEVA BARRIO 27 DE DICIEMBRE ESQUINA AV. INGAVI', '71861342', '75400544', 'CONSTRUCTORA_CHICAL@YAHOO.COM.AR', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'BRUIZ Y ASOCIADOS', '7479814018', 'NOHELIA VORAL FLORES FLORES', 'CALLE LOA N? 914', '71861143', '78690014', 'CC.BRUIZ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'EMPRESA CONSTRUCTORA Y CONSULTORA CON SILES', '7480003019', 'NELSON SILES LEON', 'SUCRE, BARRIO COINCA S/N ZONA AZARI', '74403022', '', 'CON_SILES@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'ASOCIACION ACCIDENTAL EL BIEN AVENTURADO', '7532427013', 'BILL CLINTON PADILLA LLANOS', 'CHUQUISACA, COMUNIDAD PUEBLO BAJO N? 5 CULPINA', '73457358', '', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'GUIHESI CONSULTORIA & CONSTRUCCION', '7888911016', 'JULIO CESAR SILES SUARES', 'CBBA, AV. DON BOSCO N? 3653', '75911543', '', 'JULIOCESARSILESSUAREZ@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'ASOCIACION ACCIDENTAL TRACBOL', '8268823016', 'DANIEL ZEGARRA ALVAREZ', 'CALLE CHOQUE?A N? 2135, ZONA COSMOS 79', '76277781', '', 'asotracbol04@hotmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'EMPRESA DE CONSTRUCCIONES MASOMAR', '8310087016', 'SONIA MARCANI MACHACA', 'EL ALTO, CALLE SORATA N? 2575 U.V S/N MZNO S/N ZONA: 21 DE OCTUBRE - A', '75814535', '70177426', 'SONIA25LIBERTAD@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'ARATINY MARCO QUISPE MAMANI', '8345787015', 'ARATINY MARCOS QUISPE MAMANI', 'CALLE MEXICO Y COLOMBIA, EDIF. GALERIA COLOMBIA, PISO 5 OFI. 501', '71940324', '', 'SUMMUS.ING@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'EMPRESA CONSTRUCTORA BLAFAV', '8364718017', 'FABRICIO GONZALO VARGAS PACHECO', 'ZONA SAN PEDRO ALTO C/ PIONEROS ROCHDALE N? 937', '67081223', '', 'CONSTRUCTORABLAFAV.INFO@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'EMPRESA UNIPERSONAL ICMA CONSTRUCTORES', '9880890015', 'CLAUDIA ALEJANDRA PEREZ', 'JOSE MANUEL LOZA N? 1017, ZONA CHAMOCO CHICO', '72485259', '67045772', 'icma.constructores2003@gmail.com', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'ASOCIACION ACCIDENTAL JJESAL', '9884099014', 'CARLOS ANGEL LOPEZ ZENTENO', 'LA PAZ, AV 16 DE JULIO N? 1240 EDIFICIO HERNAN PISO 12 OF. 1204', '2396034', '71297506', '@', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'ASOCIACION ACCIDENTAL EL BIEN ABENTURADO', '10328084014', 'BERTHA VERA GALARZA', 'PALCA PATA VILLA CHARCAS CHUQUISACA', '63782865', '', 'ALEJANDROPADILLATEJERINA@GMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'CENTRO DE CONSTRUCCIONES Y CONSULTORES DE OBRAS OSVALDO C.C.O.O.O', '10610138017', 'OSVALDO WALTER CHAMBI CALIZAYA', 'AYACUCHO 352 PAGADOR POTOSI', '5274983', '788209003', 'OSVALDOWALTERCHAMBIC@HOTMAIL.COM', '', 'NINGUNA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'CONSULTORA CONSTRUCTORA \'Z3\'', '4035689017', 'SILVIA GLADYS ZARATE BERNAL', 'BULLAIN N° 61 AV. ESPAÑA Y TOMAS FRIAS', '73817416', NULL, 'SILZARATE@HOTMAIL.COM', NULL, 'NINGUNA', '2022-02-02 10:55:13', '2022-05-18 12:14:27'),
(322, 'ROBERTO ZAPATA CALVO', '4083527014', 'ROBERTO ZAPATA CALVO', 'AV. JULIO VILLA N° 181', '71095686', '6420118', 'BEETOO_7911@HOTMAIL.COM', NULL, 'NINGUNA', '2022-02-02 10:57:49', '2022-02-23 14:53:40'),
(323, 'RICHEZZA CONSULTORA Y CONSTRUCCION', '3371185018', 'LEONARDO HECTOR PERALTA MERLO', 'AV. ISMAEL MONTES N°768 EDIF. GIOVANNI COL PISO 7 DEPTO. 704 OF. 704', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-02 11:08:58', '2022-02-02 11:08:58'),
(324, 'INGENIERIA DE CONSTRUCCIONES Y CONSULTORIA DCR', '3029163013', 'DANIEL CAMACHO RICALDEZ', 'AV. PETROLERA KM 1(SURTIDOR NISSAN)', '74302425', NULL, 'DANIEL.CAMACHO.DRC@GMAIL.COM', 'COCHABAMBA', 'NINGUNA', '2022-02-03 10:49:16', '2022-02-03 10:49:16'),
(325, 'A.T.E.C. CONSTRUCTORA', '5203562010', 'ANTONIO TORRICO CLAVIJO', 'PJE BOULEVARD 777 EDIF. PASEO RECOLETA BLOQUE B. PISO 1, OF 1', '4406259', NULL, 'CONTACTO@ATECCONSTRUCTORA.COM', 'COCHABAMBA', 'NINGUNA', '2022-02-03 11:03:58', '2022-02-03 11:03:58'),
(326, 'CONSTRUCTORA TRECA', '5120891011', 'IRON LUIS MORALES FERAUDY', 'CALLE BOLIVAR NRO 61', '78670505', NULL, 'CONSTRUCTORA_TRECA@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 11:08:26', '2022-02-03 11:08:26'),
(327, 'CONTRUCTORA ZURICH', '7475866018', 'MAURICIO EDUARDO CLAROS BOZA', 'BAHAMAS Nº 76', '73442514', NULL, 'CLAROSBOZA@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 11:11:48', '2022-02-03 11:11:48'),
(328, 'EMPRESA CONSTRUCTORA ICONBOL', '6166787012', 'DAVID LLUSCO MONTALVO', 'CALLE 23 DE MARZO Nº 100 ZONA BELLA VISTA', '0', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-03 11:49:10', '2022-02-03 11:49:10'),
(329, 'EMPRESA CONSTRUCTORA TERRARIO S.R.L.', '413270028', 'ALVARO GONZALO SANCHEZ BELLIDO', 'ZANJA DE CORONACION Nº 900 Y SAN FELIPE', '5278201', NULL, '123@123.COM', 'ORURO', 'NINGUNA', '2022-02-03 11:55:10', '2022-02-03 11:55:10'),
(330, 'EMPRESA ECINCAD', '5632950019', 'CARLOS RIMBERTO DOMINGUEZ LEON', '.', '0', '0', '123@123.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 12:09:11', '2022-02-03 12:09:28'),
(331, 'EMPRESA TESONUCCONS', '5303524013', 'TEODORA SONIA CHOQUE', 'ASDA', '0', NULL, '123@124.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 12:12:50', '2022-02-03 12:12:50'),
(332, 'EMPRESA CONSTRUCTORA Y CONSULTORA J.V.C.', '5663823010', 'JUAN VICTOR CAMACHO YUJRA', '.', '0', NULL, '123@124.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 12:17:29', '2022-02-03 12:17:29'),
(333, 'SOCIEDAD DE MULTICONSULTORIA ROMERO CONSTRUCTORES CONSULTORES Y ASOCIADOS S.R.L.', '179406026', 'FILEMON MAURO ROMERO TELLEZ', '.', '0', NULL, '12313@13.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 12:20:55', '2022-02-03 12:21:13'),
(334, 'DISCOMPARTS S.R L.', '401934020', 'CLAUDIA ELIANA HIZA MORALES DE ROJAS', 'CALLE DELGADILLO Nº 831 ENTRW CALLES VIRGINIO LEMA Y ALEJANDRO DEL CARPIO', '070222071', NULL, 'DISCOMPARTSTJA@GMAI.COM', 'TARIJA', 'NINGUNA', '2022-02-03 12:32:49', '2022-02-03 12:32:49'),
(335, 'ENROC CONSULTORA-CONSTRUCTORA', '1050759019', 'EDWIN RIONY ENRIQUEZ RODRIGUEZ', '.', '0', NULL, '123113@132.COM', 'TARIJA', 'NINGUNA', '2022-02-03 12:37:47', '2022-02-03 12:37:47'),
(336, 'CIVILSOL S.R.L.', '369636025', 'RUBEN OSCAR MURILLO ANTELO', '12313', '0', NULL, '146546@123.COM', 'TARIJA', 'NINGUNA', '2022-02-03 12:39:13', '2022-02-03 12:39:13'),
(337, 'EMPRESA CONSTRUCTORA Y CONSULTORA REBEDIL S.R.L.', '179486029', 'GRISELDA CELINA MAMANI ALVAREZ', '.', '0', NULL, '1231@132.COM', 'TARIJA', 'NINGUNA', '2022-02-03 12:40:41', '2022-02-03 12:41:03'),
(338, 'EMPRESA CONSTRUCTORA G&G CONSULTORIA Y CONSTRUCCION', '144450022', 'ESTEBAN GUZMAN CASPA', 'AV. 1 Nº 2 ZONA SANTIAGO SEGUNDO EL ALTO', '2311539', '2809256', 'guzman-esteban@hotmail.com', 'LA PAZ', 'NINGUNA', '2022-02-16 10:39:16', '2022-02-16 10:39:16'),
(339, 'EMPRESA CONSTRUCTORA RAMOS VADILLO S.R.L. CONTRAMOS S.R.L.', '1003239022', 'MARCELUNO RAMOS VADILLO', 'JOSERMO MURILLO VACARREZA Nº 2000', '72464720', '68291085', 'RAMOSVADILLO@HOTMAIL.COM', 'ORURO', 'NINGUNA', '2022-02-16 10:43:29', '2022-02-16 10:43:29'),
(340, 'EMPRESA CONSTRUCTORA Y CONSULTORA VIAFACOR', '5545400013', 'VICTOR HUGO AYLLON CORTEZ', NULL, '0', '75402473', '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 10:50:19', '2022-02-16 10:50:19'),
(341, 'EMCOPE', '5631982018', 'SAUL PEÑARANDA CANO', '1', '0', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 10:52:25', '2022-02-16 10:52:25'),
(342, 'EQUILIBRA INGENIERIA Y CONSTRUCCION S.R.L.', '353348029', 'VALERIA REYNOLDS PARRADO', NULL, '0', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:03:38', '2022-02-16 11:03:38'),
(343, 'CONSULTORA, CONSTRUCTORA MULTIDISCIPLINARIA \'DEMARCONS\'', '4048610012', 'MARCO ANTONIO QUISPE SALAMANCA', NULL, '0', NULL, '13@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:08:44', '2022-02-16 11:08:44'),
(344, 'EMPRESA UNIPERSONAL \'LUCIO FERNANDO GUTIERREZ PLAZA\'', '2306002013', 'LUCIO FERNANDO GUTIERREZ PLAZA', 'AV. LAS FLORES Nº 78 ZONA MALLASA', '71220085', NULL, 'LUCIO.GUT77@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:11:16', '2022-02-16 11:11:16'),
(345, 'EMPRESA UNIPERSONAL EIDAP', '7041376012', 'FABIOLA LOPEZ AYALA', NULL, '0', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:22:06', '2022-02-16 11:22:06'),
(346, 'CONSTRUCTORA BARREIRO LA PAZ COBAL S.R.L.', '185386025', 'VICTOR JORGE BARRERO REGUERIN', NULL, '0', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:24:57', '2022-02-16 11:24:57'),
(347, 'CONSTRUCTORA CONSULTORA \'GLONAS-TOP\' LTDA', '417463029', 'ERICK SIMON SANTANDER PEÑA', 'CALLE ESCALON Y AGUERO Nº 230 ZONA VILLATEJADA RECTANGULAR', '72581744', NULL, 'ESSP2426@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:27:56', '2022-02-16 11:27:56'),
(348, 'CONSTRUCCIONES DAVALOS', '5032838016', 'EIVER BEJAMIN ANACHURI DAVALOS', '.', '68706770', '78704334', '123@122.COM', NULL, 'NINGUNA', '2022-02-22 10:43:24', '2022-02-22 10:43:24'),
(349, 'EMPRESA CONSTRUCTORA ANACHURI DAVALOS SRL.', '162622020', 'EDSON SANTOS ANACHURI DAVALOS', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 10:45:11', '2022-02-22 10:45:11'),
(350, 'EMPRESA CONSTRUCTORA CONSULTORA MULTIDISIPLINARIA ROTIGUETTI', '4020927011', 'ANDEREA MARIA ROTIGUETTI SAAVEDRA', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 10:53:29', '2022-02-22 10:53:29'),
(351, 'CONSTRUCTORA HUARAYA CONS', '3525013015', 'PIO CALANI CUTI', '.', '0', NULL, '13@123.COM', NULL, 'NINGUNA', '2022-02-22 10:55:00', '2022-02-22 10:55:00'),
(352, 'EMPRESA CONSTRUCTORA & CONSULTORA BENSON SRL.', '165012020', 'TRIFON NINA MAMANI', 'AV. CANADA Nº 508', '68660811', NULL, 'BENSONSRL@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-22 10:58:02', '2022-02-22 10:58:02'),
(353, 'CONSTRUCTORA \'EULOGIO YUCRA PACO\'', '4539142016', 'EULOGIO YUCRA PACO', 'CARRETERA LOC. POCOATA S/N URB. MACHACAM', '67068834', NULL, 'JOSEHELYCHUMACERO@GMAIL.COM', 'POTOSI', 'NINGUNA', '2022-02-22 11:02:02', '2022-02-22 11:02:02'),
(354, 'EMPRESA UNIPERSONAL JUAN CARLOS SALAZAR TORREZ', '4786340017', 'JUAN CARLOS SALAZAR TORREZ', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 11:08:29', '2022-02-22 11:08:29'),
(355, 'EMPRESA CONSTRUCTORA TAWA SRL', '136747022', 'DAVID CAHUAYA CHURA', 'AV. JORGE CARRASCO Nº 76 OF. 22 ZONA 12 DE OCTUBRE EL ALTO', '71967740', NULL, 'DCAHUAYA123@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-22 11:13:45', '2022-02-22 11:13:45'),
(356, 'CONSTRUCTORA SPORTMEN Y SERVICIOS', '4361371012', 'JULIAN MENDOZA MAMANI', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 11:19:51', '2022-02-22 11:19:51'),
(357, 'EMPRESA CONSTRUCTORA \'AQSACONST\'', '4020291011', 'AMILKAR ORLANDO AQUINO SARAVIA', 'AV. SGTO FLORES Y VASQUEZ Nº 231', '71886038', NULL, 'AQSACONST@GMAIL.COM', 'ORURO', 'NINGUNA', '2022-02-22 11:23:26', '2022-02-22 11:23:26'),
(358, 'CONSTRUCTORA Y CONSULTORA EZENNIK SRL', '394430020', 'VIVIANA DEL CARMEN GUARACHI CHAVEZ', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 11:39:46', '2022-02-22 11:39:46'),
(359, 'CONSDEKO CONSUTLORA & CONSTRUCTORA SRL.', '410551022', 'JORGE HUMBERTO CRHISTIAN ENCINAS RIVERO', '.', '0', NULL, '123@132.COM', NULL, 'NINGUNA', '2022-02-22 11:55:10', '2022-02-22 11:55:10'),
(360, 'CONSTRUCTORA CONSULTORA  VASQUEZAMO SRL', '413065026', 'ADAN MOISES VASQUEZ QUISPE', '0', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 12:06:25', '2022-02-22 12:06:25'),
(361, 'CONSTRUCTORA CONSULTORA Y SERVICIOS INFORMATICOS FAMCONS', '5737769011', 'FIDEL ANGEL ANDRADE MERCADO', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-22 12:07:47', '2022-02-22 12:07:47'),
(362, 'INGELEC S.A.', '1006991024', 'GUILLERMO FLORES CALVO', 'AV. HERNANDO SILES Nº 5593 EDIF. TUNUPA PISO 3 PF. 303', '22784242', NULL, 'GFLORES@INGELEC.COM.BO', 'LA PAZ', 'NINGUNA', '2022-02-23 10:47:04', '2022-02-23 10:47:04'),
(363, 'DESMART LTDA.', '192978029', 'JUAN CARLOS PUSARICO RODRIGUEZ', 'CALLE CAPITAN RAVELO EDIF. TABORCA I, PISO MEZZANINE', '2721361', NULL, 'JCUSARICO@DESMART.NET', 'LA PAZ', 'NINGUNA', '2022-02-23 10:54:34', '2022-02-23 10:54:34'),
(364, 'LEVI CONSTRUCCIONES SRL', '266932028', '....', NULL, '0', NULL, '132@132.COM', NULL, 'NINGUNA', '2022-02-23 11:03:13', '2022-02-23 11:03:13'),
(365, 'SUR ENERGY S.R.L.', '302770026', '....', NULL, '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-23 11:04:11', '2022-02-23 11:04:11'),
(366, 'CONADEL', '5808442011', 'RICARDO DEL CARPIO MARQUEZ', 'B/ SAN JORGE II/ CJULIO LA FAYE Nº 4778', '78708091', NULL, 'CONADELCARPIO@HOTMAIL.COM', 'TARIJA', 'NINGUNA', '2022-02-23 11:06:50', '2022-02-23 11:06:50'),
(367, 'EGES SRL ENGINEERINGS & GENERAL ENERGY SERVICE', '168722021', 'ANTONIO EDGAR PINTO SIÑANI', 'VILLA COPACABANA - CALLE SGTO MANUEL CARPIO Nº 2021', '72546184', '68099878', 'EGES_SRL@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-23 11:15:18', '2022-02-23 11:15:18'),
(368, '\'KRAKEN\' SERVICIOS GENERALES SRL', '376164020', 'ALVARO JAVIER TAPIA SOLOGUREN', 'CALLE MACARIO PINILLA ESQ. AV. 6 DE AGOSTO Nº 2614 PISO 7 OF. 704', '2431393', '2432905', 'KRAKEN@KRAKEN.COM.BO', 'LA PAZ', 'NINGUNA', '2022-02-23 11:18:40', '2022-02-23 11:18:40'),
(369, 'PARSEC SRL', '125543020', 'ROBERTO JORGE GUTIERREZ ALIAGA', 'CALLE 16 DE OBRAJES N°220 EDIF. CENTRO DE NEGOCIOS OBRAJES PISO 4 OF. 409', '70662645', '70535748', 'PARSECSRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-23 14:39:37', '2022-02-23 14:39:37'),
(370, 'WILLIAMS NIEVES SANDI', '1297600013', 'WILLIAMS NIEVES SANDI', 'PASAJE II N° 147 ENTRE VICUÑA Y KENEDY', '25251316', '71180852', 'NIVICOMCOD@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-23 14:47:55', '2022-02-23 14:47:55'),
(371, 'BAHAMMEGA INGENIERIA Y MULTISERVICIOS', '3100273019', 'MARCO ANTONIO CASTRILLO GONZALES', 'CALLE FERNAN CABALLERO N° 1234 PLAN 561 EL ALTO', '76525996', NULL, 'MARCOCING69@GMAIL.COM', NULL, 'NINGUNA', '2022-02-23 14:50:09', '2022-02-23 14:50:09'),
(372, 'CONSTRUCTORA CONSULTORA RAYA', '7113265014', 'LIZ GABRIELA RAYA MEZA', '.', '0', NULL, '123@13.COM', NULL, 'NINGUNA', '2022-02-23 14:59:36', '2022-02-23 14:59:36'),
(373, 'EMPRESA MULTIDISCIPLINARIA DE CONSTRUCCION CONSULTORIA Y SERVICIO LUXUSBOL', '3528034014', 'NELSON JUANIQUINA CALCINA', 'AV. SANTA BARBARA N° 415 ENTRE TEJERINA Y TARAPACA', '67200835', NULL, 'NEL.JUANIQUINA@HOTMAIL.COM', NULL, 'NINGUNA', '2022-02-23 15:04:53', '2022-02-23 15:04:53'),
(374, 'CASA GRANDE CONSTRUCTORA S.R.L.', '410056023', 'CECILIA TERESA SEDANO SANCHEZ', 'AV. SAN ANTONIO S/N ZONA ARANJUEZ', '046661154', NULL, 'michelmendoza@yahoo.com', 'TARIJA', 'NINGUNA', '2022-03-28 10:38:49', '2022-03-28 10:38:49'),
(375, 'EMPRESA CONSTRUCTORA CODEVA', '3462595015', 'VICTOR JUSTINO APAZA CALLISAYA', '.', '0', NULL, '13@123.COM', 'LA PAZ', 'NINGUNA', '2022-03-28 10:48:58', '2022-03-28 10:48:58'),
(376, 'EMPRESA CONSTRUCTORA HERMANOS FUERTES S.R.L.', '1023653024', 'EMILIO LUIS FUERTES ALCOCER', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 10:50:14', '2022-03-28 10:50:14'),
(377, 'COMPAÑIA DE INGENIERIA Y ARQUITECTURA BOLIVIA LIMITADA (CIABOL LTDA.)', '1011411021', 'MANUEL FIDEL CUEVAS VELASQUEZ', NULL, '1', NULL, '123@132.COM', NULL, 'NINGUNA', '2022-03-28 10:56:46', '2022-03-28 10:56:46'),
(378, 'ROQUESANTO CONSTRUCCIONES SRL', '331112022', 'RICARDO ANDRES CUEVAS MAGNUS', NULL, '1', NULL, '12@123.COM', NULL, 'NINGUNA', '2022-03-28 10:58:30', '2022-03-28 10:58:30'),
(379, 'EMPRESA CONSTRUCTORA BLACUD - CHACON HNOS S.R.L. ECOBLAD S.R.L', '1011515025', 'LUIS FERNANDO BLACUD CHACON', 'CALLE SANTA CRUZ Y BOLIVAR Nº 779', '6653280', NULL, 'LUISBLACUD@GMAIL.COM', 'TARIJA', 'NINGUNA', '2022-03-28 11:02:22', '2022-03-28 11:02:22'),
(380, 'EMPRESA DE INGENIERIA Y CONSTRUCCIONES EMPRO LTDA', '1023085023', 'ALFREDO JORGE ROMERO LEYTON', NULL, '1', NULL, '1@123.COM', NULL, 'NINGUNA', '2022-03-28 11:10:36', '2022-03-28 11:10:36'),
(381, 'ECO - BOLIVIA S..R.L.', '1010635029', 'RUBEN MARTINEZ ORTEGA', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:18:58', '2022-03-28 11:18:58'),
(382, 'CONSTRUCTORA MAURI S.R.L.', '211584027', 'AURELIO MARIN CAMARGO', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:20:41', '2022-03-28 11:20:41'),
(383, 'CONSTRUCTORA ECOZEN S.R.L.', '125135024', 'WILDER ZEGARRA MAMANI', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:21:46', '2022-03-28 11:21:46'),
(384, 'TE.CO.SUR S.R.L.', '146474022', 'ZULMA ROSARIO BEJARANO MARTINEZ', NULL, '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:32:01', '2022-03-28 11:32:01'),
(385, 'VILTE &  FLORES INGENIEROS EN CONSULTORIA Y CONSTRUCION  S.R.L', '300502026', 'ANDRES DANIEL FLORES MONTAÑO', NULL, '1', NULL, '123@123.COOM', NULL, 'NINGUNA', '2022-03-28 11:37:12', '2022-03-28 11:37:12'),
(386, 'EMP. CONSTRUCTORA CONSULTORA INGENIERIA CONSTRUC TECNOLOGIA Y LAB. DE MAT. DE CONSTRUCT LABO-TOG-S.R.L.', '162110021', 'MIGUEL RILMAR TORRICO GARCIA', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:40:27', '2022-03-28 11:40:27'),
(387, 'C.A.C.A.C.C.', '6516478011', 'VICTORIA DELGADILLO JALDIN', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:41:43', '2022-03-28 11:41:43'),
(388, 'EMPRESA CONSTRUCTORA UGARTE S.R.L. \" E.C.U. SRL\"', '1010993020', 'EDWIN UGARTE LA TORRE', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:54:43', '2022-03-28 11:54:43'),
(389, 'EMPRESA UNIPERSONAL JORGE GABRIEL RAMOS ORTIZ \"J.G.R.O.\"', '2818978017', 'JORGE GABRIEL RAMOS ORTIZ', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 11:56:10', '2022-03-28 11:56:10'),
(390, 'MORALES LARRAZABAL M.L. CONSULTORIA Y CONSTRUCTORA', '3412543013', 'JUAN PABLO MORALES LARRAZABAL', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 12:15:55', '2022-03-28 12:15:55'),
(391, 'EMPRESA CONSULTORA - CONSTRUCTORA FROVER S.R.L.', '157638024', 'HENRY MARIN CHOQUEHUANCA CALLISAYA', NULL, '1', NULL, '132@123.COM', NULL, 'NINGUNA', '2022-03-28 12:23:27', '2022-03-28 12:23:27'),
(392, 'EMPRESA CONSTRUCTORA \"ASAHI\"', '1713775012', 'DANIEL JUSTINIANO RIVERO', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-03-28 12:28:24', '2022-03-28 12:28:24'),
(393, 'CONSTRUCTORA Y CONSULTORA COMPRACAD', '5126994011', 'GEOVANA MARIA PORCEL MEDINACELLY', 'CALLE CLAUDIO LLANO NRO 22', '626271', '67908688', 'GEOVITA05@GMAIL.COM', 'POTOSI', 'NINGUNA', '2022-04-04 10:37:14', '2022-04-04 10:37:14'),
(394, 'CONSTRUCTORA OCHOA NAVA', '2906119015', 'RAMIRO OCHOA RODRIGUEZ', 'AV. TOMAS VALDIVIEZO Y PEDRO DE LA GASCA', '68580737', NULL, 'MIRO_ING@HOTMAIL.COM', 'COCHABAMBA', 'NINGUNA', '2022-04-04 10:39:30', '2022-04-04 10:39:30'),
(395, 'SERVICIOS DE CONSULTORIA Y CONSTRUCCION DEL SUR \'SECONSUR\'', '5053851010', 'CARLOS ARMELLA REARTE', 'CALLE EULOGIO RUIZ N° 444', '6676723', NULL, 'SECONSUR_TJA@HOTMAIL.COM', 'TARIJA', 'NINGUNA', '2022-04-04 10:48:08', '2022-04-04 10:48:08'),
(396, 'CONSTRUCTECOM INGENIERIA Y CONSTRUCCION S.R.L. CON SIGLA COMERCIAL CONSTRUCTECOM', '369055026', 'OCTAVIO WILSON CHURA FLORES', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-04-04 10:57:58', '2022-04-04 10:57:58'),
(397, 'EMPRESA CONSTRUCTORA Y CONSULTORA MERCADO ECOMER', '4150196014', 'JOSE LUIS MERCADO SEGOVIA', 'B/ CATEDRAL AV. PRINCIPAL ESQUINA MIGUEL GALARZA N° P-17', '72999359', NULL, 'ECOMERTJA@GMAIL.COM', 'TARIJA', 'NINGUNA', '2022-04-04 11:07:02', '2022-04-04 11:07:02'),
(398, 'MARCAV', '3649864015', '.HECTOR NOE MARTINEZ CAVA', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-04-07 11:45:57', '2022-04-07 11:46:53'),
(399, 'EMPRESA CONSTRUCTORA Y CONSULTORA SHALOM', '1861398013', 'BENJAMIN ROJAS ANACHURI', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-04-07 11:51:16', '2022-04-07 11:51:16'),
(400, 'CESAR LUIS CARDOZO ORTIZ', '7171385019', 'CESAR LUIS CARDOZO ORTIZ', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-04-07 11:52:41', '2022-04-07 11:52:41'),
(401, 'CONSTRUCTORA CONSULTORA CIVIL - CAT', '9076600017', 'YHOSELIN TALLACAHUA AGUAYO', NULL, '76526305', NULL, 'YHOSELINTALLACAHUAGUAYO@gmail.com', 'LA PAZ', 'NINGUNA', '2022-04-19 11:57:07', '2022-04-19 11:57:07'),
(402, 'CONSTRUCTORA ROJAS APAZA S.R.L.', '316004021', 'YOVANA JENNY APAZA SACA', 'z/ TEMBLADERANI C/ CANONIGO AYLLON NRO 1280', '73014278', '77201200', 'ROJASAPAZASRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-04-19 12:09:20', '2022-04-19 12:09:20'),
(403, 'JUAN LIZARAZU CORTES', '603620010', 'JUAN LIZARAZU CORTES', 'GUSTAVO OTERO Y RICARDO AYALA Nro 427', '4545184', '72271403', 'HIDRAJUAN@YAHOO.COM', 'LA PAZ', 'NINGUNA', '2022-04-25 10:46:21', '2022-04-25 10:46:21'),
(404, 'CONSTRUCTORA Y CONSULTORA LUNA APAZA \"ENCOLAF\"', '3529776019', 'DONATO LUNA APAZA', 'AV. PETROLERA K 2.5 CBBA', '67587025', '71452616', 'CC_MARTE@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-04-25 10:48:40', '2022-04-25 10:48:40'),
(405, 'BIMCONST', '6853981017', 'ANDRES FELIPE HUAYNOCA ROMERO', 'CALLE SARGENTO CARRASCO N° 221 ZONA VILLA BALLIVIAN ENTRE CALLE CATACORA Y CALLE ALVAREZ', '70187621', '77504623', 'INGCIVHRJJ@GMAIL.COM', NULL, 'NINGUNA', '2022-04-25 10:54:15', '2022-04-25 10:54:15'),
(406, 'INVERSIONES REYES PERICON', '3455012015', 'JOSE DANIEL REYES PERICON', 'AV. 14 DE SEPTIEMBRE Nº 5652 ZONA OBRAJES', '0', NULL, 'JD.REYESPERICON@GMAIL.COM', NULL, 'NINGUNA', '2022-05-04 11:41:10', '2022-05-04 11:41:10'),
(407, 'KSTORRES S.R.L.', '375069023', 'MARCO ANTONIO SALINAS IÑIGUEZ', NULL, '1', NULL, '123@GMAIL.COM', NULL, 'NINGUNA', '2022-05-04 11:44:51', '2022-05-04 11:44:51'),
(408, 'BISONTE- CONSTRUCCIONES E INGENIERIA SRL.', '146072029', 'RAUL HAROLD TORO LUNA', 'CALLE 10 DE CALACOTO EDIFICIO VITRUCIO C-10  TORRE B PISO 4', '60501171', '70122420', 'BISONTE@BISONTE.COM.BO', 'LA PAZ', 'NINGUNA', '2022-05-04 11:52:35', '2022-05-04 11:52:35'),
(409, 'EMPRESA JESUS GOMEZ CHOQUE', '3718288012', 'JESUS GOMEZ CHOQUE', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-09 10:54:48', '2022-05-09 10:54:48'),
(410, 'ECYCY EMPRESA CONSTRUCTORA', '3541368011', 'RAUL ALVAREZ CHOQUETICLLA', 'V. GALVARRO  MONTECINOS N 5474', NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-09 11:02:44', '2022-05-09 11:02:44'),
(411, 'CFDCC INGENIERIA LTDA', '309780026', 'JUAN PABLO DEL CARPIO CARREÑO', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 11:42:39', '2022-05-18 11:42:39'),
(412, 'EMPRESA CONSTRUCTORA Y CONSULTORA LEIF', '3656588017', 'ALVARO LEIF MARTINEZ CAVA', NULL, '1', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 11:52:43', '2022-05-18 12:00:12'),
(413, 'SERVICIOS DE INGENIERIA Y CONSULTORIA ARANCIBIA LOPEZ \"SEICAL\"', '3651522015', 'JUAN CARLOS ARANCIBIA LOPEZ', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 11:55:59', '2022-05-18 11:55:59'),
(415, 'GOGREEN BOLIVIA THINK GREEN SRL', '240716021', 'NATALY GILDA BUMELLER TORREZ', 'SANCHEZ BUSTAMANTE ESQ. 11 DE CALACOTO EDIF. CBC II PISO 4 OFICINA 2', '2796727', '75852008', 'ADMINISTRACION2022@GOGREENBOLIVIA.COM', 'LA PAZ', 'NINGUNA', '2022-05-18 12:02:50', '2022-05-18 12:02:50'),
(416, 'CONSULTORA & CONSTRUCTORA MULTIDISCIPLINARIA \"REHILF\" SRL', '361749025', 'MARCOS JUANIQUINA AJHUACHO', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:07:03', '2022-05-18 12:07:03'),
(417, 'COPCOCI (CONSULTORIA DE PROYECTOS Y CONSTRUCCIONES CIVILES)', '3546857017', 'RAUL ALBERTO NINA RODRIGUEZ', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:08:57', '2022-05-18 12:08:57'),
(418, 'EMPRESA CONSTRUCTORA & CONSULTORA MULTIDISCIPLINARIA \"RELCONS\"', '3541991016', 'LUIS ELIO JUANIQUINA AJHUACHO', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:10:23', '2022-05-18 12:10:23'),
(419, 'GLOBAL FINANCE CONSULTANTS BOLIVIA S.R.L.', '1016891025', 'LOURDES VOTORIA MERINO LUNA', 'AV. HERNANDO SIOLES N 6062 ESQ. CALLE 1 EDIF. LOS TULIPANES OF. 104 OBRAJES', '2478999', '76530534', 'GFCBOLIVIA@YAHOO.ES', 'LA PAZ', 'NINGUNA', '2022-05-18 12:13:01', '2022-05-18 12:13:01'),
(420, 'HORACIO RAUL SANDOVAL BURGOS', '7112476019', 'HORACIO RAUL SANDOVAL  BURGOS', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:26:52', '2022-05-18 12:26:52'),
(421, 'FERTAC SRL', '232840029', 'RAMIRO CUENCA GUDIÑO', 'CALLE TENTAGUAZU N° 1770 UV. S/N  B/ SAN ANTONIO FLORES', NULL, NULL, '123@123.COM', 'TARIJA', 'NINGUNA', '2022-05-18 12:29:37', '2022-05-18 12:29:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa_sociedad`
--

CREATE TABLE `empresa_sociedad` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `participacion` int(11) NOT NULL DEFAULT 0,
  `sociedad_id` bigint(20) UNSIGNED DEFAULT NULL,
  `empresa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empresa_sociedad`
--

INSERT INTO `empresa_sociedad` (`id`, `participacion`, `sociedad_id`, `empresa_id`, `created_at`, `updated_at`) VALUES
(1, 50, 92, 109, NULL, NULL),
(2, 50, 92, 323, NULL, NULL),
(3, 50, 95, 326, NULL, NULL),
(4, 25, 95, 225, NULL, NULL),
(5, 25, 95, 327, NULL, NULL),
(6, 95, 94, 105, NULL, NULL),
(7, 5, 94, 312, NULL, NULL),
(8, 90, 100, 127, NULL, NULL),
(9, 10, 100, 328, NULL, NULL),
(10, 50, 99, 132, NULL, NULL),
(11, 50, 99, 329, NULL, NULL),
(12, 40, 98, 331, NULL, NULL),
(13, 30, 98, 330, NULL, NULL),
(14, 25, 98, 332, NULL, NULL),
(15, 5, 98, 333, NULL, NULL),
(16, 30, 97, 334, NULL, NULL),
(17, 25, 97, 335, NULL, NULL),
(18, 25, 97, 336, NULL, NULL),
(19, 20, 97, 337, NULL, NULL),
(20, 60, 36, 335, NULL, NULL),
(21, 50, 4, 168, NULL, NULL),
(22, 60, 24, 42, NULL, NULL),
(23, 40, 24, 111, NULL, NULL),
(24, 1, 40, 46, NULL, NULL),
(25, 50, 14, 104, NULL, NULL),
(26, 50, 73, 225, NULL, NULL),
(27, 50, 73, 210, NULL, NULL),
(28, 60, 10, 236, NULL, NULL),
(29, 40, 10, 194, NULL, NULL),
(30, 78, 89, 240, NULL, NULL),
(31, 50, 51, 261, NULL, NULL),
(32, 50, 51, 270, NULL, NULL),
(33, 50, 17, 340, NULL, NULL),
(34, 50, 17, 341, NULL, NULL),
(35, 70, 101, 80, NULL, NULL),
(36, 30, 101, 342, NULL, NULL),
(37, 50, 14, 343, NULL, NULL),
(38, 95, 102, 345, NULL, NULL),
(39, 5, 102, 346, NULL, NULL),
(40, 99, 103, 348, NULL, NULL),
(41, 1, 103, 349, NULL, NULL),
(42, 50, 104, 350, NULL, NULL),
(43, 50, 104, 351, NULL, NULL),
(44, 50, 105, 304, NULL, NULL),
(45, 50, 105, 354, NULL, NULL),
(46, 50, 106, 280, NULL, NULL),
(47, 50, 106, 356, NULL, NULL),
(48, 40, 49, 42, NULL, NULL),
(49, 30, 49, 358, NULL, NULL),
(50, 30, 49, 111, NULL, NULL),
(51, 20, 107, 254, NULL, NULL),
(52, 80, 107, 359, NULL, NULL),
(53, 90, 108, 360, NULL, NULL),
(54, 10, 108, 361, NULL, NULL),
(55, 60, 109, 48, NULL, NULL),
(56, 40, 109, 363, NULL, NULL),
(57, 50, 110, 364, NULL, NULL),
(58, 50, 110, 365, NULL, NULL),
(59, 51, 111, 128, NULL, NULL),
(60, 49, 111, 370, NULL, NULL),
(61, 90, 112, 170, NULL, NULL),
(62, 5, 112, 211, NULL, NULL),
(63, 5, 112, 372, NULL, NULL),
(64, 60, 113, 48, NULL, NULL),
(65, 20, 113, 375, NULL, NULL),
(66, 20, 113, 376, NULL, NULL),
(67, 70, 114, 377, NULL, NULL),
(68, 30, 114, 378, NULL, NULL),
(69, 1, 82, 312, NULL, NULL),
(70, 99, 82, 380, NULL, NULL),
(71, 90, 45, 381, NULL, NULL),
(72, 5, 45, 382, NULL, NULL),
(73, 5, 45, 383, NULL, NULL),
(74, 85, 115, 227, NULL, NULL),
(75, 5, 115, 228, NULL, NULL),
(76, 10, 115, 384, NULL, NULL),
(77, 45, 116, 385, NULL, NULL),
(78, 35, 116, 125, NULL, NULL),
(79, 14, 116, 54, NULL, NULL),
(80, 3, 116, 386, NULL, NULL),
(81, 3, 116, 387, NULL, NULL),
(82, 50, 117, 132, NULL, NULL),
(83, 50, 117, 160, NULL, NULL),
(84, 5, 118, 225, NULL, NULL),
(85, 28, 118, 327, NULL, NULL),
(86, 33, 118, 388, NULL, NULL),
(87, 34, 118, 389, NULL, NULL),
(88, 95, 119, 289, NULL, NULL),
(89, 5, 119, 178, NULL, NULL),
(90, 40, 120, 391, NULL, NULL),
(91, 30, 120, 392, NULL, NULL),
(92, 30, 120, 390, NULL, NULL),
(93, 50, 121, 103, NULL, NULL),
(94, 50, 121, 396, NULL, NULL),
(95, 90, 122, 322, NULL, NULL),
(96, 10, 122, 398, NULL, NULL),
(97, 10, 6, 399, NULL, NULL),
(98, 90, 6, 400, NULL, NULL),
(99, 40, 123, 407, NULL, NULL),
(100, 60, 123, 406, NULL, NULL),
(101, 50, 124, 48, NULL, NULL),
(102, 50, 124, 25, NULL, NULL),
(103, 80, 37, 366, NULL, NULL),
(104, 20, 37, 409, NULL, NULL),
(105, 60, 125, 355, NULL, NULL),
(106, 40, 125, 410, NULL, NULL),
(107, 80, 126, 127, NULL, NULL),
(108, 20, 126, 289, NULL, NULL),
(109, 50, 127, 40, NULL, NULL),
(110, 50, 127, 411, NULL, NULL),
(111, 33, 128, 224, NULL, NULL),
(112, 33, 128, 413, NULL, NULL),
(113, 34, 128, 412, NULL, NULL),
(114, 50, 9, 416, NULL, NULL),
(115, 34, 9, 417, NULL, NULL),
(116, 16, 9, 418, NULL, NULL),
(117, 80, 129, 135, NULL, NULL),
(118, 20, 129, 68, NULL, NULL),
(119, 40, 130, 276, NULL, NULL),
(120, 40, 130, 420, NULL, NULL),
(121, 20, 130, 421, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(93, '2014_10_12_000000_create_users_table', 1),
(94, '2014_10_12_100000_create_password_resets_table', 1),
(95, '2019_08_19_000000_create_failed_jobs_table', 1),
(96, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(97, '2021_06_23_151647_create_empresa_table', 1),
(98, '2021_06_23_160925_create_persona_table', 1),
(99, '2021_10_25_085623_create_codigos_table', 1),
(100, '2021_11_25_135056_create_sociedads_table', 1),
(101, '2021_12_01_125225_create_departamentos_table', 1),
(102, '2021_12_01_210659_create_tipos_table', 1),
(103, '2021_12_01_211502_create_programas_table', 1),
(104, '2021_12_01_211944_create_proyectos_table', 1),
(105, '2021_12_01_213130_create_detalles_table', 1),
(106, '2021_12_02_185402_create_permisos_table', 1),
(107, '2021_12_02_185659_create_permiso_user_table', 1),
(108, '2022_01_10_144347_create_codigo_proyecto_table', 1),
(109, '2022_01_21_164314_create_empresa_sociedad_table', 1),
(110, '2022_01_25_181331_create_categorias_table', 1),
(111, '2022_01_26_140552_create_proyecto_user_table', 1),
(112, '2022_01_26_141548_create_persona_proyecto_table', 1),
(114, '2022_01_28_092727_create_visitas_table', 1),
(115, '2022_01_28_093733_create_cvs_table', 1),
(146, '2022_05_05_182431_create_cars_table', 2),
(147, '2022_05_05_184131_create_tallers_table', 2),
(148, '2022_05_05_185146_create_solicituds_table', 2),
(149, '2022_05_05_191726_create_trabajos_table', 2),
(154, '2022_01_26_180259_create_contratos_table', 3),
(156, '2022_05_06_144315_create_detalle1s_table', 3),
(160, '2022_05_05_192632_create_archivos_table', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Empresas', NULL, NULL),
(2, 'Usuarios', NULL, NULL),
(3, 'Sociedades', NULL, NULL),
(4, 'Consultores', NULL, NULL),
(5, 'Licitaciones', NULL, NULL),
(6, 'Proyectos', NULL, NULL),
(7, 'Contratos', NULL, NULL),
(8, 'Visitas', NULL, NULL),
(9, 'Solicitud', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_user`
--

CREATE TABLE `permiso_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permiso_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permiso_user`
--

INSERT INTO `permiso_user` (`id`, `permiso_id`, `user_id`, `created_at`, `updated_at`) VALUES
(35, 1, 1, NULL, NULL),
(36, 2, 1, NULL, NULL),
(37, 3, 1, NULL, NULL),
(38, 4, 1, NULL, NULL),
(39, 5, 1, NULL, NULL),
(40, 6, 1, NULL, NULL),
(41, 7, 1, NULL, NULL),
(42, 8, 1, NULL, NULL),
(43, 9, 1, NULL, NULL),
(46, 1, 3, NULL, NULL),
(47, 3, 3, NULL, NULL),
(48, 4, 3, NULL, NULL),
(49, 5, 3, NULL, NULL),
(50, 7, 3, NULL, NULL),
(51, 1, 4, NULL, NULL),
(52, 3, 4, NULL, NULL),
(53, 4, 4, NULL, NULL),
(54, 5, 4, NULL, NULL),
(55, 7, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'auth_token', 'df9c81995423f86911eaa874871a25a41840abf537b6d9913414f2ad1c6fda09', '[\"*\"]', '2022-01-31 17:25:10', '2022-01-31 17:22:31', '2022-01-31 17:25:10'),
(2, 'App\\Models\\User', 1, 'auth_token', '87c2dd8d9ed47e677cbb00a6f6a17080db467f6114a46d24a4545f18974a38f5', '[\"*\"]', '2022-01-31 17:41:39', '2022-01-31 17:25:11', '2022-01-31 17:41:39'),
(3, 'App\\Models\\User', 1, 'auth_token', '1462886a4b98f71ee1b2d07ec9c704249e378f17b5909c6f6002055e7666b47b', '[\"*\"]', '2022-05-24 14:02:21', '2022-01-31 17:47:18', '2022-05-24 14:02:21'),
(4, 'App\\Models\\User', 1, 'auth_token', '96b52cf0766bd637783e9b8801870b0226366057783a1a017c3cb47b9003a900', '[\"*\"]', '2022-02-09 08:45:12', '2022-01-31 20:06:06', '2022-02-09 08:45:12'),
(6, 'App\\Models\\User', 1, 'auth_token', 'faccd30671587f27851eefa68b5937ee0177fcc14570afaf9f4d1a4cc11fb75d', '[\"*\"]', '2022-02-01 10:30:30', '2022-02-01 08:44:45', '2022-02-01 10:30:30'),
(7, 'App\\Models\\User', 1, 'auth_token', 'bacc6d615e341e1931e2bd09ff289c9de76dd95952fefbdc313ed3ef10bcae1a', '[\"*\"]', '2022-02-02 14:38:13', '2022-02-01 10:08:32', '2022-02-02 14:38:13'),
(8, 'App\\Models\\User', 1, 'auth_token', '6eb8da82b8434bc80bfaf315c8b516c52da738b0378eb07ae9c2d6ab21cf23a1', '[\"*\"]', '2022-02-02 11:20:57', '2022-02-02 10:39:42', '2022-02-02 11:20:57'),
(9, 'App\\Models\\User', 1, 'auth_token', '85a9598e62c320d7d44a792c8c02bc7b218ebb30b01d18551373c0180ded52b1', '[\"*\"]', '2022-02-02 14:52:45', '2022-02-02 14:46:30', '2022-02-02 14:52:45'),
(10, 'App\\Models\\User', 1, 'auth_token', 'ad019c6c1bc109b4d23b181c90b1f1890c90c33a99aa75eac4eb8cd6e1e46a92', '[\"*\"]', '2022-02-02 16:32:41', '2022-02-02 14:53:02', '2022-02-02 16:32:41'),
(11, 'App\\Models\\User', 1, 'auth_token', '2008591659516aa2503c49f94dee1661eb26ad8b4c1d918721bf3c3f210bcd8d', '[\"*\"]', '2022-02-03 09:23:02', '2022-02-02 17:02:55', '2022-02-03 09:23:02'),
(12, 'App\\Models\\User', 1, 'auth_token', 'd9e02d82b6e5d38c097601fc524f4c2edac061a4bf398688d3552a2b13313d85', '[\"*\"]', '2022-02-02 20:10:13', '2022-02-02 18:24:10', '2022-02-02 20:10:13'),
(13, 'App\\Models\\User', 1, 'auth_token', 'eed961596896c7dada22f5e4a37dc817d85ae63707ad086e0e475757c25413fa', '[\"*\"]', '2022-02-03 12:05:05', '2022-02-03 10:45:13', '2022-02-03 12:05:05'),
(14, 'App\\Models\\User', 1, 'auth_token', '53e5f6986cec6d04e4ed0858d70217da9b2e8f8a1fbf126545d92f135790afe0', '[\"*\"]', '2022-02-03 12:07:05', '2022-02-03 12:05:11', '2022-02-03 12:07:05'),
(15, 'App\\Models\\User', 2, 'auth_token', '76f98af2fdb36a7a20f49369662def431a08700a82493c6bef0e65dca2a1fb8d', '[\"*\"]', '2022-02-03 12:41:20', '2022-02-03 12:07:26', '2022-02-03 12:41:20'),
(16, 'App\\Models\\User', 1, 'auth_token', '8387aee2141234c4795d277cfc7685c7b051c8ca709e237d19f864408e408252', '[\"*\"]', '2022-02-03 13:24:50', '2022-02-03 13:23:26', '2022-02-03 13:24:50'),
(17, 'App\\Models\\User', 1, 'auth_token', '2fe4493fc6d9026ecdcec670cde9e2bc8b22340a36adb52d207fac01fd2d7396', '[\"*\"]', '2022-02-07 08:06:24', '2022-02-03 13:28:33', '2022-02-07 08:06:24'),
(18, 'App\\Models\\User', 1, 'auth_token', '20bb51f64bbb55f3c900acf90cb77f732511fef130553417e757d8e0fb2e8e75', '[\"*\"]', '2022-02-04 11:13:34', '2022-02-04 11:12:09', '2022-02-04 11:13:34'),
(19, 'App\\Models\\User', 1, 'auth_token', '5691a34798a9e905bca1dbde665a010b5124f2a8e7a73720904b5a4c3187ee3c', '[\"*\"]', '2022-02-04 14:58:03', '2022-02-04 14:21:35', '2022-02-04 14:58:03'),
(20, 'App\\Models\\User', 1, 'auth_token', '62be4b9e94c6ffda0f82a691625e39488dd71a8a06c54ec8478e06250fefcc1f', '[\"*\"]', '2022-02-04 16:34:29', '2022-02-04 16:30:29', '2022-02-04 16:34:29'),
(21, 'App\\Models\\User', 1, 'auth_token', 'b89f3432c9abfae92d9e0a60c308f155dee6aea78a5b7c458e3a6990c684c972', '[\"*\"]', '2022-02-04 16:50:39', '2022-02-04 16:50:34', '2022-02-04 16:50:39'),
(22, 'App\\Models\\User', 1, 'auth_token', 'ab683ebe88a89353856c31d26ba78c511c38b89919a0a17cb9ccda25304d0ea4', '[\"*\"]', NULL, '2022-02-07 08:06:41', '2022-02-07 08:06:41'),
(23, 'App\\Models\\User', 1, 'auth_token', 'f20f27cce099ab89a6302919dfaf03097de0e2494027b2aaa19b05d71459b9c2', '[\"*\"]', '2022-02-07 08:07:44', '2022-02-07 08:06:52', '2022-02-07 08:07:44'),
(24, 'App\\Models\\User', 1, 'auth_token', '8030ac2209005241207f921c5b723dc701a818cccd52fb446f711f58d46fd3be', '[\"*\"]', NULL, '2022-02-07 08:08:12', '2022-02-07 08:08:12'),
(25, 'App\\Models\\User', 1, 'auth_token', 'df4ae2a396238a1f91fc080796a0e6ccd38adaf10623421e47f8c8451fb3a5b1', '[\"*\"]', '2022-02-07 09:52:32', '2022-02-07 08:08:20', '2022-02-07 09:52:32'),
(26, 'App\\Models\\User', 1, 'auth_token', '064e563180a041c8902f264c2e50efdcaf1c12fa841205f0f95f50fc28c16f1b', '[\"*\"]', '2022-02-07 09:50:54', '2022-02-07 09:34:25', '2022-02-07 09:50:54'),
(27, 'App\\Models\\User', 3, 'auth_token', '5870b4683fc107654578decba70c0049277a31ab7e5f7867fdd3a0c685760c27', '[\"*\"]', '2022-02-07 09:52:52', '2022-02-07 09:52:46', '2022-02-07 09:52:52'),
(30, 'App\\Models\\User', 3, 'auth_token', '2e4f3982b45737ff1e00f258b859b3304e09f8d1e7dbe4440015edd81d5e8081', '[\"*\"]', '2022-02-09 08:49:44', '2022-02-09 08:49:21', '2022-02-09 08:49:44'),
(36, 'App\\Models\\User', 1, 'auth_token', '0e70568e6ced35b3155cc27989a60a0c56674af275dcb5cfcb0e905b3dba23d4', '[\"*\"]', '2022-02-10 06:41:27', '2022-02-10 06:38:51', '2022-02-10 06:41:27'),
(41, 'App\\Models\\User', 1, 'auth_token', '184e8993d2e2bbf4de21df6b56fd456bd55e44ddb16d9ffb068bbb7dfa866c76', '[\"*\"]', '2022-03-22 20:04:16', '2022-02-20 20:37:13', '2022-03-22 20:04:16'),
(42, 'App\\Models\\User', 1, 'auth_token', '0391aa8d655388d581606865de928df70f3c42737020e543a57ce55e68907b1b', '[\"*\"]', '2022-03-10 12:12:54', '2022-02-21 10:27:31', '2022-03-10 12:12:54'),
(44, 'App\\Models\\User', 1, 'auth_token', 'eea71ddadcf1e68348c26461f5bf2ccc482a792f289703a1c90cc14edfa6a393', '[\"*\"]', '2022-05-19 11:20:29', '2022-02-23 14:24:57', '2022-05-19 11:20:29'),
(45, 'App\\Models\\User', 1, 'auth_token', '5f3fe84d36e21c0e314a5352b1fd4aa4d567d234b34d1ab7ff6caf7e500fb562', '[\"*\"]', '2022-05-05 08:43:54', '2022-03-03 09:33:29', '2022-05-05 08:43:54'),
(49, 'App\\Models\\User', 1, 'auth_token', '3af4743e1665de8698cf1a73d6857d579cc02afb8e14ebf09129cee000c933ba', '[\"*\"]', '2022-05-11 12:32:30', '2022-03-15 16:17:42', '2022-05-11 12:32:30'),
(51, 'App\\Models\\User', 1, 'auth_token', '30edaa71a70e994831ab9b02d562ed03c2aa530ad2a0ab2148b311bf37d332a3', '[\"*\"]', '2022-04-22 11:52:32', '2022-04-12 10:28:49', '2022-04-22 11:52:32'),
(53, 'App\\Models\\User', 1, 'auth_token', 'ade1ac910ae2b3f8262f5d3166e47ec80ca0a8bc9629da76d2f0a45ee7030168', '[\"*\"]', '2022-05-10 23:24:48', '2022-05-04 22:50:42', '2022-05-10 23:24:48'),
(55, 'App\\Models\\User', 1, 'auth_token', '2f4b8aa32b307ae4798e1d3903cfb49ea285d8e29f8cc4253a6fc14dd121e4e6', '[\"*\"]', '2022-05-06 21:22:52', '2022-05-06 19:16:50', '2022-05-06 21:22:52'),
(58, 'App\\Models\\User', 3, 'auth_token', 'e5d45eb7082e943b71d3bb882f2155f1ef344b006cdc6e5fc03da1022de09cc6', '[\"*\"]', '2022-05-17 09:13:07', '2022-05-09 14:47:46', '2022-05-17 09:13:07'),
(62, 'App\\Models\\User', 1, 'auth_token', '4408bc2d07d373e63d93b73c6fe709540ee4fe7f9a53a6501713c2459bc86c95', '[\"*\"]', '2022-05-18 15:57:35', '2022-05-10 20:21:57', '2022-05-18 15:57:35'),
(63, 'App\\Models\\User', 1, 'auth_token', 'efe9bda056d1e60bb2d3ea8a4ba2b0d86e370fc60d36cc1cbb68b73c85d6c8f4', '[\"*\"]', '2022-05-19 11:52:34', '2022-05-13 11:03:48', '2022-05-19 11:52:34'),
(68, 'App\\Models\\User', 4, 'auth_token', 'eac6b9c8964865ca4bca613fc870aaeca5c7b93617f1ac0a017a3b4c7979c13f', '[\"*\"]', '2022-05-24 19:13:00', '2022-05-24 19:12:29', '2022-05-24 19:13:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ci` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paterno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materno` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombres` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `datosp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grado` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NATURAL',
  `departamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `ci`, `paterno`, `materno`, `nombres`, `datosp`, `nit`, `grado`, `direccion`, `fechaNacimiento`, `fono1`, `fono2`, `email`, `genero`, `observacion`, `departamento`, `status`, `created_at`, `updated_at`) VALUES
(1, '5775077', 'QUELCA', 'MAMANI', 'FLORENCIO', 'FLORENCIO QUELCA MAMANI', '5775077013', 'ING.', 'LA PAZ- AV. MECAPACA N? 7036 ENTRE CALLE N?23 -SDS', '1989-10-27', '25285129', '75402473', 'FQUELCA@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-02-02 10:16:56'),
(2, '6136029', 'COCA', 'MIRANDA', 'LIZ KAREN', 'LIZ KAREN COCA MIRANDA', '6136029', 'LIC.', 'CIUDAD SATELITE L LA PAZ', '1985-05-04', '2814108', '73026570', 'LCOCA@FPS.GOB.BO', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '3482234', '', '', '', 'ROXANA JUANA ZENTENO TAPIA', '3482234', 'ING.', 'CALLE VENTURA OVIEDO N? 2565 ZONA LA PORTADA', '1980-08-24', '65189541', '60525758', 'roxanazenteno@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '3455410', '', '', '', 'ERWIN BORIS ZARATE HUAYTA', '3455410', 'ARQ.', 'CALLE GREGORIO PACHECO N? 56, ZONA PURA PURA', '1972-10-17', '2457413', '70126320', 'erzat_arq@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '247986', '', '', '', 'LUCIO RAUL GONZALES QUISBERT', '247986', 'ING.', 'CALLE JOSE MARIA CAMACHO N? 1717', '1951-03-02', '2487150', '73087979', 'ralugonzales@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '4833074', '', '', '', 'HERNAN FABIO CONDORI CASTILLO', '4833074', 'ING.', 'CALLE MANURIPI N? 711 ZONA EL TEJAR', '1979-03-13', '73085315', '72080312', 'hermaconcas@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '3356409', '', '', '', 'GENOVA SALAZAR BAUTISTA', '3356409', '', 'AV. BUENOS AIRES N? 2074 (ZONA COTAHUMA)', '1967-08-15', '68072731', '76749070', 'aranapinto@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, '4674892', '', '', '', 'ORLANDO ONTOJA RODRIGUEZ', '4674892', 'ARQ.', 'CALLE GREGORIO REYNOLDS 641 Y PLAZA ESPA?A', '1976-09-05', '68350610', '77155511', 'cholanco@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '4813938', 'MACHADO', 'NAVIA', 'RUBEN HERIBERTO', 'RUBEN HERIBERTO MACHADO NAVIA', '4813938', 'ING', 'AV. REGIMIENTO CASTRILLO N? 156 - SAN ANTONIO SUD', '1977-11-03', '70573957', '0', 'piensa_ingenieros@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '4332929', '', '', '', 'RENE ANDRES SALINAS PALMA', '4332929', 'ING.', 'URB. LOS PINOS BLOQUE 17 DEPTO 301, ZONA SAN MIGUEL', '1982-12-29', '76201675', '76200203', 'RESALINASPA@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '3417278', 'PONCE', 'SIñANI', 'IVAN ANTONIO', 'IVAN ANTONIO PONCE SI?ANI', '3417278', 'ING.', 'CALLE 2 Nro 1065 -A ZONA VILLA TEJADA RECTANGULAR', '1975-02-22', '75239887', '0', 'iponcein@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:56:04'),
(12, '4997953', 'CONDORI', 'GUARACHI', 'CORINA ISABEL', 'CORINA ISABEL CONDORI GUARACHI', '4997953', 'ING.', 'CALLE 1-A N? 7, ZONA COSMOS 77 - EL ALTO', '1981-11-05', '78787389', '72090535', 'ing.corina.condori.g@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-11 11:04:48'),
(13, '4773902', 'CHOQUE', 'BALBOA', 'ANGELA ROSALIA', 'ANGELA ROSALIA CHOQUE BALBOA', '4773902', 'LIC.', 'AV. UNION N? 15 - Z. EL KENKO - EL ALTO', '1977-09-04', '76259722', '0', 'af-angela2014@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '2703515', 'GUZMAN', 'MEDRANO', 'ABAD', 'ABAD GUZMAN MEDRANO', '2703515', 'ING.', 'AV. DEL POETA N? 1000 Z. CENTRAL', '1963-01-01', '2444361', '69880676', 'Abad_1595@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '2371998', 'TICONA', 'RAMOS', 'GERMAN', 'GERMAN TICONA RAMOS', '2371998', 'ING.', 'AV. BRASIL N? 1647 - MIRAFLORES', '1963-05-25', '71991918', '2246383', 'GERMANTR2014@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '4254613', '', '', '', 'FELIPE FROYLAN JIMENEZ VINO', '4254613', 'ING.', 'VILLA DOLORES CALLE FRANCISCO VEZGA N? 860 - EL ALTO', '1974-09-13', '2824148', '71260970', 'froylanjimenez@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '3357435', 'HUANCA', 'MAMANI', 'SANTOS', 'SANTOS HUANCA MAMANI', '3357435', 'ING.', 'AV. COCHABAMBA N? 27 VILLA DOLORES F - EL ALTO', '1973-04-16', '65631000', '67160144', 'SANTOSHUANCA@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '3462116', '', '', '', 'JOHN EDMUNDO LLANQUE ALIAGA', '3462116', 'ING.', 'CALLE UNION N? 15, ZONA EL KENKO- EL ALTO', '1970-11-16', '76575762', '71962189', 'john-ecoagro@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '4833767', '', '', '', 'KAREN LUNA MARTINEZ', '4833767', 'ING.', 'CALLE 52 N? 777, ZONA CHASQUIPAMPA', '1977-12-04', '68125986', '0', 'karenlunamartinez@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, '3386622', 'ZENTENO', 'SORUCO', 'JAIME', 'JAIME ZENTENO SORUCO', '3386622', 'ING.', 'CALLE LAS ROSAS N? 2365 - ZONA CRISTO REY', '1971-06-29', '71579290', '2421778', 'jaimezentenosoruco@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, '4823723', '', '', '', 'HERNAN JORGE OVANDO', '4823723', 'ING.', 'EL ALTO - CALLE 2 JUAN MATIENZO PLAN 361 N? 313 ZONA C. SATELITE', '1979-03-19', '70651263', '2815307', 'hernan.jorgeovando@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, '2607283', '', '', '', 'WILFREDO ALFONZO PINTO ALCON', '2607283', 'LIC.', 'CALLE POKE WILLICHI N? 1134 COSMOS 79 EL ALTO', '1966-01-27', '72037417', '0', 'pintowilly@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, '2604056', 'TONCONI', 'MAMANI', 'ROSA', 'ROSA TONCONI MAMANI', '2604056', 'ING.', 'CALLE 38 PASAJE B N? 100, ZONA CHASQUIPAMPA', '1964-10-05', '71976683', '0', 'rousertm.510@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, '5748862', 'PORTILLO', 'CALLAPA', 'ANICETO', 'ANICETO PORTILLO CALLAPA', '5748862', 'ING.', 'CALLE ALIHUATA N? 1545 ZONA LOZA CHARAPAQUI', '1986-04-17', '63209069', '67264402', 'aportica9@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, '4038294', '', '', '', 'EDWIN FELIX ACHA COLQUE', '4038294', 'ING.', 'CALLE POTOSI N? 4725 ENTRE LIRA Y OBLITAS CIUDAD DE ORURO', '1979-11-20', '72472171', '5251706', 'EdwinFelixAC@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, '3473428', '', '', '', 'RICHARD OTTO POCOMA YUJRA', '3473428', 'ING.', 'ZONA MUNAYPATA CALLE POCONA N? 230', '1975-08-20', '71980844', '2396117', 'richardpocoma@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, '4366555', 'PATON', 'MAMANI', 'JOHNNY', 'JOHNNY PATON MAMANI', '4366555010', 'ING.', 'CALLE 17 N? 3924, ZONA VILLA TUNARI', '1978-10-09', '73033670', '71202813', 'paton_john@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 12:00:20'),
(28, '4772741', '', '', '', 'ALFREDO IGNACIO ALCON PARI', '4772741', 'ING.', 'CALLE RUPERTO JURADO N? 1749 ZONA EL TEJAR', '1976-07-31', '78849730', '67077245', 'alfredo.alcon@hotmail.com', 'alfredoignacioalcon@gmail.com;HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, '3528177', '', '', '', 'NELSON CHALLAPA ESCOBAR', '3528177', 'ING.', 'MELCHOR PEREZ DE OLGUIN N? 146 LEON Y RODRIGUEZ', '1976-01-15', '72474172', '0', 'NCHALLAPA38@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, '5787768', 'QUIROGA', 'MALLON', 'JOSE LUIS', 'JOSE LUIS QUIROGA MALLON', '5787768', 'ING.', 'CALLE 12 DE OCTUBRE ESQ. VELASCO GALVARRO', '1984-07-11', '72885690', '77151260', 'JOSEQM.1107@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, '4282244', 'MARIACA', 'GUTIERREZ', 'YARO JESUS', 'YARO JESUS MARIACA GUTIERREZ', '4282244', 'ING.', 'CALLE COLON N? 710 ZONA CENTRAL', '1979-10-15', '63094708', '73272015', 'yaro.mariaca@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, '5159722', 'CRUZ', 'HUARACHI', 'DIEGO', 'DIEGO CRUZ HUARACHI', '5159722', 'ING.', 'CALLE SANTA CRUZ S/N ZONA 23 DE MARZO IRONCOLLO (QUILLACOLLO - COCHABAMBA)', '1977-09-22', '72220880', '0', 'DIEGO.CRUZ.H@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, '1971687', 'AVILES', 'LOAYZA', 'OMAR ERNESTO', 'OMAR ERNESTO AVILES LOAYZA', '1971687', 'ING.', 'AV. HERNANDO SILES N? 6156, ZONA OBRAJES', '1975-07-09', '71525122', '0', 'omar2aviles@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, '3458910', '', '', '', 'JOSE RAMIRO SEGALES LIMA', '3458910', 'ING.', 'CALLE CUMANA N? 1168 ZONA VILLA NUEVO POTOSI', '1970-08-27', '78800569', '73513628', 'SEGALIN@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, '3538561', 'FLORES', 'LOBO', 'EMILIO', 'EMILIO FLORES LOBO', '3538561', 'ING.', 'EL ALTO ZONA NUEVOS HORIZONTES N? 222', '1975-08-09', '71881851', '5211679', 'lobofe@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, '6725950', '', '', '', 'OMAR WILLIAM RIQUEZA CATARI', '6725950', 'ING.', 'PAMPAHASI, CALLE12, N?164', '1985-10-27', '72593327', '0', '211riqom@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, '4274353', 'QUISPE', 'PEREZ', 'RAUL ALBERTO', 'RAUL ALBERTO QUISPE PEREZ', '4274353', 'ING.', 'ESTACION CENTRAL INTERIOR VIVIENDAS N?18 (EX ENFE - ZONA NORTE SAN SEBASTIAN)', '1976-04-02', '73054399', '60529296', 'INGRAULICO@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '3428872', '', '', '', 'NELLY SANDRA VENTURA GOYZUETA', '3428872', 'ING.', 'PAMPAHASI AV. CIRCUMBALACI?N N? 90', '1968-11-02', '71583194', '0', 'NELLYVENTURA2@YAHOO.ES', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '4949631', 'BAUTISTA', 'ARANCIBIA', 'ELDER LEONEL', 'ELDER LEONEL BAUTISTA ARANCIBIA', '4949631', 'LIC.', 'CALLE 10 Nº 2394 VILLA SANTIAGO II', '1978-06-09', '71573066', NULL, 'ELDER2222@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:43:32'),
(40, '4806090', '', '', '', 'EMMA MARCELA TORRES GUZMAN', '4806090', 'LIC.', 'CIUDADELA FERROVIARIA CALLE 4 N? 1724', '1982-05-07', '73056052', '0', 'emarcelatorresg@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '4798912', 'MENDOZA', 'VILLANUEVA', 'WILLY', 'WILLY MENDOZA VILLANUEVA', '4798912', 'ING.', 'AV. ARQUITECTO N? 10 ZONA FERROPETROL EL ALTO', '1975-01-01', '71293349', '70141412', 'Willymendoza40@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, '3436561', '', '', '', 'JOSE MANUEL GAETE DAZA', '3436561', 'ING.', 'C. GERRRILLEROS LANZA N? 942, ZONA MIRAFLORES', '1969-06-04', '77591149', '73577417', 'teconciv@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, '6099904', '', '', '', 'FABIOLA BLANCA VELIZ CORDOVA', '6099904', 'LIC.', 'CALLE UNION Y CALLE 2 N?212, ZONA VILLA FATIMA', '1983-07-27', '73209937', '2721373', 'FABIANAA_VEL@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, '2698066', 'MENDOZA', 'FERNANDEZ', 'ALBERTO', 'ALBERTO MENDOZA FERNANDEZ', '2698066', 'ING.', 'VILLA 18 DE MAYO CALLE 3 N? 90', '1964-04-18', '71261251', '77232066', 'amendozaf_92@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, '2738412', '', '', '', 'JOSE LUIS CHOOLNER CALIZAYA', '2738412', 'ING.', 'SUCRE YANACOCHA N? 949', '1961-05-26', '2408911', '71214828', 'Jose.choolner@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, '4423636', 'LUPE', 'COPATITI', 'MARIO', 'MARIO LUPE COPATITI', '4423636', 'ING.', 'CALLE 9 N? 33 ZONA SANTIAGO II EL ALTO', '1976-07-22', '73746327', '0', 'mariolupeti@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, '3547306', 'MARTINEZ', 'CALIZAYA', 'LILIAN ISABEL', 'LILIAN ISABEL MARTINEZ CALIZAYA', '3547306015', 'ARQ.', 'TACNA N? 1872 ENTRE MURGUIA Y ALDANA', '1977-07-08', '5284962', '72315315', 'isamar._@hotmail.com', 'MUJER', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-22 11:37:49'),
(48, '3515719', 'MARCA', 'CRUZ', 'NESTOR', 'NESTOR MARCA CRUZ', '3515719012', 'ING.', 'ZONA VILLA DOLORES CALLE 13 N? 7050', '1968-10-05', '72572550', '72584639', 'marcafam@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:47:49'),
(49, '3357614', '', '', '', 'RUBEN JULIO ROQUE PAREDES', '3357614', 'ING.', 'CALLE BALTAZAR ALQUIZA 1154 ZONA CALLAMPAYA', '1968-08-23', '71526104', '0', 'RUBENROQ@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, '2287647', '', '', '', 'JAIME GUTIERREZ QUEVEDO', '2287647', 'ING.', 'CALLE 9 N? 65, ZONA 12 DE OCTUBRE ENTRE AV. RAUL SALMON Y RODOLFO PALENQUE', '1975-03-25', '70517700', '2824670', 'jgutierrezquevedo@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, '2268563', 'SANTOS', 'QUENALLATA', 'LUIS', 'LUIS SANTOS QUENALLATA', '2268563', 'ING', 'AV. MARISCAL ANDRES DE SANTA CRUZ ZONA URBANIZACI?N EL INGENIO', '1960-08-25', '71970086', '0', 'Luis.santos.quenallata@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, '4884082', '', '', '', 'INGRID NATTY RODRIGUEZ NAVIA', '4884082', 'ING.', 'CALLE 1 -A N? 320 ZONA ALTO SEGUENCOMA', '1981-06-18', '72504124', '0', 'lopus_81@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, '3506494', 'ROQUE', 'LINO', 'MARCIAL', 'MARCIAL ROQUE LINO', '3506494', 'ING.', 'ORURO, URBANIZACION PARAISO 1', '1972-01-16', '72308604', '0', 'marcialro4@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, '4144768', '', '', '', 'SIXTO GONZALEZ PHERCA', '4144768', 'ING.', 'URB. VILLA DORINA MANZANO F1 LOTE 13', '1973-04-06', '72312088', '71825500', 'sqplider@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, '3425276', '', '', '', 'ANGEL WILBERTO CALDERON BALLESTEROS', '3425276', 'ING.', 'AV. VENEZUELA N? 4 VILLA SAN ANTONIO', '1971-08-13', '76767235', '2238935', 'lawcb71@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, '2729947', '', '', '', 'SAMUEL MACHACA FRIAS', '2729947', 'ING.', 'CALLE FEDERICO AVILA N? 1865, ZONA SAN ANTONIO BAJO', '1959-02-16', '67348711', '0', 'smachacafr@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, '7023332', '', '', '', 'JOSE LUIS CORTEZ CALLISAYA', '7023332', 'ARQ.', 'CALLE MANUEL ASEGURA Y CORDERO N? 5114, ZONA VILLA YUNGUYO - EL ALTO', '1987-07-25', '70693594', '73564732', 'courtezljcc@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, '2606362', '', '', '', 'DANIEL ROMAN PEREZ', '2606362', 'ARQ.', 'CALLE BELTRAN S/N ZONA 16 DE JULIO - EL ALTO', '1965-02-16', '2846345', '71919253', 'romdape@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, '6859492', '', '', '', 'ARTURO CELSO RIVAS SOLIZ', '6859492', 'ING.', 'CALLE 25 DE JULIO S/N, SANTIAGO DE LACAYA PERIFERICA', '1986-05-08', '78815331', '73018708', 'ARTURORIVAS71001@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, '4809733', '', '', '', 'SILVIA CAROL RIOS ARRUETA', '4809733', 'LIC.', 'CALLE RAMONA SINOSAIN N? 1125 ZONA NORTE', '1977-04-21', '2283296', '71955609', 'silviacarol_47@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, '6958613', 'MAMANI', 'SULLCATA', 'MONICA ROSARIO', 'MONICA ROSARIO MAMANI SULLCATA', '6958613', 'ING.', 'C. GRAL. GONZALES N? 1184, Z. SAN PEDRO', '1987-10-01', '72588252', '2900171', 'MONICAMMNI28@GMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-15 12:46:22'),
(62, '4309477', 'PABON', 'CHURA', 'HUGO', 'HUGO PABON CHURA', '4309477', 'ING.', 'ALTO CALACOTO AV. LITORAL N? 577 OVEJUYO', '1973-05-01', '74025777', '0', 'HBPINGENIEROS@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, '4378731', 'RAMOS', 'MIRANDA', 'EDWIN JOSE', 'EDWIN JOSE RAMOS MIRANDA', '4378731', 'ING.', 'VILLA ESTHER, CALLE GLADIOLOS N? 1744', '1975-12-01', '74060441', '2833102', 'edwin_ramallom@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, '6085029', '', '', '', 'ROBERTO CARLOS IBA?EZ TROCHE', '6085029', 'ARQ.', 'CALLE SBTTE. JORGE EULER N? 328 ZONA 16 DE JULIO CIUDAD DE EL ALTO', '1977-11-15', '71901699', '70137700', 'rocaitro60@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, '3395092', '', '', '', 'MARLENY SOFIA QUISPE CHURA', '3395092', 'ING.', 'CALLE PASCOE N? 3278 ZONA 16 DE JULIO EL ALTO - LA PAZ', '1978-09-18', '68114478', '0', 'ynelrams@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, '4058067', '', '', '', 'ROGER CUTILE ESCALANTE', '4058067', 'ING.', 'PASAJE 824 N? 2057 EDIF. SIN NOMBRE PISO 1 ZONA CRISTO REY', '1982-12-04', '72380909', '78879097', 'rcutileescalante@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, '1828209', 'FLORES', 'VILCHES', 'CARLOS ALBERTO', 'CARLOS ALBERTO FLORES VILCHES', '1828209', 'ING.', 'CALLE JUAN MANUEL LOZA N? 1718 ZONA MIRAFLORES', '1964-02-06', '71535456', '2242256', 'fovicc@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, '4886624', 'COAQUIRA', 'TITIRICO', 'BEATRIZ', 'BEATRIZ COAQUIRA TITIRICO', '4886624', 'LIC.', 'ZONA PAMPAHASI CALLE 6 - A N? 58', '1982-05-13', '67093887', '0', 'bett_2891@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, '4803898', '', '', '', 'ROLANDO DIMAR CONDORI MAMANI', '4803898', 'ING.', 'ZONA VILLA ADELA C. 12 DE FEBRERO N? 2835', '1978-07-20', '76595656', '0', 'rolandodimar@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, '423824', '', '', '', 'ARMANDO AUGUSTO CORTEZ LOAYZA', '423824', 'ING.', 'AV. 3 N? 24 AUQUISAMA?A', '1948-08-30', '2770984', '79619649', 'armcortez@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, '3537329', '', '', '', 'MARCO ANTONIO CAMARA MIRANDA', '3537329', 'ING.', 'AROMA ENTRE VELASCO GALVARRO Y 6 DE AGOSTO - ORURO', '1977-05-16', '67206853', '0', 'MARCOCAMARAM@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, '3473434', '', '', '', 'NELSON CAHUAYA MENDOZA', '3473434', 'ING.', 'ANTONIO GALLARDO N? 1132', '1970-08-23', '67018547', '0', 'cawaxanelson@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, '6722730', 'SI?ANI', 'LOPEZ', 'JUAN ALBERTO', 'JUAN ALBERTO SI?ANI LOPEZ', '6722730', 'ING.', 'AV. 6 DE MARZO ZONA 12 DE OCTUBRE CALLE 5 Y 6 N? 220', '1987-11-15', '72514446', '0', 'ing.estruc.jasl@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, '4742835', 'CONDORI', 'CORONEL', 'EDWIN', 'EDWIN CONDORI CORONEL', '4742835017', 'ING.', 'CALLE MURILLO N? 264 - VIACHA', '1974-12-04', '79104171', '71291211', 'edconcor@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 11:09:46'),
(75, '5555109', '', '', '', 'ROBERTO VARGAS POQUECHOQUE', '5555109', 'ING.', 'AV. B N? 695, ZONA VILLA TEJADA TRIANGULAR', '1982-08-23', '73331453', '0', 'v_roberth@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, '3398374', 'CASTILLO', 'MALLEA', 'RICHARD', 'RICHARD CASTILLO MALLEA', '3398374', 'ING.', 'CALLE TUPIZA N? 140 ZONA SAN SEBASTIAN', '1968-07-08', '73718095', '0', 'rlcmallea@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, '2689072', '', '', '', 'VICTOR MARTIN CARITA LARUTA', '2689072', 'ING.', 'PASAJE MECAPACA N? 1025 ZONA BALLIVIAN 2DA. SECCION', '1977-03-10', '71209977', '0', 'caritavoctor@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, '3980034', 'WAYLLACE', 'SANABRIA', 'JUAN LUIS', 'JUAN LUIS WAYLLACE SANAVRIA', '3980034', 'ING.', 'AV. EL SOL N 240 ZONA KUPINI - JOKONI LA PAZ', '1977-09-25', '78733378', '0', 'jluisws@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-11 10:56:11'),
(79, '4838236', 'BUSTAMANTE', 'APAZA', 'ELIZABETH LEONOR', 'ELIZABETH LEONOR BUSTAMANTE APAZA', '4838236', 'LIC.', 'ZONA ALTO TEJAR, CALLE 7 N? 905', '1979-07-01', '2473399', '73212142', 'LIZLE@HOTMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-15 10:38:47'),
(80, '3348995', '', '', '', 'PRIMO FERNANDO RIERA CARVAJAL', '3348995', 'ARQ.', 'CALLE 35 N? 100 DEPTO 4, ZONA ACHUMANI', '1978-01-29', '75218667', '0', 'fernando.rierac@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, '2362577', '', '', '', 'FERNANDO CESAR VAZQUEZ MEDINA', '2362577', 'ING.', 'CALLE DEMETRIO CANELAS N? 26 ZONA OBRAJES', '1965-12-29', '77266576', '0', 'fervasquez42@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, '4859055', '', '', '', 'MARCO ALBERTO SALINAS LUNA OROZCO', '4859055', 'ARQ.', 'AV. OSCAR ALFARO N? 27 VILLA SAN ANTONIO ALTO', '1980-08-20', '2235624', '70192323', 'marqsalinas@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, '5489270', '', '', '', 'HANS GONZALO VARGAS PHILIPS', '5489270', 'ING.', 'CALLE FINAL RICARDO ALBA S/N, ZONA ALTO TUCSUPAYA', '1982-09-09', '72880351', '72891167', 'pkkos82@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, '4975209', 'PACHECO', 'HUAYHUA', 'ORLANDO LUIS', 'ORLANDO LUIS PACHECO HUAYHUA', '4975209', 'ING.', 'CALLE LIZON AREVALO N? 3074 ZONA GERMAN BUSCH 1-1-3 ELALTO', '1979-09-18', '76500365', '73061755', 'orlandoluisp@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, '4985111', '', '', '', 'RIANET MIRIAM CUSSI MAMANI', '4985111', 'ARQ.', 'URB. PANORAMICA 1 CALLE BENJAMIN FRANKLIN N? 1264', '1982-07-09', '76767022', '74062222', 'mairim_anet@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, '4267063', '', '', '', 'LINDOMAR QUISPE ROJAS', '4267063', 'ARQ.', 'AV. 9 ESQ. CALLE INGAVI N? 200 ZONA ALTO LIMA 3ra. SECCION - EL ALTO', '1977-02-02', '2844541', '72589004', 'arqlindomar@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, '4245076', '', '', '', 'VALERIANO ANCARI TARQUI', '4245076', 'ARQ.', 'AV. BOLIVIA N? 438 ZONA CALUYO', '1974-06-05', '70554654', '0', 'vat@outlook.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, '6193224', '', '', '', 'MARCO ANTONIO MAMANI PEREZ', '6193224', 'ARQ.', 'ZONA SANTIAGO 1 CALLE 4 N? 1277 EL ALTO', '1986-05-25', '76238380', '0', 'prelomar@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, '5472461', '', '', '', 'JHONNY GONZALES ALEJO', '5472461', 'ING.', 'AV. LOS PINOS N? 767 ZONA VILLA REMEDIOS', '1982-02-03', '78946106', '76294897', 'jhongonzales32@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, '4902620', '', '', '', 'ANGEL ARIEL ARUQUIPA LEDEZMA', '4902620', 'ARQ.', 'VILLA COPACABANA, CALLE ROBERTO CALLACAHUA N? 1934', '1980-03-01', '72593993', '0', 'arielarquipa@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, '5994105', '', '', '', 'LOURDES CHOQUE QUISPE', '5994105', 'ING.', 'AV. RIO BENI N? 2065, ZONA CUPILUPACA NUEVOS HORIZONTES EL ALTO', '1984-05-16', '76233274', '0', 'lurdes103@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, '5783851', 'CASTRO', 'PACHECO', 'RITA VERONICA', 'RITA VERONICA CASTRO PACHECO', '5783851012', 'ING.', 'CALLE ESTADOS UNIDOS Nro 1320', '1984-08-11', '77873776', '74540969', 'ritaveronica75@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 11:15:23'),
(93, '4277016', '', '', '', 'FREDDY AYALA HUACARA', '4277016', 'ING.', 'URB. EL PEDREGAL, AV. A N? 1079 ENTRE CALLES 3 Y 4 ZONA ALTO CALACOTO - LA PAZ', '1974-09-12', '71973926', '0', 'AYALAFREDDY1974@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, '4267120', '', '', '', 'SONIA SUSANA LUQUE SANTALLA', '4267120', 'LIC.', 'CIUDAD SATELITE, PLAN 175, AV. DIEGO DE OCA?A N? 495', '1972-10-23', '74378457', '77773369', 'sonilu_s@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, '3505442', '', '', '', 'EDON ROBERTO VICENTE TORREZ', '3505442', 'ING.', 'CALLE O ENTRE J Y K N? 75', '1971-10-26', '68292396', '0', 'edonvito1@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, '1880310', '', '', '', 'GERMAN COLQUE AYALA', '1880310', 'ING.', 'CALLE 5 N? 77, ZONA LOS ROSALES DE ACHUMANI', '1970-04-25', '77579966', '71598562', 'gercoayal@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, '4268387', '', '', '', 'RAUL CLAUDIO FLORES MACHICADO', '4268387', 'ING.', 'CALLE 1 N? 19, BARRIO ROSASANI', '1974-07-04', '67239400', '67220400', 'ironmaidenmachicado@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, '2374249', '', '', '', 'RICHARD RAMOS LOPEZ', '2374249', 'ING.', 'CALLE 10 PASAJE D N? 165 ZONA OBRAJES', '1964-04-03', '77709181', '0', 'r_ramos_l@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, '6122825', '', '', '', 'JUAN PABLO DEL CARPIO CARRE?O', '6122825', 'ING.', 'AV. 6 DE AGOSTO N? 2484', '1986-04-01', '0', '0', 'JPABLODELCARPIO@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, '6001286', '', '', '', 'JHONY CHOQUE CALLE', '6001286', 'ING.', 'ZONA FRANZ TAMAYO BAUTISTA SAAVEDRA N? 4556', '1980-11-24', '0', '0', 'Lonche102@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, '4764253', '', '', '', 'HILARION COPA MAMANI', '4764253', 'ING.', 'CALLE 15 DE AGOSTO N? 3235, ZONA SAL SILVESTRE', '1972-10-21', '0', '0', 'hilarionc111@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, '2384245', 'HINOJOSA', 'SAAVEDRA', 'VLADIMIR ANTONIO', 'VLADIMIR ANTONIO HINOJOSA SAAVEDRA', '2384245', 'ING.', 'CALLE DPTO. PANDO N? 322, ZONA NORTE CHALLAPAMPA', '1962-08-14', '71504456', '0', 'vladant62@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, '4879786', 'ESPEJO', 'TICONA', 'JOSE HUMBERTO', 'JOSE HUMBERTO ESPEJO TICONA', '4879786', 'ING.', 'CALLE LIBERTAD N? 64, ZONA SAN ISIDRO', '1980-08-04', '73545142', '0', 'jose.het@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, '6038653', 'LAURA', 'ACU?A', 'BENITO ALVARO', 'BENITO ALVARO LAURA ACU?A', '6038653', 'ING.', 'EL ALTO,AV. LADISLAO CABRERA N? 2854, ZONA 16 DE JUNIO', '1989-07-11', '76511708', '68013780', 'BEN.ALV.LAU.ACU@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, '6835126', '', '', '', 'KARLA LORENA MOREIRA DORADO', '6835126', 'ARQ.', 'CALLE CA?ADA STRONGEST N? 1665, ZONA SAN PEDRO', '1986-09-20', '0', '0', 'Lorena_644mor@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, '3556252', '', '', '', 'LUDMILA CALANI SUAREZ', '3556252', 'ARQ.', 'CALLE ILLAMPU N? 301 ENTRE OBLITAS Y BELZU', '1978-01-27', '0', '0', 'Ludcalconstrucciones@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, '4828478', '', '', '', 'CARMEN SANJINEZ LOPEZ', '4828478', 'ARQ.', 'CALLE DIAZ ROMERO N? 1381, ZONA MIRAFLORES', '1980-08-27', '0', '0', 'sanji_ezconst@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, '425572', '', '', '', 'ERNESTO FIDEL APARICIO VALLE', '425572', 'ARQ.', 'CALLE SATELITE PLAN 175 CALLE 17-C N? 315 - EL ALTO', '1960-04-24', '0', '0', 'ernestofaaparicio@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, '2610848', '', '', '', 'ALEX ENRIQUE CASTILLO MU?OZ', '2610848', 'ARQ.', 'CALLE COLON EDIF. COLON SUB SUELO OF. 9', '1962-07-15', '0', '0', 'alexttcastillo@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, '2502144', '', '', '', 'CONSUELO LOYOLA CHOQUE POMA', '2502144', 'ING.', 'ZONA VILLA ADELA AV. CIRCUNVALACION N? 3084', '1967-10-23', '73537188', '0', 'CONGRI5@YAHOO.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, '3433316', '', '', '', 'DIDDIER GUILLERMO GIRONDA CLAURE', '3433316', 'ING.', 'CALLE ENRIQUE LOUP N? 1736, ZONA VILLA COPACABANA', '1970-02-10', '0', '0', 'diddierg@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, '3080050', '', '', '', 'MARCELINO NINA HUANCA', '3080050', 'ING.', 'B.D. TORO N? 60 - ORURO', '1971-02-19', '0', '0', 'MARCELINO_NINA@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, '7221511', '', '', '', 'LORENA LISET FLORES SERRANO', '7221511', 'ING.', 'AV. 31 DE OCTUBRE N? 2115, ZONA BAJO SAN ANTONIO', '1989-09-29', '70226009', '2232494', 'Lflores.ser@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, '6119437', '', '', '', 'MIGUEL ANGEL SECKO FLORES', '6119437', 'ING.', 'CALLE PROLONGACION POSNANSKY N? 1916, ZONA SANTA BARBARA', '1986-04-17', '0', '0', 'miguelsecko@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, '2466933', 'RUIZ', 'DELGADO', 'JUAN CARLOS', 'JUAN CARLOS RUIZ DELGADO', '2466933', 'LIC.', 'CALLE 23 DE CALACOTO N° 7834, EDIF ASTROMELIA DPTO SS1', '1966-02-26', '78838339', NULL, 'jcruizd@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:59:04'),
(116, '3343275', '', '', '', 'MARCIAL CRUZ FLORES', '3343275', 'ING.', 'AV. CIVICA N? 80, ZONA VILLA TEJADA TRIANGULAR - EL ALTO', '1962-10-13', '0', '0', 'WALTERCRUZFC@OUTLOOK.ES', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, '6868769', 'LAURA', 'LIMA', 'RAFAEL SIMEON', 'RAFAEL SIMEON LAURA LIMA', '6868769', 'ING.', 'CASA MATRIZ  TOROTORO N? 1074, ZONA VILLAZON LA PAZ', '1990-01-05', '78897732', '67036456', 'leafar_arual@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, '5956810', '', '', '', 'LUCIO TOMAS CHALLCO CALLISAYA', '5956810', 'ING.', 'CALLE VIACHA N? 100, ZONA ALTO CHIJINI', '1981-12-21', '0', '0', 'visit_atom@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, '4768942', '', '', '', 'BEATRIZ LORENZA CHOQUE TARQUI', '4768942', 'LIC.', 'AV. MECAPACA CALLE 23 N? 50, ZONA OBRAJES', '1977-07-21', '0', '0', 'Beitachoque2020@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, '5785128', 'FLORES', 'QUISBERT', 'MARSEND JACQUELINE', 'MARSEND JACQUELINE FLORES QUISBERT', '5785128011', 'ING.', 'CALLE OBISPO CARDENAS', '1983-11-07', '73451725', NULL, 'mafloqu@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 12:36:57'),
(121, '6909841', '', '', '', 'MARIA ISABEL CHOQUE CHAMBILLA', '6909841', 'ING.', 'CALLE 14 B N? 3, ZONA VILLA TUNARI - EL ALTO', '1990-11-05', '0', '0', 'choqueisabel@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, '2623580', '', '', '', 'RENEE SOFIA CHOQUE SARATE', '2623580', 'LIC.', 'AV. MISAEL SARACHO N? 2375', '1971-09-18', '70558937', '67040552', 'sofita-umsa@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, '3412855', '', '', '', 'FREDDY CANQUI MAGNE', '3412855', 'ING.', 'CALLE ARZABE N? 3139, ZONA 16 DE JULIO - EL ALTO', '1969-03-05', '74869239', '0', 'fredancanqui@yahoo.com.ar', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, '2786209', '', '', '', 'EDGAR EUSTAQUIO CHARALY MAYORGA', '2786209', 'ING.', 'CALLE JUANA A. P. N? 7 ESQ. SOCOMACHI, ZONA VILLA EL PROGRESO  - ORURO', '1963-09-22', '72492541', '5234077', 'edgarcharaly@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, '3528910', '', '', '', 'FELIX ALEJANDRO AYARDE ROMERO', '3528910', 'ING.', 'AV. ARCE N? 2303 Y ROSENDO GUTIERREZ, EDIF TORRE IDEA DPTO 10C', '1976-08-09', '76205858', '0', 'ale_ayarde.r@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, '2780611', '', '', '', 'JOSE LUIS PANOZO TORRICO', '2780611', 'ING.', 'CALLE 25, URB LOS PINOS', '1961-03-30', '72349161', '0', 'Giusepe.17209@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, '4991113', '', '', '', 'LUIS CHAMBI CHINCHE', '4991113', 'ING.', 'CALLE MONTEVIDEO N? 282, ZONA KANTUTANI', '1982-10-11', '77798393', '0', 'luischambichinche@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, '6854890', '', '', '', 'DARCY SCHEARIZA ARMAZA VASQUEZ', '6854890', 'ARQ.', 'CALLE BATALLA DE SUIPACHA N? 1066, ZONA AGUA DE LA VIDA', '1988-11-16', '78798988', '2283307', 'sharyarmaza@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, '1334195', 'TRONCOSO', 'RIOS', 'RENE ANDRES', 'RENE ANDRES TRONCOSO RIOS', '1334195', 'ING.', 'CALLE TENIENTE OQUENDO N? 414', '1958-11-18', '73247233', '79545540', 'reneandrestroncosoris18@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, '5998480', 'HUANCA', 'HUANCA', 'JHONN JESUS', 'JHONN JESUS HUANCA HUANCA', '5998480012', 'ING.', 'AV. TARAPACA Nro 120, ZONA VILLA SANTIAGO I', '1985-01-11', '78871408', '0', 'jhonnjesus2113@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:39:40'),
(131, '5954108', '', '', '', 'FRANZ DANIEL ROBLES SANDY', '5954108', 'ARQ.', 'CALLE RAFAEL MENDOZA N? 400, ZONA ALTO SAN ANTONIO', '1985-06-27', '75884347', '0', 'arqdanielrobless@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, '6137758', '', '', '', 'VANIA PAMELA LUNA VALDEZ', '6137758', 'ARQ.', 'CALLE 46 N? 4646, ZONA CHASQUIPAMPA', '1984-05-26', '70638609', '0', 'vanialunav@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, '3434119', '', '', '', 'MARIA RENEE SELAYA RODRIGUEZ', '3434119', 'ARQ.', '', '1978-06-16', '68026878', '70620309', 'mr.selaya@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, '6102535', '', '', '', 'ABRAHAM CARVAJAL LIMACHI', '6102535', 'ARQ.', 'CALLE 122 N? 75 ZONA VILLA BOLIVAR B', '1983-10-06', '71232151', '75106951', 'king_teken11@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, '4965852', '', '', '', 'ROMER SALOMON BLANCO SALGUEIRO', '4965852', 'ING.', 'CALLE J. ARCE N? 2137 PLAN 266, ZONA CIUDAD SATELITE', '1983-09-20', '77207266', '0', 'romeritoblanquito@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, '5943367', '', '', '', 'PAMELA IVONNE VISCARRA OVANDO', '5943367', 'ARQ.', 'AV. HECTOR ORMACHEA N? 5556', '1982-03-16', '77561562', '0', 'pameviscarra@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, '3645543', '', '', '', 'IVAN MARCELO GOYTIA PACA', '3645543', 'ING.', 'CALLE 1 EDIF. SANTA RITA DPTO. 3B, ZONA LOS PINOS', '1976-09-01', '76200527', '0', 'marcelo.goytia@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, '6107812', '', '', '', 'ALVARO REYNALDO CARRILLO CUBA', '6107812', 'ING.', 'AV. 31 DE OCTUBRE, ZONA VILLA SAN ANTONIO BAJO', '1989-08-07', '78828038', '74057473', 'alvaro.carrillo.cuba@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, '4998167', '', '', '', 'PRIMO MARIO MANZANEDA VICENTE', '4998167', 'ING.', 'CALLE 6 N? 947, ZONA SANTIAGO II', '1980-04-16', '68225731', '0', 'capernaum777@live.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, '5130828', '', '', '', 'PATRICIA JANE NIEVES CONDE', '5130828', 'ING.', 'CALLE JORGE ACU?A N? 30', '1982-09-14', '68001976', '0', 'Ing.nieves.pj@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, '4897280', '', '', '', 'LIMBERT ARTURO FIGUEROA RAMIREZ', '4897280', 'ING.', 'AV. BOLIVIA CALLE 6 N? 8', '1981-09-23', '73272575', '0', 'figueroa.ingcivil@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, '5009500', '', '', '', 'MARISELA LORENA SOLANO TARQUINO', '5009500', 'ARQ.', 'CALLE RICARDO MUJIA N? 809, ZONA SOPOCACHI', '1989-10-18', '70223718', '73535154', 'mari_jpm@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, '3392694', '', '', '', 'HUGO ERNESTO JIMENEZ SORIA', '3392694', 'ING.', 'CALLE 54 N? 7, ZONA CHASQUIPAMPA', '1980-03-16', '72070095', '0', 'hjiso777@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, '3498210', '', '', '', 'SAULA DEL ROCIO FERNANDEZ MONASTERIOS', '3498210', 'ARQ.', 'CALLE CUBA N? 1602 EDIF. CAMPANINI DPTO. J, ZONA MIRAFLORES', '1971-06-28', '70580822', '0', 'saulafe@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, '6049226', '', '', '', 'MONICA ARMINDA ALVARADO VELASCO', '6049226', 'ING.', 'AV. MU?OZ REYES N? 46, ZONA ALTO IRPAVI - LAS PRADERAS', '1992-02-02', '68008684', '0', 'alvarado.velasco.monica@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, '4776712', '', '', '', 'CONSTANTINO QUESO CHIARA', '4776712', '', 'CALLE 37 N? 7, ZONA WILACOTA', '1980-12-08', '72035022', '0', 'supervision deobrasdcdp@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, '4312781', '', '', '', 'ARIEL BENJAMIN SORIA AMURRIO', '4312781', 'ARQ.', 'CALLE RUISE?OR N? 21 EDIF. VIVIANA CALEB PB. 1-A, ZONA IRPAVI', '1975-08-30', '22723368', '77575543', 'ariel.soria@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, '2431529', '', '', '', 'ANTONIO JOSE SANCHEZ SALINAS', '2431529', 'ARQ.', 'AV. 23 DE MARZO N? 187, ZONA RIO SECO', '1971-03-07', '67096266', '0', 'ass_arq_6177@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, '6812368', '', '', '', 'JOSELYN CHAVEZ QUISBERT', '6812368', 'ARQ.', 'CALLE HERNANDO SILES N? 60, ZONA HUMACHUA 2 - VIACHA', '1986-09-17', '72580970', '0', 'joselyn_arq@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, '4912848', '', '', '', 'FABIOLA OLIVARES ULLOA', '4912848', 'LIC.', 'CALLE PEDRO SALAZAR N? 872', '1980-09-14', '75201100', '76263250', 'fabiola ulloa_abog@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, '3113751', '', '', '', 'REMBERTO ALAN CARVAJAL AIZA', '3113751', 'ING.', 'VILLA MERCEDES - EL ALTO', '1971-01-22', '72476937', '0', 'maalancarvajal@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, '3081817', '', '', '', 'EDWIN HURTADO HUMEREZ', '3081817', 'ING.', 'AV. RIO MAMORE Y AV. LITORAL S/N - EL ALTO', '1968-02-27', '72486738', '0', 'edwhurhum@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, '5086213', '', '', '', 'ORLANDO HUANCA VILLCA', '5086213', 'ING.', 'CAKKE 17 DE AGOSTO', '1979-08-14', '72440538', '0', 'orlando_icma@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, '3089637', '', '', '', 'LUIS GONZALO ALESSANDRI ZAMORANO', '3089637', 'ING.', 'AV. 6 DE OCTUBRE N? 4598 Y SARGENTO FLORES', '1966-01-07', '5249730', '72470749', 'Alessandrig100@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, '4910239', 'ASISTIRI', 'CUSI', 'FRANZ', 'FRANZ ASISTIRI CUSI', '4910239', 'ING.', 'CALLE 8 N? 233 VILLA ESCOBAR URIA', '1982-08-25', '77714160', '71262883', 'FRANZ.IN1982@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, '3379797', '', '', '', 'ARTURO RICARDO SEGOVIA CLAVIJO', '3379797', 'ING.', 'CALLE 23 DE MARZO N? 1755 EDIF. NILVITA DPTO 101', '1969-04-03', '76245557', '0', 'arturoseg58@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, '3063560', '', '', '', 'LAURA CAROLINA BUSTOS CALLE', '3063560', 'ING.', '12 DE OCTUBRE N? 1666, MADRID Y BULLAIN', '1973-07-01', '73809665', '0', 'laurabustosc@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, '5256623', 'CAYO', 'TAQUICHIRI', 'EDGAR', 'EDGAR CAYO TAQUICHIRI', '5256623', 'ING.', 'PATACA ALTA BARRIO FORTALEZA PARADA TRUFI M', '1978-02-20', '72194216', '0', 'Ect.sanjo@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, '3593775', '', '', '', 'CARLOS RUBEN RICO EGUEZ', '3593775', 'ING.', 'CALLE SURUBI ESQ. CHICHAPI - VILLA BONITA - URUBO - SANTA CRUZ', '1975-11-06', '76402374', '0', 'cheme75@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, '4337732', '', '', '', 'ALEJANDRO QUENTA LEVANDRO', '4337732', 'ING.', 'CALLE CHIMAN IGNACIO N? 4015, ZONA VILLA INGENIO D-2', '1974-07-17', '70634384', '72533526', 'alejandro.quenta7@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, '6857382', NULL, 'CABALLERO MAMANI', 'AYLIN RUTH', 'AYLIN RUTH CABALLERO MAMANI', '6857382', 'ING.', 'AV. EUSEBIO GUTIERREZ N? 572, ZONA ACHACHICALA', '1987-09-17', '2304653', '74029193', 'aylinrcm2@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-05 17:00:15'),
(162, '4879082', '', '', '', 'CATALINA HILARI CAPARICONA', '4879082', 'ING.', 'CALLE ANTOFAGASTA N? 118, ZONA ALTO 27 DE MAYO', '1980-04-29', '70667149', '0', 'Cata48790@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, '7915894', '', '', '', 'HUMBERTO LAZCANO TARQUI', '7915894', 'LIC.', 'CALLE PEDRO TOLEDO S/N, ZONA SUDESTE (VALLE HERMOSO NORTE)- COCHABAMBA', '1988-06-01', '72274248', '0', 'lazcanohumberto@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, '3491076', '', '', '', 'JAVIER ALEJANDRO SOLOGUREN ZAMORA', '3491076', 'ING.', 'LA PRADERA CALLE 6 N? 75, ZONA ALTO IRPAVI', '1974-03-23', '0', '76544499', 'Structum.mail@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, '6966931', '', '', '', 'JOSE LUIS CANQUI MAMANI', '6966931', 'ING.', 'CALLE ARTEMISA N? 1045, ZONA ROMERO ALTO - EL ALTO', '1988-10-10', '76580654', '0', 'josecanqui.jc@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, '7203476', '', '', '', 'MARILIA MARICEL RIOS MENDOZA', '7203476', 'ING.', 'CALLE JORGE SAENZ CASI HAITI N? 1026', '1990-08-14', '73486015', '0', 'Rios_vial@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, '5493370', '', '', '', 'ALVARO RODRIGO VELASQUEZ CASTRO', '5493370', 'ING.', 'CALLE SUCRE S/N, VILLA ABECIA - CHUQUISACA', '1983-01-27', '71863355', '75799264', 'rod_rigo216@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, '4051360', '', '', '', 'ERICK FABRICIO CAMACHO BELTRAN', '4051360', 'ING.', 'AVENIDA ESPA?A N? 1460 ENTRE LA SALLE Y BULLAN', '1990-02-03', '73843005', '25261749', 'ef_crazy1@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, '4778509', '', '', '', 'BRUNO POMA LAYME', '4778509', 'ING.', 'CALLE JUSTO GERMAN VARELA N? 9, ZONA LA PORTADA', '1979-10-07', '71969347', '0', 'brunos7@live.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, '4333266', '', '', '', 'EDUARDO FRANZ QUIROZ TORREZ', '4333266', 'ING.', 'AV. CARRASCO N? 1506, ZONA MIRAFLORES', '1976-05-13', '70634910', '0', 'edufranzquiroztorrez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, '6194801', '', '', '', 'RICARDO FERNANDO CESPEDES CHAVEZ', '6194801', 'LIC.', '', '1986-05-28', '75868779', '0', 'ricardojul.05@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, '2455441', '', '', '', 'GONZALO ANTONIO BILBAO LA VIEJA RUIZ', '2455441', 'LIC.', 'CALLE 27 N? 9, ZONA LOS PINOS', '1973-08-25', '77773609', '60663266', 'bilbaolaviaje.gonzalo@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, '4775444', '', '', '', 'MAGALY LUZ JURADO MARISCAL', '4775444', 'LIC.', 'CALLE 1 VILLA DOLORES N? 717 - EL ALTO', '1974-06-26', '77219381', '0', 'magalyluz2005@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, '4814447', '', '', '', 'SUSANA KARINA FLORES PINTO', '4814447', 'LIC.', 'CALLE ABETOS N? 7009, ZONA BAJO LLOJETA', '1978-08-28', '72035232', '2412701', 'susanakarinafp@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, '3056905', '', '', '', 'GALO MATIAS RODRIGUEZ', '3056905', 'LIC.', 'BUENOS AIRES Y LOS ANDES N? 375', '1962-10-16', '74110925', '0', 'matiasgalo78@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, '4058114', '', '', '', 'NILDA PATRICIA SILES ZENTENO', '4058114', 'ING.', 'CALLE BOLIVAR N? 1168', '1982-07-11', '72487666', '0', 'patriciasilesz@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, '9881723', 'FLORES', 'UÑO', 'ANA MARIA', 'ANA MARIA FLORES U?O', '9881723011', 'LIC.', 'CLAUDIO SANJINEZ N| 1605', '1975-09-26', '67052939', '63196865', 'floresana2609@gmail.com', 'MUJER', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-22 11:52:32'),
(178, '6061739', '', '', '', 'NESTOR GONZALO TORREZ MONTALVO', '6061739', 'ING.', 'EL ALTO,ZONA: VILLA CONCEPCION CALLE JUAN BAUTISTA N? 1514', '1987-05-21', '0', '22850717', 'TORREZ.MONTALVO.21@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, '5238220', '', '', '', 'FREDDY MONTA?O ROJAS', '5238220', 'LIC.', 'CALLE MANUEL ASCENCIO VILLARROEL S/N PUNATA -COCHABAMBA', '1975-11-20', '70370420', '0', 'FREMORO94@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, '4378485', '', '', '', 'OLGA PILAR LIMACHI MAMANI', '4378485', 'LIC.', 'CALLE PUERTA DEL SOL N? 797, ZONA PASANKERI', '1976-01-13', '68183605', '0', 'abelenlimachi_ts@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, '4311421', '', '', '', 'CHRISTIAN RODRIGO AGUILAR SALAZAR', '4311421', 'ING.', 'CALLE SANTOS MACHICADO N? 599, EDIFICIO ADELA PISO 2 DPTO 2', '1984-08-20', '72080799', '22491766', 'crisor.agui@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, '3771732', '', '', '', 'OSCAR MATT VARGAS SANDOVAL', '3771732', 'ING.', 'CALLE CHUQUISACA N? 16', '1974-07-06', '79718036', '0', 'osvarsa@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, '6798950', '', '', '', 'JOSE LUIS QUISPE CINKA', '6798950', 'ARQ.', 'CALLE 1RO DE MAYO N? 195, ZONA MALLASILLA', '1987-05-20', '69743988', '0', 'Joseluiscrow203d@gmsil.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `personas` (`id`, `ci`, `paterno`, `materno`, `nombres`, `datosp`, `nit`, `grado`, `direccion`, `fechaNacimiento`, `fono1`, `fono2`, `email`, `genero`, `observacion`, `departamento`, `status`, `created_at`, `updated_at`) VALUES
(184, '5808789', '', '', '', 'MARIO BENJAMIN ORTIZ GARZON', '5808789', 'ING.', 'AV. TEJADA SORZANO N? 926 ENTRE ITURRALDE Y DIEGO PERALTA', '1986-03-31', '78226315', '71193518', 'zurdo_c_1@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, '5969055', '', '', '', 'FABRICIO FRANZ MONCADA CARTAGENA', '5969055', 'ING.', 'CALLE TENIETE GUILLEN ESQ 19 N? 6495, ZONA OBRAJES', '1987-11-29', '71528082', '0', 'fabri_6270@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, '4786522', '', '', '', 'EDISON CHAMBI CALLISAYA', '4786522', 'ING.', 'CALLE 5 N? 200, ZONA BELLA VISTA', '1985-01-22', '73287600', '0', 'edisonchambi@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, '4804864', '', '', '', 'JOAQUIN MIGUEL VASQUEZ SALAZAR', '4804864', 'ING.', 'CALLE LAS COLINAS CONDOMINIO, MEDITERRANEO N? 6, ZONA ACHUMANI LAS LOMAS', '1986-05-05', '73009921', '0', 'kinvasquez@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, '6122713', '', '', '', 'MAURICIO JORGE OVANDO', '6122713', 'ING.', 'PLAN 361, CALLE 2 N? 313, CIUDAD SATELITE - EL ALTO', '1986-06-29', '79542643', '63199595', 'epicusmau@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, '6119937', '', '', '', 'WENDY TATIANA GARCIA GUILLEN', '6119937', 'ING.', 'AV. OSCAR ESCALANTE N/N, BARRIO PAZ ZAMORA', '1989-10-12', '77798899', '0', 'wtati_518@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, '3428967', '', '', '', 'LUIS FRANCISCO CHIPANA QUELCA', '3428967', 'ING.', 'AV. ACONCAGUA N? 8724, ZONA SENKATA ANTOFAGASTA', '1976-08-21', '76209726', '67083050', 'luischipanaquelca@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, '8432385', '', '', '', 'KAREN MARCIA MENDOZA PAZ', '8432385', 'ING.', 'CALLE PROLONGACION CLAVIJO N? 68, ZONA SAN JORGE', '1990-10-03', '0', '0', 'k.mendoza.paz.90@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, '4777048', '', '', '', 'LIBERTAD ESPA?A MITA', '4777048', 'ARQ.', 'VILLA SALOME CALLE 5 N?506', '1982-03-23', '2258297', '73532326', 'liesmi@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, '2684749', '', '', '', 'FRANKLIN ZENON MERLO QUISBERT', '2684749', 'ARQ.', 'CASLLE KILOMETRO 7, N? 1780, ZONA ALTO SAN PEDRO', '1974-03-22', '76296917', '0', 'arq-franklin@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, '3533857', '', '', '', 'ERICK JOHNNY RIOS ARDAYA', '3533857', 'ING.', 'CALLE JORGE SAENZ Y HONDURAS 1022', '1976-10-08', '71522676', '0', 'erck.riosardaya@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, '4291528', '', '', '', 'EDWIN EDGAR ACARAPI ARUQUIPA', '4291528', 'ARQ.', 'CALLE K N? 521, ZONA VILLA VICTORIA', '1976-05-22', '72515424', '0', 'Arqarapi@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, '8305490', '', '', '', 'BLADIMIR RUBEN LOAYZA TICONA', '8305490', 'ING.', 'FINAL LANDAETA N? 1208, ZONA TEMBLADERANI', '1990-02-10', '76271361', '0', 'Bladimir.loayza.t@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, '4311139', '', '', '', 'JUAN MAMANI TICONA', '4311139', 'ING.', 'LA PAZ DE AYACUCHO N? 2031, ZONA VILLA SALOME', '1973-11-29', '73284755', '0', 'Ing.jmt10999@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, '2318449', '', '', '', 'JOHNNY MARTINEZ MONTA?O', '2318449', 'ARQ.', 'CIUDAD SATELITE PLAN 361, CALLE 5 N? 371', '1962-08-31', '74722322', '0', 'mmzinedine2318@mail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, '5982496', '', '', '', 'VIVIANA SOFIA ITURRY QUINTANILLA', '5982496', 'ING.', 'PZA. ISABEL LA CATOLICA EDIF. BUSH DPTO. 701, ZONA SAN JORGE', '1985-01-13', '72066468', '0', 'vivitusiq@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, '2326777', '', '', '', 'FREDDY QUISBERT MENDOZA', '2326777', 'ARQ.', 'CALLE MANANEDA 1ER PASAJE N? 80', '1960-08-21', '22282726', '0', 'freqm@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, '6086520', '', '', '', 'FRANCO DAVID ADUVIRI PAREDES', '6086520', 'ING.', 'CALLE 30ESQ. CALLE B N? 301, ZONA ACHUMANI', '1989-08-27', '77701740', '0', 'francoadu@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, '7888876', '', '', '', 'ROLANDO MAMANI ACHACOLLO', '7888876', 'ARQ.', 'CALLE GRECIA VALLE HERMOSO, ZONA SUD', '1987-12-10', '71459291', '0', 'roland.rick.net@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, '6004364', 'MAURICIO', 'QUISPE', 'MARCO ANTONIO', 'MARCO ANTONIO MAURICIO QUISPE', '6004364', 'ING.', 'CALLE RAUL SALMON DE LA BARRA N? 3675, ZONA BARRIO DEL PERIODISTA EL ALTO LA PAZ', '1984-04-24', '71949848', '73043907', 'mauriciomarco1984@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, '3540831', '', '', '', 'CARLOS ABDON BALDERRAMA CESPEDES', '3540831', 'LIC.', 'CALLE JUAN MINCHIN ESQ LECLERE POLO N? 1', '1977-01-22', '5240411', '77110931', 'carvebald@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, '2627464', '', '', '', 'JOSE FERNANDO TARQUI BLANCO', '2627464', 'ARQ.', 'CALLE COLON N? 857', '1980-04-17', '77716330', '0', 'Fernando_jftb@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, '5989113', '', '', '', 'SOLEDAD LOURDES FLORES DIAZ', '5989113', 'ING.', 'CALLE VICTOR EDUARDO N? 300, ZONA MIRAFLORES', '1985-09-13', '0', '68137655', 'solufdi@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, '3462806', '', '', '', 'GROVER HUANCA CHAMBI', '3462806', 'ING.', 'CALLE MAURICIO MANCILLA N? 879, ZONA FINAL LOS ANDES', '1968-04-03', '71228890', '0', 'grover_agro@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, '5271853', '', '', '', 'FRANCO SALINAS PASQUIER', '5271853', 'ING.', 'PASAJE CHOPIN N? 130, ZONA COLQUIRI SUD', '1987-05-07', '67430984', '74571109', 'franco_labamba@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, '6498532', 'LARA', 'ORTU?O', 'ARIEL NIVER', 'ARIEL NIVER LARA ORTU?O', '6498532', 'ING.', 'AV. LLUNQUI YUPANKI N? 1098 EDIF. ISABELLA DPTO 2', '1992-01-14', '72238750', '4790294', 'ariellara1415@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, '2539170', 'VISCARRA', 'MEJIA', 'GUSTABO ROBERTO', 'GUSTABO ROBERTO VISCARRA MEJIA', '2539170', 'ING.', 'CALLE 13 A N? 13, ZONA IRPAVI', '1965-01-27', '67083222', '60528561', 'roberto_viscarra@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, '4413214', 'MARCA', 'CRUZ', 'CELSO', 'CELSO MARCA CRUZ', '4413214018', 'ING.', 'CALLE 21 DE DICIEMBRE N? 1744, ZONA CHILLIMARCA FINAL CALLE CARACOL BARRIO 26 DE FEBRERO', '1975-06-10', '73524160', '0', 'marcacc75@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 13:35:45'),
(212, '4039565', '', '', '', 'FREDDY CACERES HUANACO', '4039565', 'ING.', 'AV. CIVICA N? 948 ENTRE CALLE 8 Y CALLE 10', '1979-01-29', '68327810', '0', 'frey_79@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, '4094465', 'ARANCIBIA', 'YUCRA', 'GROBER WILSON', 'GROBER WILSON ARANCIBIA YUCRA', '4094465', 'ING.', 'AV. DEL EJERCITO N? 1309', '1978-12-25', '73443506', '0', 'groverwilson@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, '5656247', 'AVALOS', 'OJEDA', 'WILBER WILSON', 'WILBER WILSON AVALOS OJEDA', '5656247', 'ING.', 'AV. DEL EJERCITO N? 901', '1985-01-21', '74413024', '67611693', 'wilsonavalosojeda@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, '4039309', 'BARRIENTOS', 'CONDORI', 'BENJAMIN', 'BENJAMIN BARRIENTOS CONDORI', '4039309018', 'ING.', 'AVAROA/ PDTE. MONTES Nro 66', '1980-10-04', '72344085', '0', 'boldi10@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:59:25'),
(216, '3116096', '', '', '', 'GERARDO ROQUE LOZANO', '3116096', 'ING.', '6 DE OCTUBRE N? 1000, GALLEGUITOS', '1970-03-02', '72498680', '0', 'geryroque@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, '2377992', '', '', '', 'RAMIRO LUIS ALTAMIRANO YUJRA', '2377992', '', 'CALLE VENTURA N? 2536, ZONA LA PORTADA', '1962-02-06', '2382839', '71564342', 'RAMIROLESS@YAHOO.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, '5062084', '', '', '', 'MARCIAL MODESTO CHOQUE GODOY', '5062084', 'ING.', 'CALLE 1 N? 126, URB. LAS RETAMAS, ZONA SEGUENCOMA', '1972-02-24', '67200725', '0', 'constructora.itc.srl@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, '3629825', '', '', '', 'LUIS ALFONZO GARECA LLANO', '3629825', 'ING.', 'CALLE NTONIO ARCE N? 2126, CIUDAD SATELITE - EL ALTO', '1975-08-18', '65753516', '67598388', 'luisgareca@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, '8736500', '', '', '', 'DEIBY GOMEZ NU?EZ', '8736500', 'ING.', 'URB. VILLA MIRAFLORES - TIQUIPAYA', '1989-07-30', '76990461', '74771090', 'dgncivil@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, '6610071', '', '', '', 'VICTOR VICENTE ALI FUERTES', '6610071', 'ING.', 'CALLE NAZARIA IGNACIA N? 71 ZONA CHAPINI', '1987-02-14', '73859360', '0', 'victor_vaf@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, '3674674', 'ROSAS', 'VILLAFUERTE', 'WALTER MARIO', 'WALTER MARIO ROSAS VILLAFUERTE', '3674674', 'ING.', 'PLAZA CALVARIO', '1971-09-08', '73898795', '-312628319', 'Walros2013@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, '848513', '', '', '', 'NELSON ANTONIO TORRICO MARTINEZ', '848513', 'ING.', 'CALLE RUIZ DE ORELLANA N? 1120, ZONA HIPODROMO', '1956-03-23', '71720780', '0', 'nelsontorrico56@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, '4791531', 'AGREDA', 'CASTILLO', 'JUAN PABLO', 'JUAN PABLO AGREDA CASTILLO', '4791531', 'ING.', 'CALLE 24 DE SEPTIEMBRE N? 500, ZONA COTA COTA', '1988-08-03', '72080810', '76514118', 'juampifregado@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, '4338639', 'REYNAGA', 'POMA', 'JAVIER OSCAR', 'JAVIER OSCAR REYNAGA POMA', '4338639', 'ING.', 'AV. A N? 17 URB. CODAVISA, ZONA CHASQUIPAMPA', '1976-09-17', '2777926', '75201179', 'oscarreynagapoma@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, '4319811', '', '', '', 'CRISTOBAL CORI MAMANI', '4319811', 'ING.', 'AV. EX VIA FERREA Y CALLE 6 N? 114, MARISCAL SANTACRUZ - VIACHA', '1975-11-16', '73055162', '71281786', 'cristobal_cori@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, '7052727', '', '', '', 'ABEL JOAQUIN CABRERA ZAPANA', '7052727', 'ING.', 'CALLE CHAMPI ORKO N? 2014, ZONA ILLAMPU', '1990-07-26', '72078929', '65558511', 'abel_cabrera_zapana@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, '3643286', 'FORTUN', 'CASTRO', 'ISAAC', 'ISAAC FORTUN CASTRO', '3643286', 'ING.', 'AV. JULIO VILLA N? 361 - SUCRE', '1975-06-23', '72866202', '6421749', 'ing.isaacfortun@gmailcom', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, '365395-1D', 'ALCON', 'TRONCOSO', 'NATHAN MIQUEAS', 'NATHAN MIQUEAS ALCON TRONCOSO', '365395-1D', 'ING.', 'CALLE VISCARRA N? 14, ALTO VILLA SAN ANTONIO', '1959-03-28', '2230921', '70141284', 'nalcontr@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, '6023764', '', '', '', 'VLADIMIR CHOQUE ARANCIBIA', '6023764', 'ING.', 'CALLE SAN MARCOS N| 1255,URB CORAZON DE JESUS - EL ALTO', '1986-06-30', '71548226', '0', 'Leimund@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, '3355764', '', '', '', 'SEVERO ROJAS LIMA', '3355764', 'ING.', 'ZONA NUEVOS HORIZONTES I, CALLE  4 N? 416 -EL ALTO', '1966-09-30', '67193658', '0', 'severojas@outlook.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, '1915615', '', '', '', 'DENISSE MARIELA PARRA ARIAS', '1915615', 'ING.', 'AV 20 DE OCTUBRE NO 2144-503', '1974-08-17', '73086199', '2412413', 'denisseparra1974@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, '4993054', '', '', '', 'CLAUDIA VILLANUEVA ARANO', '4993054', 'LIC.', 'ZONA CRISTO REY,C. ANDRES BARRAGAN N?2112', '1981-08-29', '72574573', '0', 'leptochica@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, '4060971', '', '', '', 'ARIEL FERRUFINO REINAGA', '4060971', 'LIC.', 'AV. SIMON BOLIVAR N? 1861 (ZONA MIRAFLORES)', '1982-11-17', '68215459', '0', 'aferrufino@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, '6408312', '', '', '', 'JAVIER ILLANES ARGOTE', '6408312', 'ING.', 'CALLE NATANIEL AGUIRRE #211 ENTRE RICARDO SORUCO Y GRAL. CAMACHO (ZONA CENTRAL QUILLACOLLO)', '1984-12-03', '4390344', '76470012', 'javillanes.a@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, '5056866', '', '', '', 'YAMIL MONTES MICHEL', '5056866', 'ING.', 'ZONA SOPOCACHI (AV. SANCHEZ LIMA-PASAJE FABIANI)', '1983-04-03', '74526519', '0', 'HGGASYAMILMONTES@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, '4020931', 'GUARDIA', 'QUINO', 'LUIS FERNANDO', 'LUIS FERNANDO GUARDIA QUINO', '4020931', 'ING.', 'AV. PANORAMICA N? 22 ENTRE CALLE 5 Y 6  VILLA DOLORES EL ALTO', '1979-02-26', '63120774', '76771174', 'LUISGUARDIAQ@YAHOO.ES', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, '6144460', '', '', '', 'HERNAN ZOILO LUQUE MOJICA', '6144460', 'ING.', 'C/ MANUEL OYOS N? 1145 Z. 23 DE MARZO', '1985-10-26', '71365045', '76515583', 'HERNANZLUQUE@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, '6148869', '', '', '', 'MARIA ANGELA CANDIA BARRIONUEVO', '6148869', 'ING.', 'AV. AUGUSTO GUZMAN N? 4095 Z. VILLA MERCEDES B.', '1982-10-25', '71509986', '0', 'MARIA71509986@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, '3448955', '', '', '', 'SINTHIA CARLA AZURDUY VILLALOBOS', '3448955', 'LIC.', 'C. JUAN DOMINGO PERON N? 25, ZONA SAN ISIDRO- ALTO', '1985-04-05', '73006374', '0', 'sinthia@azurduy_v8@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, '4305921', '', '', '', 'ISRAEL HEBER SURCO PEREZ', '4305921', 'ING.', 'ZONA SOPOCACHI ABDON SAAVEDRA N? 2063', '1991-03-30', '72066116', '0', 'ISRAELHEBERSP@OUTLOOK.ES', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, '3351712', '', '', '', 'EDWIN EDUARDO SANCHEZ APAZA', '3351712', 'ING.', 'ZONA 1RO DE MAYO , PLAN 52 B N? 13', '1982-01-03', '67070498', '0', 'eduardo_eddu@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, '5706081', '', '', '', 'THALIA RODRIGUEZ PORTILLO', '5706081', 'LIC.', 'ZONA VILLA EL CARMEN CALLE 6 N? 45', '1990-02-04', '72917085', '0', 'THALIARODRIGUEZPORTILLO@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, '3048803', '', '', '', 'ROBERTO FLORES RIOS', '3048803', 'ING.', 'CALLE JUAN JOSE PEREZ N? 668 ENTRE PERU Y ALTO DE LA ALIANZA-ORURO', '1964-09-04', '73801861', '0', 'roflores0409@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, '4504879', '', '', '', 'DIETER LUJAN ORELLANA', '4504879', 'ING.', 'AV. JUAN B. PEREIRA S/N ARANI', '1979-02-06', '74341809', '4787240', 'caballo_dieter@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, '1892791', '', '', '', 'JORGE OCTAVIO PRIETO FLORES', '1892791', 'ING.', 'CALLE CAP. GARCIA 1969, URB. MOTO MENDEZ', '1974-10-20', '78704041', '0', 'joprietof@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, '5126994', 'PORCEL', 'MEDINACELLY', 'GEOVANA MARIA', 'GEOVANA MARIA PORCEL MEDINACELY', '5126994011', 'ING.', 'CALLE CLAUDIO LLANOS N 22 ZONA SAN ROQUE', '1982-05-31', '67908688', NULL, 'GEOVITA05@HOTMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:00:46'),
(248, '4059979', '', '', '', 'ARIEL OSVALDO LOPEZ BELMONTE', '4059979', 'ING.', 'JOSE AGUIRRE ACHA 1558 DPTO 2-G COCHABAMBA', '1983-12-10', '71850668', '0', 'ariel_LB_7@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, '3519800', 'CHURQUI', 'MANCILLA', 'CRISTOBAL', 'CRISTOBAL CHURQUI MANCILLA', '3519800', 'ING.', 'FINAL TTE. N? 48 ENTRE ANTOFAGASTA Y CHAYANTA', '1974-07-10', '72490028', '0', 'CRISTOBALCHURQUI@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, '3323720', 'CALLISAYA', 'GUTIERREZ', 'RAMIRO', 'RAMIRO CALLISAYA GUTIERREZ', '3323720', 'ING.', 'EL ALTO - SENKATA URB. PARCOPATA PLAZA 2 DE FEBRERO - 313', '1968-02-02', '73577825', '0', 'consultoresening2021@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, '-496234123', 'QUELCA', 'MAMANI', 'FLORENCIO', 'FLORENCIO QUELCA MAMANI', '-496234123', 'ING.', 'CALLE J NRO 381', '1989-10-27', '25285129', '75402473', 'FLORENS.LONWE@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, '4454086', 'FLORES', 'FULGUERA', 'OMAR GONZALO', 'OMAR GONZALO FLORES FULGUERA', '4454086', 'ING.', 'CALLE 14 DE SEPTIEMBRE PAYACOLLO ,SIPE SIPE CBBA', '1976-09-17', '67401610', '0', 'GONI_CITO@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, '4041536', 'VALERIANO', 'CARVALLO', 'HUASCAR JUAN PABLO', 'HUASCAR JUAN PABLO VALERIANO CARVALLO', '4041536', 'ING.', 'SARGENTO FLORES NRO 716', '1978-07-17', '76139624', '0', 'HUASCARJUAN@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, '3538112', 'LUCERO', 'MEJIA', 'EDSSON RENE', 'EDSSON RENE LUCERO MEJIA', '3538112', 'ING.', 'CALLE 10 NRO 626 ZONA OBRAJES', '2000-01-01', '72453125', '0', 'CVIMAREK@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, '3519776', 'NOGALES', 'AJHUACHO', 'DELMA', 'DELMA NOGALES AJHUACHO', '3519776', 'ING.', 'URQUIDI NRO 332 TOMAS FRIAS Y RENGEL', '1975-03-09', '5212617', '73801807', 'MEGANCITADELMA@HOTMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, '3061809', 'ALEGRIA', 'SEQUEIROS', 'RICARDO ABELARDO', 'RICARDO ABELARDO ALEGRIA SEQUEIROS', '3061809', 'ING.', 'C. LOAYZA CAMACHO EDIF. UGARTE  PISO 5 DEPTO 502', '1973-06-09', '72341343', '0', 'ESPERANZA.BOLIVIA2016@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, '4085085', 'RIVERA', 'CLAROS', 'MAURICIO EDUARDO', 'MAURICIO EDUARDO RIVERA CLAROS', '4085085', 'ING.', 'CALLE PISAGUA NRO 400', '1980-09-10', '46460867', '72876446', 'CMAURI.109@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, '3116284', 'CONDORI', 'PACO', 'JULIA FILOMENA', 'JULIA FILOMENA CONDORI PACO', '3116284', 'ING.', 'CALLE BENI NRO 29, ZONA CALVARIO', '1976-08-10', '75213422', '0', 'JULIA23629@GMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, '3461631', 'MENDOZA', 'TITIRICO', 'GABRIELA', 'GABRIELA MENDOZA TITIRICO', '3461631', 'ING.', 'ZONA VILLA COPACABANA C/ VICENTE CAMARGO NRO 1826', '1982-08-12', '71219105', '0', 'TITIRICOGABA@GMAIL.COM', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, '2613119', 'ISIDRO', 'CONDORI', 'RENE', 'RENE ISIDRO CONDORI', '2613119', 'ING.', 'AV. APUMALLA1623 NRO 1623  ZONA CALLAMPAYA', '1961-08-22', '68666820', '0', 'RENEISIDROC@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, '6067651', 'SANTOS', 'MAMANI', 'OSMAN ROBERTO', 'OSMAN ROBERTO SANTOS MAMANI', '6067651', 'ING.', 'EL ALTO, C. SATELITE URB. CHACARISMAL AV. JERUSALEN NRO. 4720', '0000-00-00', '73540150', '0', 'OSMANSMAMANI@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, '4038607', 'CHOQUE', 'APAZA', 'CESAR UALDINO', 'CESAR UALDINO CHOQUE APAZA', '4038607', 'ING.', 'AVENIDA K NRO 5 ENTRE AV. ILLIMANI Y CALLE  4 DE LA CIUDAD DEL ALTO', '1979-05-14', '74134100', '75973555', 'CESARUALDINO@HOTMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, '9100349', 'QUEQUESANA', 'CORDERO', 'JHONNY ISRAEL', 'JHONNY ISRAEL QUEQUESANA CORDERO', '9100349', 'ING.', 'CALLE SUR CINTI, ZONA MURARATA P3,EL ALTO', '1986-02-04', '71215665', '0', 'JHONNYSRAEL22@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, '7041090', 'TAMBO', 'CALLIZAYA', 'JORGE LUIS', 'JORGE LUIS TAMBO CALLIZAYA', '7041090', 'ING.', 'Z. VILLA AVAROA C. 139 NRO 920 EL ALTO', '1990-05-19', '72019361', '0', 'JORGETAMBOC@GMAIL.COM', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, '2141951', 'GARICA', 'APAZA', 'EMILIO', 'EMILIO GARICA APAZA', '2141951010', 'ING.', 'CALLE 1 No 2 ZONA 12 DE OCTUBRE EL ALTO LA PAZ BOLIVIA', '1968-10-15', '71572067', '2820944', 'egarciaapaza@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 12:35:55'),
(267, '4006090', 'TORRES', 'GUZMAN', 'EMA MARCELA', 'EMA MARCELA TORRES GUZMAN', '4006090', 'LIC.', 'LA PAZ-BOLIVIA ZONA CIUDADELA FERROVIARIA C 4 N?1724', '1982-05-07', '73056052', '0', 'emarcelatorresg@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, '4306443', 'HUANCA', 'LEYVA', 'JUVENAL', 'JUVENAL HUANCA LEYVA', '4306443', 'ING.', 'CALLE 6 , NUMERO 7 ZONA CALIRI', '1973-04-04', '22723157', '71260571', 'jugamawees@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, '4250990', 'SELAEZ', 'GARCIA', 'GUELY ZENAIDA', 'GUELY ZENAIDA SELAEZ GARCIA', '4250990015', 'LIC.', 'PLAN 405 CALLE 22 A N? 717  CIUDAD SATELITE', '1972-05-21', '68192547', NULL, 'gselaez21@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 10:59:28'),
(270, '6100466', 'MAMANI', 'SULLCATA', 'VICTOR HUGO', 'VICTOR HUGO MAMANI SULLCATA', '6100466', 'ING.', 'CALLE GRAL GONZALES N? 1184', '1983-04-20', '72083131', '0', 'vicohugo.1@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, '6800198', 'QUEQUESANA', 'QUISPE', 'MARCOS', 'MARCOS QUEQUESANA QUISPE', '6800198', 'LIC.', 'AV. RAMIRO CASTILLO N?100', '1986-07-26', '73240071', '76598081', 'quiquis555@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, '13417470', 'POCOMASI', 'ANDRADE', 'DANIELA ANDREA', 'DANIELA ANDREA POCOMASI ANDRADE', '13417470', 'LIC.', 'CBBA - ZONA DE VALLE HERMOSO - DISTRITO 8  MUNICIPIO CERCADO', '1993-01-02', '4762994', '79955851', 'danielapocomasi@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, '7043641', 'VILLAZANTE', 'JUSTO', 'RUBEN', 'RUBEN VILLAZANTE JUSTO', '7043641', 'LIC.', 'CALLE HUMBERTO VASQUEZ N? 3074 ZONA MARISCAL SUCRE', '1988-08-21', '69812475', '75270079', 'rubenvillazantejusto@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, '3041086', 'LOPEZ', 'SOLIZ', 'HUGO', 'HUGO LOPEZ SOLIZ', '3041086', 'ING.', 'CECILIO GUZMAN DE ROJAS 220 Y 1? DE NOVIEMBRE', '1960-12-18', '68151016', '0', 'hugolopezsoliz@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, '4753921', 'MIRANDA', 'CANAVIRI', 'MARCO ANTONIO', 'MARCO ANTONIO MIRANDA CANAVIRI', '4753921', 'ING.', 'CALLE 10 DE FEBRERO N? 30 VILLA SAN ANTONIO', '1970-01-12', '72598624', '0', 'mirandamarco@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, '2524591', 'INCHAUSTI', 'AVILES', 'JUAN CARLOS', 'JUAN CARLOS INCHAUSTI AVILES', '2524591', 'ING.', 'AV. SANCHE LIMA N? 2512, EIF. MELISA, DPTO 8-A', '1964-03-04', '2418608', '75275868', 'lialjoca@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, '3536668', 'HIDALGO', 'MARTINEZ', 'GUSTAVO', 'GUSTAVO HIDALGO MARTINEZ', '3536668016', 'ING.', 'C. CAÑADA STRONGERT Nro 48, AV. BARRIENTOS Y MENACHO', '1977-09-25', '25244848', '72468326', 'gustavohidalgo@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:37:46'),
(278, '4083527', 'ZAPATA', 'CALVO', 'ROBERTO', 'ROBERTO ZAPATA CALVO', '4083527', 'ING.', 'AV. JULIO VILLA N? 181', '1978-02-07', '71095686', '0', 'beetoo_7911@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, '6728215', 'APAZA', 'COCARICO', 'JOSE GONZALO', 'JOSE GONZALO APAZA COCARICO', '6728215', 'ING.', 'EL ALTO, Z/ VILLA INGAVI C. AGUALLMAYA, N? 1045', '1987-12-01', '73098555', '0', 'joseciv_21@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, '4772923', 'ESPINOZA', 'SALAS', 'ERICK DANIEL', 'ERICK DANIEL ESPINOZA SALAS', '4772923', 'LIC.', 'CALLE 4 DE MAYO N? 1320 VILLA NUEVO POTOSI', '1976-07-20', '73062120', '74078478', 'esalaserick@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, '5966435', 'MAMANI', 'ALANOCA', 'LADISLAO', 'LADISLAO MAMANI ALANOCA', '5966435', 'ING.', 'CALLE JUAN CHANGO LOPEZ N? 12 ZONA SAGRADO CORAZON', '1982-06-27', '71576467', '0', 'ladislaoma22@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, '4972101', 'COTA', 'MAMANI', 'JHONY EDWIN', 'JHONY EDWIN COTA MAMANI', '4972101', 'ING.', 'CALLE OTERO DURELLS, N? 3554 ZONA 16 DE NOVIEMBRE, ENTRE CALLES DEMETRIO CANELAS Y CIRCUNVALACION', '1981-12-28', '77530995', '75200114', 'jhonycota@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, '4020075', 'OLIVERA', 'GUZMAN', 'MARCIAL', 'MARCIAL OLIVERA GUZMAN', '4020075', 'ING.', 'AV. DE LOS SARGENTOS Y CALLE 12 N? 329 (URB. ILLIMANI)', '1979-09-23', '67237501', '0', 'marcelo-424@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, '4943300', 'LEQUIPE', 'CASTILLO', 'JESUS', 'JESUS LEQUIPE CASTILLO', '4943300', 'ING.', 'C. MANKO KAPAK N? 304 ZONA SAN SEBASTIAN', '1976-01-03', '72004276', '2462777', 'jlequipelp@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, '4293151', 'LAZO', 'BUSTAMANTE', 'MIGUEL JAVIER', 'MIGUEL JAVIER LAZO BUSTAMANTE', '4293151', 'ING.', 'AV. ARGENTINA N? 2125 EDIF. ROSSER PISO 1', '1984-07-08', '76714185', '0', 'migueljavierlazo@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, '7024128', 'GUTIERREZ', 'SILVESTRE', 'WILDER', 'WILDER GUTIERREZ SILVESTRE', '7024128', 'ING.', 'AV. ANTOFAGASTA', '1989-03-03', '67198698', '0', 'wildersilvestre@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, '3482252', 'QUISPE', 'CALLE', 'ARMANDO', 'ARMANDO QUISPE CALLE', '3482252', 'ING.', 'EL ALTO, Z/ FERROPETROL C/ N? 1 PUERTA N? 7', '1969-10-12', '72588910', NULL, 'quispearmando217@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-03 11:36:53'),
(288, '4339173', 'ROJAS', 'MANCILLA', 'ROMMEL ELOY', 'ROMMEL ELOY ROJAS MANCILLA', '4339173', 'ING.', 'Z. VILLA VICTORIA, AV. SAN PEDRO DE SORATA N?', '1982-12-01', '72510538', '0', 'rommeltonysiempre10@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, '4118712', 'CABRERA', 'ARANDIA', 'ARIEL', 'ARIEL CABRERA ARANDIA', '4118712015', 'ING.', 'CALLE ITURRICHA 233', '1980-05-11', '73447405', NULL, 'arikocabrera@hotmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:14:35'),
(290, '4338957', 'MAMANI', 'MATIAS', 'EDWIN', 'EDWIN MAMANI MATIAS', '4338957010', 'ING.', 'LA PAZ,COM. CARACHUYO, PROVINCIA AROMA', '1974-11-12', '67161022', NULL, 'edwinmdos@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 11:57:33'),
(291, '2447741', 'HUAYCHO', 'PACAJES', 'HERNAN', 'HERNAN HUAYCHO PACAJES', '2447741014', 'ING.', 'CALLE LOAYZA 349,EDIFICIO LOAYZA, PISO 3 OF. 302', '1970-07-10', '2902153', '72575408', 'ing.hernanhuaycho@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 12:39:09'),
(292, '4386567', 'ROCHA', 'LOPEZ', 'FELIX ROGER', 'FELIX ROGER ROCHA LOPEZ', '4386567', 'IN.', 'VILLA PABON, PASAJE EMILIO AGUIRRE N? 100', '1974-09-11', '67557144', '0', 'felixrochalopez3109@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, '5470110', 'ESPINAL', 'SONCO', 'MARCELINO', 'MARCELINO ESPINAL SONCO', '5470110', 'ING.', 'EL ALTO, AV. AYGUACHI N? 1054, Z. INGAVI.', '1979-04-26', '69922218', NULL, 'esmar54@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-03 12:29:31'),
(294, '5074311', 'JIMENEZ', 'FLORES', 'GONZALO FERNANDO', 'GONZALO FERNANDO JIMENEZ FLORES', '5074311', 'ING.', 'CALLE CHACO N? 20 SOPOCACHI', '1980-12-29', '76508718', '0', 'ralfur@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, '1812707', 'VILTE', 'LOPEZ', 'HILARION RAFAEL', 'HILARION RAFAEL VILTE LOPEZ', '1812707', 'ING.', 'CALLE ADEL AVILA N? 2402 SAN GERONIMO', '1964-01-14', '68691539', '0', 'hrafavilte@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, '6757827', 'PAREDES', 'VACA', 'REYNALDO RODRIGO', 'REYNALDO RODRIGO PAREDES VACA', '6757827', 'ING.', 'LA PAZ, AUQUISAMA?A AV. 1, CALLE C N? 50', '1993-02-24', '69845419', '78849178', 'paredes.vaca.reynado@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, '4305703', 'CARDOZO', 'CUENCA', 'ERICK JORGE', 'ERICK JORGE CARDOZO CUENCA', '4305703', 'ING.', 'CALLE CASIMIRO CORRALES N? 1226 ZONA MIRAFLORES', '1986-05-08', '72066257', '0', 'erick.cardozo1232@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, '4404248', 'VERA', 'MALDONADO', 'JUAN CARLOS', 'JUAN CARLOS VERA MALDONADO', '4404248', 'ING.', 'AV. BLANCO GALINDO KM8 N? 202', '1975-10-11', '72715958', '0', 'jqarlosvera@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, '4891671', 'LOPEZ', 'CORI', 'WILMER RODNY', 'WILMER RODNY LOPEZ CORI', '4891671', 'ING.', 'BAJO SAN ANTONIO, CALLE FEDERICO AVILA N? 1836 ENTRE 6 Y 7', '1986-05-17', '70666631', '0', 'wilmerlopezcori@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, '267887', 'VARGAS', 'CERRUTO', 'FELIX WALTER', 'FELIX WALTER VARGAS CERRUTO', '267887', 'ING.', 'AV. MU?OZ REYES, CALLE 27 N? 199', '1949-07-29', '4549010', '72260009', 'wvargascerruto@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, '1060138', 'CHAMBI', 'CALIZAYA', 'OSVALDO WALTER', 'OSVALDO WALTER CHAMBI CALIZAYA', '1060138', 'ING.', 'AV. LOS SARGENTOS N? 329 Z. BAJO LLOJETA', '1961-09-13', '78820903', '71489041', 'osvaldowalterchambicalizaya@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, '2466033', 'VASQUEZ', 'RAMIREZ', 'FRANCISCO', 'FRANCISCO VASQUEZ RAMIREZ', '2466033017', 'ING.', 'LAPAZ, CALLE 54 Nro178, ZONA CHASQUIPAMPA', '1959-10-04', '76797010', NULL, 'arcoinsrl@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 11:10:55'),
(303, '3478244', 'VEGA', 'LAZARTE', 'ROBERTO FRANZ', 'ROBERTO FRANZ VEGA LAZARTE', '3478244', 'ING.', 'AV. BUENOS AIRES N? 1311 Z. ALTO SAN PEDRO', '1973-09-17', '67053451', '0', 'robvelz2@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, '6003824', 'FERNANDEZ', 'FLORES', 'YOLO', 'YOLO FERNANDEZ FLORES', '6003824', 'LIC.', 'LA PAZ, CALLE CRAMER ENTRE AV. ARMENTIA', '1980-08-01', '63216442', '0', 'fernandezyolo@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, '5998484', 'RODRIGUEZ', 'MARQUEZ', 'JUAN RAID', 'JUAN RAID RODRIGUEZ MARQUEZ', '5998484', 'ING.', 'AV. FINAL BUENOS AIRES C/3 N? 100', '0000-00-00', '70567640', '0', 'juanraid2000@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, '3566143', 'MEJIA', 'MAMANI', 'JABIER', 'JABIER MEJIA MAMANI', '3566143', 'ING.', 'CALLE BRASIL NRO 200', '1971-01-26', '72218466', '4363259', 'jabier_mejia@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, '6935763', 'TINTAYA', 'CUEVAS', 'LORGIO LUIS', 'LORGIO LUIS TINTAYA CUEVAS', '6935763', 'ING.', 'ZONA SOPOCACHI, PASAJE PEATONAL JJ PEREZ N? 15 PISO 3', '1987-03-13', '71523277', '0', 'lorgio_tintaya@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, '2703749', 'TERAN', 'MIRANDA', 'LIZETT AURORA', 'LIZETT AURORA TERAN MIRANDA', '2703749', 'ING.', 'CALLE RODRIGUEZ 721', '1968-07-06', '68907352', '0', 'lizett.teran@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, '6761147', 'ALVAREZ', 'ZAMBRANA', 'LUIS MARIO', 'LUIS MARIO ALVAREZ ZAMBRANA', '6761147', 'ING.', 'C/ VALENTIN ABECIA N? 1751, ZONA ALTO SAN PEDRO', '1987-09-06', '62475540', '73269080', 'luismarioazza@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, '5262803', 'QUINTANILLA', 'ZURITA', 'MARIO FERNANDO', 'MARIO FERNANDO QUINTANILLA ZURITA', '5262803012', 'ING.', 'FRANCISCO VIEDMA Nro 549', '1980-09-12', '76981139', '0', 'fernandoquintanillazurita@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:57:59'),
(311, '4870740', 'PAREDES', 'QUIROGA', 'ERICK WILMER', 'ERICK WILMER PAREDES QUIROGA', '4870740', 'ING,', 'AV. GOBLEZ N? 6834, ZONA IRPAVI', '1981-05-12', '72017163', '0', 'erick.paredes@reinventasrl.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, '7021318', 'TICONA', 'CONDORI', 'JUAN CARLOS', 'JUAN CARLOS TICONA CONDORI', '7021318', 'ING.', 'ZONA, V. EXALTACION, PLAZA TORREZ, CALLE LA OPINION N? 2614 EL ALTO', '1989-01-01', '77565906', '0', 'univer_juanca@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, '3435637', 'CASTILLO', 'MU?OZ', 'NEYZA JACQUELINE', 'NEYZA JACQUELINE CASTILLO MU?OZ', '3435637', 'ING.', 'ZONA TEMBLADERANI, OBISPO BOSQUE, FINAL HUALLPARRIMACHI N? 337', '1969-10-25', '71967730', '0', 'neyzacastillo@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, '4259028', 'CHOQUE', 'MAMANI', 'JAVIER', 'JAVIER CHOQUE MAMANI', '4259028', 'ING.', 'C/ CARRASCO N? 55', '1974-01-05', '69879587', '0', 'xaviercm77@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, '4917981', 'SANCHEZ', 'SALAS', 'GABRIELA', 'GABRIELA SANCHEZ SALAS', '4917981', 'ING.', 'LA PAZ, URB. LA RINCONADA N? 9 ZONA LA FLORIDA', '1981-12-05', '77214673', '77747740', 'gabissalas7@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, '7171385', 'CARDOZO', 'ORTIZ', 'CESAR LUIS', 'CESAR LUIS CARDOZO ORTIZ', '7171385', 'ING.', 'TARIJA, PAMPA REDONDA', '1987-03-04', '68691574', '0', 'cesar_4531@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, '4433907', 'SAAVEDRA', 'IRIARTE', 'MARCO ANTONIO', 'MARCO ANTONIO SAAVEDRA IRIARTE', '4433907', 'ING.', 'CBBA, C/ JUAN DE LA CRUZ TORREZ N? 1459 ZONA MUYURINA', '1976-05-29', '72201117', '4664200', 'msavdra@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, '8561773', 'MAMANI', 'QUIRUCHI', 'WINDER', 'WINDER MAMANI QUIRUCHI', '8561773', 'ING.', 'LLALLAGUA, AV. BUENOS AIRES N? 55', '1989-08-16', '73305051', '72354143', 'windermamaniquiruchi@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, '3525277', 'LOPEZ', 'LOPEZ', 'EDWIN TOMAS', 'EDWIN TOMAS LOPEZ LOPEZ', '3525277', 'ING.', 'CBBA, AV. VILLAVICENCIO N? 226 ZONA SARCABAMBA', '1971-03-07', '71476439', '76449861', 'edwinlopez2007@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, '3551250', 'TERAN', 'BALLESTEROS', 'ANGEL IVAN', 'ANGEL IVAN TERAN BALLESTEROS', '3551250010', 'ING.', 'ZANJA DE CORONACION ESQ. SAN FELIPE N? 500', '1977-08-01', '74132738', '68284938', 'aitb77@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 11:19:52'),
(321, '68045530', 'CALLE', 'CHOQUE', 'HERNAN HUGO', 'HERNAN HUGO CALLE CHOQUE', '68045530', 'ING.', 'ZONA EL ALTO CHIJINI AV. 9 DE ABRIL C/2 N? 144B', '1989-04-19', '76540648', '0', 'hhcc777@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, '3733732', 'MONTES', 'FLORES', 'RICHARD RENAN', 'RICHARD RENAN MONTES FLORES', '3733732', 'ING.', 'AV. BLANCO GALINDO KM 10.5 (BARRIO QUECHISTA)', '1970-04-30', '67503361', '0', 'richi-30@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, '3547916', 'JAQUE', 'MAMANI', 'OMAR MODESTO', 'OMAR MODESTO JAQUE MAMANI', '3547916', 'ING.', 'ORURO, CALLE TARAPACA A PROLONGACION LIRA N? 16', '1977-02-12', '73841200', '0', 'omarjaque@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, '35392018', 'ARI', 'CONDARCO', 'LUIS FERNANDO', 'LUIS FERNANDO ARI CONDARCO', '35392018', 'ING.', 'AV. ALONZO DE IBA?EZ ENTRE SEVERP DUMAN Y BENI N? 43', '1976-11-28', '63639006', '0', 'ferniari123@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, '4282324', 'AGUILAR', 'CAMPOS', 'NESTOR JESUS', 'NESTOR JESUS AGUILAR CAMPOS', '4282324', 'ING.', 'CALLE IGNACIO SANJINES N? 725-A ZONA BELLA VISTA', '1974-06-02', '2750206', '70134546', 'nestoraguilar501@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, '3380780', 'ESPEJO', 'SEMPERTEGUI', 'BISMARKPERCY', 'BISMARKPERCY ESPEJO SEMPERTEGUI', '3380780', 'ING.', 'LA PAZ, C/ LEON DE LA BARRA N? 956 ZONA GRAN PODER', '1975-11-09', '62583253', '0', 'bisper9@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, '2690876', 'QUINO', 'COLOMA', 'ZENON FELIX', 'ZENON FELIX QUINO COLOMA', '2690876010', 'ING.', 'C/ RUPERTO JURADO Nro 1712 Z/ EL TEJAR', '1963-06-22', '69978814', '70653522', 'zenonquino1@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:33:42'),
(328, '1385133', 'RUIZ', 'VARGAS', 'MIGUEL ANGEL', 'MIGUEL ANGEL RUIZ VARGAS', '1385133', 'ING.', 'CALLE CARDENAL TERRAZAS S/N', '1966-05-09', '63943082', '0', 'miruva25@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, '3479946', 'CENTELLAS', 'CAMA', 'WALDO OMAR', 'WALDO OMAR CENTELLAS CAMA', '3479946', 'ING.', 'CALLE LUIS GEMIO N? 5 Z. MIRAFLORES', '1971-04-18', '70637524', '0', 'wkjpsj@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, '4124416', 'COLQUE', 'AYALA', 'JUAN PABLO', 'JUAN PABLO COLQUE AYALA', '4124416', 'ING.', 'CALLE SAN SALVADOR N? 1333 Z. MIRAFLORES', '1978-03-25', '73494223', '0', 'juanpablo_ca@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, '1864460', 'PAREDES', 'GARNICA', 'ELOY', 'ELOY PAREDES GARNICA', '1864460', '', 'CARRETERA SAN JACINTO S/N ZONA TABLADA GRANDE', '1969-12-02', '46662784', '71875087', 'e_garnica@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, '4022044', 'RAMOS', 'FLORES', 'ORLANDO', 'ORLANDO RAMOS FLORES', '4022044', 'ING.', 'CALLE MONTESIONOS ENTRE SORIA GALVARRO', '1979-01-05', '78270081', '0', 'c_r_bro@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, '4526789', 'ZURITA', 'MARTINEZ', 'CINTHIA SOLANGE', 'CINTHIA SOLANGE ZURITA MARTINEZ', '4526789', 'ING.', 'CBBA, C/ ARAWAQUI, 178', '1979-03-01', '62636670', '0', 'cszm@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, '3498022', 'GOMEZ', 'RAMALLO', 'VICTOR HUGO', 'VICTOR HUGO GOMEZ RAMALLO', '3498022', 'ING.', 'CALLE PUERTO RCO N? 1030 MIRAFLORES', '1975-05-14', '70624401', '2244320', 'victorhugogomez@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, '4175698', 'CALLAU', 'ZURITA', 'JORGE DAVID', 'JORGE DAVID CALLAU ZURITA', '4175698', 'ING.', 'AV. 21 DE JUNIO N? 777 EDIFICIO EL PARQUE LOMAS DE ACHUMANI', '1980-04-18', '71148004', '0', 'jorgedcz@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, '3807873', 'MALDONADO', 'VERA', 'JAVIER GUSTAVO', 'JAVIER GUSTAVO MALDONADO VERA', '3807873', 'ING.', 'CBBA, MARIA E. BALLIVIAN ZONA LA VERTIENTE', '1975-01-02', '67012151', '0', 'jmaldonadovera@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, '4839333', 'LAURA', 'MEGUILLANES', 'MARCELO', 'MARCELO LAURA MEGUILLANES', '4839333', 'ING.', 'EL ALTO, C. CAPACK. YUPANQUI N? 2905 URB. HUGO CHAVEZ FRIAS', '1978-12-07', '70545052', '0', 'ingciv.mlm@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, '5632678', 'CORIA', 'MARTINEZ', 'FAHRID EDWARD', 'FAHRID EDWARD CORIA MARTINEZ', '5632678', 'ING.', 'CALLE PE?A N? 7 VILLA VICTORIA', '1983-01-03', '68665388', '22386138', 'edwardsin_cm@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(339, '4981103', 'TANCARA', 'TITO', 'JHONNY ALEXANDER', 'JHONNY ALEXANDER TANCARA TITO', '4981103018', 'ING.', 'CALLE I Nro 25 ZONA SANTA ROSA', '1981-07-09', '71233155', NULL, 'jhonny.tancara@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 12:33:23'),
(340, '4261209', 'GUZMAN', 'RIVERO', 'RENE AUGUSTO', 'RENE AUGUSTO GUZMAN RIVERO', '4261209', 'ING.', 'C. 17 DE JULIO N? 27', '1976-08-27', '71933874', '0', 'reneaugustog@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(341, '5940392', 'ALIAGA', 'YAPU', 'JAVIER GUILERMO', 'JAVIER GUILERMO ALIAGA YAPU', '5940392', 'ING.', 'AV. VICTOR AGUSTIN UGARTE N? 52 ZONA ALTO SOPOCACHI', '1986-05-28', '76511655', '2412822', 'javier.aliaga.y@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(342, '4376692', 'MALAGA', 'TORRICO', 'PABLO EDUARDO', 'PABLO EDUARDO MALAGA TORRICO', '4376692', 'ING.', 'URBANIZACION AUTOPISTA MANZANO P N? 169', '1980-04-01', '78955130', '75222031', 'edumalagat@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(343, '3389371', 'RIVEROS', 'MAGUE?O', 'RAUL', 'RAUL RIVEROS MAGUE?O', '3389371', 'ING.', 'C/ CANADA N? 1055', '0000-00-00', '71591327', '69843604', 'raulrivelino@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(344, '5781016', 'FERNANDEZ', 'APARICIO', 'ISIDRO', 'ISIDRO FERNANDEZ APARICIO', '5781016', 'ING.', 'C/ ADEL CORTEZ PJE N? 3 B/SAN GERONIMO', '1990-04-24', '70227368', '0', 'isi1441.if@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(345, '3548712', 'RIVAS', 'ERAZU', 'MARTIN UZHEIL', 'MARTIN UZHEIL RIVAS ERAZU', '3548712', 'ING.', 'CBBA, AV. G. MARTINEZ S/N', '1978-04-09', '72274894', '4317928', 'martin-rivas6@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(346, '603247', 'PEREZ', 'GONZALES', 'RODOLFO', 'RODOLFO PEREZ GONZALES', '603247', 'ING.', 'C. TOMAS FRIAS N? 747, 6 DE OCTUBRE', '0000-00-00', '71183426', '5274496', 'perezgonzalesrodolfo83@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(347, '812067', 'IRIARTE', 'CARDONA', 'HECTOR VLADIMIR', 'HECTOR VLADIMIR IRIARTE CARDONA', '812067', 'ING.', 'PASAJE LOS ALAMOS N? 70, CALACOTO SAN MIGUEL', '1951-07-20', '2790959', '71565960', 'equimaq.hic@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(348, '1297600', 'NIEVES', 'SANDI', 'WILLIAMS', 'WILLIAMS NIEVES SANDI', '1297600', 'ING.', 'PASAJE II N? 147 ENTRE VICU?A Y KENNEDY, ZONA SUD.', '1956-11-11', '71180852', '74474474', 'nivicomcod@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(349, '603245', 'CHAVEZ', 'ORTU?O', 'JORGE FRANCISCO', 'JORGE FRANCISCO CHAVEZ ORTU?O', '603245', 'ING.', 'CALLE VILUYO 318 Y LINARES ZONA SAN PEDRO', '0000-00-00', '76541849', '0', 'gruposima1@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(350, '1876887', 'BENITEZ', 'ORTIZ', 'RUDY ELIO', 'RUDY ELIO BENITEZ ORTIZ', '1876887', 'ING.', 'TARIJA, CALLE COLON N? O-136 ENTRE AV. VICTOR PAZ ESTENSSORO Y CALLE AVAROA, BARRIO LAS PANOSAS', '1969-07-09', '71873853', '72988593', 'e_benitez_5@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(351, '3385010', 'ALCON', 'CHOQUE', 'BENITO', 'BENITO ALCON CHOQUE', '3385010', 'ING.', 'PAMPAHASI CALLE S N? 1100', '1972-03-21', '68070406', '0', 'benitoalconchoque@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(352, '4745165', 'TAMBO', 'MAMANI', 'ANGEL', 'ANGEL TAMBO MAMANI', '4745165', 'ING.', 'EL ALTO, VILLA DOLORES F AV. SAN ANTONIO GALLARDO N? 27', '1977-03-01', '76203455', '0', 'angeltambomamani@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(353, '6752853', 'HUAYNOCA', 'ROMERO', 'JUAN JOSE', 'JUAN JOSE HUAYNOCA ROMERO', '6752853', 'ING.', 'C/JUAN GUTIERREZ PANIAGUA N? 797 ZONA CHAMOCO CHICO', '1988-03-05', '22470732', '70187621', 'ingcivhrjj@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(354, '4038704', 'ESCALIER', 'LAZARTE', 'CRISTHIAN MARTIN', 'CRISTHIAN MARTIN ESCALIER LAZARTE', '4038704015', 'LIC.', 'ORURO,CALLE PAGADOR ENTRE LEON Y RODRIGUEZ ED. 6 DE JUNIO DPTO 104', '1979-07-24', '60401361', '73317273', 'ericartman283@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:59:44'),
(355, '3513304', 'QUISPE', 'FLORES', 'MARIA LUISA', 'MARIA LUISA QUISPE FLORES', '3513304', 'ING.', 'JUNIN N? 775 PRESIDENTE MONTES Y LA PLATA', '1973-08-26', '71858948', '0', 'mlqf26@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(356, '8991723', 'FLORES', 'U?O', 'ANA MARIA', 'ANA MARIA FLORES U?O', '8991723', 'LIC.', 'CLAUDIO SANJINES N? 1605', '1975-09-26', '67052939', '63196865', 'floresana2609@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(357, '6147871', 'FUENTES', 'FABIANI', 'IVAN FRANCISCO', 'IVAN FRANCISCO FUENTES FABIANI', '6147871', 'ING.', 'CALLE 2 N? 821 ZONA VILLALOBOS MUNICIPAL', '1985-09-12', '78788917', NULL, 'iffivan30@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-15 12:38:38'),
(358, '2047382', 'BRA?EZ', 'CORTEZ', 'CARLOS EDUARDO', 'CARLOS EDUARDO BRA?EZ CORTEZ', '2047382', '', 'C. JORGE SEANZ N?1201', '1962-05-08', '2242075', '68974228', 'carloseduardo.bra?ez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(359, '1435761', 'PATRICIO', 'HINOJOSA', 'FELIPE', 'FELIPE PATRICIO HINOJOSA', '1435761', 'LIC.', 'CALLE PIRAI N? 1652', '1966-05-26', '68408708', '0', 'felipepatricio222@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `personas` (`id`, `ci`, `paterno`, `materno`, `nombres`, `datosp`, `nit`, `grado`, `direccion`, `fechaNacimiento`, `fono1`, `fono2`, `email`, `genero`, `observacion`, `departamento`, `status`, `created_at`, `updated_at`) VALUES
(360, '4377776', 'CALLISAYA', 'ZAPANA', 'FRANCISCA', 'FRANCISCA CALLISAYA ZAPANA', '4377776', 'LIC.', 'CIUDAD DEL ALTO, ZONA BALLIVIAN CALLE FOURNIER N? 250', '1976-07-23', '72097517', '71896302', 'callisayazapanaf@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(361, '2611900', 'CHAMBI', 'MAMANI', 'DOMINGA', 'DOMINGA CHAMBI MAMANI', '2611900', 'ING.', 'VILLA FATIMA BARRIO PETROBRAS CALLE MARIANO CALVO N? 109', '1964-01-26', '71905518', '0', 'domichambi@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(362, '4041352', 'VERGARA', 'HERRERA', 'OSCAR FREDDY', 'OSCAR FREDDY VERGARA HERRERA', '4041352', 'LIC.', 'CALLE ADOLFO MIER Y BAPTISTA N? 217', '1982-11-21', '6828448', '0', 'vergarah.@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(363, '4769197', 'TORREZ', 'RENGEL', 'MONICA GUADALUPE', 'MONICA GUADALUPE TORREZ RENGEL', '4769197', 'LIC.', 'ZONA ACHACHICALA CALLE EUSEBIO GUTIERREZ N? 661', '1977-01-13', '76521314', '68214394', 'monilut@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(364, '3538360', 'QUISPE', 'LIMA', 'JOSE ANTONIO', 'JOSE ANTONIO QUISPE LIMA', '3538360', 'ING.', 'CALLE 10 DE FEBRERO S/N BARRIO KAMI COLCAPIRHUA', '1974-02-03', '67400516', '0', 'joescuario.se@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(365, '4749697', 'SALGADO', 'RADA', 'G. RAQUEL', 'G. RAQUEL SALGADO RADA', '4749697', 'ING.', 'LINARES Y TARIJA N? 26', '1977-08-22', '77532618', '2310149', 'jharitasalgado@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(366, '9219753', 'QUISPE', 'AJNOTA', 'RICARDO CESARIO', 'RICARDO CESARIO QUISPE AJNOTA', '9219753', 'ING.', 'EL ALTO, AV. 7 DE OCTUBRE N? 2834 ZONA VILLA YUNGUYO', '1989-01-28', '73743725', '0', 'ricardoqa92@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(367, '2644643', 'ZARATE', 'ALACAMA', 'VICTOR', 'VICTOR ZARATE ALACAMA', '2644643', 'ING.', 'LA PAZ, EL ALTO ZONA SAN LUIS CALLE L  N? 9', '1967-12-18', '73027553', '2836629', 'zaratevi@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(368, '1388288', 'HUARACHI', 'CHOQUE', 'WILSON', 'WILSON HUARACHI CHOQUE', '1388288', 'ING.', 'CBBA, CALLE CHARI?A ESQ. PACHAMAMITA S/N ZONA NORTE', '2021-05-19', '-384212301', '67546687', 'wipehuch.67@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(369, '4268373', 'CHURATA', 'MACHACA', 'OSCAR', 'OSCAR CHURATA MACHACA', '4268373', 'ING.', 'EL ALTO, AV. PUERTO ACOSTA N? 1230 Z. PUERTO CAMACHO', '1973-04-28', '71926218', '67112481', 'ochurata@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(370, '3505258', 'MAGNE', 'VILLCA', 'MARIA MAGDALENA', 'MARIA MAGDALENA MAGNE VILLCA', '3505258', 'ING.', 'CALLE OJEDA S/N BARRIO ITOS', '1972-07-22', '67238197', '0', 'makecic@yahoo.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(371, '6801831', 'CHARCA', 'PABON', 'GONZALO', 'GONZALO CHARCA PABON', '6801831', 'ING.', 'EL ALTO, ZONA VLLA ADELA, PLAN 145 MANZANO 202, N? 1', '1988-12-15', '72057747', '0', 'gonzalocharcapabon@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(372, '6031966', 'CASAS', 'APAZA', 'VIVIANA', 'VIVIANA CASAS APAZA', '6031966', 'ING.', 'EL ALTO, CALLE HERMANI N? 50, ZONA LOS ANDES', '1984-03-27', '73089659', '0', 'waynawara2016@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(373, '5245754', 'VARGAS', 'NAVARRO', 'ARIEL', 'ARIEL VARGAS NAVARRO', '5245754', 'ING.', 'AV. ZARZUELA N? 125 ZONA VINO TINTO', '1987-01-10', '72597890', '0', 'arielvargasnavarro@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(374, '2721968', 'MU?OZ', 'VASQUEZ', 'JORGE', 'JORGE MU?OZ VASQUEZ', '2721968', 'ING.', 'CALLE 7 HONDANADA N? 50 ZONA KUPINI II', '0000-00-00', '2721968', '73262878', 'jormuvas@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(375, '3672910', 'MAIZARES', 'CALAPI?A', 'OSWALDO', 'OSWALDO MAIZARES CALAPI?A', '3672910', 'ING.', 'URBANIZACION VELA CALLE 1 S/N ZONA TORRECILLAS', '1966-08-05', '67382782', '72951593', 'osvi_osvi@outlook.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(376, '3061940', 'RUEDA', 'LOPEZ', 'SIMON', 'SIMON RUEDA LOPEZ', '3061940', 'ING.', 'CALLE ARCE N? 746 Y PRESIDENTE MONTES', '1969-09-16', '25257493', '68353654', 'coriviri@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(377, '4035824', 'BARRIOS', 'QUIROGA', 'PAUL', 'PAUL BARRIOS QUIROGA', '4035824', 'ING.', 'CALLE DE LA OLIVA Y MENDEZ ARCOS EDIFICIO HERMANOS GONZALES', '1980-02-06', '73530005', '0', 'paulbarrios@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(378, '2763773', 'BERRIOS', 'ESPINOZA', 'ROMUALDO', 'ROMUALDO BERRIOS ESPINOZA', '2763773', 'ING.', 'SUCRE,CALLE CUBA N? 34B', '0000-00-00', '73440701', '0', 'rberrios57@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(379, '1880766', 'CASTILLO', 'SORUCO', 'FABIAN ARTURO', 'FABIAN ARTURO CASTILLO SORUCO', '1880766', 'ING.', 'CBBA, CALLE EUFRONIO VISCARRA N? 1295', '1975-10-12', '71860858', '0', 'arturocastillo20@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(380, '4248608', 'GUTIERREZ', 'ALIAGA', 'ROBERTO JORGE', 'ROBERTO JORGE GUTIERREZ ALIAGA', '4248608', 'ING.', 'LA PAZ, AV. HUGO ERNEST N? 6786', '1975-06-08', '70662645', '0', 'robertinge@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(381, '5055219', 'AUZA', 'QUENTASI', 'JORGE FERNANDO', 'JORGE FERNANDO AUZA QUENTASI', '5055219', 'ING.', 'BARRIO 4 DE JULIO CALLE VENEZUELA N? 1726', '0000-00-00', '72980812', '0', 'fernandoauza1@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(382, '2879076', 'SALAZAR', 'ARANIBAR', 'SERGIO ROBERTO', 'SERGIO ROBERTO SALAZAR ARANIBAR', '2879076', 'ING.', 'PEDRO SALAZAR 615 DEPARTAMENTO 3A EDIFICIO MARIA INMACULADA, ZONA SOPOCACHI', '0000-00-00', '71224438', '0', 'sergio.apcnatura@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(383, '4837760', 'CASTRO', 'MAMANI', 'LUCIO OTELIO', 'LUCIO OTELIO CASTRO MAMANI', '4837760', 'ING.', 'AV. SAN JOSE N? 2255, ZONA MUNAYPATA', '1977-12-13', '70683085', NULL, 'ingluciocastro131277@hotmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-03 12:16:21'),
(384, '3100273', 'CASTRILLO', 'GONZALES', 'MARCO ANTONIO', 'MARCO ANTONIO CASTRILLO GONZALES', '3100273', 'ING.', 'EL ALTO, C. FERNAN CABALLERO N? 1234 PLAN 561', '1969-02-15', '76525996', '70519567', 'marcocing69@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(385, '3559552', 'BELZU', 'RAMOS', 'RICARDO ANIBAL', 'RICARDO ANIBAL BELZU RAMOS', '3559552', 'ING.', 'POTOSI, N? 115 ENTRE RODRIGUEZ Y LEON', '1977-08-07', '74103417', '0', 'ricardobelzuramos@outlook.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(386, '3514462', 'CHOQUE', 'ROJAS', 'IRMA', 'IRMA CHOQUE ROJAS', '3514462', 'ING.', 'AV. 17 DE AGOSTO ESQ. RAMON MANGUDO', '1974-05-12', '67242177', NULL, 'irmachoque@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 12:01:46'),
(387, '3326760', 'QUIROGA', 'AGUILAR', 'JAVIER GONZALO', 'JAVIER GONZALO QUIROGA AGUILAR', '3326760', 'ING.', 'EL ALTO, CALLE  9, ESQ. VEZGA N? 290 ZONA VILLA DOLORES', '1970-08-30', '67083229', '0', 'javioquiro@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(388, '3433337', 'LARA', 'CUBA', 'ELIANA ELINOL', 'ELIANA ELINOL LARA CUBA', '3433337', 'ING.', 'LA PAZ, CALLE ILLAMPU 856', '1970-08-13', '63009547', '0', 'elianaelino@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(389, '3331845', 'GOMEZ', 'QUISPE', 'HUGO RAMIRO', 'HUGO RAMIRO GOMEZ QUISPE', '3331845', 'ING.', 'CALLE POLICARPIO EYZAGUIRRE 1344', '1967-03-23', '-366971230', '0', 'gomez_hugo_23@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(390, '3501919', 'HUALLATA', 'LIMACHI', 'SIMEON', 'SIMEON HUALLATA LIMACHI', '3501919', 'ING.', 'ORURO, C/ WASHINGTHON N? 112 ESQ. JULIO ZAMORA ZONA SUD.', '1972-06-01', '73806000', '0', 'simeonhl@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(391, '3537215', 'CAMACHO', 'TORREZ', 'ROAMIR GUSTAVO', 'ROAMIR GUSTAVO CAMACHO TORREZ', '3537215', 'ING.', 'CALLE GENARO SANJINEZ N? 975A ZONA NORTE', '1978-08-08', '72055064', '0', 'roamir.camacho@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(392, '3520950', 'FERRUFINO', 'BARRIOS', 'JUAN CARLOS', 'JUAN CARLOS FERRUFINO BARRIOS', '3520950', 'ING.', 'LEON N? 210 Y VELASCO GALVARRO', '1974-06-02', '73831246', '79420087', 'juancafeba@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(393, '6899504', 'QUINO', 'OROSCO', 'HOWARD RUDDY', 'HOWARD RUDDY QUINO OROSCO', '6899504', 'ING.', 'ZONA BAJO TEJAR CA??E RIO PIRAI N? 892', '1989-09-25', '7967932', '72544520', 'ruddy_quino@hotmail.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(394, '245251', 'CARPIO', 'TITO', 'RUPERTO ANIBAL', 'RUPERTO ANIBAL CARPIO TITO', '245251', 'ING.', 'LA PAZ,CALLE PACAJES N? 14, VILLA VICTORIA', '1944-03-14', '73070265', '0', 'rupercarpio@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(395, '6163991', 'TENORIO', 'CASTILLO', 'AUGUSTO FABIAN', 'AUGUSTO FABIAN TENORIO CASTILLO', '6163991', 'ING.', 'EL ALTO, C. L. DE LA VEGA N? 3452 Z. BALLIVIAN', '1984-01-20', '77763438', '0', 'afternorio5five5@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(396, '3104387', 'SANGUEZA', 'DUE?AS', 'GERMAN', 'GERMAN SANGUEZA DUE?AS', '3104387', 'ING.', 'CALLE 30A ENTRE DIEGO DE PORTUGAL', '1969-07-07', '72302089', '0', 'germansangueza@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(397, '1056240', 'GALVAN', 'FLORES', 'WALTER DERY', 'WALTER DERY GALVAN FLORES', '1056240', 'ING.', 'VENEZUELA N? 7 ZONA PLAN 40 POTOSI', '1958-09-09', '72427949', '77135136', 'galvanfwd@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(398, '4068091', 'GONZALES', 'BURGOA', 'RODOLFO', 'RODOLFO GONZALES BURGOA', '4068091', 'ING.', 'AV. LANDAETA S/N Z. SAN PEDRO', '1982-10-03', '78996400', '0', 'rodolfo.xad@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(399, '5090853', 'ANDIA', 'FLORES', 'MARCELO JESUS', 'MARCELO JESUS ANDIA FLORES', '5090853', 'ING.', 'SERRUDO 331', '1983-05-03', '67919355', '0', 'marcandiaf@outlook.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(400, '4053365', 'COPA', 'VELASCO', 'VILMA BLANCA', 'VILMA BLANCA COPA VELASCO', '4053365', 'ING.', 'AV. AVAROA N? 104 COSTA RICA Y ECUADOR', '1980-10-01', '74101405', '0', 'vilbla_cove@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(401, '5042813', 'CASTRO', 'HERRERA', 'JUAN CARLOS', 'JUAN CARLOS CASTRO HERRERA', '5042813', 'ING.', 'CALLE VALLE GRANDE N? 2347', '1979-12-02', '72994427', '73854677', 'ing_carlos_castro@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(402, '5724593', 'PACHECO', 'CEREZO', 'DANIEL ALBERTO', 'DANIEL ALBERTO PACHECO CEREZO', '5724593', '', 'CALLE 10 Y 14 DE SEPTIEMBRE (OBRAJES) N? 517 EDIFICIO UGARTE', '1985-01-30', '69945110', '0', 'daniel.pacheco.cerezo.dapc@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(403, '4051615', 'VALLEJOS', 'MIRANDA', 'RUTH', 'RUTH VALLEJOS MIRANDA', '4051615', 'LIC.', 'C/MODESTO OMISTE N? 19 ENTRE TACNA Y ENRIQUE SALAZAR', '1981-07-01', '71843893', '62769429', 'ruthvale647@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(404, '4962074', 'MAMANI', 'CHOQUE', 'JUAN PABLO', 'JUAN PABLO MAMANI CHOQUE', '4962074', 'ING.', 'C. NERY N? 3114 ZONA 16 DE JULIO', '1979-06-26', '70570540', '76765105', 'ingindjpablo@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(405, '9113808', 'HUANCA', 'CATUNTA', 'FREDDY', 'FREDDY HUANCA CATUNTA', '9113808', 'ING.', 'CALLE LITORAL N? 3135 SAN ROQUE EL ALTO', '1992-04-20', '68076304', '0', 'soyfreddycito04@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(406, '5954207', 'CHOQUE', 'BALBOA', 'RUBEN DARIO', 'RUBEN DARIO CHOQUE BALBOA', '5954207', 'ING.', 'CALLE YANACACHI N? 1109 VILLA FATIMA', '2081-06-04', '73067975', '79688866', 'ruben88866@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(407, '2540814', 'GUTIERREZ', 'YAPU', 'ROGELIO', 'ROGELIO GUTIERREZ YAPU', '2540814', 'ING.', 'CALLE CARLOS MEDINACELLI N? 3445 URB. 16 DE NOVIEMBRE EL ALTO', '1964-08-07', '73220865', '0', 'rgutyy@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(408, '3115699', 'CHALLGUA', 'NINA', 'RICHARD MAXIMO', 'RICHARD MAXIMO CHALLGUA NINA', '3115699013', 'ING.', 'AV. ESPA?A ENTRE AV. CIRCUMVALACION', '1970-11-27', '71109900', '72353533', 'richardchallgua@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 11:46:04'),
(409, '2756809', 'NUÑEZ', 'YUPANQUI', 'SEGUNDINO DANIEL', 'SEGUNDINO DANIEL NU?EZ YUPANQUI', '2756809', 'ING.', 'JAEN N? 930 ACHA Y 1DE MAYO (ZONA SUD)', '1968-07-10', '72454717', '0', 'danyez45@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 11:47:55'),
(410, '3436574', 'ROJAS', 'CAZAS', 'NELLY JULIA', 'NELLY JULIA ROJAS CAZAS', '3436574', 'ING.', 'VIACHA, PLAZA EVARISTO CALLE 104', '1970-04-12', '73012775', '0', 'nelly.ipade@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(411, '6147469', 'CHIPANA', 'VASQUEZ', 'ROGER REYNALDO', 'ROGER REYNALDO CHIPANA VASQUEZ', '6147469', 'ING.', 'CALLE 4 N? 52 ZONA PURA PURA BARRIO FERROVIARIO', '1984-07-16', '71532717', '0', 'chipana.roger@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(412, '2017168', 'LUCANO', 'GOMEZ', 'BONIFACIA', 'BONIFACIA LUCANO GOMEZ', '2017168', 'LIC.', 'LA PAZ, CALLE LANDAETA N? 450 SOPOCACHI', '1953-06-05', '70635191', '72579829', 'bonilucano@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(413, '6798314', 'ALI', 'QUISPE', 'MARIA SILVIA', 'MARIA SILVIA ALI QUISPE', '6798314015', 'LIC.', 'ZONA BALLIVIAN CALLE FOURNIER N? 282', '1986-06-12', '72561636', NULL, 'silvitaaliq@gmail.com', 'MUJER', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-04-12 13:48:40'),
(414, '4712379', 'VIRUEZ', 'SOTO', 'JULIO CESAR', 'JULIO CESAR VIRUEZ SOTO', '4712379', 'ING.', 'CALLE SAN MARCOS N? 30', '1979-06-06', '67970271', '0', 'viruez80@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(415, '4813449', 'MONTERO', 'ROQUE', 'ADHEMAR', 'ADHEMAR MONTERO ROQUE', '4813449', 'ARQ.', 'FRANCISCO VIEDMA N? 1120 ZONA NORTE CBBA', '1982-04-05', '4445636', '72253062', 'arq_adhe1000@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(416, '5696893', 'LOPEZ', 'CHAVEZ', 'STHEPHANY NOELIA', 'STHEPHANY NOELIA LOPEZ CHAVEZ', '5696893', 'LIC.', 'AV. PERIFERICA S/N', '1988-04-05', '63572034', '73413142', 'sheccid.fu88@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(417, '3101847', 'FERNANDEZ', 'ZABALETA', 'ROSMERI', 'ROSMERI FERNANDEZ ZABALETA', '3101847', 'ING.', 'AV. E. AVAROA N? 44 (VALLE HERMOSO) CBBA.', '1969-05-02', '74824825', '0', 'rossf8@hotmail.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(418, '4090847', 'SEJAS', 'TICONA', 'GABRIELA LUDMILA', 'GABRIELA LUDMILA SEJAS TICONA', '4090847', 'ING.', 'LA PAZ, BARRIO SANTA BARBARA CALLEJON 3 DE MAYO N? 1861', '1979-08-28', '67643832', '74408303', 'gabbybbag@hotmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(419, '4756023', 'LUNA', 'FABIO', 'ROLANDO', 'ROLANDO LUNA FABIO', '4756023', 'ING.', 'ZN. SAN LUIS, CALLE J NRO 110 (EL ALTO)', '1974-01-10', '67184084', NULL, 'rolandolunafabio@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-15 10:57:24'),
(420, '2696178', 'PACHECO', 'CHOQUE', 'DORA', 'DORA PACHECO CHOQUE', '2696178016', 'ING.', 'CALLE 10, CALLE D No 165 ZONA OBRAJES', '1964-12-27', '71579997', NULL, 'dpach1227@gmail.com', 'MUJER', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-17 11:00:31'),
(421, '4454844', 'SANCHEZ', '', 'RAUL', 'RAUL SANCHEZ', '4454844', 'ING.', 'AV. BARTOLOME GUZMAN S/N Y HUASCAR', '1978-09-25', '44590831', '72267920', 'ing.civ.sanchezr@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(422, '3964685', 'AGUILAR', 'PELAEZ', 'HENRY', 'HENRY AGUILAR PELAEZ', '3964685', 'ING.', 'CALLE BUSTILLOS N? 737', '1975-07-22', '6227957', '67902730', 'henaguipe@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(423, '6472966', 'HERBAS', 'MERIDA', 'WILDER', 'WILDER HERBAS MERIDA', '6472966', 'ING.', 'PASAJE POR VENIR S/N', '1987-04-11', '67402375', '0', 'wherbas11@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(424, '4812509', 'VILLAZARTE', 'ILLANES', 'LUIS FERNANDO', 'LUIS FERNANDO VILLAZARTE ILLANES', '4812509', 'ING.', 'AV. BOLIVAR N? 1564 ZONA RIO SECO', '1978-10-22', '77542895', '0', 'lufervillaz@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(425, '3071350', 'MAYORGA', 'PEREZ', 'JOSE MILTON', 'JOSE MILTON MAYORGA PEREZ', '3071350', 'ING.', 'TELLEZ ROS S/N Y CALLE 5 BARRIO BOLIVAR A', '1969-03-19', '72461312', '0', 'jmmayorgaislas@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(426, '4193695', 'UYENO', 'MENDIETA', 'ANGEL JULIAN', 'ANGEL JULIAN UYENO MENDIETA', '4193695015', 'ING.', 'C/CBBA 938 WASHINGTON Y CAMACHO', '1980-11-20', '5257634', '72494257', 'uyenoangel@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:35:52'),
(427, '2929414', 'BLANCO', 'RIOS', 'MARCOS', 'MARCOS BLANCO RIOS', '2929414', 'ING.', 'SANTA CRUZ B/ SAN JOSE OBRERO, C/CHIMANES N? 2000', '1957-03-28', '71606528', '0', 'marcosblancorios@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(428, '6879637', 'MAMANI', 'LAGUNA', 'ADALID', 'ADALID MAMANI LAGUNA', '6879637', 'ING.', 'CALLE B N? 1910 URB. AMBORO Z/VILLA COOPERATIVA EL ALTO', '1991-07-25', '77750306', '0', 'adalid.civ@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(429, '4313352', 'RODRIGUEZ', 'MAURICIO', 'BORIS PORFIRIO', 'BORIS PORFIRIO RODRIGUEZ MAURICIO', '4313352', 'ING.', 'CALLE UYUSTUS N? 80', '1975-09-15', '63164015', '0', 'ingboris@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(430, '3413412', 'GUAYGUA', 'MONASTERIOS', 'DAVID', 'DAVID GUAYGUA MONASTERIOS', '3413412', 'ING.', 'EL ALTO, CALLE LADISLAO CABRERA N? 1055 ZONA VILLA TUNARI', '1970-07-15', '74093600', '60169020', 'condag13@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(431, '2891192', 'ALVAREZ', 'ENCINAS', 'RENE VICTOR', 'RENE VICTOR ALVAREZ ENCINAS', '2891192', 'ING.', 'CBBA, CALLE MANUEL MARIN N? 1037', '1963-03-06', '72297752', '0', 'consultora2025@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(432, '4126991', 'MEDINA', 'CASTILLO', 'IVAN ERICK', 'IVAN ERICK MEDINA CASTILLO', '4126991', 'ING.', 'BARRIO SAN MARTIN / ORURO', '1975-07-10', '72988699', '0', 'ericktexas2004@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(433, '7484791', 'CUELLAR', 'TINUCO', 'VIRGILIO', 'VIRGILIO CUELLAR TINUCO', '7484791013', 'ING.', 'CALLE CAMPO SANTA CRUZ N? 162', '1989-01-29', '67621559', '0', 'villo.vc@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 10:48:56'),
(434, '3497787', 'RIVERA', 'ASPIAZU', 'WILLIAMS IVAN', 'WILLIAMS IVAN RIVERA ASPIAZU', '3497787', 'ING.', 'EL ALTO, CALLE ESTEBAN ARCE(6) N? 62B ZONA VILLA TUNARI', '1980-05-02', '76275101', '0', 'ivan.rivera.a@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(435, '4951149', 'LUQUE', 'QUISPE', 'MARINA ROXANA', 'MARINA ROXANA LUQUE QUISPE', '4951149', 'ING.', 'EL ALTO, CALLE ESTEBAN ARCE(6) N? 62B, ZONA VILLA TUNARI', '1977-12-01', '77778987', '0', 'roxanaluquequispe@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(436, '8319959', 'LAFUENTE', 'ARRAYA', 'LUCIA DEL CARMEN', 'LUCIA DEL CARMEN LAFUENTE ARRAYA', '8319959', 'ING.', 'CALLE 1B N? 790 ZONA CIUDAD DEL ALTO', '1992-07-16', '72094093', '67148911', 'lulaar92@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(437, '3102794', 'PEÑAFIEL', 'SOLIZ', 'JORGE LORENZO', 'JORGE LORENZO PE?AFIEL SOLIZ', '3102794', 'ING.', 'AV. TIHUANACU Nro 999 ENTRE CALLE N? 2 ZONA VILLA DOLORES', '1968-09-05', '73836766', '0', 'jlpenafiel@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 11:31:56'),
(438, '674481', 'HUAYTA', 'GUTIERREZ', 'FRANCISCO', 'FRANCISCO HUAYTA GUTIERREZ', '674481', 'ING.', 'EL ALTO, AV. PAPA PAOLO 2327', '1958-10-10', '72290336', '0', 'fhuayta2000@yahoo.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(439, '3499639', 'SALAZAR', 'ESPINOZA', 'DIERCINA FRIDA', 'DIERCINA FRIDA SALAZAR ESPINOZA', '3499639', 'ING.', 'VALENTIN ABECIA PASAJE 1 N? 1500', '1973-10-29', '77716547', '0', 'diercinasalazar@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(440, '4813573', 'PATZI', 'CAMPOS', 'YRIS LINDSAY', 'YRIS LINDSAY PATZI CAMPOS', '4813573', 'ING.', 'AV. DEL ESCULTOR N? 457 COTA COTA', '1978-09-06', '74059725', '2784899', 'yrispcampos@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(441, '6784613', 'QUISPE', 'TALLACAGUA', 'MIRIAN', 'MIRIAN QUISPE TALLACAGUA', '6784613', 'ING.', 'Z- TEMBLADERANI C-CARLOS ROMERO N?2', '1985-10-17', '68171698', '0', 'mirian.agroumsa@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(442, '2739995', 'CLAROS', 'SALAZAR', 'JAIME VIDAL', 'JAIME VIDAL CLAROS SALAZAR', '2739995', 'ING.', 'BLASS PUERTAS 1333 ENTRE 3 DE MAYO, ZONA ALTO POTOSI, CIUDAD DE LA PAZ', '1963-07-08', '72313399', '0', 'clarosjaimevidal@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(443, '4373635', 'SUCOJAYO', 'CHOQUE', 'EDIL', 'EDIL SUCOJAYO CHOQUE', '4373635', 'ING.', 'C/ RAYMUNDO TABORGA N? 1438', '1978-09-16', '71244688', '0', 'edil.sucojayo1@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(444, '6816307', 'MAMANI', 'HUANCA', 'PAMELA', 'PAMELA MAMANI HUANCA', '6816307', 'ING.', 'CALLE CBBA N? 20 ZONA UNION ALIANZA', '1990-05-25', '73284806', '0', 'padme.liz90@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(445, '2681161', 'GONZALES', 'SORIA', 'GERMAN RAMIRO', 'GERMAN RAMIRO GONZALES SORIA', '2681161', 'ING.', 'C/ JOSE LEMOINE ZONA VILLA COPACABANA', '1963-10-14', '70180301', '0', 'raminino2000@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(446, '2706465', 'MARI?O', 'GONZALES', 'JAVIER VICENTE', 'JAVIER VICENTE MARI?O GONZALES', '2706465', 'ING.', 'EL ALTO VILLA EXALTACION CALLE 4 N? 15', '1965-01-22', '73243890', '0', 'javiervmg@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(447, '5756570', 'TOLA', 'LAZARTE', 'APOLINAR', 'APOLINAR TOLA LAZARTE', '5756570', 'ING.', 'URB. VILLA DORINA MZNO B2 N? 13', '1986-10-23', '67218335', '0', 'tigre_jose86@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(448, '4275967', 'VELASCO', 'TAMAYO', 'NOEL RODRIGO', 'NOEL RODRIGO VELASCO TAMAYO', '4275967', 'ING.', 'CALLE 1 N? 1025-A, BAJO LLOJETA', '1974-01-01', '69890800', '2500138', 'noelvelasco277@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(449, '5676429', 'SARDAN', 'SE?ORANIS', 'ARTURO', 'ARTURO SARDAN SE?ORANIS', '5676429', 'ING.', 'C. CLAUDIO FARFAN N? 3060 AV. ALEMANA', '1991-06-08', '72602374', '0', 'asardan08@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(450, '4452259', 'LEDEZMA', 'DELGADILLO', 'RODRIGO BENITO', 'RODRIGO BENITO LEDEZMA DELGADILLO', '4452259', 'ING.', 'CALLE EUCALIPTOS N? 700', '1977-04-02', '68475650', '0', 'ledezmarodrigo08@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(451, '6561194', 'QUISPE', 'PACHECO', 'FRANCO ROBERTO', 'FRANCO ROBERTO QUISPE PACHECO', '6561194', 'ING.', 'C/CHUQUISACA N? 259', '1985-11-27', '68404401', '6228871', 'franquito271185@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(452, '7072524', 'ARUQUIPA', 'ARUQUIPA', 'JHERRY IVAN', 'JHERRY IVAN ARUQUIPA ARUQUIPA', '7072524', 'ING.', 'EL ALTO, Z. TUPAC KATARI CALLE 1-A N? 406', '1992-08-04', '77779309', '0', 'jherryivanaa@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(453, '4143931', 'ROZO', 'RIVERA', 'RAFAEL SANTOS', 'RAFAEL SANTOS ROZO RIVERA', '4143931', 'ING.', 'CALLE MENDEZ N? 928 CIUDAD DE TARIJA', '1976-07-07', '77877687', '0', 'rozo_construcciones@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(454, '6440375', 'SALAZAR', 'CLADERA', 'OSCAR JESUS', 'OSCAR JESUS SALAZAR CLADERA', '6440375', 'ING.', 'CBBA, AV. NICETO RODRIGUEZ N? 417', '1989-10-18', '61300611', '0', 'oscarsalazar.cl@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(455, '4881848', 'NINA', 'MELENDEZ', 'EDDY RENAN', 'EDDY RENAN NINA MELENDEZ', '4881848', 'ING.', 'EL ALTO, AV. CIVICA CALLE 6 DE N? 65 ZONA VILLA EXALTACION', '1980-04-05', '75827456', '7352870', 'supervisoreddyninamelendez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(456, '4800115', 'GUTIERREZ', 'QUIROGA', 'RODRIGO', 'RODRIGO GUTIERREZ QUIROGA', '4800115', 'ING.', 'PASAJE PASOKANKI N? 56 Z. MIRAFLORES', '1976-08-19', '2242949', '67060561', 'rodricro@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(457, '658545', 'LOPEZ', 'SARAVIA', 'CARLOS', 'CARLOS LOPEZ SARAVIA', '658545', 'ING.', 'C/MIGUEL APARICIO N? 209 ZONA VILLA FATIMA LA PAZ', '0000-00-00', '72573342', '0', 'ingclopezs@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(458, '4281262', 'LARICO', 'BLANCO', 'RICARDO', 'RICARDO LARICO BLANCO', '4281262', 'ING.', 'CALLE A  N 23 ZONA BRASIL RIO SECO', '1973-04-03', '71514536', NULL, 'ricardolaricoblancon@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-19 10:43:18'),
(459, '6017170', 'FLORES', 'FLORES', 'ADOLFO', 'ADOLFO FLORES FLORES', '6017170', 'ING.', 'EL ALTO, CALLE 5 N? 56 ZONA VILLA TUNARI', '1981-05-05', '70659662', '0', 'adolf.flores2@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(460, '4983031', 'CONDORI', 'PATZI', 'ROLANDO WILSON', 'ROLANDO WILSON CONDORI PATZI', '4983031', 'ING.', 'AV. JUAN PABLO II, N? 2105 ZONA PUERTO MEJILLONES (EL ALTO-RIO SECO)', '1980-03-12', '72088991', '70161191', 'rolando_wilson@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(461, '6449726', 'NINA', 'MARTINEZ', 'ROLANDO', 'ROLANDO NINA MARTINEZ', '6449726', 'ING.', 'URB. LA PAZ S/N CBBA', '1985-03-07', '72215485', '0', 'rolando77martinez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(462, '4059324', 'MAMANI', 'CAHUANA', 'EDGAR', 'EDGAR MAMANI CAHUANA', '4059324', 'ING.', 'C/J. AZURDUY N? 1125 Y J. ENVIS Y PANIAGUA Z.', '1980-07-18', '72423269', '0', 'edgarin222@live.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(463, '4114820', 'RENDON', 'GARECA', 'ALEX FERNANDO', 'ALEX FERNANDO RENDON GARECA', '4114820', 'ING.', 'AV. CANADA N? 572', '1981-03-04', '74432233', '77110338', 'fer_gareca@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(464, '5520675', 'SANCHEZ', 'LOPEZ', 'GUSTAVO ADOLFO', 'GUSTAVO ADOLFO SANCHEZ LOPEZ', '5520675', 'ING.', 'AV. DE LA JUSTICIA EDIF. ARTESAMISA PISO 1 DEPTO B1 SUCRE', '0000-00-00', '73430919', '73463995', 'gusadolsanchezlopez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(465, '4845018', 'MAMANI', 'CHOQUE', 'CARLOS ALBERTO', 'CARLOS ALBERTO MAMANI CHOQUE', '4845018', 'ING.', 'AV. FINAL INGAVI N? 2040 ZONA FERROVIARIA VIACHA', '1983-02-07', '74411965', '73223095', 'carlosfni@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(466, '4769236', 'VILLAFUERTE', 'VILLARROEL', 'RENAN', 'RENAN VILLAFUERTE VILLARROEL', '4769236', 'ING.', 'URB. EL VEGEL CALLE 2 N? 310 Z. IRPAVI', '0000-00-00', '72076367', '0', 'stronville@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(467, '4085927', 'CANIZARES', 'KAMA', 'FEDERICO NEX', 'FEDERICO NEX CANIZARES KAMA', '4085927', 'ING.', 'SUCRE, AV. MARTIN CARDENAS N? 155', '1979-07-18', '72890442', '0', 'nexjeco@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(468, '4006654', 'CORO', 'VEDIA', 'GONZALO', 'GONZALO CORO VEDIA', '4006654', 'ING.', 'CALLE PIZARRO N? 98', '1976-12-09', '72443279', '0', 'gonzalo.coro.vedia@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(469, '7103531', 'GUACHACALLA', 'CONDORI', 'DANIEL', 'DANIEL GUACHACALLA CONDORI', '7103531', 'ING.', 'AV. LITORAL N? 2114 ENTRE BOQUERON ZONA EL ALTO', '1987-09-01', '69310761', '0', 'daniel.guachalla.c@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(470, '3109170', 'QUIROGA', 'QUISPE', 'WILSON', 'WILSON QUIROGA QUISPE', '3109170', 'ING.', 'URB. JUSTO JUEZ CALLE S/N N? 7 Y AV. TERESA DE CALCUTA', '0000-00-00', '72492022', '0', 'ingwqq2@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(471, '3528034', 'JUANIQUINA', 'CALCINA', 'NELSON', 'NELSON JUANIQUINA CALCINA', '3528034', 'ING.', 'CALLE SANTA BARBARA N? 415 TEJERINA Y TARAPACA', '1979-07-05', '67200835', '0', 'nel.juaniquina@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(472, '5548745', 'RAMOS', 'VARGAS', 'CRISTIAN LUIS', 'CRISTIAN LUIS RAMOS VARGAS', '5548745', 'ING.', 'CALLE CONCHITAS N? 524 ZONA SAN PEDRO', '1983-09-06', '72948685', '0', 'rcristianluis@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(473, '5800007', 'GUTIERREZ', 'CALDERON', 'JOSE MIGUEL', 'JOSE MIGUEL GUTIERREZ CALDERON', '5800007', 'ING.', 'CALLE AROMA Y FLORES EDIF. QUISPE PISO 2-ZONA 3 DE MAYO', '1986-04-20', '72967064', '0', 'luckhuntt@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(474, '6587860', 'MONTA?O', 'QUINAYA', 'OMAR', 'OMAR MONTA?O QUINAYA', '6587860', 'ING.', 'AV. DEL EJERCITO NACIONAL N? 590', '1987-11-03', '72896090', '0', 'tom_0387@hotmai.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(475, '4886415', 'TICONA', 'CAYLLAGUA', 'ABDON', 'ABDON TICONA CAYLLAGUA', '4886415', 'ING.', 'ZONA HUAYNA POTOSI, CALLE 25 # 695', '1980-09-08', '72578939', '0', 'ing.abdon_ticona@hotmai.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(476, '3433240', 'SILLO', 'AGUILAR', 'NATALIO', 'NATALIO SILLO AGUILAR', '3433240', 'ING.', 'CALLE 3 N? 330 ZONA LAS LOMAS', '1966-07-27', '74085434', '0', 'nataliosillo@hotmail.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(477, '3794991', 'MONTECINOS', 'PAHUASI', 'HERNAN', 'HERNAN MONTECINOS PAHUASI', '3794991', 'ING.', 'AV. CIRCUNVALACION S/N ZONA TAQUI?A', '1971-06-14', '72290122', '0', 'hm2214@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(478, '2643223', 'ACUÑA', 'PACO', 'LADISLAO', 'LADISLAO ACU?A PACO', '2643223', 'ING.', 'CALLE MAPIRI S/N MOCOMOCO PROVINCIA CAMACHO', '1966-06-27', '68009513', '0', 'ladislaoqulla@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-04 11:34:21'),
(479, '3527174', 'GUTIERREZ', 'SILES', 'JUAN CARLOS', 'JUAN CARLOS GUTIERREZ SILES', '3527174', 'ING.', 'ARICA N? 1990 ALDANA Y MURGUIA', '1975-06-04', '73804560', '0', 'jg3517517@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(480, '1860785', 'GUTIERREZ', 'NAVA', 'NORMAN WILSON', 'NORMAN WILSON GUTIERREZ NAVA', '1860785', 'ING.', 'BARRIO NARCISO CAMPERO CALLE LUIS PARRA N? 1774', '0000-00-00', '78700358', '71878880', 'mwgn2000@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(481, '2302582', 'SOLIZ', 'ORTIZ', 'JUAN CARLOS', 'JUAN CARLOS SOLIZ ORTIZ', '2302582', 'ING.', 'AV. HECTOR ORMACHEA N? 5378  ZONA OBRAJES', '1960-03-23', '73231806', '2783736', 'jcsolizortizb@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(482, '6078305', 'QUISPE', 'CALLISAYA', 'SONIA', 'SONIA QUISPE CALLISAYA', '6078305', 'ING.', 'ZONA 7 DE SEPTIEMBRE CALLE 17 DE JULIO N? 3034', '1985-08-23', '67159550', '0', 'consulplantagro@gmail.com', 'MUJER', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(483, '3388722', 'JIMENEZ', 'JEMIO', 'MIGUEL ANGEL', 'MIGUEL ANGEL JIMENEZ JEMIO', '3388722', 'ING.', 'AV. LOS LEONES N? 2434 (MIRAFLORES)', '1967-10-02', '73720762', '0', 'miguelo-2-10@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(484, '4316298', 'MAMANI', 'MAMANI', 'JHONY MARCELO', 'JHONY MARCELO MAMANI MAMANI', '4316298', 'ING.', 'EL ALTO, CALLE A MU?OS #1034 Z. ZENKATA', '1977-01-16', '73508873', '0', 'jhonymarcelomamanimamani@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(485, '3662392', 'LLANOS', 'PEREZ', 'ADAN JESUS', 'ADAN JESUS LLANOS PEREZ', '3662392', 'ING.', 'ORURO, PAGADOR N? 6816 ENTRE SANTABARBARA Y JAEN', '1967-08-20', '72484358', '0', 'adan_jlp@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(486, '4422880', 'TOLEDO', 'GALLEGO', 'JOSE LUIS', 'JOSE LUIS TOLEDO GALLEGO', '4422880', 'ING.', 'CILLA EL CARMEN CALLE 1 N? 65', '1972-10-21', '76777183', '0', 'jl_toledo@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(487, '3978274', 'GONZALES', 'CONDORI', 'RICHARD', 'RICHARD GONZALES CONDORI', '3978274', 'ING.', 'CALLE FANOLA N? 195', '1971-09-19', '72422322', '26226896', 'ic.r.gonzales.c@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(488, '4037861', 'CHINCHE', 'IQUIZE', 'FREDDY JAVIER', 'FREDDY JAVIER CHINCHE IQUIZE', '4037861', 'ING.', 'CASTO PINILLA N? 21 ENTRE WASGHINTON Y LA PLATA', '1979-03-23', '67241431', '0', 'freddychinche23@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(489, '3991050', 'DELGADO', 'MARTINEZ', 'DAVID', 'DAVID DELGADO MARTINEZ', '3991050', 'ING.', 'CALLE 12 DE OCTUBRE N? 176', '1980-07-18', '72423430', '0', 'dademart@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(490, '5984976', 'TICONA', 'HILARI', 'JUAN CARLOS', 'JUAN CARLOS TICONA HILARI', '5984976', 'ING.', 'EL ALTO, CALLE 35 N? 8 ZONA ALTO LIMA 2DA SECCION', '0000-00-00', '76246189', '0', 'consultora_tycons@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(491, '4807729', 'PILLCO', 'ROQUE', 'MARCO ANTONIO', 'MARCO ANTONIO PILLCO ROQUE', '4807729', 'ING.', 'LA PAZ, ZONA KOCHAPAMPA CALLE B N? 1618', '1978-09-12', '75299503', '75205686', 'marco antoniopillcoroque@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(492, '4250871', 'APAZA', 'QUISPE', 'GUIDO MIGUEL', 'GUIDO MIGUEL APAZA QUISPE', '4250871', 'ING.', 'EL ALTO, C. VIACHA N? 5114 ZONA SAN PEDRO', '1976-07-05', '72570703', '0', 'miguel_ap@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(493, '5491703', 'FLORES', 'MEZZA', 'HECTOR GUSTAVO ALEX', 'HECTOR GUSTAVO ALEX FLORES MEZZA', '5491703', 'ING.', 'AV. UNION N? 199 ZONA RECOLETA', '1979-06-26', '68668992', '0', 'ingcv.hgafm@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(494, '4745906', 'CONTRERAS', 'AGUIRRE', 'WILMER RICARDO', 'WILMER RICARDO CONTRERAS AGUIRRE', '4745906017', 'ING.', 'AV. RAMIRO CASTILLO N? 20 IF 1B Z. VILLA DEL CARMEN', '1978-07-12', '72579399', '0', 'wilmer4745906@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-03-03 11:05:12'),
(495, '3486759', 'ALVAREZ', 'REYES', 'NELSON GUSTAVO', 'NELSON GUSTAVO ALVAREZ REYES', '3486759', 'ING.', 'CALLE ROSALES 9 N? 40 ZONA CRISTAL 1 A UNA CUDRA DE LA PLAZA CRISTAL 1', '1990-02-12', '76519801', '0', 'nelsonnet666@htomail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(496, '9212907', 'VICENTE', 'APAZA', 'BRYAN FAUSTO', 'BRYAN FAUSTO VICENTE APAZA', '9212907', 'ING.', 'ZONA CIUDAD SATELITE PLAN 97 CALLE 13 A N?885', '1992-06-12', '79567400', '0', 'bryanvicente50@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(497, '6698298', 'QUISPE', 'CAMI?O', 'JUAN FRANKLIN', 'JUAN FRANKLIN QUISPE CAMI?O', '6698298', 'ING.', 'CALLE ARRUETA N? 130', '1991-08-21', '72386901', '0', 'juanfranklin767@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(498, '5656292', 'ZELAYA', 'VARGAS', 'EFRAIN', 'EFRAIN ZELAYA VARGAS', '5656292', 'ING.', 'CATAGAITA N? 202', '1984-11-18', '73411144', '0', 'efra_cons_ezv@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(499, '4741032', 'MARQUEZ', 'CONDE', 'EDDY NELSON', 'EDDY NELSON MARQUEZ CONDE', '4741032', 'ING.', 'CALLE POSNASKY N? 1086 MIRAFLORES', '1975-07-18', '72079316', '0', 'noslen_328@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(500, '6127818', 'SALAZAR', 'ROMERO', 'JUAN GABRIEL', 'JUAN GABRIEL SALAZAR ROMERO', '6127818', 'ING.', 'LA PAZ. C. MONJE N? 107 Z. VILLA LAS DELICIAS', '1986-02-05', '72576815', '0', 'salazar.jugabriel@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(501, '4417980', 'TRIVEÑO', 'VARGAS', 'RENZO FABIAN', 'RENZO FABIAN TRIVE?O VARGAS', '4417980', 'ING.', 'LA PAZ, CALLE EMILIO CALDERON N 356', '1975-02-14', '77900925', '0', 'renzfotv@gmail.com', 'HOMBRE', 'NATURAL', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-03 11:41:59'),
(502, '4038793', 'GONZALES', 'CACERES', 'VICTOR HUGO', 'VICTOR HUGO GONZALES CACERES', '4038793', 'ING.', 'AV. TITO YUPANQUI N? 1128 PEDRO VILLAMIL (VILLA COPACABANA)', '1979-06-15', '73281822', NULL, 'hug_gon@yahoo.es', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '2022-05-03 11:51:06'),
(503, '4786340', 'SALAZAR', 'TORREZ', 'JUAN CARLOS', 'JUAN CARLOS SALAZAR TORREZ', '4786340', 'ING.', 'LA PAZ, ZONA LA PORTADA, CALLE V. OVIENDO N? 2590', '1977-11-04', '70611162', '0', 'jcsalazartorrez@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(504, '1286160', 'MICORDIA', 'JALLAZA', 'ROBERTO', 'ROBERTO MICORDIA JALLAZA', '1286160', 'ING.', 'AV. GUILLERMO URQUIDI E-1636 CBBA.', '1985-06-28', '44230813', '72716153', 'rmicordi@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(505, '3445322', 'KARNINCIC', 'FIGUEREDO', 'MARCO ANTONIO', 'MARCO ANTONIO KARNINCIC FIGUEREDO', '3445322', 'ING.', 'LA PAZ, CALLE 1 N? 510 ZONA VALLE HERMOSO', '1971-02-04', '71966960', '0', 'maka.bo@hotmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(506, '3622544', 'FERRUFINO', 'UGARTE', 'JAVIER GONZALO', 'JAVIER GONZALO FERRUFINO UGARTE', '3622544', 'ING.', 'CBBA, CALLE URU N? 1030', '1967-11-23', '71720421', '0', 'javoferru@gmail.com', 'HOMBRE', 'Null', 'Null', 'NATURAL', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(507, '8346773', 'QUISPE', 'LEQUIPE', 'RAUL', 'RAUL QUISPE LEQUIPE', '8346773', 'ING.', 'C. 6 Nº 1025 Z. TEJADA RECTANGULAR', '1990-10-22', '60141605', NULL, 'RQUISPE@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-02 10:20:42', '2022-02-02 10:21:04'),
(508, '4036571', 'BELTRAN', 'ILLANES', 'JHONNY BENJAMIN', 'JHONNY BENJAMIN BELTRAN ILLANES', '4036571', 'ING.', 'LA PAZ,', '1979-01-10', '68357475', NULL, 'JBELTRAN@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-02 10:24:42', '2022-02-02 10:25:08'),
(509, '7541440', 'VARGAS', 'RODRIGUEZ', 'RONALD', 'RONALD VARGAS  RODRIGUEZ', '7541440', 'ING.', 'ZONA TERMINAL', '1992-05-05', '74454456', NULL, 'RVARGAS@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-02 10:27:31', '2022-02-02 10:27:52'),
(510, '3068283', 'RUEDA', 'CLAVIJO', 'VLADIMIR BORIS', 'VLADIMIR BORIS RUEDA CLAVIJO', '3068283', 'ING.', 'ZONA TERMINAL', '1957-01-10', '63787242', NULL, 'VRUEDA@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-02 10:30:33', '2022-02-02 10:31:39'),
(513, '6785727', 'SANTALLA', 'ACARAPI', 'ROSMERY JULIA', 'ROSMERY JULIO SANTALLA ACARAPI', '6785727', 'ING.', 'Av. illimani #2130', '1983-07-04', '73210690', NULL, 'rsantalla@fps.gob.bo', 'MUJER', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-07 10:34:57', '2022-02-10 06:40:05'),
(514, '4056919', 'EULATE', 'CRUZ', 'ALBERT', 'ALBERT EULATE CRUZ', '4056919', 'ING.', 'ZONA TERMINAL', '1983-03-08', '73835327', NULL, 'AEULATE@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-07 10:37:44', '2022-02-07 10:37:44'),
(515, '4779085', 'CONDORI', 'CORONEL', 'MIGUEL', 'MIGUEL CONDORI CORONEL', '4779085', 'ING.', 'C.CRESPO N°9 VIACHA', '1977-03-27', '72035222', NULL, 'MCONDORI@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:39:59', '2022-02-22 15:39:59'),
(516, '4331087', 'GUZMAN', 'ALARCON', 'ALVARO LUIS', 'ALVARO LUIS GUZMAN ALARCON', '4331087', 'ING.', 'AV. TIAHUANACU N° 20 Z. 12 DE OCTUBRE', '1983-02-14', '6707443', NULL, 'AGUZMAN@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:43:24', '2022-02-22 15:43:24'),
(517, '3455346', 'MARCA', 'CASTILLO', 'ROLANDO VICTOR', 'ROLANDO VICTOR MARCA CASTILLO', '3455346', 'ING.', 'C. FRANCISCO ARAMAYO N° 125', NULL, '76510488', NULL, 'RMARCA@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:45:39', '2022-04-21 11:12:21'),
(518, '6129141', 'QUENALLATA', 'BERNABE', 'REYNALDO', 'REYNALDO QUENALLATA BERNABE', '6129141', 'ING.', 'AV. 2 DE AGOSTO N° 4094 ALTO', NULL, '76545386', NULL, 'RQUENALLATA@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:49:52', '2022-02-22 15:49:52'),
(519, '2774505', 'FLORES', 'SOLARES', 'NINOSKA IVONNE', 'NINOSKA IVONNE FLORES SOLARES', '2774505', 'ING.', 'CAPITAN RIVALO N° 2441', NULL, '70558285', NULL, 'NFLORES@FPS.GOB.BO', 'MUJER', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:51:30', '2022-02-22 15:51:30'),
(520, '2456506', 'BELLOT', 'KAITEIS', 'NELSON FEDERICO', 'NELSON FEDERICO BELLOT KAITEIS', '2456506', 'ING.', 'AV. PRINCIPAL KOANI 987', NULL, '71534168', NULL, 'NBELLOT@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:53:50', '2022-02-22 15:53:50'),
(521, '3385058', 'TINTAYA', 'BAUTISTA', 'JOSE LUIS', 'JOSE LUIS TINTAYA BAUTISTA', '3385058', 'LIC.', 'RESD. EN COM SANTA BARBARA – PROV NOR YUNGAS', NULL, '78255287', NULL, 'JTINTAYA@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:56:27', '2022-02-22 15:56:27'),
(522, '2527993', 'CONDORI', 'CAUNA', 'REYNALDO', 'REYNALDO CONDORI CAUNA', '2527993019', 'LIC.', 'CALLE CHIUTA Nº 174 HUAYNA POTOSI 2DA SECCION EL ALTO NORTE', '1968-02-10', '68078154', NULL, 'RCCONDORI@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:57:36', '2022-05-27 22:37:35'),
(523, '2711804', 'MAMANI', 'UCHANI', 'TEODORO MAX', 'TEODORO MAX MAMANI UCHANI', '2711804', 'LIC.', 'CALLE PASCOE 3476', '1968-11-09', '76592204', NULL, 'TMAMANI@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 15:59:47', '2022-02-22 15:59:47'),
(524, '2285611', 'MARCO', 'PEREZ', 'PATRICIA ELVIRA', 'PATRICIA ELVIRA MARCO PEREZ', '2285611', 'LIC.', 'CALLE 25 C, SECTOR ASILO ACHUMANI', NULL, '79680472', NULL, 'PMARCO@FPS.GOB.BO', 'MUJER', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 16:09:45', '2022-02-22 16:09:45'),
(525, '6072427', 'FERNANDEZ', 'MENDOZA', 'WILSON', 'WILSON FERNANDEZ MENDOZA', '6072427', 'LIC.', 'C FRANCISCO BEDREGAL Nº 2634 Z. SAN MARTIN DE PORRES', '1991-11-16', '62462502', NULL, 'WFERNANDEZ@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 16:11:48', '2022-02-22 16:11:48'),
(526, '4268086', 'CHAVEZ', 'OPORTO', 'MARTIN FELIPE', 'MARTIN FELIPE CHAVEZ OPORTO', '4268086', 'ABG.', 'LA PAZ', NULL, '71949966', NULL, 'MCHAVEZ@FPS.GOB.BO', 'HOMBRE', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 16:13:47', '2022-02-22 16:13:47'),
(527, '8312443', 'RIOS', 'MALDONADO', 'KATTERINE IRIS', 'KATTERINE IRIS RIOS MALDONADO', '8312443', 'LIC.', 'AV. LA BANDERA Nº 58 Z. VILLA PABON', '1989-01-23', '75879808', NULL, 'KARIOS@FPS.GOB.BO', 'MUJER', 'SERVIDOR PUBLICO', NULL, 'ACTIVO', '2022-02-22 16:16:36', '2022-02-22 16:16:36'),
(528, '5286795', 'ZURITA', 'TIRADO', 'DANNY ALVARO', 'DANNY ALVARO ZURITA TIRADO', '5286795013', 'ING.', 'AV. VILLAZON KM 6,5 URB LOS OLIVOS C-9', '1983-01-06', '68498616', NULL, 'ZURITADANNY30@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 10:44:21', '2022-03-03 10:44:21'),
(529, '6476987', 'COCA', 'CAISIRI', 'JAFETT', 'JAFETT COCA CAISIRI', '6476987', 'ING.', 'C/SAN LORENZO 327-A COLCAPIRHUA-CBBA', NULL, '67408430', '67231308', 'YAS7070@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 10:46:58', '2022-03-03 10:46:58'),
(530, '5680488', 'MAMANI', 'ROMERO', 'SIMEON CRISTIAN', 'SIMEON CRISTIAN MAMANI ROMERO', '5680488', 'ING.', 'Av. J prudencio bustillos nro 312', '1987-03-11', '6435452', '75443450', 'moshitocris@gmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 11:04:04', '2022-03-03 11:04:04'),
(531, '3524588', 'COPAJIRA', 'ARROYO', 'HENAN', 'HENAN COPAJIRA ARROYO', '3524588017', 'ING.', 'C/ QUINTANILLA \"A\" Nº 260 BOLIVAR Y MURGUIA', '1973-08-03', '77518654', NULL, 'H.CA@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 11:08:17', '2022-03-03 11:08:17'),
(532, '3645550', 'CALVETTY', 'AMELLER', 'DAVID CRISTIAN', 'DAVID CRISTIAN CALVETTY AMELLER', '3645550018', 'ING.', 'CALLE ESTADOS UNIDOS Nº1320', NULL, '78721216', NULL, 'cdcalvetty@hotmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 11:13:30', '2022-03-03 11:13:30'),
(533, '6853981', 'HUAYNOCA', 'ROMERO', 'ANDRES FELIPE', 'ANDRES FELIPE HUAYNOCA ROMERO', '6853981017', 'ING.', 'CALLE JUAN GUTIERREZ PANIAGUA Nº 797 ZONA CHAMOCO CHICO', '1990-11-29', '77504623', '73278020', 'INGCIVHRJJ@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 11:18:34', '2022-03-03 11:18:34'),
(534, '3482167', 'LOZA', 'PARI', 'RAMIRO WALDO', 'RAMIRO WALDO LOZA PARI', '3482167015', 'ING.', 'CALLE ROBERTO HINOJOSA 1921 ZONA DE VILLA SAN ANTONIO', '1971-10-15', '72858605', NULL, 'LOZARAMIRO@YAHOO.ES', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-03 11:22:55', '2022-03-03 11:22:55'),
(535, '2442589', 'VALENZUELA', 'MELGAR', 'MARCO LIVIO', 'MARCO LIVIO VALENZUELA MELGAR', '2442589', 'ING.', 'C/ ALMIRANTE GRAU 493', NULL, '71409880', NULL, 'MVMELGAR@OUTLOOK.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:39:01', '2022-03-04 11:39:01'),
(536, '6761858', 'COPA', 'TOLA', 'GUILLERMO', 'GUILLERMO COPA TOLA', '6761858011', 'ING.', 'calle filipinas s/n valle hermoso D-8 M-466 entre calle libertad y rio mula mayu', '1986-01-13', '72245502', NULL, 'guillermocopa@hotmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:42:07', '2022-03-04 11:42:07');
INSERT INTO `personas` (`id`, `ci`, `paterno`, `materno`, `nombres`, `datosp`, `nit`, `grado`, `direccion`, `fechaNacimiento`, `fono1`, `fono2`, `email`, `genero`, `observacion`, `departamento`, `status`, `created_at`, `updated_at`) VALUES
(537, '6891380', 'VALENCIA', 'CURACA', 'ELISEO', 'ELISEO VALENCIA CURACA', '6891380012', 'ING.', 'RESIDENCIA EN ATAHUALLPA PROV. LARECAJA', '1991-07-30', '68117400', NULL, 'ELISEOVALENCIA84@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:44:57', '2022-03-04 11:44:57'),
(538, '3967623', 'QUISPE', 'GARCIA', 'JUAN CARLOS', 'JUAN CARLOS QUISPE GARCIA', '3967623011', 'ING.', 'CALLE VILLAROEL ENTRE MURILLO DORADO', '1973-10-03', '73840743', NULL, 'juancarlosquispegarcia@gmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:48:03', '2022-03-04 11:48:03'),
(539, '7234344', 'NIEVES', 'LIZARRAGA', 'CARLOS ABEL', 'CARLOS ABEL NIEVES LIZARRAGA', '7234344018', 'ING.', 'CALLE USA Nro 1320 EDIF.  \"EL SOL\" PISO 2', '1992-12-02', '78243076', '67395502', 'LIZARRAGANIEVES@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:50:39', '2022-03-04 11:50:39'),
(540, '5940013', 'CHOQUE', 'MAMANI', 'ORLANDO', 'ORLANDO CHOQUE MAMANI', '5940013', 'ING.', 'Z/ 16 DE FEBRERO C/ LOS PINOS Nro 3245', '1982-11-11', '77573727', NULL, 'ORLANDOCHOQUE@ICLOUD.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 11:53:32', '2022-03-04 11:53:50'),
(541, '3610352', 'AGUILAR', 'ZELADA', 'RINO ABEL', 'RINO ABEL AGUILAR ZELADA', '3610352017', 'ING.', 'FINAL AV. 2 DE AGOSTO PASAJE INNOMINADO S/N', '1973-05-24', '67538775', NULL, 'AGUILARZELADA662@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-04 12:03:58', '2022-03-04 12:03:58'),
(542, '4816108', 'NINA', 'CUEVAS', 'CAMILO ENRIQUE', 'CAMILO ENRIQUE NINA CUEVAS', '4816108', 'LIC.', 'EL ALTO, ZONA VILLA EXALTACION CALLE OPINION Nº 14-B', '1979-07-15', '67124235', NULL, 'CAMILONINA100@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-07 12:08:54', '2022-03-07 12:08:54'),
(543, '3372645', 'MAMANI', 'HUANCA', 'EDMUNDO GERMAN', 'EDMUNDO GERMAN MAMANI HUANCA', '3372645', 'LIC.', 'CALLE PILCOMAYO 1703 VILLA VICTORIA LA PAZ', '1979-02-24', '77717822', NULL, 'DESDELHOYO@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-07 12:12:31', '2022-03-07 12:12:31'),
(544, '33340721F', 'CORDERO', 'LOZA', 'MARIA VERONICA', 'MARIA VERONICA CORDERO LOZA', NULL, 'LIC.', 'CALLE PROLONGACION LAS FLORES Nº 4 ZONA MALLASA - LA PAZ', '1965-04-06', '69933269', NULL, 'VCORDERO65LOZA@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-07 12:17:26', '2022-03-07 12:17:26'),
(545, '4794089', 'MARCA', 'CHOQUE', 'GERMAN', 'GERMAN MARCA CHOQUE', '4794089', 'ING.', 'av. 16 de julio Nro 100 zona ballivian', NULL, '77223148', NULL, 'g_marca@hotmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 10:45:31', '2022-03-11 10:45:31'),
(546, '4749542', 'NACHO', 'ZAPATA', 'ENCAR MOISES', 'ENCAR MOISES NACHO ZAPATA', '4749542', 'ING.', 'C. BOLIVAR NRO 76 Z. EL ALTO', '1974-03-25', '71913702', NULL, 'ENCARNACHO@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 10:47:25', '2022-03-11 10:47:25'),
(547, '4762806', 'TICONA', 'ARCAYA', 'ANGEL MIGUEL', 'ANGEL MIGUEL TICONA ARCAYA', '4762806', 'ING.', 'C. ANTONIO GONZALES NRO 729 Z. BELLA VISTA', '1976-10-02', '71291101', NULL, 'MIGUEL.TICONA.MT@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 10:52:13', '2022-03-11 10:52:13'),
(548, '7273076', 'RAMOS', 'COLQUE', 'PAMELA', 'PAMELA RAMOS COLQUE', '7273076', 'ING.', 'CALLE LINARES NRO 980 ZONA CENTRAL', '1987-09-14', '68358752', NULL, 'PAMELARAMOSCOLQUE@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 10:54:43', '2022-03-11 10:54:43'),
(549, '3334312', 'QUISPE', 'TARQUI', 'NICOLAS EDUARDO', 'NICOLAS EDUARDO QUISPE TARQUI', '3334312', 'ING.', 'ZONA VINTO TINTO CALLE MAMA OCLLO Nro 718', '1968-12-06', '73273636', NULL, 'ATONLON_SRL@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 10:57:55', '2022-03-11 11:00:36'),
(550, '6877461', 'CALLE', 'SANCHEZ', 'MIRCO ELIOT', 'MIRCO ELIOT CALLE SANCHEZ', '6877461', 'ING.', 'ZONA ALTO CHIJINI C/ ANTONIO GALLARDO Nro 34', '1985-09-30', '63136673', NULL, 'MIRCOCIVIL@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-11 11:02:54', '2022-03-11 11:02:54'),
(551, '4981801', 'MAYDANA', 'SUMI', 'ELIZABETH', 'ELIZABETH MAYDANA SUMI', '4981801', 'ING.', 'calle cbba, nro 2940 ZONA HUAYNA POTOSI TERCERA SECCION', '1979-07-24', '71518266', NULL, 'elizabethmaydanasumi@gmail.com', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:41:19', '2022-03-15 10:41:19'),
(552, '3065900', 'RAMIREZ', 'CAPIA', 'ERNESTO', 'ERNESTO RAMIREZ CAPIA', '3065900', 'ING.', 'CALLE 6 Nº 3 ENTRE PROLONGACION CAMPO JORDAN', '1967-04-03', '71102434', NULL, 'RAMCAPER@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:44:47', '2022-03-15 10:44:47'),
(553, '4046719', 'VILLCA', 'COLQUE', 'DONATO', 'DONATO VILLCA COLQUE', '4046719', 'ING.', 'CALLE 17, 12 Y 20 BARRIO CAPO VERDE ORURO', '1978-02-03', '67249267', NULL, 'VILLCA77@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:46:56', '2022-03-15 10:46:56'),
(554, '3412449', 'QUELALI', 'MAMANI', 'ALBERTO', 'ALBERTO QUELALI MAMANI', '3412449', 'ING.', 'RIO SECO Z/BRASIL , C/ GUAJARAMERIN NRO 3025', '1971-12-03', '68000425', NULL, 'AQUELALI201171@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:49:06', '2022-03-15 10:49:06'),
(555, '4868796', 'ESPINOZA', 'ALMAZAN', 'JORGE GABRIEL', 'JORGE GABRIEL ESPINOZA ALMAZAN', '4868796', 'ING.', 'EL ALTO ZONA VILLA ADELA PLAN 34 NRO 8 CALLE K', '1974-03-10', '70127514', '22830222', 'JORGEALMAZAN_7886ARG@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:51:45', '2022-03-15 10:51:45'),
(556, '4915287', 'QUISPE', 'QUISPE', 'LETICIA GABRIELA', 'LETICIA GABRIELA QUISPE QUISPE', '4915287', 'ING.', 'ANDRES BELLO NRO 100', '1981-07-23', '77760032', '2793122', 'LETICIA.QUISPE.81@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:53:52', '2022-03-15 10:53:52'),
(557, '4283273', 'YANA', 'CHAMBI', 'GERMAN JAVIER', 'GERMAN JAVIER YANA CHAMBI', '4283273', 'ING.', 'Z. SAGRADO CORAZON DE JESUS C. JUNIN NRO 95', '1975-12-13', '73081234', NULL, 'AJVIERYAN@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 10:56:25', '2022-03-15 10:56:25'),
(558, '4291014', 'CALANI', 'CHOQUE', 'REGINA PORFIRIA', 'REGINA PORFIRIA CALANI CHOQUE', '4291014', 'ING.', 'CALLE JUAN BALZA NRO 5024 ZONA VILLA DOLORES', '1974-09-06', '74045751', NULL, 'REGINACALANI@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 11:00:05', '2022-03-15 11:00:05'),
(559, '5969680', 'FERNANDEZ', 'ALI', 'BEATRIZ', 'BEATRIZ FERNANDEZ ALI', '5969680', 'ING.', 'ZONA 16 DE JULIO KAYNAKOLLO, CALLE 3 Nro 130', '1983-04-28', '76278745', NULL, 'BEA_0428@HOTMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 11:02:32', '2022-03-15 11:02:32'),
(560, '3111766', 'ROJAS', 'MEDRANO', 'CARIM JAVIER', 'CARIM JAVIER ROJAS MEDRANO', '3111766', 'ING.', 'C. SERERE S/N ENTRE AV. LA PAZ Y SALINAS', '1969-07-21', '61667361', NULL, 'ROJAS.CARIM@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 12:41:20', '2022-03-15 12:41:20'),
(561, '5974284', 'QUIQUISANA', 'QUISPE', 'ELOY', 'ELOY QUIQUISANA QUISPE', '5974284', 'ING.', 'CALLE 3 NRO 40 ZONA TEMBLADERANI', '1981-12-02', '71255196', '72541387', 'ELOY_QUIQUIS@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 12:48:55', '2022-03-15 12:48:55'),
(562, '3510781', 'FERNANDEZ', 'QUISPE', 'AQUILIO ARTURO', 'AQUILIO ARTURO FERNANDEZ QUISPE', '3510781', 'ING.', 'RAMON MANGUDO NRO 955', '1974-05-12', '72342529', '71849862', 'FERNANDEZTUTO@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 12:52:18', '2022-03-15 12:52:18'),
(563, '4069413', 'TOLA', 'SUMI', 'MARTIN EVER', 'MARTIN EVER TOLA SUMI', '4069413', 'ING.', 'VANGUARDIA NRO 1072 Y AV. BUENOS AIRES', '1982-10-27', '76153208', NULL, 'MARTINTOLA@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-03-15 12:56:58', '2022-04-14 11:55:35'),
(564, '5033863', 'CHOQUE', 'MERLOS', 'JIMMY WINSOR', 'JIMMY WINSOR CHOQUE MERLOS', '5033863', 'ING.', 'BARRIO 6 DE AGOSTO CALLE REPUBLICA', '1979-03-20', '72999522', NULL, 'JIMICITOCHM21010@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-11 10:41:51', '2022-04-11 10:41:51'),
(565, '4048714', 'MARCA', 'CHOQUE', 'MARIELA', 'MARIELA MARCA CHOQUE', '4048714', 'ING.', 'BAPTISTA Nº 1024 CBBA Y CARO', NULL, '72358117', NULL, 'MARYELMAR@HOTMAIL.ES', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-11 10:47:15', '2022-04-11 10:47:15'),
(566, '3535668', 'HIDALGO', 'MARTINEZ', 'GUSTAVO', 'GUSTAVO HIDALGO MARTINEZ', '3535668', 'ING.', 'C. CAÑADA STRONGEST Nº 48 AV. BARRIENTOS Y MENACHO', '1977-09-25', '5244848', '72468326', 'GUSTAVOHIDALGO@YAHOO.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-11 10:52:19', '2022-04-11 10:52:19'),
(567, '4315642', 'LAYME', 'POMA', 'OSCAR', 'OSCAR LAYME POMA', '4315642', 'ING.', 'Z/ PEDRO DOMINGO MURILLO C/ JOSE JIMENEZ PINTADO Nº 2094', '1974-03-16', '76507103', NULL, 'OSCAR92@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-11 10:54:35', '2022-04-11 10:54:35'),
(568, '5272272', 'ISSA', 'ACHA', 'LUIS EMIR', 'LUIS EMIR ISSA ACHA', '5272272012', 'ING.', 'Z. CRUCE TAQUIÑA CALLE 24 DE JUNIO N° 21', '1993-02-16', '74426645', NULL, 'LUISISSA1629@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 10:37:48', '2022-04-12 10:37:48'),
(569, '4192748', 'CUELLAR', 'MANO', 'JOSE DAINER', 'JOSE DAINER CUELLAR MANO', '4192748018', 'ING.', 'C/ COBIJA 120', '1981-12-13', '72090222', NULL, 'DAINERCUELLAR@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 10:43:44', '2022-04-12 10:43:44'),
(570, '4995163', 'DIAZ', 'PACO', 'ROBERTO', 'ROBERTO DIAZ PACO', '4995163012', 'ING.', 'CALLE GUAQUI N° 10 Z/ 16 DE JULIO EL ATLO', '1985-01-07', '72022998', NULL, 'ROVHKAI@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 10:49:20', '2022-04-12 10:49:20'),
(571, '1795845', 'ALCOBA', 'ZENTENO', 'REMIGIO ABRAHAM', 'REMIGIO ABRAHAM ALCOBA ZENTENO', '1795845016', 'LIC.', NULL, NULL, '73055199', NULL, 'ALCOBAZ@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 10:52:58', '2022-04-12 12:01:20'),
(572, '6764017', 'BLANCO', 'MORA', 'SARAI YASNAYA', 'SARAI YASNAYA BLANCO MORA', '6764017', 'ING.', 'CALLE 3 N° 22 ZONA CUPILUPACA SUR ENTRE CALLE 5 Y 3', '1987-09-23', '71284784', NULL, 'YASNIBLANCO@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 10:54:42', '2022-04-12 10:58:20'),
(573, '5786477', 'SIVILA', 'CORTEZ', 'LIZBETH JHOVANA', 'LIZBETH JHOVANA SIVILA CORTEZ', '5786477017', 'ING.', 'BARRIO ROSEDAL  C. CARANDAITI Nº 2989', '1987-03-30', '68620884', NULL, 'LIZBETHSIVILA22@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 11:17:34', '2022-04-12 11:17:34'),
(574, '1076868', 'CALDERON', 'VIDAURRE', 'JHONNY', 'JHONNY CALDERON VIDAURRE', '1076868019', 'ING.', 'BARRIO SAN PEDRO C. 29 DE JULIO Nº 2406', '1963-04-05', '61850760', NULL, 'JHOCALVIDA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 11:20:38', '2022-04-12 11:20:38'),
(575, '4126399', 'RODRIGUEZ', 'SANCHEZ', 'MARCELO ADAN', 'MARCELO ADAN RODRIGUEZ SANCHEZ', '4126399', 'ING.', 'TARIJA AV. LA PAZ ESQ. DELFIN PINO ICHAZO', '1974-09-20', '72982620', NULL, 'AMARRADS@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 11:22:48', '2022-04-12 11:22:48'),
(576, '4837249', 'LUCANO', 'LUCANO', 'DANIEL PABLO', 'DANIEL PABLO LUCANO LUCANO', '4837249013', 'ING.', 'CALLE MOXOS Nº 105 COTAHUMA', '1979-02-18', '70590867', '68050661', 'DANIELPABLOLUCANO@HOTMAIL.COM', NULL, 'NATURAL', NULL, 'ACTIVO', '2022-04-12 11:46:39', '2022-04-12 11:46:39'),
(577, '2638858', 'LAZARTE', 'JUSTINIANO', 'MAGDA MILENKA', 'MAGDA MILENKA LAZARTE JUSTINIANO', '2638858017', 'ING.', 'CALLE VALENTIN ABECIA N° 1807', '1971-05-29', '70195538', NULL, 'MILENKALAZARTE@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 11:52:25', '2022-04-12 11:52:25'),
(578, '5284334', 'CATARI', 'LUNA', 'ORLANDO', 'ORLANDO CATARI LUNA', '5284334014', 'ING.', 'AV, RUBEN DARIO ENTRE HOINORATO ZALAZAR', '1983-03-08', '71767383', NULL, 'OCATARI@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:06:03', '2022-04-12 12:06:03'),
(579, '2070874', 'LAURA', 'ZEGARRA', 'RAFAEL', 'RAFAEL LAURA ZEGARRA', '2070874013', 'ING.', 'AV. ALAMOS ESQ. PUERTO DE ILO N° 1374', '1962-10-24', '78897735', NULL, 'RLAURAZE2@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:08:04', '2022-04-12 12:08:04'),
(580, '4966210', 'CHURA', 'GUERRERO', 'WILMER FRANZ', 'WILMER FRANZ CHURA GUERRERO', '4966210013', 'ING.', 'AV. TUPAC AMARU', '1979-12-04', '71293181', NULL, 'MERWILLF@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:11:07', '2022-04-12 12:11:07'),
(581, '2456445', 'MAMANI', 'QUISPE', 'CRISPIN PRUDENCIO', 'CRISPIN PRUDENCIO MAMANI QUISPE', '2456445016', 'ING.', 'AV. MARIO MERCADO N° 100 BAJO LLOJETA', '1964-04-28', '71901648', NULL, 'CRISPIN_MAMANI@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:15:50', '2022-04-12 12:15:50'),
(582, '3089612', 'AYALA', 'NIÑO DE GUZMAN', 'JORGE', 'JORGE AYALA NIÑO DE GUZMAN', '3089612019', 'ING.', 'EDIF. TORRE VIENA N° 1719', '1978-07-29', '68512633', NULL, 'SETHIANS@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:20:58', '2022-04-12 12:20:58'),
(583, '6111523', 'ARUQUIPA', 'CHALLAPA', 'FELIX', 'FELIX ARUQUIPA CHALLAPA', '6111523010', 'ING.', 'LA ASUNTA ZONA 3 LAS PALMERAS SUD YUNGAS', '1981-04-24', '72545001', '67146294', 'FACH24_@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:42:48', '2022-04-12 12:42:48'),
(584, '6756877', 'MONDACA', 'HUAYTA', 'JOEL', 'JOEL MONDACA HUAYTA', '6756877012', 'ABG.', 'VILLA SALOME CALLE G N° 1167', '1989-09-06', '77244677', NULL, 'JAELM.IA7D@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:45:32', '2022-04-12 12:45:32'),
(585, '3060579', 'VACAFLOR', 'CALLE', 'MARTIN', 'MARTIN VACAFLOR CALLE', '3060579010', 'ING.', 'FINAL FRANCISCO BEDREGAL N° 1042', '1966-07-29', '71451704', NULL, 'MARVAC@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 12:52:34', '2022-04-12 12:52:34'),
(586, '4811461', 'CORDOVA', 'CALLE', 'SANDRO', 'SANDRO CORDOVA CALLE', '4811461017', 'ING.', 'CALLE TIQUINA N° 8080', '1977-06-30', '73517486', NULL, 'SAND48CORDOVA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 13:34:46', '2022-04-12 13:34:46'),
(587, '4119271', 'MAMANI', 'VEGA', 'JAIME', 'JAIME MAMANI VEGA', '4119271013', 'ING.', 'CATACORA Y COLON N° 180', '1964-06-14', '72876892', '74139283', 'JAIMANIVEGA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 14:08:51', '2022-04-12 14:08:51'),
(588, '4920613', 'CHOQUE', 'CALLIZAYA', 'SIMEON ALFREDO', 'SIMEON ALFREDO CHOQUE CALLIZAYA', '4920613', 'LIC.', 'MZNO D PATIO 1 N° 115 ZONA RIO SECO', '1980-01-05', '73250258', NULL, 'ALFCHECE@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-12 14:12:38', '2022-04-22 11:47:40'),
(589, '7029486', 'APAZA', 'APAZA', 'FREDDY', 'FREDDY APAZA APAZA', '7029486', 'ING.', 'COM. CANTAPA PROV. LOS ANDES', '1985-09-10', '71982775', '72586734', 'AGROAPAZA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:40:45', '2022-04-14 11:40:45'),
(590, '5771391', 'AJHUACHO', 'CALIZAYA', 'ROSENDO', 'ROSENDO AJHUACHO CALIZAYA', '5771391', 'ING.', 'PROL. SALAMANCA N° 4068 Y STARZECK', NULL, '68087868', NULL, 'RACALIZAYA@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:44:24', '2022-04-14 11:44:24'),
(591, '3111387', 'RIOS', 'UZEDA', 'RODOLFO DAVID', 'RODOLFO DAVID RIOS UZEDA', '3111387', 'ING.', 'TARAPACA N° 940 Y HERRERA', '1969-09-05', '69330334', '25259499', 'RODORIOS@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:47:05', '2022-04-14 11:47:05'),
(592, '6021493', 'ESPINOZA', 'CHURA', 'OLVIS ANTONIO', 'OLVIS ANTONIO ESPINOZA CHURA', '6021493', 'ING.', 'CALLE MUNAYPATA N°670', '1985-01-16', '72451977', NULL, 'ESPINOZAOLVIS@YAHOO.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:51:09', '2022-04-14 11:51:09'),
(593, '1424047', 'ROMERO', 'LACOA', 'MILTON FLORENCIO', 'MILTON FLORENCIO ROMERO LACOA', '1424047', 'ING.', 'CALLE LIDIO USTARES N° 679', '1963-10-27', '68376239', '70462109', 'MILROMY_@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:54:06', '2022-04-14 11:54:06'),
(594, '3068166', 'ROMAN', 'MEDINA', 'EDISON OSWALDO', 'EDISON OSWALDO ROMAN MEDINA', '3068166', 'ING.', 'VELASCO GALVARRO S/N KENNEDY Y VICUÑA ZUNA SUR', '1967-04-30', '73834901', NULL, 'ROMANNEDI2003@YAHOO.ES', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-14 11:58:12', '2022-04-21 12:10:30'),
(595, '1096632', 'GUTIERREZ', 'ESPADA', 'YURI VLADIMIR', 'YURI VLADIMIR GUTIERREZ ESPADA', '1096632015', 'ING.', 'AV. MARCELO QUIROGA SANTA CRUZ, S/N ESQUINA CALLE ADRIAN CAMACHO', '1968-01-06', '72889595', '46421682', 'YURIVLADGE@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:40:14', '2022-04-21 11:40:14'),
(596, '4023701', 'LUTINA', 'LOPEZ', 'RAMON', 'RAMON LUTINA LOPEZ', '4023701', 'ING.', 'C/ MANUAL SERRANO Y C/ CABILDO Nº 11', '1976-08-31', '5211707', '72473454', 'RAMONLUTILOPEZ@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:43:58', '2022-04-21 11:43:58'),
(597, '3061322', 'CONDORI', 'TICONA', 'ROMAN', 'ROMAN CONDORI TICONA', '3061322', 'ING.', 'JOSERMO MURILLO Nº 14 HERNANDO SILES A ILLANES ZONA NORTE', '1961-08-10', '71852118', NULL, 'ROMAN0861@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:46:44', '2022-04-21 11:46:44'),
(598, '1099415', 'URIONA', 'GUZMAN', 'JULIO CESAR', 'JULIO CESAR URIONA GUZMAN', '1099415014', 'ING.', 'CALLE MARIANO SERRANO Nº 172', '1972-08-15', '63717369', NULL, 'URIONAGUZMANJULIOCESAR@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:51:22', '2022-04-21 11:51:22'),
(599, '5731949', 'ANCARI', 'CONDORI', 'MAGNO', 'MAGNO ANCARI CONDORI', '5731949015', 'ING.', 'CALLE CARLOS ROMERO Nº 220 ZONA TEMBLADERANI', '1988-04-10', '73283607', NULL, 'ANCARI.MAG@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:54:05', '2022-04-21 11:54:05'),
(600, '4889781', 'TARQUI', 'COCARAPI', 'NANCY ISABEL', 'NANCY ISABEL TARQUI COCARAPI', '4889781010', 'ING.', 'VILLA COPACABANA CALLE 18 Nº 1773', '1980-07-10', '75888178', '73506053', 'NANCYTARQUI@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:56:41', '2022-04-21 11:56:41'),
(601, '4288691', 'SAIRE', 'ARUQUIPA', 'GERMAN', 'GERMAN SAIRE ARUQUIPA', '4288691', 'ING.', 'CALLE REYES CARDONA ZONA CALLAMPAYA Nº 40', '1978-05-12', '72514296', NULL, 'GERMAN.DOCUMENTOS@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 11:58:57', '2022-04-21 11:58:57'),
(602, '3348379', 'QUISPE', 'CRUZ', 'DOMINGO GONZALO', 'DOMINGO GONZALO QUISPE CRUZ', '3348379', 'ING.', 'ZONA VILLA AROMA CALLE 7 Nº 302', '1973-08-04', '74835619', '70516935', 'AGRODOGO@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:02:17', '2022-04-21 12:02:17'),
(603, '3499160', 'ALVAREZ', 'ROQUE', 'CARMEN TANIA', 'CARMEN TANIA ALVAREZ ROQUE', '3499160', 'ING.', 'ZONA NORTE AV. PERU CALLE FINAL BENI Nº 38', '1972-07-16', '2285056', '73054150', 'TANALVOGRO@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:04:25', '2022-04-21 12:04:25'),
(604, '3357391', 'CHAVEZ', 'BERNAL', 'GIOVANAA', 'GIOVANAA CHAVEZ BERNAL', '3357391', 'ING.', 'VENANCIO BURGOA 949', '1977-08-31', '63137831', NULL, 'GIOVANNACHAVEZ3357@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:08:08', '2022-04-21 12:08:08'),
(605, '2792364', 'MEDRANO', 'PROCEL', 'FREDDY', 'FREDDY MEDRANO PROCEL', '2792364014', 'ING.', 'EL ALTO CIUDAD SATELITE PLAN 266 CALLE J ANTONIO ARZE Nº 2039', '1962-12-02', '71969513', NULL, 'MEDRANOPORFREDDY@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:14:43', '2022-04-21 12:14:43'),
(606, '5738459', 'ATAHUICHI', 'HUAYGUA', 'FRANKLIN', 'FRANKLIN ATAHUICHI HUAYGUA', '5738459018', 'ING.', 'URB. HUAJARA III M7 L8', '1970-06-06', '63650264', '25210764', 'VLDM66@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:18:27', '2022-04-21 12:18:27'),
(607, '5755875', 'UGARTE', 'LINAJA', 'TITO OSCAR', 'TITO OSCAR UGARTE LINAJA', '5755875017', 'ING.', 'sucre arica y tacna', '1985-07-17', '72354420', NULL, 'titooscar0417@gmail.com', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-04-21 12:20:37', '2022-04-21 12:20:37'),
(608, '7285023', 'CRUZ', 'MATIAS', 'REGINA RINA', 'REGINA RINA CRUZ MATIAS', '7285023', 'ABG.', '6 DE OCTUBRE Nro 1000 enrre galleguillos y cometa mamani', '1970-09-07', '74133330', NULL, 'RCRUZMAT@HOTMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-04-22 11:40:39', '2022-04-22 11:40:39'),
(609, '4909480', 'QUIROGA', 'MURILLO', 'JAIME HERNAN', 'JAIME HERNAN QUIROGA MURILLO', '4909480', 'ING.', 'IRPAVI II, AV. LAS PALMERAS Nº 100 DPTO 4D', '1984-10-16', '60166431', NULL, 'JJHHQQMM@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 11:40:15', '2022-05-03 11:40:15'),
(610, '4980864', 'PALMA', 'MONASTERIOS', 'JOSE LUIS', 'JOSE LUIS PALMA MONASTERIOS', '4980864', 'ING.', 'EL ALTO, ZONA VILLA TUNARI CALLE Nº 9', NULL, '78779167', '79505350', 'SAGIJPM_10@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 11:45:52', '2022-05-03 11:45:52'),
(611, '3713204', 'MENDIETA', 'CHOQUE', 'NATALIA', 'NATALIA MENDIETA CHOQUE', '3713204', 'ING.', 'C/BACKOVIC Nº 2176', NULL, '72454856', NULL, 'MENDIETANATALIAC@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 11:49:05', '2022-05-03 11:49:05'),
(612, '3975101', 'VARGAS', 'PAREDES', 'PATRICIA', 'PATRICIA VARGAS PAREDES', '3975101', 'ING.', 'OTERO DE LA VEGA Nº 805', '1979-11-27', '72520240', NULL, 'PAATHYY@HOTMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 11:55:23', '2022-05-03 11:55:23'),
(613, '4779558', 'QUIROGA', 'CHARCA', 'GROVER PEDRO', 'GROVER PEDRO QUIROGA CHARCA', '4779558', 'ING.', 'CALLE FRANCISCO BEDREGAL Nº 1020', '1975-10-08', '7069948', NULL, 'GROVERQUIROGA3@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 11:57:47', '2022-05-03 11:57:47'),
(614, '4260864', 'CANO', 'ESPEJO', 'DANIEL NESTOR', 'DANIEL NESTOR CANO ESPEJO', '4260864', 'ING.', 'VILLA BOLIVAR \"C\" CALLE 130 Nº 22', '1972-04-10', '71204645', NULL, 'DCANOESPEJO@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:05:48', '2022-05-03 12:05:48'),
(615, '1435558', 'MAGNE', 'JIMENEZ', 'EDGAR', 'EDGAR MAGNE JIMENEZ', '1435558', 'ING.', 'ZONA MIRAFLORES, CALLE ILLIMANI Nº 1860', '1971-09-05', '72532013', NULL, 'EDGARMAJI1@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:12:25', '2022-05-03 12:12:25'),
(616, '3559488', 'FLORES', 'SIERRA', 'FREDDY', 'FREDDY FLORES SIERRA', '3559488', 'ING.', 'BA.MAGISTERIO NRO 3-E ZONA NORTE ORURO', '1979-01-22', '73818250', NULL, 'FRED_FFP@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:14:47', '2022-05-03 12:14:47'),
(617, '5792387', 'NUÑEZ', 'CONDORI', 'CLEVER', 'CLEVER NUÑEZ CONDORI', '5792387019', 'ING.', 'CALLE SUCRE CASI ESQI. LOAIZA', '1986-08-11', '74550181', NULL, 'CLEVER_CNC@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:27:18', '2022-05-03 12:27:18'),
(618, '1866671', 'LOPEZ', 'VILLEGAS', 'JUAN CARLOS', 'JUAN CARLOS LOPEZ VILLEGAS', '1866671', 'ING.', 'LAS PILASTRAS CALLE SALOMON BENITEZ Nº 513', NULL, '73896442', '67911428', 'JCLOPEVI69@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:32:38', '2022-05-03 12:32:38'),
(619, '4273980', 'TORREZ', 'SOLARES', 'LUIS FERNANDO', 'LUIS FERNANDO TORREZ SOLARES', '4273980', 'ING.', 'AV. ENTRE RIOS Nº 1437 ZONA CHAMOCO CHICO', '1975-02-12', '72022152', NULL, 'LUISF_T@YAHOO.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:36:21', '2022-05-03 12:36:21'),
(620, '4981686', 'PALMA', 'VILLCA', 'GROVER', 'GROVER PALMA VILLCA', '4981686', 'ING.', 'C/17 Nº 200 Z. VILLA TUNARI', '1989-09-22', '68126641', NULL, 'GPVCIV@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:39:07', '2022-05-03 12:39:07'),
(621, '2455821', 'VARGAS', 'ROCHA', 'EDGAR', 'EDGAR VARGAS ROCHA', '2455821', 'ING.', 'VILLA COPACABANA AV. IMPERIAL Y CALLE 3', '1959-10-18', '68194541', '76419971', 'EDVAROC@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:42:04', '2022-05-03 12:42:04'),
(622, '4921300', 'APAZA', 'MAYTA', 'ROLANDO', 'ROLANDO APAZA MAYTA', '4921300019', 'ING.', 'ZONA 16 DE JULIO CALLE PASCOE Nº 3146', NULL, '72057101', '73284541', 'ING.ROLANDO.APAZA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:47:11', '2022-05-03 12:47:11'),
(623, '4754870', 'CONDORI', 'MENDOZA', 'MARCO ANTONIO', 'MARCO ANTONIO CONDORI MENDOZA', '4754870013', 'ING.', 'AV. CIUDAD DEL NIÑO Nº 1112', '1980-01-17', '76726165', '2255248', 'MACCIV@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-03 12:50:20', '2022-05-03 12:50:20'),
(624, '5973896', 'POMA', 'TITIRICO', 'DAVID ORLANDO', 'DAVID ORLANDO POMA TITIRICO', '5973896', 'ING.', 'ZONA EL ALTO INCA LLOJETA NRO 5323 C/D', '1984-09-03', '73018401', NULL, 'DPOMA@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-16 15:44:30', '2022-05-16 15:49:31'),
(625, '3608640', 'ECHEVERRIA', 'HERRERA', 'ROSE MARIE', 'ROSE MARIE ECHEVERRIA HERRERA', '3608640', 'ING.', 'BOLOGNIA C/5', '1966-06-27', '70728189', NULL, 'ROSEECHEVERRIA44@GMAIL.COM', 'MUJER', 'NATURAL', NULL, 'ACTIVO', '2022-05-16 15:48:26', '2022-05-16 15:48:26'),
(626, '6595528', 'MENDOZA', 'AMADOR', 'JORGE EDMUNDO', 'JORGE EDMUNDO MENDOZA AMADOR', '6595528014', 'LIC.', 'CALLE MODESTA SANJINES Nº 1114 ZONA MIRAFLORES', '1988-09-29', '2245302', '72532592', 'JORAMADOR88@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-17 10:55:42', '2022-05-17 12:34:42'),
(627, '7520926', 'SEGOVIA', 'QUENTASI', 'MIGUEL ANGEL', 'MIGUEL ANGEL  SEGOVIA QUENTASI', '7520926', 'LIC.', 'CALLE EEUU S/N', '1988-06-02', '68666865', NULL, 'BRUJO_METAL_18@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-17 12:43:39', '2022-05-17 12:43:39'),
(628, '4376377', 'COA', 'CHURA', 'ORLANDO', 'ORLANDO COA CHURA', '4376377011', 'ING.', 'ZONA HUAYNA POTOSI PSJE. CHOROLQUE No 3144', '1976-05-15', '79600285', NULL, 'ORLANDOCOA13@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-17 12:46:35', '2022-05-17 12:46:35'),
(629, '6486327', 'ZAMBRANA', 'MENESES', 'RODRIGO', 'RODRIGO ZAMBRANA MENESES', '6486327', 'ING.', 'AV. BLANCO GALINDO KM 7 1/2 BARRIO FLORIDA SUD S/N CALLE LOS CLAVELES', '1986-06-12', '62682473', '70761590', 'VALENTINALUCIANA20092019@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:42:20', '2022-05-19 10:42:20'),
(630, '7317704', 'PUSARICO', 'YUJRA', 'ROGELIO', 'ROGELIO PUSARICO YUJRA', '7317704', 'ING.', 'AV. KOLLASUYO Nº 3214 Z/ TAHUANTINSUYO', '1976-11-02', '77745150', '73556199', 'ROGELIOPY@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:46:10', '2022-05-19 10:46:10'),
(631, '330361', 'JIMENEZ', 'ALVAREZ', 'JAIME MARCIAL', 'JAIME MARCIAL JIMENEZ ALVAREZ', '330361', 'ING.', 'C. RAFAEL BUSTILLOS 1034 Z. SOPOCACHI', '1963-03-25', '71558837', NULL, 'JAIMEMARCIAL@YAHOO.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:48:26', '2022-05-19 10:48:26'),
(632, '5554136', 'MAMANI', 'CABRERA', 'JUAN SAUL', 'JUAN SAUL MAMANI CABRERA', '5554136', 'ING.', 'C. ADELA ZAMUDIO Nº 256 Z/ EL RELOJ', '1983-06-12', '72865569', NULL, 'SAUL.MAMANI@OUTLOOK.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:50:54', '2022-05-19 10:50:54'),
(633, '6157987', 'CASTRO', 'MAMANI', 'FELIX', 'FELIX CASTRO MAMANI', '6157987', 'ING.', 'C/ CRISTO VENCEDOR N 2166 Z/ MUNAYPATA', '1984-05-28', '76268588', '72025553', 'ELT.FELIX.CASTRO@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:53:46', '2022-05-19 10:53:46'),
(634, '1085963', 'TAVERA', 'FLORES', 'JHONNY ARTURO', 'JHONNY ARTURO TAVERA FLORES', '1085963', 'ING.', 'CALLE EDUARDO BERDECIO Nº 1798', '1965-03-03', '71519834', '2486870', 'JATAVERA3@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 10:59:38', '2022-05-19 10:59:38'),
(635, '3501652', 'AJATA', 'SANDOVAL', 'SAMUEL ARIEL', 'SAMUEL ARIEL AJATA SANDOVAL', '3501652', 'ING.', 'CALLE LAS MORRAS S/N BARRIO AEROPUERTO', '1973-02-16', '60261007', NULL, 'SAMUELAJATA@HOTMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 11:20:05', '2022-05-19 11:20:05'),
(636, '4048651', 'RIVERO', 'CONTRERAS', 'JHONNY JACKSON', 'JHONNY JACKSON RIVERO CONTRERAS', '4048651', 'ING.', 'av. navarra S/N', '1981-07-20', '72850406', NULL, 'jj.RiVERCON@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-19 11:52:24', '2022-05-19 11:52:24'),
(637, '3520009', 'VILLCA', 'VILLCA', 'AURELIO DELFIN', 'AURELIO DELFIN VILLCA VILLCA', '3520009019', 'ING.', 'PROV. G. VILLARROEL 25 DE SEPTIEMBRE 1973', '1973-09-25', '68580548', '71468790', 'AURELIOV725@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-24 21:31:06', '2022-05-24 21:31:06'),
(638, '3635648', 'CHOQUE', 'PADILLA', 'GUIDO', 'GUIDO CHOQUE PADILLA', '3635648', 'ING.', 'CALLE LOS CLAVELES Nº 8', '1972-07-02', '72867700', NULL, 'CHOQUEGUIDO69@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-24 21:33:52', '2022-05-24 21:33:52'),
(639, '1332667', 'NAVARRO', 'TUFIÑO', 'PETER MARIO', 'PETER MARIO NAVARRO TUFIÑO', '1332667', 'ING.', 'CALLE RICARDO MUJIA Nº 1122 ZONA SOPOCACHI', '1960-09-07', '71813114', NULL, 'ING.PETERMNT@GMAIL.COM', 'HOMBRE', 'NATURAL', NULL, 'ACTIVO', '2022-05-24 21:35:14', '2022-05-24 21:35:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_proyecto`
--

CREATE TABLE `persona_proyecto` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `persona_id` bigint(20) UNSIGNED DEFAULT NULL,
  `proyecto_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persona_proyecto`
--

INSERT INTO `persona_proyecto` (`id`, `persona_id`, `proyecto_id`, `created_at`, `updated_at`) VALUES
(2, 509, 117, NULL, NULL),
(3, 508, 119, NULL, NULL),
(4, 507, 119, NULL, NULL),
(5, 509, 116, NULL, NULL),
(6, 514, 120, NULL, NULL),
(7, 507, 120, NULL, NULL),
(8, 516, 121, NULL, NULL),
(9, 517, 121, NULL, NULL),
(10, 87, 123, NULL, NULL),
(11, 515, 123, NULL, NULL),
(12, 519, 124, NULL, NULL),
(13, 507, 124, NULL, NULL),
(14, 515, 125, NULL, NULL),
(15, 519, 126, NULL, NULL),
(16, 519, 127, NULL, NULL),
(17, 87, 128, NULL, NULL),
(18, 519, 129, NULL, NULL),
(19, 515, 130, NULL, NULL),
(20, 516, 131, NULL, NULL),
(21, 507, 131, NULL, NULL),
(22, 517, 132, NULL, NULL),
(23, 516, 133, NULL, NULL),
(24, 515, 133, NULL, NULL),
(25, 517, 134, NULL, NULL),
(26, 507, 134, NULL, NULL),
(27, 517, 135, NULL, NULL),
(28, 87, 136, NULL, NULL),
(29, 508, 138, NULL, NULL),
(30, 519, 137, NULL, NULL),
(31, 507, 140, NULL, NULL),
(32, 515, 139, NULL, NULL),
(33, 516, 141, NULL, NULL),
(34, 517, 143, NULL, NULL),
(35, 87, 142, NULL, NULL),
(36, 507, 144, NULL, NULL),
(37, 516, 145, NULL, NULL),
(38, 507, 146, NULL, NULL),
(39, 515, 147, NULL, NULL),
(40, 517, 147, NULL, NULL),
(41, 508, 148, NULL, NULL),
(42, 507, 148, NULL, NULL),
(43, 516, 150, NULL, NULL),
(44, 87, 149, NULL, NULL),
(45, 515, 151, NULL, NULL),
(46, 87, 152, NULL, NULL),
(47, 517, 152, NULL, NULL),
(48, 519, 153, NULL, NULL),
(49, 517, 154, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'MI AGUA', NULL, NULL),
(2, 'MI RIEGO', NULL, NULL),
(3, 'PAR', NULL, NULL),
(4, 'PIU', NULL, NULL),
(5, 'FOCCIP', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

CREATE TABLE `proyectos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `convocatoria` int(11) NOT NULL DEFAULT 1,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `precio` decimal(20,2) NOT NULL DEFAULT 0.00,
  `plazo` int(11) NOT NULL DEFAULT 0,
  `lotes` int(11) NOT NULL DEFAULT 1,
  `cuce` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento_id` bigint(20) UNSIGNED DEFAULT NULL,
  `programa_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tipo_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id`, `nombre`, `convocatoria`, `fecha`, `hora`, `link`, `precio`, `plazo`, `lotes`, `cuce`, `observacion`, `departamento_id`, `programa_id`, `tipo_id`, `created_at`, `updated_at`) VALUES
(1, 'SUP. TEC. SAP LLUSCAMAYO - SANTA ELENA CHORO GRANDE (APOLO CORIPATA)', 1, '2021-03-26', '10:30:00', '', '181100.00', 240, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'DESCOM FI SAP LLUSCAMAYO - SANTA ELENA CHORO  GRANDE (APOLO CORIPATA)', 1, '2021-03-30', '11:30:00', '', '141770.00', 240, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'SUP. TEC. SIST. DE RIEGO DISTRITO JOKOPAMPA (PUERTO CARABUCO) SISTEMA 1 Y 2', 1, '2021-03-30', '11:30:00', '', '249000.00', 365, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'CONST. SIST. AGUA POTABLE CORPACHILAYA (CHU COCANI)', 1, '2021-03-31', '10:30:00', '', '1547285.20', 180, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'CONST. PUENTE VEHICULAR THURI JACKE JAWIRA (PUERTO CARABUCO)', 1, '2021-04-06', '11:30:00', '', '950551.30', 180, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'SUP. TEC. SAP. CORPACHILAYA PI?UTA (CHUA COCANI CHARA?A)', 1, '2021-04-09', '11:30:00', '', '112654.98', 180, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'CONCLUSI?N CONSTRUCCI?N DE CORDONES DE SUJECI?N Y CUNETAS DE VIA (LPZ-LPZ) 2 LOTES', 1, '2021-04-09', '12:30:00', '', '4434999.52', 45, 1, '', 'NINGUNA', 2, 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'DESCOM FI SAP CORPACHILAYA PI?UTA (CHUA COCANI  CHARA?A)', 1, '2021-04-15', '10:30:00', '', '91300.15', 180, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'SUP. TEC. PUENTE VEHICULAR WILA JAWIRA -THURI JACKE JAWIRA (LURIBAY ? PUERTO CARABUCO)', 1, '2021-04-19', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'CONST. PUENTE VEHICULAR WILA JAWIRA (LURIBAY)', 1, '2021-04-22', '11:30:00', '', '658800.39', 180, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'SUP. TEC. PUENTE VEHICULAR TOHOMONOCO (PALOS BLANCOS)', 1, '2021-04-23', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'SUP. TEC. SIST. RIEGO PRESA SENKA ALTA  (CALAMARCA)', 1, '2021-04-27', '11:30:00', '', '223553.00', 270, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'SUP. TEC. SIST. RIEGO PRESA SENKA ALTA  (CALAMARCA)', 1, '2021-04-27', '11:30:00', '', '223553.00', 270, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'CONST. PUENTE VEHICULAR TOHOMONOCO (PALOS BLANCOS)', 1, '2021-04-29', '11:00:00', '', '1849418.33', 278, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'CONST. SIST. AGUA POTABLE ALQA QHUTA FASEI (PUCARANI) LOTE 1,2,Y 3', 1, '2021-06-04', '10:30:00', '', '0.00', 180, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'AMPL. SIST. ALCANT. SANIT. CON DESCARGA A UN SIST. BOMBEO D-8 ETAPA IV (CIUDAD EL ALTO)', 1, '2021-06-08', '11:30:00', '', '4419305.79', 180, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'AMPL. SIST. ALCANT. SANIT. CON DESCARGA A UN SIST. BOMBEO D-8 ETAPA III (CIUDAD EL ALTO)', 1, '2021-06-15', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'CONST. DE OBRAS PARA EL CONTROL DE DESLIZAMIENTOS CUENCA ALPACOMA TORRENTERA TITIRI (ACHOCALLA)', 1, '2021-06-18', '11:30:00', '', '0.00', 180, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'SUP. TEC. DE OBRAS PARA EL CONTROL DE DESLIZAMIENTOS CUENCA ALPACOMA TORRENTERA TITIRI (ACHOCALLA)', 1, '2021-06-28', '11:00:00', '', '0.00', 180, 1, '', 'NINGUNA', 2, 4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'CONST. SIST. DE RIEGO AYLLUS ORIGINARIOS ANTARANI Y JALANTANI (COMANCHE)', 1, '2021-06-29', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'SUP. TEC. ALCANTARILLADO SANIT. CON DESCAGA A  SIST. BOMBEO D-8 ETAPA IV (CIUDAD EL ALTO)', 1, '2021-06-30', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'SUP. TEC. ALCANTARILLADO SANIT. CON DESCARGA A SIST. BOMBEO D-8 ETAPA III (CIUDAD EL ALTO)', 1, '2021-07-01', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'CONCL. MEJ. SIST. AGUA POTABLE AREA URBANA MAPIRI (MAPIRI)', 1, '2021-07-02', '10:00:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'SUP TEC. SIST. DE RIEGO AYLLUS ORIGINARIOS ANTARANI Y JALANTANI (COMANCHE)', 1, '2021-07-07', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'CONCLUSI?N CONSTRUCCI?N DE CORDONES DE SUJECI?N, CUNETAS DE VIA Y ELEVACION Y REDUCCION DE CAMARAS (LPZ-VIA) (LOTE 1)', 1, '2021-07-09', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'SUP. TECNICA SISTEMA DE RIEGO HAMPATURI ALTO - (HAMPATURI) (LA PAZ)) LOTE 1', 1, '2021-07-12', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'SUP. TECNICA SISTEMA DE RIEGO HAMPATURI - BAJO CENTRO - CHICANI Y CHINCHAYA  -  (HAMPATURI (LA PAZ)) LOTE 2 Y LOTE 3', 1, '2021-07-13', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'AMPL. ALCANTARILLADO SANIT. CON DESCARGA A SIST. BOMBEO D-8 ETAPA IV (CIUDAD EL ALTO)', 1, '2021-07-13', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'SUP. TECNICA SISTEMA DE RIEGO HAMPATURI - BAJO CENTRO - CHICANI Y CHINCHAYA  -  (HAMPATURI (LA PAZ)) LOTE 2 Y LOTE 3', 1, '2021-07-13', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'CONST. SIST. DE RIEGO ULLUMANI-VISCACHALA (CAJUATA)', 1, '2021-07-14', '11:30:00', '', '180.00', 180, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'SUP. TEC.  SIST. DE RIEGO ULLUMANI-VISCACHALA (CAJUATA)', 1, '2021-07-15', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'SUP. TEC- SIST. AGUA POTABLE ALQA QHUTA FASE I (PUCARANI)', 1, '2021-07-20', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'CONST. SIST DE RIEGO MAYOR PARA COMUNIDADES DEL DISTRITO HAMPATURI (LA PAZ)', 1, '2021-07-22', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'CONST. SIST. AGUA POTABLE PONGO (PALCA)', 1, '2021-07-30', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'CONST. SIST. AGUA POTABLE COMUNIDAD CA?AVIRI (UMALA)', 1, '2021-08-04', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'SUP. TEC. PONGO COMUNIDAD CA?AVIRI (PALCA UMALA)', 1, '2021-08-05', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'ALQUILER DE TRANSPORTE CON CARGUIO Y DESCARGUIO (LPZ-LAP) LOTE 1  Y 2', 1, '2021-08-13', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'SUP. TEC. AMPL. SISTEMA DE RIEGO QHONQHO LIQUILIQUI (JESUS DE MACHACA)', 1, '2021-08-19', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'AMPL. SISTEMA DE RIEGO QHONQHO LIQUILIQUI (JESUS DE MACHACA)', 1, '2021-08-20', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'DESCOM FI SIST. AGUA POTABLE PONGO COMUNIDAD CA?AVIRI (PALCA UMALA)', 1, '2021-08-27', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'APERTURA DE PROP.: ADQUISICI?N Y COLOCADO DE PLACAS DE NOMINACION DE CALLES (LPZ-LAP) LOTES 1,2,3', 1, '2021-09-07', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'SUP. CONST. SIST. MICRORIEGO TUPALANI CUSUPAYA ESTAMAYA, CAPIYUNI (SGO. MACHACA)', 1, '2021-09-14', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'SUP. CONST.SIST. RIEGO COM. COLLANA (AYO AYO)', 1, '2021-09-15', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'CONST. SIST. MICRORIEGO TUPALANI CUSUPAYA ESTAMAYA CAPIYUNI (SGO. DE MACHACA)', 1, '2021-09-15', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'CONST. SIST. RIEGO LILLIMANI (PUCARANI)', 1, '2021-09-15', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'ACOMPA?AMIENTO Y ATI SIS. MIRORIEGO TUPALANI CUSUPAYA ESTAMAYA CAPIYUNI (SGO. MACHACA)', 1, '2021-09-16', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'ACOMPA?AMIENTO ATI. SIST. RIEGO LILLIMANI (PUCARANI)', 1, '2021-09-16', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'SUP. CONST. RIEGO LILLIMANI (PUCARANI)', 1, '2021-09-17', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ACOMPA?AMIENTO ATI SIST. RIEGO COM. COLLANA (AYO AYO)', 1, '2021-09-17', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'CONST. SIST. DE MICRORIEGO WATACA?A (MALLA)', 1, '2021-09-20', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'CONST. SIST. DE RIEGO CANQUI CHICO  (INQUISIVI)', 1, '2021-09-21', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'CONST. SIST. AGUA POTABLE MURO MAMANI (ACHACACHI)', 1, '2021-09-23', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'CONST. SIST. RIEGO COM. COLLANA (AYO AYO)', 1, '2021-09-24', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'SUP. CONST. SIST. DE MICRORIEGO WACATACA?A (MALLA)', 1, '2021-09-29', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'SUP. TEC. CONST. SIST. DE RIEGO CANQUI CHICO (INQUISIVI)', 1, '2021-09-29', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'DESCOM SIST. AGUA POTABLE ALQA QHUTA FASE I (PUCARANI)', 1, '2021-10-06', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'AMPL. SIST. DE RIEGO TACACHACA (TACACOMA)', 1, '2021-10-07', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'CONST. SIST. RIEGO SULLKATITI ARRIBA (J. D. MACHACA)', 1, '2021-10-08', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'DESCOM FI SIST. DE AGUA POTABLE MURUMAMANI (ACHACACHI)', 1, '2021-10-14', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'SUP. TEC. SIST. DE RIEGO TACACHACA (TACACOMA)', 1, '2021-10-14', '14:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'SUP. SIST. RIEGO SULLKATITI ARRIBA (J. D. MACHACA)', 1, '2021-10-15', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'SUP. TEC. SIST. DE AGUA POTABLE MURUMAMANI (ACHACACHI)', 1, '2021-10-15', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'SUP. MEJ. SIST. RIEGO SAN ANTONIO (GUAQUI)', 1, '2021-10-18', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'CONST. SIST. RIEGO SUBCENTRAL LARIPATA (SORATA)', 1, '2021-10-18', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'ACOMPA?AMIENTO Y ATI. RIEGO SUILLKATITI ARRIBA (J. D. MACHACA)', 1, '2021-10-19', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'ACOMPA?AMIENTO Y ATI. SIST. RIEGO SAN ANTONIO (GUAQUI)', 1, '2021-10-20', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'MEJ. SIST. RIEGO SAN ANTONIO (GUAQUI)', 1, '2021-10-20', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'CONST. SISTEMA DE RIEGO PARARANI (CAIROMA)', 1, '2021-10-21', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'CONST. PUENTE VEHICULAR CHAPI CHAPINI( LURIBAY)', 1, '2021-10-22', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'ONST. SISTEMA DE RIEGO AHIJADERA (CAIROMA)', 1, '2021-10-25', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'CONST. SIST. DE RIEGO TOPOHOCO (CORO CORO)', 1, '2021-10-25', '14:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'CONST. SISTEMA DE RIEGO LLOJA (CAIROMA)', 1, '2021-10-26', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'IMPLEMENTACION ALUMBRADO PUBLICO DISTRITOS EL ALTO(LPZ-ELA)', 1, '2021-11-02', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 4, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'CONST. SIST. RIEGO CHU?U?A NORTE (ANCORAIMES)', 1, '2021-11-03', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'ACOMPA?AMIENTO Y ATI. AMPL. SISTEMA DE RIEGO QHONQHO LIQUILIQUI (JESUS DE MACHACA)', 1, '2021-11-04', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'MEJORAMIENTO SISTEMA DE RIEGO AZAMBO (LURIBAY)', 1, '2021-11-04', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'CONCL. SUP. SIST. AGUA POTABLE AREA URBANA  MAPIRI (MAPIRI)', 1, '2021-11-08', '14:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'MEJ. SIST. RIEGO CHIPUYO QUIABAYA Y JATICHULAYA (CHARAZANI)', 1, '2021-11-09', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'MEJ. SIST. DE MICRORIEGO SECTOR JIWA?A (SANTIAGO DE MACHACA)', 1, '2021-11-10', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'CONST. SIST DE RIEGO S.MATARA - CHIRIMAYA (LURIBAY)', 1, '2021-11-10', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'MEJ. SIST. RIEGO CACHAPAYA (PALCA)', 1, '2021-11-11', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'MEJ. SIST. DE RIEGO SAPAHAQUI COM. TARQUIMAYA ?CAATA (SAPAHAQUI)', 1, '2021-11-12', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'SUP. TEC. SIST.DE RIEGO SUBCENTRAL LARIPATA (SORATA)', 1, '2021-11-15', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'CONST. SIST. RIEGO COM. VILAQUE (STGO. DE CALLAPA)', 1, '2021-11-15', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'SUP. TEC. SIST.DE RIEGO SUBCENTRAL LARIPATA (SORATA)', 1, '2021-11-15', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'SUP. TEC. SIST. DE RIEGO TOPOHOCO (CORO CORO)', 1, '2021-11-16', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'SUP. IMPL. ALUMBRADO PUBLICO EL ALTO - (LPZ-ELA)', 1, '2021-11-17', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 4, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'SUP. TEC. SIST. DE REIGO CHU?U?A NORTE (ANCORAIMES)', 1, '2021-11-18', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'SUP. TEC. SISTEMA DE RIEGO AZAMBO (LURIBAY)', 1, '2021-11-18', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'SUP. TEC. SIST. RIEGO CHIPUYPO QUIABAYA Y JATICHULAYA (CHARAZANI)', 1, '2021-11-19', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'SUP. TEC. SIST. RIEGO S. MATARA CHIRIMAYA (LURIBAY)', 1, '2021-11-19', '14:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'CONST. SIST- RIEGO SUB CENTRAL UCHAMBAYA (CAIROMA)', 1, '2021-11-19', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'CONST. SIST. AGUA POTABLE COMUNIDAD TIRMA (LA PAZ)', 1, '2021-11-22', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'SUP. TEC. SIST. RIEGO COM VILAQUE (STAGO. CALLAPA)', 1, '2021-11-23', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'ACOMPA?AMIENTO Y ATI. SISTEMA DE RIEGO CHU?U?A NORTE (ANCORAIMES)', 1, '2021-11-26', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'ACOMPA?AMIENTO Y ATI. SISTEMA DE RIEGO AZAMBO (LURIBAY)', 1, '2021-11-26', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'SUP. TEC. SIST. RIEGO SUB CENTRAL UCHAMBAYA (CAIROMA)', 1, '2021-11-29', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'SUP. TEC. SISEMA DE RIEGO CAHCAPAYA (PALCA)', 1, '2021-11-29', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'CONST. SAP COMUNIDAD APANA-UMAPAYA-COM. CHIRINI - TIQUIMANI-UMAPALCA (LA PAZ)', 1, '2021-11-30', '10:32:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'MEJ. SAP COM. YURUMANI COMUNIDAD COBIJA (LA PAZ)', 1, '2021-11-30', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'ACOMPA?AMIETO Y ATI. SIST. RIEGO S. MATARA CHIRIMAYA (LURIBAY)', 1, '2021-12-01', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'ACOMPA?AMIENTO Y ATI. SIST. RIEGO CHIPUYPO QUIABAYA Y JATICHULAYA (CHARAZANI)', 1, '2021-12-01', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'ACOMPA?AMIENTO Y ATI. MEJ., SISTEMA DE RIEGO CACHAPAYA (PALCA)', 1, '2021-12-03', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'ACOMPA?AMIENTO Y ATI. SIST. RIEGO COM. VILAQUE (STGO. DE CALLAPA)', 1, '2021-12-03', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'ACOMPA?AMIENTO Y ATI. SIST. -RIEGO SUB CENTRAL UCHAMBAYA (CAIROMA)', 1, '2021-12-07', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'CONST. PUENTE VEHICULAR CONDADO KHOLA ALTA Y KHOLA BAJA (SAPAHAQUI)', 1, '2021-12-17', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'MEJ. SISTEMA DE RIEGO PRESURIZADO COM. CHICOMA (SAPAHAQUI)', 1, '2021-12-17', '14:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'SUP. TEC. SIST. DE RIEGO SUBCENTRAL LARIPTA - SORATA)', 1, '2021-12-22', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'SUP. TEC. SIST. RIEGO SAPAHAQUI COM. TARQUIMAYA CAATA(SAPAHAQUI)', 1, '2021-12-23', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'SUP. TEC. SISTEMA DE RIEGO PARARANI (CAIROMA)', 1, '2021-12-27', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'SUP. TEC. SISTEMA DE RIEGO LLOJA (CAIROMA)', 1, '2021-12-27', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'SUP. TEC. SISTEMA DE MICRO RIEGO SECTOR JIWA?A (SANTIAGO DE MACHACA)', 1, '2021-12-28', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'SUP. TEC. SISTEMA DE RIEGO AHIJADERA PRESURIZADO COM CHICOMA (SAPAHAQUI- CAIROMA)', 1, '2021-12-28', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 2, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'SUP. TEC. SIST. AGUA POTABLE COM. CHIRINI-TIQUIMANI-UMAPALCA-APANA UMAPAYA (LA PAZ)', 1, '2021-12-29', '10:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'SUP. TEC. SIST. AGUA POTABLE COM. YURUMANI  COBIJA ? TIRMA (LA PAZ)', 1, '2021-12-29', '12:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'SUP. TEC. PUENTE VEHICULAR CONDODAO KHOLA ALTA Y KHOLA BAJA  - CHAPI CHAPINI (SAPAHAQUI LURIBAY)', 1, '2021-12-30', '11:30:00', '', '0.00', 0, 1, '', 'NINGUNA', 2, 3, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'SUP. TEC. SIST. DE RIEGO SUBCENTRAL LARIPATA (SORATA)', 1, '2022-02-02', '10:30:00', 'https://meet.google.com/adp-pudi-etr', '250000.00', 365, 1, '22-0287-01-1173895-3-1', NULL, 2, 2, 1, '2022-02-01 10:34:56', '2022-02-02 10:40:39'),
(119, 'CONST. SIST. DE RIEGO COMUNIDAD WALATA GRANDE (ACHACACHI)', 1, '2022-02-03', '10:30:00', 'https://meet.google.com/agm-unei-nit', '7067520.48', 310, 1, '22-0287-01-1193809-1-1', NULL, 2, 2, 1, '2022-02-03 09:14:18', '2022-02-03 09:14:18'),
(120, 'MEJ. SIST. RIEGO CHIPUYO QUIABAYA Y JATICHULAYA (CHARAZANI)', 1, '2022-02-16', '10:30:00', 'https://meet.google.com/bgf-cift-sge', '2020195.40', 210, 1, '22-0287-01-1168603-2-1', NULL, 2, 2, 1, '2022-02-14 12:08:25', '2022-02-14 12:09:31'),
(121, 'CONST. SIST. RIEGO ALTO PATACAMAYA (PATACAMAYA)', 1, '2022-02-22', '10:30:00', 'https://meet.google.com/odz-byqe-dzf', '2415379.34', 180, 1, '22-0287-01-1193811-1-1', NULL, 2, 2, 1, '2022-02-21 10:35:03', '2022-02-21 10:35:03'),
(123, 'programa de infraestructura urbana para la generación de empleo ii bol 32/2018 implem. alumbrado publico ciudad de el alto (ciudad de el alto)', 1, '2022-02-23', '10:30:00', 'https://meet.google.com/hkz-ohbb-uzc', '11152697.53', 150, 1, '22-0287-01-1193584-1-1', NULL, 2, 4, 1, '2022-02-23 08:40:47', '2022-02-23 08:40:47'),
(124, 'SUP. TEC. SIST. DE RIEGO COMUNIDAD WALATA GRANDE (ACHACACHI)', 1, '2022-02-23', '14:30:00', 'https://meet.google.com/pci-hdax-ugi', '320000.00', 310, 1, '22-0287-01-1197608-1-1', NULL, 2, 2, 1, '2022-02-23 11:46:20', '2022-02-23 14:30:24'),
(125, 'SUP. CONST. SIST. RIEGO ALTO PATACAMAYA (PATACAMAYA)', 1, '2022-03-03', '10:30:00', 'https://meet.google.com/yxq-ndcw-stq', '120768.00', 180, 1, '22-0287-01-1199452-1-1', NULL, 2, 2, 2, '2022-03-02 13:43:29', '2022-03-03 09:33:48'),
(126, 'ACOMPAÑAMIENTO Y ATI. SIST. RIEGO ALTO PATACAMAYA (PATACAMAYA)', 1, '2022-03-04', '11:30:00', 'https://meet.google.com/vpu-ddpn-bfj', '100000.00', 180, 1, '22-0287-01-1199506-1-1', NULL, 2, 2, 2, '2022-03-04 10:11:22', '2022-03-04 10:11:22'),
(127, 'Supervision Construccion Enlosetado: Lote 1: Sup. Const. Enlosetado Avenida Cancañiri (Llallagua); Lote 2: Sup. Const. Enlosetado Avenida Montes (Llallagua); Lote 3: Sup. Const. Enlosetado Calle Alianza (Llallagua).', 1, '2022-03-07', '11:30:00', 'https://meet.google.com/esb-bdfs-pws', '101377.32', 90, 3, '22-0287-05-1200531-1-1', NULL, 3, 4, 2, '2022-03-07 10:10:18', '2022-03-07 11:40:29'),
(128, 'SUP. TEC. SISTEMA DE MICRO RIEGO SECTOR JIWAÑA (SANTIAGO DE MACHACA)', 1, '2022-03-11', '10:30:00', 'https://meet.google.com/kry-ozow-kef', '95871.00', 180, 1, '22-0287-01-1197663-1-1', NULL, 2, 3, 2, '2022-03-11 09:52:26', '2022-03-11 09:52:26'),
(129, 'ACOMPAÑAMIENTO Y ASISTENCIA TECNICA INTEGRAL SISTEMA DE RIEGO LLOJA (CAIROMA)', 1, '2022-03-11', '12:30:00', 'https://meet.google.com/vnw-pjnf-xrv', '83400.00', 180, 1, '22-0287-01-1197661-1-1', NULL, 2, 3, 2, '2022-03-11 11:28:03', '2022-03-11 11:29:00'),
(130, 'ACOMPAÑAMIENTO Y ASISTENCIA TECNICA INTEGRAL SISTEMA DE MICRO RIEGO SECTOR JIWAÑA (SANTIAGO DE MACHACA)', 1, '2022-03-15', '10:30:00', 'https://meet.google.com/hay-ouxy-wcs', '87882.00', 180, 1, '22-0287-01-1197675-1-1', NULL, 2, 3, 2, '2022-03-15 08:52:20', '2022-03-15 08:52:20'),
(131, 'ACOMPAÑAMIENTO Y ASISTENCIA TECNICA INTEGRAL SISTEMA DE RIEGO PARARANI (CAIROMA)', 1, '2022-03-15', '12:30:00', 'https://meet.google.com/ukh-askc-fwx', '75000.00', 180, 1, '22-0287-01-1197676-1-1', NULL, 2, 3, 2, '2022-03-15 11:39:12', '2022-03-15 11:39:12'),
(132, 'CONST. ENLOSETADO VIAS URBANAS Y DRENAJE J.V. 8 DE DICIEMBRE (SANTA ROSA)', 1, '2022-03-22', '11:30:00', 'https://us02web.zoom.us/j/89452841439?pwd=eUVpZkJ2M0ZibzAwZE1KL2tFcFp2Zz09', '2803392.49', 120, 1, '22-0287-08-1195607-1-1', NULL, 6, 4, 1, '2022-03-22 11:14:33', '2022-03-22 11:14:33'),
(133, 'CONST. SIST. DE RIEGO ALTO PEÑAS - KERANI (BATALLAS)', 1, '2022-03-28', '10:30:00', 'https://meet.google.com/nkp-ztrt-gzp', '28036784.58', 420, 1, '22-0287-01-1191951-1-1', NULL, 2, 2, 1, '2022-03-28 09:34:04', '2022-03-28 09:34:04'),
(134, 'CONST. SIST. AGUA POTABLE POBLACION COPALANI (LA ASUNTA)', 1, '2022-04-04', '10:30:00', 'https://meet.google.com/wta-fmkq-qeq', '997334.19', 180, 1, '22-0287-01-1202261-1-1', NULL, 2, 1, 1, '2022-04-04 10:07:35', '2022-04-04 10:07:35'),
(135, 'SUP. TEC. SIST. DE RIEGO COMUNIDAD WALATA GRANDE (ACHACACHI)', 1, '2022-04-07', '11:30:00', 'https://meet.google.com/vpp-xzix-nob', '320000.00', 60, 1, '22-0287-01-1197608-2-1', NULL, 2, 2, 1, '2022-04-07 11:36:40', '2022-04-07 12:01:21'),
(136, 'SUP. TEC. SISTEMA DE RIEGO AHIJADERA PRESURIZADO COM. CHICOMA (CAIROMA SAPAHAQUI)', 1, '2022-04-11', '10:30:00', 'https://meet.google.com/zen-xbgt-ofu', '157320.06', 180, 1, '22-0287-01-1185134-2-1', NULL, 2, 3, 2, '2022-04-11 10:30:41', '2022-04-11 10:30:41'),
(137, 'SUP. TEC. SIST. AGUA POTABLE POBLACION COPALANI (LA ASUNTA)', 1, '2022-04-12', '10:30:00', 'https://meet.google.com/ciu-otcr-aga', '54000.00', 180, 1, '22-0287-01-1202288-1-1', NULL, 2, 1, 2, '2022-04-12 09:21:21', '2022-04-12 09:21:21'),
(138, 'DESCOM FI ALCANTARILLADO SANIT. CON DESCARGA A SIST. BOMBEO D-8 ETAPA IV (CIUDAD EL ALTO)', 1, '2022-04-12', '10:30:00', 'https://meet.google.com/cec-egbk-rqs', '200000.00', 180, 1, '22-0287-01-1202296-1-1', NULL, 2, 1, 2, '2022-04-12 11:12:40', '2022-04-12 13:42:46'),
(139, 'DESCOM SIST. ALCANT. SANIT. CON DESCARGA A UN SIST. BOMBEO D-8 ETAPA III (CIUDAD EL ALTO)', 1, '2022-04-12', '11:30:00', 'https://meet.google.com/kfy-pnbt-quc', '200000.00', 210, 1, '22-0287-01-1202295-1-1', NULL, 2, 1, 2, '2022-04-12 11:28:49', '2022-04-12 11:28:49'),
(140, 'DESCOM SIST. AGUA POTABLE POBLACION COPALANI (LA ASUNTA)', 1, '2022-04-12', '00:30:00', 'https://meet.google.com/xeo-thqi-vko', '40692.55', 180, 1, '22-0287-01-1202292-1-1', NULL, 2, 1, 2, '2022-04-12 12:28:26', '2022-04-12 12:28:26'),
(141, 'ACOMPAÑAMIENTO Y ATI SIST.RIEGO PRESURIZADO COM CHICOMA AHIJADERA (SAPAHAQUI CAIROMA)', 1, '2022-04-14', '11:30:00', 'https://meet.google.com/drv-xepp-jof', '138291.61', 180, 1, '22-0287-01-1208784-1-1', NULL, 2, 3, 2, '2022-04-14 11:18:10', '2022-04-14 11:19:37'),
(142, 'MEJ. CAMINO VECINAL HUATAJATA - SONCACHI CHICO (HUATAJATA)', 1, '2022-04-19', '11:30:00', 'https://meet.google.com/dnw-mweo-kha', '272620.60', 180, 1, '22-0287-01-1202601-1-1', NULL, 2, 3, 1, '2022-04-19 09:22:18', '2022-04-19 09:22:18'),
(143, 'ACOMPAÑAMIENTO Y ATI. SIST. RIEGO SAPAHAQUI COM. TARQUIMAYA-CAATA (SAPAHAQUI)', 1, '2022-04-21', '11:30:00', 'https://meet.google.com/gfc-mdey-xei', '260000.00', 240, 1, '22-0287-01-1211755-1-1', NULL, 2, 2, 2, '2022-04-21 11:11:11', '2022-04-21 11:11:11'),
(144, 'CONCL. DESCOM- FI SAP SIQUI AMPL SAP SIST. AGUA POTABLE MARQUIRIVI (CALACOTO COLQUENCHA)', 1, '2022-04-22', '11:30:00', 'https://meet.google.com/rgw-rexf-tgi', '91559.50', 240, 1, '22-0287-01-1202299-1-1', NULL, 2, 1, 2, '2022-04-22 10:49:10', '2022-04-22 10:51:35'),
(145, 'SUP. TEC. SIST. DE RIEGO SUBCENTRAL LARIPATA (SORATA)', 1, '2022-04-25', '10:30:00', 'https://meet.google.com/vhw-nrom-hxd', '250000.00', 365, 1, '22-0287-01-1173895-4-1', NULL, 2, 2, 1, '2022-04-25 10:10:31', '2022-04-25 10:10:31'),
(146, 'SUP. TEC. CAM. VECINAL HUATAJATA - SONCACHI CHICO – MURO CONT.COM. HUAYHUASI (HUATAJATA MECAPACA)', 1, '2022-05-03', '11:30:00', 'https://meet.google.com/imi-ujvn-hgh', '116000.00', 180, 1, '22-0287-01-1212627-1-1', NULL, 2, 3, 2, '2022-05-03 09:20:26', '2022-05-03 11:27:49'),
(147, 'CONST. MURO DE CONTENCION EN RIO LA PAZ COM. HUAYHUASI (MECAPACA)', 1, '2022-05-04', '11:30:00', 'https://meet.google.com/nsf-kkhs-dpa', '3120708.18', 180, 1, '22-0287-01-1208804-1-1', NULL, 2, 3, 1, '2022-05-04 10:37:09', '2022-05-04 10:37:09'),
(148, 'CONST. SIST. RIEGO COM. PAIRUMANI, ICRANA Y SIPE SIPE (HUARINA)', 1, '2022-05-09', '10:30:00', 'https://meet.google.com/yae-hpns-kpp', '10035837.75', 300, 1, '22-0287-01-1208799-1-1', NULL, 2, 2, 1, '2022-05-09 09:01:11', '2022-05-09 09:01:11'),
(149, 'SUP. CONST. ENLOSETADO VIAS URBANAS Y DRENAJE J.V. 8 DE DICIEMBRE (SANTA ROSA)', 1, '2022-05-16', '15:30:00', 'https://us02web.zoom.us/j/83610578978?pwd=ZFlXUzJzWXdQMTRtNk5SaGhWRXVjQT09', '750000.00', 120, 1, '22-0287-08-1201294-1-2', NULL, 6, 4, 2, '2022-05-16 15:28:24', '2022-05-16 15:28:24'),
(150, 'DESCOM SIST. AGUA POTABLE COMUNIDAD APANA-UMAPAYA CHIRINI-TIQUIMANI-UMAPALCA (LA PAZ)', 1, '2022-05-17', '10:30:00', 'https://meet.google.com/uwp-ifzj-xcx', '60106.72', 120, 2, '22-0287-01-1218963-1-1', NULL, 2, 1, 2, '2022-05-17 10:26:16', '2022-05-17 10:26:16'),
(151, 'DESCOM SIST. AGUA POTABLE COM. YURUMANI - TIRMA COBIJA (LA PAZ)', 1, '2022-05-17', '12:30:00', 'https://meet.google.com/eai-aacv-ovi', '69000.00', 120, 3, '22-0287-01-1218961-1-1', NULL, 2, 1, 2, '2022-05-17 12:16:39', '2022-05-17 12:16:39'),
(152, 'SUP. TEC. SIST. DE RIEGO ALTO PEÑAS - KERANI (BATALLAS)', 1, '2022-05-18', '11:30:00', 'https://meet.google.com/foy-ewmo-fmo', '800000.00', 420, 1, '22-0287-01-1215062-1-1', NULL, 2, 2, 1, '2022-05-18 11:26:18', '2022-05-18 11:32:32'),
(153, 'PROGRAMA DE INFRAESTRUCTURA URBANA PARA LA GENERACIÓN DE EMPLEO II SUP. TEC. IMPLEM. ALUMBRADO PUBLICO CIUDAD DE EL ALTO (CIUDAD EL ALTO)', 1, '2022-05-19', '10:30:00', 'https://meet.google.com/akh-xeuo-mwq', '200000.00', 150, 1, '22-0287-01-1218958-1-1', NULL, 2, 4, 2, '2022-05-19 10:08:18', '2022-05-19 10:08:18'),
(154, 'SUP. TEC. SIST. RIEGO COM. PAIRUMANI, ICRANA Y SIPE SIPE (HUARINA)', 1, '2022-05-24', '11:30:00', 'https://meet.google.com/qek-zqje-tnb', '215666.92', 300, 1, '22-0287-01-1220010-1-1', NULL, 2, 2, 2, '2022-05-24 21:28:36', '2022-05-24 21:28:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto_user`
--

CREATE TABLE `proyecto_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sociedads`
--

CREATE TABLE `sociedads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombreEmpresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombreLegal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NINGUNA',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sociedads`
--

INSERT INTO `sociedads` (`id`, `nombreEmpresa`, `codigo`, `nombreLegal`, `direccion`, `fono1`, `fono2`, `email`, `departamento`, `observacion`, `created_at`, `updated_at`) VALUES
(1, 'ASOCIACION ACCIDENTAL  \'SAN PEDRO\'', '10001', 'ROLANDO ALFONZO SURRIABLE VALLEJOS', 'TARIJA, BARRIO LAS PANOSAS, CALLE ISACC ATTIE S/N', '46652601', '46652601', 'ROLANDOSURRIABLE@YAHOO.ES', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'ASOCIACION ACCIDENTAL  HYDROTECH Y ASOCIADOS', '10002', 'OMAR CHISTIAN MORALES GOMEZ', 'TARIJA, HUGO LOPEZ DOLZ N? 39 BARRIO EL CARMEN', '75114411', '', 'HYDROTECHTARIJA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'ASOCIACION ACCIDENTAL \'BROCA\'', '10004', 'OSVALDO WALTER CHAMBI CALIZAYA', 'ORURO, AYACUCHO N? 352 ENTRE PAGADOR Y POTOSI', '78820903', '', 'OSAVALDOWALTERCHAMBIC@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'ASOCIACION ACCIDENTAL \'C.S.I. - COMRO S.R.L.\'', '10005', 'FREDDY OSVALDO MOSCOSO MOSCOSO', 'LA PAZ, EL ALTO OBRAJES CALLE JOSE MONTERO N? 992', '70181118', '', 'CSI_CONSTRUCTORA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'ASOCIACION ACCIDENTAL \'CAUSE\'', '10006', 'CESAR LUIS CARDOZO ORTIZ', 'TARIJA BARRIO SAN ROQUE CALLE 1362', '68691574', '62621836', 'CESAR_4531@HOTMAIL.COM', 'TARIJA', 'Null', '0000-00-00 00:00:00', '2022-04-25 10:43:37'),
(7, 'ASOCIACION ACCIDENTAL \'ECOFER ARGOS\'', '10007', 'VICTOR MIGUEL FERNANDEZ SALAZAR', 'C. HUGO ESTRADA EDIF. OLIMPA PISO 2, OF. 3 PLAZA ESTADIUM N?', '0', '', '@', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'ASOCIACION ACCIDENTAL G6G Y ASOCIADOS', '10008', 'GERMAN GONZALO GAMBOA CORDOVA', 'COBIJA, BARRIO NAZARIA AV. MANURIPI N? 05 ESQ. CALLE PEDRO VILLALOBOS', '75102610', '', 'G3GAMBOACORDOVA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'ASOCIACION ACCIDENTAL \'COREL\'', '10009', 'LUIS ELIO JUANIQUINA AJHUACHO', 'AV. VELASCO GALVARRO N? 2993 KENNEDY Y VILLAZON', '67201615', NULL, 'CONST_CONSULT_RELCONS@YAHOO.COM', NULL, 'Null', '0000-00-00 00:00:00', '2022-05-18 12:04:16'),
(10, 'ASOCIACION ACCIDENTAL \'JJES CONSTRUCCIONS -OROPEZA\'', '10010', 'DANIEL OROPEZA MERCADO', 'LA PAZ, 4TO PISO INMUEBLE UBICADO EN LA CALLE CRESPO N? 1696 Z. SAN PEDRO', '70114466', '71297506', 'ISRAELNOVEMBER@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'ASOCIACION ACCIDENTAL \'LOS ANDES\'', '10011', 'JUAN PABLO DEL CARPIO CARRE?O', 'OBRAJES CALLE 16 EDIFICIO CENTRO DE NEGOCIOS OBRAJES PISO 4 OF. 401', '71221096', '', 'MEGACONSTRUCCIONESBOLIVIA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'ASOCIACION ACCIDENTAL \'LOZA- MASELOTI\'', '10012', 'MARCO ANTONIO LOZA PACHECO', 'CBBA, CALLE ASARPAYA S/N ZONA NORTE', '7972119', '72260584', 'MLOZAP@YAHOO.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'ASOCIACION ACCIDENTAL \'NORTE\'', '10013', 'ERIKA CHRISTEL JUSTINIANO WUNDER', 'SANTA CRUZ, VARRIO SAN SILVESTRE N? 38 UV 78 MZ 00E ZONA NORTE', '33256629', '', 'GERENCIA.WUNDERSRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'ASOCIACION ACCIDENTAL \'PORVENIR\'', '10014', 'DELIA MORALES ROSAS', 'OBLITAS Nº 610 ESQ. VASQUEZ', '72491414', NULL, '22MARCOK@GMAIL.COM', 'ORURO', 'Null', '0000-00-00 00:00:00', '2022-02-22 11:25:25'),
(15, 'ASOCIACION ACCIDENTAL \'RIEGO SAPAHAQUI\'', '10015', 'JOSE FREDY SAAVEDRA RIVERA', 'CALLE HEROES DEL BOQUERON N? 1320 ZONA MUYURINA', '74560075', '', 'FSR_GTECNICA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'ASOCIACION ACCIDENTAL \'RIEGO TORAL\'', '10016', 'RUBEN URZAGASTE PANTOJA', 'CALLES LAS PALMAS N? 17 ACHUMANI', '71597901', '', 'URZAGASTEPR@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'ASOCIACION ACCIDENTAL \'SAN ANTONIO\'', '10017', 'VICTOR HUGO AYLLON CORTEZ', 'CALLE BOLIVAR N? 1232', '69625915', '', 'VICTOR_AYLLONCORTEZ@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'ASOCIACION ACCIDENTAL \'SIETE LOBOS Y ASOCIADOS\'', '10018', 'HERNAN LOBO ACOSTA', 'LA PAZ, CALLE BAILON MERCADO N? 370', '74086410', '', 'HLALOBO@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'ASOCIACION ACCIDENTAL A&A- PIEROLA - LABORATORIO PACHANA  ASOCIADOS', '10019', 'JUAN CARLOS PIEROLA ALVARADO', 'C. SUCRE N? 269 ENTRE AROMA E INGAVI ZONA CENTRAL PUNATA', '5256365', '70795036', 'PIEROCARLOS@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'ASOCIACION ACCIDENTAL A&C', '10020', 'IGOR MENDIZABOAL ESPINOZA', 'SANTA CRUZ, 8VO ANILLO BANZER, REMANZO 1 C/2 OESTE N? 11', '76664920', '', 'MENDIZABALIGOR90@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'ASOCIACION ACCIDENTAL ACP Y ASOCIADOS', '10021', 'MAGDA MERCEDES CLAVIJO AYAVIRI', 'PJE BOULEVARD N? 777 BLOQUE B. EDIF PASEO RECOLETA PISO ? OF. 1', '393842027', '', 'MCA.DIRECCION@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'ASOCIACION ACCIDENTAL AGUAS DE PUCARANI', '10022', 'FERNANDO GUILLERMO ZEGARRA CANO', 'C. BRAULIO VERA N? 6580 ZONA IRPAVI', '72549392', '', 'FEZEGARRA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'ASOCIACION ACCIDENTAL ANDALUCIA', '10023', 'LUIS MIGUEL LAZCANO QUIROGA', 'TARIJA, BARRIO JUAN XXIII, CALLE BELGRANO N? 2038', '69300990', '69300990', 'LAZCANOQUIROGALM@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'ASOCIACION ACCIDENTAL ATALAYA', '10024', 'DANITZA NINET GONZALES CONDORI', 'AV. APUMALLA N? 16 ZONA LA PORTADA', '67106420', NULL, 'ELVIS.GUARACHI@YAHOO.COM', 'LA PAZ', 'Null', '0000-00-00 00:00:00', '2022-04-04 11:04:15'),
(25, 'ASOCIACION ACCIDENTAL AVVC', '10025', 'JUAN PABLO AVILES MATIJASEVIC', 'LA PAZ, CALLE 57B N? 248 ACHUMANI', '77798820', '', 'PABLOAVILES24@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'ASOCIACION ACCIDENTAL AXIAL ASOCIADOS', '10026', 'SABINO COTA MAMANI', 'EL ALTO, AV. RODOLFO PALENQUE NZNO 87 N? 2 ZONA 12 DE OCTUBRE BARRIO MINERO', '74084167', '', 'ACOTAS@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'ASOCIACION ACCIDENTAL BRAMA Y ASOCIADOS', '10027', 'JORGE HUAYLLA VARGAS', 'SUCRE: CALLE DALENCE N? 741', '72895999', '', 'NEG_DIC23@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'ASOCIACION ACCIDENTAL CERTEZA', '10028', 'ABDON CLEMENTE PANIAGUA LOAYZA', 'CALLE TUMUSALA N? 204', '4585250', '', 'SIKUSRL.CONSTRUCCIONES@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'ASOCIACION ACCIDENTAL CLAROSBOZA % ASOCIADOS', '10029', 'LUIS FERNANDO CLAROS BOZA', 'CALLE BAHAMAS NRO', '73442514', '', 'CLAROSBOZA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'ASOCIACION ACCIDENTAL CODEVA-LKI', '10030', 'IVAR MAURICIO LEDEZMA CASABLANCA', 'LA PAZ, PROLG/25 EDF/LA ARBOLEDA DEPTO 203 Z AUQUISAMANA', '72017776', '', 'EMP.LKI.SRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'ASOCIACION ACCIDENTAL CON SENTIDOS RRCY - MALLA FINITA S.R.L.', '10031', 'RONALD RODRIGO CALLE YUCRA', 'LA PAZ, CALLE VICENTE ALVAREZ PLATA N? 1148, ZONA VILLA PABON', '73302618', '', 'RODRIGOYUCRA321@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'ASOCIACION ACCIDENTAL CONHEVI & RINO ASOCIADOS', '10032', 'MIJAIL FAVIAN VILTE BELLIDO', 'CIUDAD SATELITE, PLAN 405 C8 N? 977', '72530320', '71540060', 'MVILTE@CONHEVI.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'ASOCIACION ACCIDENTAL CONSULTORES HAMPATURI', '10033', 'ANTONIO TORRICO CLAVIJO', 'PJE, BOULEVARD N? 777 EDIF. PASEO RECOLETA, BLOQUE B. PISO ? OF. 1', '4406259', '67400789', 'MCA.DIRECCION@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'ASOCIACION ACCIDENTAL DEL SUR', '10034', 'CHARLY ROGER FLORES ARAMAYO', 'TARIJA, CALLE PAZ AGUIRRE N? 2022 BARRIO SAN GERONIMO', '72972874', '72978175', 'RODRIGOUZQUEDA_S@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'ASOCIACION ACCIDENTAL DEL SUR', '10035', 'CHRISTIAN CALDERON PARAVICINI', 'CALLE PROLONGACION MAN CESPED N? 80 \'LA FLORIDA - ZONA SUR\'', '76171353', '', 'SECDEMGDEL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'ASOCIACION ACCIDENTAL DEL SUR', '10036', 'IVAN EDMUNDO SANCHEZ LOPES', 'TARIJA, AV. AVAROA S/N ZO?A LAS PANOSAS', '729871133', '', 'EMPRESAOBCITEC@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'ASOCIACION ACCIDENTAL CONADEL Y ASOCIADOS', '10037', 'JESUS GOMEZ CHOQUE', 'AV. JORGE PAZ GALARZA N? 4854 B/ SAN JORGE II', '67383710', '78708091', 'REYNALDO_JRM@HOTMAIL.COM', NULL, 'Null', '0000-00-00 00:00:00', '2022-05-09 10:52:51'),
(38, 'ASOCIACION ACCIDENTAL ECOFAT', '10038', 'LUIS FERNANDO BLACUD CHACON', 'LA PAZ, CALLE SANTA CRUZ N? 779 TARIJA-BOLIVIA', '46653280', '', 'LUISBLACUD@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'ASOCIACION ACCIDENTAL EOLO Y ASOCIADOS', '10039', 'ABEL ALFREDO VILLENA SUBELZA', 'CALLE SALOMON BENITEZ N? 321 BARRIO LA LOMA', '63792252', '70211201', 'CONSULTORAEOLO@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'ASOCIACION ACCIDENTAL FRANORTEC', '10040', 'GLORIA LUISA ESPINOZA BALTAZAR', 'EL ALTO, CALLE 34 N? 73 COTACOTA', '22799392', '', 'FRANOMASRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'ASOCIACION ACCIDENTAL FSR-MANOCA', '10041', 'JOSE SAAVEDRA RIVERA', 'AV. SANTOS VARGAS ESQ. LUIS LARA ZONA PACATA BAJA - CBBA.', '71497153', '4020795', 'FSR_GTECNICA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'ASOCIACION ACCIDENTAL HAMPATURI', '10042', 'GONZALO XAVIER LA FUENTE NERY', 'C MECAPAQUE?A N? 2449', '4307344', '72210008', 'COLAFSRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'ASOCIACION ACCIDENTAL HAMPATURI 2', '10043', 'TRIFON NINA MAMANI', 'SUCRE, AVENIDA CANADA N? 508', '68660811', '', 'BENSONSRL@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'ASOCIACION ACCIDENTAL HYDRO &VIA Y ASOCIADOS', '10044', 'MARCO ANTONIO GOMEZ MENDIVIL', 'LA PAZ, CALLE 6 DE OBRAJES', '724000668', '', 'HIDROYVIA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'ASOCIACION ACCIDENTAL ILLIMANI', '10045', 'RUBEN MARTINES ORTEGA', 'WENCESLAO ALBA 47', '72422084', NULL, 'ECOBOLIVIASRL@GMAIL.COM', 'POTOSI', 'Null', '0000-00-00 00:00:00', '2022-03-28 11:14:22'),
(46, 'ASOCIACION ACCIDENTAL JAYLLI', '10046', 'RODRIGO TEOFILO HERRERA AYARDE', 'CALLE GRANADA N? 342 BARRIO ANDALUCIA', '71898669', '73480755', 'EMPRESATRIASUR@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'ASOCIACION ACCIDENTAL JESVIA', '10047', 'JUAN JOSE LIMACHI TARQUI', 'LA PAZ, ZONA LA PORTADA CALLE 4 N? 444 PISO 1', '71297506', '', 'JJES-CONSTRUCCIONES @HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'ASOCIACION ACCIDENTAL LA PAZ', '10048', 'JOSE EDUARDO LENZ MAMANI', 'CALLE SALOMON BENITEZ N? 321 BARRIO LA LOMA', '68693226', '', 'CONSULTORAEOLO@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'ASOCIACION ACCIDENTAL LUAM ASOCIADOS', '10049', 'VIVIANA DEL CARMEN GUARACHI CHAVEZ', 'LA PAZ, CALLE PEDRO MIRANDA Nº 5 ZONA LA PORTADA', '10114914', '60678037', 'ELVIS.GUARACHI@YAHOO.COM', 'LA PAZ', 'Null', '0000-00-00 00:00:00', '2022-02-22 11:38:16'),
(50, 'ASOCIACION ACCIDENTAL LUZUL Y ASOCIADOS', '10050', 'LISANDRO NELSON AZURDUY', 'AV. DEL EJERCITO N? 402', '46424237', '72876271', 'LUZUL_7007@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'ASOCIACION ACCIDENTAL MC', '10051', 'AMERICO RUBEN HILAQUITA RAMOS', 'LA PAZ, AV. NACIONES UNIDAS N? 500 ZONA RINCON LA PORTADA', '76281602', NULL, 'AMERICO_HILAQUITA@HOTMAIL.COM', 'LA PAZ', 'Null', '0000-00-00 00:00:00', '2022-04-19 12:03:12'),
(52, 'ASOCIACION ACCIDENTAL MINELCO EMOCI', '10052', 'JOSE DAVID ARZE TORREZ', 'AROMA N? 582 LA PAZ Y 6 DE OCTUBRE EDIFICIO TIERRA DE ORO PISO 5', '5234776', '', 'MINELCO_05@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'ASOCIACION ACCIDENTAL NIPAES & SANMING', '10053', 'CARMEN JULIA PARRA GUTIERREZ', 'CALLEJON CULIO TAPIA N? 23 ZONA GRAN PODER', '73283600', '', 'NIPAESCJ@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'ASOCIACION ACCIDENTAL NORTE', '10054', 'JORGE ORLANDO RODRIGUEZ GARCIA', 'AV. 2 DE AGOSTO N? 5060, ENTRE 5TO Y 6TO ANILLO', '71331445', '', 'MIJAELSRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'ASOCIACION ACCIDENTAL NUEVA ALIANZA', '10055', 'DANIEL JUSTINIANO RIVERO', 'RIBERALTA, AV NICOLAS SUAREZ N? 831 ZONA BASE AEREA', '2424012', '', 'JAVIERENDARA6@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'ASOCIACION ACCIDENTAL OCCIDENTAL', '10056', 'CINTYA ROCIO DE LA QUINTANILLA HERRERA', 'CALACOTO CALLE 12  REPUBLICA DE PORTUGAL N? 608', '75851298', '', 'CINTYADELAQUINTANA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'ASOCIACION ACCIDENTAL OROPROM', '10057', 'DANIEL OROPEZA MERCADO', 'EL ALTO, CALLE MERCADO N? 1328, EDIFICIO BALLIVIAN  PISO 2  OFICINA 205, ZONA CENTRAL', '70114466', '', 'ISRAELNOVEMBER@4GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'ASOCIACION ACCIDENTAL ORTHON - PROGRESIVA', '10058', 'JOSE VELASQUEZ DELGADO', 'LA PAZ, CALLE MECHOR PEREZ DE OLGUIN N? 2458 Z. SOPOCACHI', '2771205', '', 'COVAS.INFO@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'ASOCIACION ACCIDENTAL ORTHON -COVAS - PROGRESIVA', '10059', 'JOSE VELASQUEZ DELGADO', 'CALLE MELCHOR PEREZ DE OLGUIN N? 2458', '2417919', '', 'ORTHONSRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'ASOCIACION ACCIDENTAL PACIFICO', '10060', 'SERGIO GUSTAVO BARRON SALINAS', 'CONDOMINIO LA CAMPANA N? 9 Z. LOMAS DE ACHUMANI', '68225533', '', 'BASALCAM.SRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'ASOCIACION ACCIDENTAL PAK', '10061', 'DANIEL JUSTINIANO RIVERO', 'LA PAZ, CALLE LUIS CRESPO N? 1969, ZONA SOPOCACHI', '63259104', '2424012', 'JAVIERENDARA6@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'ASOCIACION ACCIDENTAL PEUR', '10062', 'JOSE LUIS ARCE LAURA', 'PLAZA BADEN POWEL N? 95 ZONA MIRAFLORES', '70110101', '', 'CONSULTORAPEUR@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'ASOCIACION ACCIDENTAL PORTBOL', '10063', 'MADELAINE MILAGROS MOLLINEDO PONCE DE LEON', 'LA PAZ, CALLE 23 DE CALACOTO N? 7676 EDIFICIO VILLAS DEL SOL', '71560001', '', 'MADELAINE.MOLLINEDO@GUPOLEVON.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'ASOCIACION ACCIDENTAL PROFESIONALES UNIDOS', '10064', 'MANUEL ANTONIO GUDI?O MARQUEZ', 'BARRIO BARTOLOME  ATTARD CALLE CAP. JOSE GARCIA N? E-99', '6638932', '71875928', 'MANUELANTONIOGUDI?OMARQUEZ@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'ASOCIACION ACCIDENTAL PUCARA', '10065', 'ALDRIN MICHAEL CLAURE PACORICONA', 'LA PAZ, LANDAETA N? 262 EDIFICIO TAMAYO PLANTA BAJA  OF. 10', '22318187', '', 'ARKANIAARQUITECTURA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'ASOCIACION ACCIDENTAL PUCARANI', '10066', 'LUIS FERNANDO BLACUD CHACON', 'LA PAZ, CALLE SANTA CRUZ N? 779', '46653280', '', 'LUISBLACUD@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'ASOCIACION ACCIDENTAL RAM -C & ASOCIADOS', '10067', 'JUAN RAMON CANAZA FLORES', 'CALLE J LAVANDENZ N? 2426 ZONA SANTA ANA SARCOBAMBA', '4029455', '68580881', 'RAMONCANAZA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'ASOCIACION ACCIDENTAL SAMER Y ASOCIADOS', '10068', 'SERGIO IVAN AVILA CASTELLANOS', 'TARIJA, BARRIO EL TEJAR PASAJE ARTURO SORUCO N? 246 ENTRE FEDERICO AVILA Y ESPA?A', '72989082', '', 'SERGIOAVILACASTELLANOS@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'ASOCIACION ACCIDENTAL SAN PEDRO', '10069', 'ROLANDO ALFONZO SURRIABLE VALLEJOS', 'BARRIO LAS PANOSAS, CALLE ISACC ATTIE S/N', '46652601', '46652601', 'ROLANDOSURRIABLE@YAHOO.ES', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'ASOCIACION ACCIDENTAL SEINCOBOL', '10070', 'RONY GONZALO ARCE HIGUERAS', 'TARIJA, PASAJE S/N B/ ARANJUEZ SUD', '6677275', '', 'CCSEINCOBOL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'ASOCIACION ACCIDENTAL SERVICA', '10071', 'CHRISTIAN BORIS SERRUDO TARRAGA', 'BARRIO LA PAMPA, AV. POTOSI N? 950', '71891069', '', 'CBS_SERRUDO@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'ASOCIACION ACCIDENTAL SIERRA PE?ARANDA CAREMATH & CONTRALTO', '10072', 'JUAN GABRIEL SIERRA PE?ARANDA', 'CALLE POTOSI N? 6871 ENTRE SANTA BARBARA Y JAEN', '71833868', '', 'JGSP60@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'ASOCIACION ACCIDENTAL SORATA', '10073', 'SAMUEL BENITO TORRES ROMERO', 'CALLE PERU N? 48', '72886941', '', 'CLAROSBOZA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'ASOCIACION ACCIDENTAL TREBOL S.RL.', '10074', 'MARCO ANTONIO KARNINCIC FIGUEREDO', 'CALLE JUAN MANUEL LOZA N? 1997 ESQUINA MISAEL SARACHO, MIRAFLORES.', '71966960', '', 'MAKA.BO@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'ASOCIACION ACCIDENTAL VLACONST', '10075', 'VLADIMIR PAUCARA MUJICA', 'CALLE SILVERIO MENACHO, N? 1712 ZONA EL TEJAR', '77526002', '', 'INGVLADIMIRPAUKARA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'ASOSIACION ACCIDENTAL \'EN-RED, CHOQUELEC\'', '10076', 'RENE GONZALO CHOQUE JUCHANI', 'C. UCURE?A N? 283 Z. VILLA  TUNARI', '73738453', '', 'CHOQUELEC@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'CITAGEO & ASOCIADOS', '10077', 'ORLANDO QUENALLATA CORI', 'CALLE NU?EZ DEL PRADO N? 1024 ZONA VILLA INGENIO', '67156313', '', 'LANDOQUENACORI@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'CONSORCIO PROGRESO', '10078', 'ARIEL ARMAZA OLIVAREZ', 'LA PAZ, CALLE B N? 195 VILLA FATIMA', '79100100', '', 'DAYA_SRL@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'CONSORCIO PUCARANI 2', '10079', 'EDGAR CATARI AGUAYO', 'CBBA, TIQUIPAYA ZONA VILLA ESPERANZA CALLE MANANTIAL S/N', '79759526', '', 'EDYCATARIAGUAYO@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'CONSORCIO RYUNO -NOEVAL', '10080', 'JOSE LUIS BUTRON MACHICADO', 'C. JULIO TAPIA N? 986 ZONA GRAN PODER', '71887868', '', 'TYUNO-NOEVAL@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'COSORCIO DE INGENIEROS TORREZARMAZA', '10081', 'ARIEL ARMAZA OLIVARES', 'CALLE B N? 195 VILLA FATIMA', '79100100', '', 'TORREZARMAZA@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'EMPRO - ASOCIADOS', '10082', 'ALFREDO DANIEL ROMERO YAÑEZ', 'CBBA, CALLE ADELFA Nº 323 ZONA TAQUI?A', '4375749', NULL, 'AROMERO@EMPROLTDA.COM', 'COCHABAMBA', 'Null', '0000-00-00 00:00:00', '2022-03-28 11:06:01'),
(84, 'MENDOZA & DIAZ ASOCIADOS S.R.L.', '10084', 'MERY PACO CASTRO', 'EL ALTO, CALLE GUAQUI N? 10 Z/16 DE JULIO', '2843022', '', 'MENDOZAYDIAZSRL@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'OBRAS CIVILES E INDUSTRIALES OCSIS SR', '10085', 'ALVARO TAPIA CAMPOS', 'LA PAZ, AV. 6 DE AGOSTO N? 2700', '2912462', '79649049', 'MARIO.FLORES22@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'OPEC', '10086', 'ENRIQUE JAIME OLLER CATOIRA', 'LA PAZ, AV. COSTANERA N? 1000 EDIFICIO GALA 4A', '70652444', '', 'EOLLERC@YAHOO.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'ORDENES CONSTRUCCIONES', '10087', 'FRANSCISCO RAFAEL ORDENES SOTELO', 'PAMPAHASI CALLE 6 N? 241 URB. SAID', '72024561', '2433300', '@', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'SAN ANTONIO DE GUAQUI  ASOCIACION ACCIDENTAL', '10088', 'RENE CRISTIAN SAHONERO DAZA', 'CALLE 3 N? 4891 ZONA OBRAJES T. JULIETA P.08', '76757579', '', 'SAN.ANTONIO.GUAQUI@GMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'SOCIEDAD ACCIDENTAL CON ALTURA', '10089', 'SIMON WALDO HILARIO  CHOQUE', 'EL ALTO, CALLE 10 A PLAN 129 N? 287 UV: S/N ZONA CIUDAD SATELITE', '78768682', '70587583', 'DIT_LLANQUI@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'SOCIEDAD ACCIDENTAL CONSTRUCCIONES EL ALTO', '10090', 'DIETER OVIDIO LLANQUI AJATA', 'EL ALTO, CALLE ARZABE N? 26 ZONA LOS ANDES', '70587583', '78768682', 'WALDOHI@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'TECA ASOCIADOS', '10091', 'IRON LUIS MORALES FERAUDY', 'C. BOLIVAR 61-C', '78670505', '', 'TRECA_CONSTRUCTORA@HOTMAIL.COM', '', 'Null', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'ASOCIACION ACCIDENTAL LARIPATA', '10092', 'NESTOR GONZALO TORREZ MONTALVO', 'C. JUAN BAUTISTA N° 1514 Z. VILLA CONCEPCION', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-02 11:04:40', '2022-02-02 11:04:40'),
(94, 'ASOCIACION ACCIDENTAL TUNARI', '10093', 'MIGUEL ANGEL TORRICO TRUJILLO', 'CALE 7 Nº 42 PACATA ALTA', '70360211', NULL, 'CONSTRUCCIONES.JCF.MTT.SRL@GMAIL.COM', 'COCHABAMBA', 'NINGUNA', '2022-02-03 10:55:31', '2022-02-03 10:55:31'),
(95, 'ASOCIACION ACCIDENTAL ZURICH ASOCIADOS', '10094', 'IRON LUIS MORALES FERAUDY', 'CALLE BOLIVAR Nº 61', '78670505', NULL, 'CLAROSBOZA@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 10:59:39', '2022-02-03 10:59:39'),
(97, 'ASOCIACION ACCIDENTAL DEL SUR', '10095', 'CLAUDIA ELIANA HIZA MORALES', 'C/ DELGADILLO Nº 381 ZONA LAS PANOSAS', '70222071', NULL, 'DISCOMPARTSTJA@GMAIL.COM', 'TARIJA', 'NINGUNA', '2022-02-03 11:22:44', '2022-02-03 11:22:44'),
(98, 'ENCINCAD Y ASOCIADOS', '10096', 'CARLOS RIMBERTO DOMINGUEZ LEON', 'AV. JULIO VILLA Nº 428 - Z. EL ALTO DELICIAS', '73427384', NULL, 'CALO_DL950@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-02-03 11:31:50', '2022-02-03 11:31:50'),
(99, 'TERRARIOS Y ASOCIADOS', '10097', 'ALEYDA TERAN RAMALLO', 'CALLE PASAJE PISAGUA ENTRE SAN FELIPE Y ARCE Nº7', '5278201', NULL, 'EMOCI2010@HOTMAIL.COM', 'ORURO', 'NINGUNA', '2022-02-03 11:38:18', '2022-02-03 11:42:27'),
(100, 'ICONBOL Y ASOCIADOS', '10098', 'NESTOR GONZALO TORREZ MONTALVO', 'ZONA VILLA CONCEPCION CALLE JUAN BAUTISTA Nº 1514', '67114675', NULL, 'CONSTRUCTORA.ECT.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-03 11:41:32', '2022-02-03 11:41:32'),
(101, 'ASOCIACION ACCIDENTAL CHARAZANI', '10099', 'MERY PACO CASTRO', 'CALLE GUAQUI Nº 10 Z/16 DE JULIO', '2483022', NULL, 'MENDOZAYDIASSRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:00:47', '2022-02-16 11:00:47'),
(102, 'ASOCIACION ACCIDENTAL ASOCONST', '10100', 'FABIOLA LOPEZ AYALA', 'CALLE 10 ENTRE CALLE 9 Y 11 Nº1034', '78825036', NULL, 'LOPEZAYALA1993LUPITA@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-16 11:16:36', '2022-02-16 11:16:36'),
(103, 'ASOCIACION ACCIDENTAL CONSOLIDAR', '10101', 'EIVER BENJAMIN ANACHURI DAVALOS', 'B/12 de octubre pasaje TARAIRI Nº 2324', '68708770', NULL, 'ARQ_EIVER_BAD@HOTMAIL.COM', 'TARIJA', 'NINGUNA', '2022-02-22 10:38:45', '2022-02-22 10:38:45'),
(104, 'ASOCIACION ACCCIDENTAL SAN LUIS', '10102', 'ANDREA MARIA DE PEREZ ROTIGUETTI SAAVEDRA', 'CALLE SANTA BARBARA Nº 217 ENTRE RAYKA BACOVIC Y AV. BRASIL', '67200870', '67200873', 'ANDREAROTIGUETTI@GMAIL.COM', 'ORURO', 'NINGUNA', '2022-02-22 10:49:31', '2022-02-22 10:49:31'),
(105, 'ASOCIACION ACCIDENTAL POMO Y ASOCIADOS', '10103', 'JUAN JOSE DAVALOS DAVALOS', 'CALLE VENTURA OVIENDO Nº 2590 ZONA LA PORTADA', '73017933', NULL, 'JCSALAZARTORREZ@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-22 11:05:47', '2022-02-22 11:05:47'),
(106, 'ASOCIACION ACCIDENTAL MAYTA - SPORTMEN', '10104', 'FRANKLIN TORREZ MAYTA', 'CALLE CARLOS MONTENEGRO Nº 7204 ZONA SAN PABLO', '74098001', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-02-22 11:16:36', '2022-02-22 11:16:36'),
(107, 'ASOCIACION ACCIDENTAL OASIS', '10105', 'JORGE HUMBERTO CRHISTIAN ENCINAS RIVERO', 'AV. ARCE Nº 2631 EDIF. TORRE MULTICINE PISO 8 OF. 809', '70524444', NULL, 'CONSTRUCTORADEKO1@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-22 11:48:49', '2022-02-22 11:48:49'),
(108, 'ASOCIACION ACCIDENTAL VASQUEZAMO - FAMCONS', '10106', 'ADAN MOISES VASQUEZ QUISPE', 'AV. SUCRE S/N ZONA MODERNA ENTRE CALLE 1RO DE MAYO Y CALLE BEREA', '78128963', NULL, '123@123.COM', 'ORURO', 'NINGUNA', '2022-02-22 12:04:20', '2022-02-22 12:04:20'),
(109, 'ASOCIACION ACCIDENTAL EPC-LIGTING', '10107', 'ADOLFO DAVID LORIA CANEDO', 'CALLE PINTO TELLERIA Nº 102 EDIF.VALLE IRPAVI DPTO 401', '2721361', NULL, 'EMP.LKI.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-02-23 10:51:27', '2022-02-23 10:51:27'),
(110, 'ASOCIACION ACCIDENTAL SUR ENERGY SRL Y ASOCIADOS', '10108', 'CARLOS ABRAHAM ZYLVETI', 'AV. MIRA CASTRILLO Y CALLE B Nº 2430 EDIF. MIRAFLORES DPTO 1A', '0', NULL, '123@132.COM', 'TARIJA', 'NINGUNA', '2022-02-23 10:59:50', '2022-02-23 10:59:50'),
(111, 'ASOCIACION ACCIDENTAL EQUIMAQ - NIEVES', '10109', 'WILLIAMS NIEVES SANDI', '.', '0', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-02-23 14:44:52', '2022-02-23 14:44:52'),
(112, 'ASOCIACION ACCIDENTAL DEL SUR', '10110', 'GERMAN LAURA CAIZAYA', 'AV. 11 DE FEBRERO N° 387 BARRIO LOURDES', '4665558', '71836288', 'GERMANLAURA_3@HOTMAIL.COM', 'TARIJA', 'NINGUNA', '2022-02-23 14:56:55', '2022-02-23 14:56:55'),
(113, 'ASOCIACION ACCIDENTAL ALTIPLANO', '10111', 'IVAR MAURICIO LEDEZMA CASABLANCA', 'CALLE PINTO TELLERIA Nº 102 EDIF. VALLE IRPAVI PISO 4 ZONA IRPAVI', '72017776', NULL, 'EMP.LKI.SRL@GMAIL.COM', 'POTOSI', 'NINGUNA', '2022-03-28 10:43:58', '2022-03-28 10:43:58'),
(114, 'ASOCIACION ACCIDENTAL CIABOL Y ASOCIADOS', '10112', 'MANUEL FIDEL CUEVAS VELASQUEZ', 'AV. JULIO DELIO ECHAZU Nº 100', '46635858', '46643777', 'CENTRAL@CIABOL.COM.BO', 'TARIJA', 'NINGUNA', '2022-03-28 10:53:34', '2022-03-28 10:53:34'),
(115, 'ASOCIACION ACCIDENTAL SUDAMERICANA', '10113', 'LINO SALOMON MEDINA SULLCA', 'AV. INDEPENDENCIA NRO 899 BARRIO SAN MARTIN TARIJA', '72988571', NULL, 'LINO_MEDINA@HOTMAIL.COM', 'TARIJA', 'NINGUNA', '2022-03-28 11:27:20', '2022-03-28 11:27:20'),
(116, 'ASOCIACION ACCIDENTAL KERANI', '10114', 'GUSTAVO ROBERTO TORREZ CARI', 'AV. ARCE NRO 2871  EDIF PRISCILA , MEZANINE OF. 4', '1', NULL, 'DAYA_SRL@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-03-28 11:34:52', '2022-03-28 11:34:52'),
(117, 'EMOCI-ECOFER', '10115', 'VICTOR MANUEL FERNANDEZ SALAZAR', 'C. HUGO ESTRADA EDIF. OLIMPIA Nº 1354 PISO 2 OFI. 3', '1', NULL, '123@123.COM', 'ORURO', 'NINGUNA', '2022-03-28 11:44:37', '2022-03-28 11:44:37'),
(118, 'ASOCIACION ACCIDENTAL EIE ASOCIADOS', '10116', 'JORGE GABRIEL RAMOS ORTIZ', 'CALLE HONDURAS 418 BARRIO PETROLERO', '72877101', NULL, 'CLAROSBOZA@HOTMAIL.COM', 'CHUQUISACA', 'NINGUNA', '2022-03-28 11:49:45', '2022-03-28 11:49:45'),
(119, 'ASOCIACION ACCIDENTAL \"G.O.C. Y ASOCIADO\"', '10117', 'FAVIO TORREZ MONTALVO', 'CALLE 14, ZONA COSMOS 78 EL ALTO', '72092733', '2850717', 'CONST_GOC@HOTMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-03-28 12:01:29', '2022-03-28 12:01:29'),
(120, 'ASOCIACION ACCIDENTAL BATALLAS', '10118', 'DANIEL JUSTINIANO RIVERO', 'CALLE NICOLAS SUAREZ Nº 831 BASE AEREA', '73959697', NULL, 'JPMORALES.LARRAZABAL@MICONSTRUCTORA.COM', 'LA PAZ', 'NINGUNA', '2022-03-28 12:10:10', '2022-03-28 12:10:10'),
(121, 'ASOCIACION ACCIDENTAL LCC', '10119', 'ALEJANDRA NICOLE CARVAJAL CASTILLO', 'AV. SANCHEZ LIMA 2557 TORRE CODES PISO 14 OFICINA B', '76760601', NULL, 'LYC.INGENIERIAYCONSTRUCCION@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-04-04 10:51:03', '2022-04-04 10:51:03'),
(122, 'ASOCIACION ACCIDENTAL WALATA', '10120', 'ROBERTO ZAPATA CALVO', '1', '1', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-04-07 11:44:18', '2022-04-07 11:44:18'),
(123, 'SOCIEDAD ACCIDENTAL INVERSIONES REYES PERICON - KSTORRES', '10121', 'JOSE DANIEL REYES PERICON', 'CALLE FEDERICO SUAZO Nº 1885 EDIF. ALCAZAR TORRE GRANADA', '65675740', '70566666', 'JD.REYESPERICON@GMAIL.COM', NULL, 'NINGUNA', '2022-05-04 11:36:59', '2022-05-04 11:36:59'),
(124, 'ASOCIACION ACCIDENTAL RIO LA PAZ', '10122', 'IVAR MAURICIO LEDEZMA CASABLANCA', 'ZONA IRPAVI CALLE 11 AV. PINTO TELLERIA Nº 102 EDIF. VALLE DE IRVAPI', '67004318', '72017776', 'EMP.LKI.SRL@GMAIL.COM', 'LA PAZ', 'NINGUNA', '2022-05-04 11:48:06', '2022-05-04 11:48:06'),
(125, 'ASOCIACION ACCIDENTAL TAWA - ECYCY', '10123', 'DAVID CAHUANA CHURA', 'EL ALTO, AV. 6 DE AGOSTO ZONA ROSAS PANPA N 100', '71967740', NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-05-09 10:58:23', '2022-05-09 10:58:23'),
(126, 'ASOCIACION ACCIDENTAL ILLIMANI', '10124', 'NESTOR GONZALO TORREZ MONTALVO', NULL, '67114675', NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-09 11:07:07', '2022-05-09 11:07:07'),
(127, 'ASOCIACION ACCIDENTAL \"MCB - CFDCC\"', '10125', 'JOSE MARIA DURAN YESELLI', NULL, NULL, NULL, '123@123.COM', 'LA PAZ', 'NINGUNA', '2022-05-18 11:40:22', '2022-05-18 11:40:22'),
(128, 'ASOCIACION ACCIDENTAL ALTO PEÑAS - KERANI', '10126', 'ALVARO LEIF MARTINEZ CAVA', 'PERU N 20', '72872686', NULL, 'LEIF_ALVARO@HOTMAIL.COM', NULL, 'NINGUNA', '2022-05-18 11:45:51', '2022-05-18 11:45:51'),
(129, 'ASOCIACION ACCIDENTAL KERANI - AA', '10127', 'ANGEL WILFREDO CALDERON BALLESTEROS', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:16:58', '2022-05-18 12:16:58'),
(130, 'ASOCIACION ACCIDENTAL ECOLETTI', '10128', 'MARVIN ADRIAN PERALTA RODAS', NULL, NULL, NULL, '123@123.COM', NULL, 'NINGUNA', '2022-05-18 12:19:52', '2022-05-18 12:19:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicituds`
--

CREATE TABLE `solicituds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `seguimiento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fechaini` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `taller_id` bigint(20) UNSIGNED DEFAULT NULL,
  `car_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallers`
--

CREATE TABLE `tallers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fono2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tallers`
--

INSERT INTO `tallers` (`id`, `nit`, `nombre`, `representante`, `direccion`, `fono1`, `fono2`, `status`, `url`, `observacion`, `created_at`, `updated_at`) VALUES
(1, '6188061019', 'SERVICAR', 'ADEMAR ANDRES VILLARREAL GARCIA', 'MERCADO LAS DELICIAS N° 125 ZONA CAPUMA', '221632', '75286179', 'ACTIVO', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos`
--

CREATE TABLE `tipos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipos`
--

INSERT INTO `tipos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'EMP.-ASOC.', NULL, NULL),
(2, 'CONSUL', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `repuesto` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalle` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `factura` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activo',
  `solicitud_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USUARIO',
  `fechalimite` date NOT NULL DEFAULT '2022-12-31',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVO',
  `ci` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `tipo`, `fechalimite`, `status`, `ci`, `email_verified_at`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ADMINISTRADOR', 'fqm@gmail.com', 'admin', '2022-12-31', 'ACTIVO', '0001', NULL, '$2y$10$xSKtS7JD31jLvfJ7XwhVeuCp5yzIyb.M5xrDl9jgPf51DtlbIQPva', NULL, NULL, NULL, '2022-02-07 08:07:44'),
(2, 'FLORENCIO QUELCA MAMANI', 'florens.lonwe@gmail.com', 'admin', '2022-12-31', 'ACTIVO', '5775077', NULL, '$2y$10$b7HT7wMCI7r8D84CTU8.2.JsaVN7C..9Vc97/MNiihwJfqLXO.JmO', NULL, NULL, NULL, '2022-02-07 08:08:41'),
(3, 'PATRICIA MARCO', 'pmarco@fps.gob.bo', 'USUARIO', '2022-12-04', 'ACTIVO', NULL, NULL, '$2y$10$S/zy5F12nprSozlKlkdr7O4Vu7e/c5eXo0XM03NEktNFwx45ASO0K', NULL, NULL, '2022-02-07 09:52:32', '2022-02-07 09:52:32'),
(4, 'CONSULTA', 'consulta@fps.gob.bo', 'USUARIO', '2023-01-31', 'ACTIVO', NULL, NULL, '$2y$10$O6BTRnhFkge4KB.7IDskv.iUQIY7pAyYOf7hvIohYkDp9b46/oY/i', NULL, NULL, '2022-03-11 12:42:01', '2022-03-11 12:42:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `motivo` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `empresa` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `funcionario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observacion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persona_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `archivos_url_unique` (`url`),
  ADD KEY `archivos_user_id_foreign` (`user_id`),
  ADD KEY `archivos_categoria_id_foreign` (`categoria_id`);

--
-- Indices de la tabla `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cars_codigo_unique` (`codigo`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `codigos`
--
ALTER TABLE `codigos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigos_nombre_unique` (`nombre`);

--
-- Indices de la tabla `codigo_proyecto`
--
ALTER TABLE `codigo_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_proyecto_proyecto_id_foreign` (`proyecto_id`),
  ADD KEY `codigo_proyecto_codigo_id_foreign` (`codigo_id`);

--
-- Indices de la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contratos_nombre_unique` (`nombre`),
  ADD KEY `contratos_proyecto_id_foreign` (`proyecto_id`);

--
-- Indices de la tabla `cvs`
--
ALTER TABLE `cvs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cvs_nombre_unique` (`nombre`),
  ADD KEY `cvs_persona_id_foreign` (`persona_id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle1s`
--
ALTER TABLE `detalle1s`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalle1s_contrato_id_foreign` (`contrato_id`);

--
-- Indices de la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detalles_proyecto_id_foreign` (`proyecto_id`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `empresas_nit_unique` (`nit`);

--
-- Indices de la tabla `empresa_sociedad`
--
ALTER TABLE `empresa_sociedad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_sociedad_empresa_id_foreign` (`empresa_id`),
  ADD KEY `empresa_sociedad_sociedad_id_foreign` (`sociedad_id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permiso_user_permiso_id_foreign` (`permiso_id`),
  ADD KEY `permiso_user_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas_ci_unique` (`ci`);

--
-- Indices de la tabla `persona_proyecto`
--
ALTER TABLE `persona_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona_proyecto_proyecto_id_foreign` (`proyecto_id`),
  ADD KEY `persona_proyecto_persona_id_foreign` (`persona_id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proyectos_departamento_id_foreign` (`departamento_id`),
  ADD KEY `proyectos_programa_id_foreign` (`programa_id`),
  ADD KEY `proyectos_tipo_id_foreign` (`tipo_id`);

--
-- Indices de la tabla `proyecto_user`
--
ALTER TABLE `proyecto_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sociedads`
--
ALTER TABLE `sociedads`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sociedads_codigo_unique` (`codigo`);

--
-- Indices de la tabla `solicituds`
--
ALTER TABLE `solicituds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `solicituds_taller_id_foreign` (`taller_id`),
  ADD KEY `solicituds_car_id_foreign` (`car_id`);

--
-- Indices de la tabla `tallers`
--
ALTER TABLE `tallers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tallers_nit_unique` (`nit`);

--
-- Indices de la tabla `tipos`
--
ALTER TABLE `tipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trabajos_solicitud_id_foreign` (`solicitud_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visitas_persona_id_foreign` (`persona_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivos`
--
ALTER TABLE `archivos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `codigos`
--
ALTER TABLE `codigos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `codigo_proyecto`
--
ALTER TABLE `codigo_proyecto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cvs`
--
ALTER TABLE `cvs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle1s`
--
ALTER TABLE `detalle1s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `detalles`
--
ALTER TABLE `detalles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=489;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=422;

--
-- AUTO_INCREMENT de la tabla `empresa_sociedad`
--
ALTER TABLE `empresa_sociedad`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=640;

--
-- AUTO_INCREMENT de la tabla `persona_proyecto`
--
ALTER TABLE `persona_proyecto`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `programas`
--
ALTER TABLE `programas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT de la tabla `proyecto_user`
--
ALTER TABLE `proyecto_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sociedads`
--
ALTER TABLE `sociedads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT de la tabla `solicituds`
--
ALTER TABLE `solicituds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tallers`
--
ALTER TABLE `tallers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tipos`
--
ALTER TABLE `tipos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivos`
--
ALTER TABLE `archivos`
  ADD CONSTRAINT `archivos_categoria_id_foreign` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `archivos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `codigo_proyecto`
--
ALTER TABLE `codigo_proyecto`
  ADD CONSTRAINT `codigo_proyecto_codigo_id_foreign` FOREIGN KEY (`codigo_id`) REFERENCES `codigos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `codigo_proyecto_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `cvs`
--
ALTER TABLE `cvs`
  ADD CONSTRAINT `cvs_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle1s`
--
ALTER TABLE `detalle1s`
  ADD CONSTRAINT `detalle1s_contrato_id_foreign` FOREIGN KEY (`contrato_id`) REFERENCES `contratos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles`
--
ALTER TABLE `detalles`
  ADD CONSTRAINT `detalles_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresa_sociedad`
--
ALTER TABLE `empresa_sociedad`
  ADD CONSTRAINT `empresa_sociedad_empresa_id_foreign` FOREIGN KEY (`empresa_id`) REFERENCES `empresas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa_sociedad_sociedad_id_foreign` FOREIGN KEY (`sociedad_id`) REFERENCES `sociedads` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `permiso_user`
--
ALTER TABLE `permiso_user`
  ADD CONSTRAINT `permiso_user_permiso_id_foreign` FOREIGN KEY (`permiso_id`) REFERENCES `permisos` (`id`),
  ADD CONSTRAINT `permiso_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `persona_proyecto`
--
ALTER TABLE `persona_proyecto`
  ADD CONSTRAINT `persona_proyecto_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_proyecto_proyecto_id_foreign` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proyectos_programa_id_foreign` FOREIGN KEY (`programa_id`) REFERENCES `programas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `proyectos_tipo_id_foreign` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicituds`
--
ALTER TABLE `solicituds`
  ADD CONSTRAINT `solicituds_car_id_foreign` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `solicituds_taller_id_foreign` FOREIGN KEY (`taller_id`) REFERENCES `tallers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_solicitud_id_foreign` FOREIGN KEY (`solicitud_id`) REFERENCES `solicituds` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD CONSTRAINT `visitas_persona_id_foreign` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
