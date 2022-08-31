-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-08-2022 a las 06:44:10
-- Versión del servidor: 8.0.26
-- Versión de PHP: 8.1.6

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
		pe.nombre_perfil as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona
	from usuarios u
		inner join personas p on u.id_persona = p.id_persona
		inner join perfiles pe on u.id_perfil = pe.id_perfil
  where u.fecha_del is null and u.id_usuario = idUsuario;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoModulo` (IN `row1` INT, IN `length1` INT, IN `buscar` VARCHAR(200))   BEGIN
   SELECT
			id_opcion as id_modulo,
			nombre_opcion as nombre_modulo,
			url as ruta,
			(select count(*) from opciones where fecha_del is null) as total
		FROM opciones where fecha_del is null and nombre_opcion like concat('%',buscar,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoPerfil` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
   SELECT
			id_perfil,
			nombre_perfil,
			descripcion,
			estado,
			(select count(*) from perfiles where fecha_del is null) as total
		FROM perfiles where fecha_del is null and nombre_perfil like concat('%',busca,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoPersona` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
	select
		id_persona,
		dni,
		nombres,
		apellido_paterno,
		apellido_materno,
		(select count(*) from personas where fecha_del is null) as total
	from personas
  where fecha_del is null and concat(nombres,' ',apellido_paterno,' ',apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listadoUsuario` (IN `row1` INT, IN `length1` INT, IN `busca` VARCHAR(200))   BEGIN
	select
		u.id_usuario,
		u.usuario,
		pe.nombre_perfil as perfil,
		concat(p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) as persona,
		(select count(*) from usuarios where fecha_del is null) as total
	from usuarios u
		inner join personas p on u.id_persona = p.id_persona
		inner join perfiles pe on u.id_perfil = pe.id_perfil
  where u.fecha_del is null and concat(u.id_usuario,' ',u.usuario,' ',pe.nombre_perfil,' ',p.nombres,' ',p.apellido_paterno,' ',p.apellido_materno) like concat('%',busca,'%')
		LIMIT row1,length1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `menu` (IN `idPerfil` INT)   begin
select
	o.nombre_opcion,
	o.url
from perfil_opciones po
inner join opciones o on po.id_opcion = o.id_opcion and po.fecha_del is null
where po.id_perfil = idPerfil;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `prefilOpciones` (IN `idPerfil` INT)   begin
select
o.id_opcion,
o.nombre_opcion,
(case when po.id_perfil_opcion > 0 then 1 else 0 end) as activo
from perfil_opciones po
right join opciones o on po.id_opcion = o.id_opcion and po.fecha_del is null and po.id_perfil = idPerfil;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opciones`
--

CREATE TABLE `opciones` (
  `id_opcion` int NOT NULL,
  `nombre_opcion` varchar(200) COLLATE utf8_bin NOT NULL,
  `url` varchar(200) COLLATE utf8_bin NOT NULL,
  `id_usuario_reg` int NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_usuario_act` int DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_del` int DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `opciones`
--

INSERT INTO `opciones` (`id_opcion`, `nombre_opcion`, `url`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'Seguridad', 'seguridad', 1, '2022-08-30 23:41:24', '::1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Persona', 'persona', 1, '2022-08-30 23:41:41', '::1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id_perfil` int NOT NULL,
  `nombre_perfil` varchar(50) COLLATE utf8_bin NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_bin NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `id_usuario_reg` int NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_act` int DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_del` int DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id_perfil`, `nombre_perfil`, `descripcion`, `estado`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 'administrador', 'administrador', 1, 1, '2022-08-30 00:00:00', '11', 1, '2022-08-30 23:41:48', '::1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_opciones`
--

CREATE TABLE `perfil_opciones` (
  `id_perfil_opcion` int NOT NULL,
  `id_perfil` int NOT NULL,
  `id_opcion` int NOT NULL,
  `id_usuario_reg` int NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_usuario_act` int DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_del` int DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `perfil_opciones`
--

INSERT INTO `perfil_opciones` (`id_perfil_opcion`, `id_perfil`, `id_opcion`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, 1, 1, 1, '2022-08-30 23:41:48', '::1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, 1, '2022-08-30 23:41:48', '::1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id_persona` int NOT NULL,
  `dni` varchar(8) COLLATE utf8_bin NOT NULL,
  `nombres` varchar(50) COLLATE utf8_bin NOT NULL,
  `apellido_paterno` varchar(200) COLLATE utf8_bin NOT NULL,
  `apellido_materno` varchar(200) COLLATE utf8_bin NOT NULL,
  `sexo` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_usuario_reg` int NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_usuario_act` int DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_del` int DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id_persona`, `dni`, `nombres`, `apellido_paterno`, `apellido_materno`, `sexo`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`) VALUES
(1, '71255419', 'albin', 'hinostroza', 'macavilca', 'M', 1, '2022-08-30 00:00:00', '1', NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL,
  `id_persona` int NOT NULL,
  `id_area` int NOT NULL,
  `id_perfil` int NOT NULL,
  `usuario` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(200) COLLATE utf8_bin NOT NULL,
  `correo` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_reg` int NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `ipmaq_reg` varchar(20) COLLATE utf8_bin NOT NULL,
  `id_usuario_act` int DEFAULT NULL,
  `fecha_act` datetime DEFAULT NULL,
  `ipmaq_act` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `id_usuario_del` int DEFAULT NULL,
  `fecha_del` datetime DEFAULT NULL,
  `ipmaq_del` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `id_area`, `id_perfil`, `usuario`, `password`, `correo`, `id_usuario_reg`, `fecha_reg`, `ipmaq_reg`, `id_usuario_act`, `fecha_act`, `ipmaq_act`, `id_usuario_del`, `fecha_del`, `ipmaq_del`, `estado`) VALUES
(1, 1, 1, 1, 'admin', '$2y$13$AzSu7ICHHQQo7durNWiSju29o9CNOKhynuXmp1RnAE2thoZppAQiW', 'a', 1, '2022-08-30 00:00:00', '111', NULL, NULL, NULL, NULL, NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `opciones`
--
ALTER TABLE `opciones`
  ADD PRIMARY KEY (`id_opcion`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id_perfil`);

--
-- Indices de la tabla `perfil_opciones`
--
ALTER TABLE `perfil_opciones`
  ADD PRIMARY KEY (`id_perfil_opcion`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id_persona`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `opciones`
--
ALTER TABLE `opciones`
  MODIFY `id_opcion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id_perfil` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil_opciones`
--
ALTER TABLE `perfil_opciones`
  MODIFY `id_perfil_opcion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id_persona` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
