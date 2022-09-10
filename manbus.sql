-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-09-2022 a las 06:21:42
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
           direccion
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
(14, 'etrt', 'ert200', 1, '2022-09-09 23:56:07', '127.0.0.1', 1, '2022-09-09 23:56:28', '127.0.0.1', 1, '2022-09-09 23:56:34', '127.0.0.1');

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
  `stock` tinyint(1) NOT NULL,
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
(1, 'C0002', 'gfh', 'fgh2020', 1, '10.20', 10, 1, '2022-09-10 00:51:56', '127.0.0.1', 1, '2022-09-10 00:56:06', '127.0.0.1', 1, '2022-09-10 00:56:35', '127.0.0.1'),
(2, 'C0002', 'asdad', 'adasd', 1, '120.50', 10, 1, '2022-09-10 00:57:08', '127.0.0.1', 1, '2022-09-10 00:57:15', '127.0.0.1', NULL, NULL, NULL);

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
(1, 'administrador', 'prueba', 1, 1, '2021-04-30 22:41:48', '::1', 1, '2022-08-30 21:25:21', '::1', NULL, NULL, NULL),
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
(167, 1, 1, 1, '2022-08-30 21:25:21', '::1', NULL, NULL, NULL, NULL, NULL, NULL),
(168, 1, 2, 1, '2022-08-30 21:25:21', '::1', NULL, NULL, NULL, NULL, NULL, NULL),
(169, 5, 1, 1, '2022-09-09 23:53:31', '127.0.0.1', NULL, NULL, NULL, 1, '2022-09-09 23:54:07', '127.0.0.1'),
(170, 5, 1, 1, '2022-09-09 23:54:07', '127.0.0.1', NULL, NULL, NULL, NULL, NULL, NULL);

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
  `ipmaq_del` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `taller`
--

INSERT INTO `taller` (`id_taller`, `codigo_taller`, `nombre`, `direccion`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'C0002', 'El agustino', 'av lucas', 1, '2022-09-10 01:16:27', '127.0.0.1', 1, '2022-09-10 01:19:32', '127.0.0.1', 1, '2022-09-10 01:19:37', '127.0.0.1');

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

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `modulo`
--
ALTER TABLE `modulo`
  MODIFY `id_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `id_rol_modulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT de la tabla `taller`
--
ALTER TABLE `taller`
  MODIFY `id_taller` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
