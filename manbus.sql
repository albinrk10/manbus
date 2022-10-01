-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-09-2022 a las 01:23:04
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `manbus`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `datoUsuario` (IN `idUsuario` INT)   begin
	select
		pe.nombre_rol as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona
	from usuarios u
		inner join empleado p on u.id_empleado = p.id_empleado
		inner join rol pe on u.id_rol = pe.id_rol
  where u.fecha_del is null and u.id_usuario = idUsuario;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoAlmacen` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200), OUT `total` INT)   BEGIN

    declare totalRegistro int;

    select
        a.id_almacen,
        p.codigo_producto,
        p.nombre,
        a.fecha_ingreso,
        a.cantidad_entrada,
        a.cantidad_salida,
        a.cantidad_actual
    from almacen a
        inner join producto p on a.id_producto = p.id_producto
    where a.fecha_del is null
      and concat(p.codigo_producto, ' ', p.nombre) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*) from almacen a inner join producto p on a.id_producto = p.id_producto
                         where a.fecha_del is null
                           and concat(p.codigo_producto, ' ', p.nombre) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoEmpleado` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
	select
		id_empleado,
		dni,
		nombres,
		apellido_paterno,
		apellido_materno,
		(select count(*) from empleado where fecha_del is null) as total
	from empleado
  where fecha_del is null and concat(nombres,' ',apellido_paterno,' ',apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoModulo` (IN `row1` INT, IN `length1` INT, IN `buscar` VARCHAR(200))   BEGIN
   SELECT
			id_modulo as id_modulo,
			nombre_modulo as nombre_modulo,
			url as ruta,
			(select count(*) from modulo where fecha_del is null) as total
		FROM modulo where fecha_del is null and nombre_modulo like concat('%',buscar,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoProducto` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200), OUT `total` INT)   BEGIN

    declare totalRegistro int;

    select id_producto,
           codigo_producto,
           nombre,
           descripcion,
           estado,
           precio,
           stock
    from producto
    where fecha_del is null
      and concat(codigo_producto, ' ', nombre) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from producto
                         where fecha_del is null
                           and concat(codigo_producto, ' ', nombre) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoRol` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
    SELECT id_rol,
           nombre_rol,
           descripcion,
           estado,
           (select count(*) from rol where fecha_del is null) as total
    FROM rol
    where fecha_del is null
      and nombre_rol like concat('%', busca, '%')
    LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoTaller` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200), OUT `total` INT)   BEGIN

    declare totalRegistro int;

    select id_taller,
           codigo_taller,
           nombre,
           direccion,
           concesionario
    from taller
    where fecha_del is null
      and concat(codigo_taller, ' ', nombre) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from taller
                         where fecha_del is null
                           and concat(codigo_taller, ' ', nombre) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoUsuario` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
    select u.id_usuario,
           u.usuario,
           pe.nombre_rol                                                       as perfil,
           concat(p.nombres, ' ', p.apellido_paterno, ' ', p.apellido_materno) as persona,
           (select count(*) from usuarios where fecha_del is null)             as total
    from usuarios u
             inner join empleado p on u.id_empleado = p.id_empleado
             inner join rol pe on u.id_rol = pe.id_rol
    where u.fecha_del is null
      and concat(u.id_usuario, ' ', u.usuario, ' ', pe.nombre_rol, ' ', p.nombres, ' ', p.apellido_paterno, ' ',
                 p.apellido_materno) like concat('%', busca, '%')
    LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoVehiuclo` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200), OUT `total` INT)   BEGIN

    declare totalRegistro int;

    select id_vehiculo,
        marca,
        version,
        modelo,
        matricula,
        denominacion_comercial,
        medidas_neumaticos,
        altura,
        anchura,
        longitud,
        distancia_entre_ejes,
        masa_maxima_autorizada,
        tipo_motor,
        numero_cilindros,
        cilindarada,
        potencia_expresada_en_cv,
        potencia_expresada_en_kw,
        numero_bastidor,
        numero_plazas,
        tara,
        descripcion,
        incripcion,
        config_vehicular,
        flg_estado
    from vehiculos
    where fecha_del is null
      and concat(matricula, ' ', descripcion) like concat('%', busca, '%')
    LIMIT row1,length1;

    set totalRegistro = (select count(*)
                         from vehiculos
                         where fecha_del is null
                           and concat(matricula, ' ', descripcion) like concat('%', busca, '%'));

    select totalRegistro INTO total;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `menu` (IN `idPerfil` INT)   begin
    select o.nombre_modulo,
           o.url
    from rol_modulo po
             inner join modulo o on po.id_modulo = o.id_modulo and po.fecha_del is null
    where po.id_rol = idPerfil;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rolModulo` (IN `idPerfil` INT)   begin
    select o.id_modulo,
           o.nombre_modulo,
           (case when po.id_rol_modulo > 0 then 1 else 0 end) as activo
    from rol_modulo po
             right join modulo o on po.id_modulo = o.id_modulo and po.fecha_del is null and po.id_rol = idPerfil;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id_almacen` int(11) NOT NULL,
  `id_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cantidad_entrada` decimal(8,2) DEFAULT NULL,
  `cantidad_salida` decimal(8,2) DEFAULT '0.00',
  `cantidad_actual` decimal(8,2) DEFAULT '0.00',
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id_almacen`, `id_producto`, `cantidad_entrada`, `cantidad_salida`, `cantidad_actual`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`, `fecha_ingreso`) VALUES
(1, '2', '150.00', '0.00', '0.00', 1, '2022-09-27 23:04:03', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 23:34:44', '127.0.0.1', '2022-09-27'),
(2, '2', '100.00', '0.00', '0.00', 1, '2022-09-27 23:35:06', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 23:36:26', '127.0.0.1', '2022-09-28'),
(3, '2', '175.25', '0.00', '175.25', 1, '2022-09-27 23:35:15', '127.0.0.1', 1, '2022-09-27 23:36:22', '127.0.0.1', 1, '2022-09-27 23:49:13', '127.0.0.1', '2022-09-22'),
(4, '2', '14.00', '0.00', '14.00', 1, '2022-09-27 23:46:46', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 23:49:10', '127.0.0.1', '2022-09-28'),
(6, '2', '150.00', '0.00', '150.00', 1, '2022-09-27 23:51:41', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-27'),
(7, '2', '15.00', '0.00', '15.00', 1, '2022-09-27 23:52:08', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_area` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id_area`, `id_taller`, `codigo`, `nombre`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 2, 'aa', 'aaa', 1, '2022-09-27 00:00:00', '1', NULL, NULL, NULL, 1, '2022-09-27 22:11:40', '127.0.0.1'),
(2, 2, 'bb', 'bb', 1, '2022-09-27 00:00:00', '1', NULL, NULL, NULL, 1, '2022-09-27 22:12:40', '127.0.0.1'),
(3, 2, NULL, 'dfghdfhfhfgh', 1, '2022-09-27 21:57:00', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 22:14:44', '127.0.0.1'),
(4, 2, NULL, 'Prueba de registro de area nueva', 1, '2022-09-27 22:14:38', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, NULL, 'sdfsfsf', 1, '2022-09-27 22:15:42', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 22:15:47', '127.0.0.1'),
(6, 2, NULL, 'sdfsfsfsfsdfs', 1, '2022-09-27 22:15:45', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-27 22:17:19', '127.0.0.1'),
(7, 2, NULL, 'dgdfgdgd', 1, '2022-09-27 22:17:17', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_empleado` int(11) NOT NULL,
  `dni` varchar(8) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido_paterno` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido_materno` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sexo` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`id_empleado`, `dni`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, '72669187', 'Franklin Ruiz', 'Asto', 'Leon', 'Masculino', 1, '2021-05-01 01:03:57', '1', 1, '2021-09-26 22:53:15', '::1', 1, '2022-09-10 00:56:10', '127.0.0.1'),
(11, '72669188', 'Franklin Ruiz3', 'Asto', 'Leon', 'Masculino', 1, '2022-09-09 23:37:20', '127.0.0.1', 1, '2022-09-09 23:37:55', '127.0.0.1', 1, '2022-09-09 23:39:08', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulo`
--

CREATE TABLE `modulo` (
  `id_modulo` int(11) NOT NULL,
  `nombre_modulo` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `modulo`
--

INSERT INTO `modulo` (`id_modulo`, `nombre_modulo`, `url`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'Seguridad', 'seguridad', 1, '2021-04-30 20:22:03', '::1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Persona', 'persona', 1, '2021-04-30 20:40:54', '::1', 1, '2021-05-02 15:04:06', '::1', NULL, NULL, NULL),
(14, 'etrt', 'ert200', 1, '2022-09-09 23:56:07', '127.0.0.1', 1, '2022-09-09 23:56:28', '127.0.0.1', 1, '2022-09-09 23:56:34', '127.0.0.1'),
(15, 'Producto', 'producto', 1, '2022-09-27 19:37:53', '127.0.0.1', 1, '2022-09-28 00:44:23', '127.0.0.1', NULL, NULL, NULL),
(16, 'Taller', 'taller', 1, '2022-09-27 19:38:01', '127.0.0.1', 1, '2022-09-28 00:44:31', '127.0.0.1', NULL, NULL, NULL),
(17, 'Almacen', 'almacen', 1, '2022-09-27 22:34:21', '127.0.0.1', 1, '2022-09-28 00:44:37', '127.0.0.1', NULL, NULL, NULL),
(18, 'Vehiculo', 'vehiculo', 1, '2022-09-28 20:20:07', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL,
  `codigo_producto` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `stock` decimal(8,2) DEFAULT '0.00',
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id_producto`, `codigo_producto`, `nombre`, `descripcion`, `estado`, `precio`, `stock`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'C0002', 'gfh', 'fgh2020', 1, '10.20', '10.00', 1, '2022-09-10 00:51:56', '127.0.0.1', 1, '2022-09-10 00:56:06', '127.0.0.1', 1, '2022-09-10 00:56:35', '127.0.0.1'),
(2, 'C0002', 'asdad', 'adasd', 1, '120.50', '175.00', 1, '2022-09-10 00:57:08', '127.0.0.1', 1, '2022-09-10 00:57:15', '127.0.0.1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`, `descripcion`, `estado`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'administrador', 'prueba', 1, 1, '2021-04-30 22:41:48', '::1', 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL),
(5, 'asdad', 'asdasd2020', 1, 1, '2022-09-09 23:53:31', '127.0.0.1', 1, '2022-09-09 23:54:07', '127.0.0.1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_modulo`
--

CREATE TABLE `rol_modulo` (
  `id_rol_modulo` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `rol_modulo`
--

INSERT INTO `rol_modulo` (`id_rol_modulo`, `id_rol`, `id_modulo`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(167, 1, 1, 1, '2022-08-30 21:25:21', '::1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(168, 1, 2, 1, '2022-08-30 21:25:21', '::1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(169, 5, 1, 1, '2022-09-09 23:53:31', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-09 23:54:07', '127.0.0.1'),
(170, 5, 1, 1, '2022-09-09 23:54:07', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(171, 1, 1, 1, '2022-09-27 19:38:09', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(172, 1, 2, 1, '2022-09-27 19:38:09', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(173, 1, 15, 1, '2022-09-27 19:38:09', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(174, 1, 16, 1, '2022-09-27 19:38:09', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(175, 1, 1, 1, '2022-09-27 22:34:27', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(176, 1, 2, 1, '2022-09-27 22:34:27', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(177, 1, 15, 1, '2022-09-27 22:34:27', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(178, 1, 16, 1, '2022-09-27 22:34:27', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(179, 1, 17, 1, '2022-09-27 22:34:27', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 20:20:13', '127.0.0.1'),
(180, 1, 1, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(181, 1, 2, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(182, 1, 15, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(183, 1, 16, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(184, 1, 17, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(185, 1, 18, 1, '2022-09-28 20:20:13', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taller`
--

CREATE TABLE `taller` (
  `id_taller` int(11) NOT NULL,
  `codigo_taller` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `concesionario` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `taller`
--

INSERT INTO `taller` (`id_taller`, `codigo_taller`, `nombre`, `direccion`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`, `concesionario`) VALUES
(1, 'C0002', 'El agustino', 'av lucas', 1, '2022-09-10 01:16:27', '127.0.0.1', 1, '2022-09-10 01:19:32', '127.0.0.1', 1, '2022-09-10 01:19:37', '127.0.0.1', NULL),
(2, 'C0002', 'roche1', 'Av. San  553, Lima', 1, '2022-09-27 19:38:20', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'm00024', 'Las malvinas 1', 'las malvinas 145 n2 ', 1, '2022-09-28 00:24:14', '127.0.0.1', 1, '2022-09-28 00:39:22', '127.0.0.1', NULL, NULL, NULL, 'Las malvinas'),
(4, 'fghf', 'fgh', 'fghfh', 1, '2022-09-28 00:36:18', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 00:41:31', '127.0.0.1', ''),
(5, 'gjhghj', 'ghjghj', 'hgjgj', 1, '2022-09-28 00:37:55', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-28 00:41:27', '127.0.0.1', 'ghjhgj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `id_area` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `usuario` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_empleado`, `id_area`, `id_rol`, `usuario`, `password`, `correo`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`, `estado`) VALUES
(1, 1, 15, 1, 'admin', '$2y$13$AzSu7ICHHQQo7durNWiSju29o9CNOKhynuXmp1RnAE2thoZppAQiW', 'franklin.asto.leon@gmail.com', 1, '2021-04-30 01:16:30', 'a', 1, '2021-06-29 23:51:59', '::1', NULL, NULL, NULL, 1),
(10, 1, NULL, 1, 'admin1', '$2y$13$pY8ebvvP9Ih2hw32aS63RuW0Oy5QYiS6uecuZVQEb9EZ/Kml.ta4i', 'franklin.asto.leon@gmail.com', 1, '2022-09-10 00:01:37', '127.0.0.1', 1, '2022-09-10 00:03:46', '127.0.0.1', 1, '2022-09-10 00:03:52', '127.0.0.1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id_vehiculo` int(11) NOT NULL,
  `marca` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modelo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matricula` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `denominacion_comercial` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `medidas_neumaticos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anchura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitud` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `distancia_entre_ejes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `masa_maxima_autorizada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_motor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_cilindros` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cilindarada` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `potencia_expresada_en_cv` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `potencia_expresada_en_kw` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_bastidor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_plazas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tara` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incripcion` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `config_vehicular` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `flg_estado` tinyint(1) NOT NULL,
  `id_usuario_reg` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario_act` int(11) DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_usuario_del` int(11) DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id_vehiculo`, `marca`, `version`, `modelo`, `matricula`, `denominacion_comercial`, `medidas_neumaticos`, `altura`, `anchura`, `longitud`, `distancia_entre_ejes`, `masa_maxima_autorizada`, `tipo_motor`, `numero_cilindros`, `cilindarada`, `potencia_expresada_en_cv`, `potencia_expresada_en_kw`, `numero_bastidor`, `numero_plazas`, `tara`, `descripcion`, `incripcion`, `config_vehicular`, `flg_estado`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'toyota', 'as', 'as', 'as', 'as', 'as', 'as', 'as', 'as', NULL, NULL, 'as', 'as', NULL, 'as', 'as', 'as', 'as', 'as', '2022', 'as', 'as', 1, 1, '2022-09-28 20:00:07', '127.0.0.1', 1, '2022-09-28 20:17:05', '127.0.0.1', 1, '2022-09-28 20:17:09', '127.0.0.1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id_almacen`);

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_empleado`) USING BTREE;

--
-- Indices de la tabla `modulo`
--
ALTER TABLE `modulo`
  ADD PRIMARY KEY (`id_modulo`) USING BTREE;

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`) USING BTREE;

--
-- Indices de la tabla `rol_modulo`
--
ALTER TABLE `rol_modulo`
  ADD PRIMARY KEY (`id_rol_modulo`) USING BTREE;

--
-- Indices de la tabla `taller`
--
ALTER TABLE `taller`
  ADD PRIMARY KEY (`id_taller`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`) USING BTREE;

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id_almacen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `rol_modulo`
--
ALTER TABLE `rol_modulo`
  MODIFY `id_rol_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
