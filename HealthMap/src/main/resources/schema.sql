SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Base de datos: `health_map`

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `country`

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
    `country_code` varchar(20) NOT NULL,
    `country_name` varchar(50) NOT NULL,
    PRIMARY KEY (`country_code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `healthindicador`

DROP TABLE IF EXISTS `healthindicador`;
CREATE TABLE IF NOT EXISTS `healthindicador` (
    `indicador_code` varchar(50) NOT NULL,
    `indicador_name` varchar(100) NOT NULL,
    PRIMARY KEY (`indicador_code`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `data`

DROP TABLE IF EXISTS `data`;
CREATE TABLE IF NOT EXISTS `data` (
    `id_data` int(11) NOT NULL AUTO_INCREMENT,
    `indicador_code` varchar(50) NOT NULL,
    `country_code` varchar(10) NOT NULL,
    `year` varchar(100) NOT NULL,
    `indicador_value` DECIMAL(10),
    PRIMARY KEY (`id_data`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

-- Estructura de tabla para la tabla `healthindicadores`

DROP TABLE IF EXISTS `healthindicadores`;
CREATE TABLE IF NOT EXISTS `healthindicadores` (
    `id_indicadores` int(11) NOT NULL AUTO_INCREMENT,
    `indicador_code` varchar(50) NOT NULL,
    `indicador_name` varchar(50) NOT NULL,
    `source_nota` varchar(1000) NOT NULL,
    `source_organization` varchar(1000) NOT NULL,
    PRIMARY KEY (`id_indicadores`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `healthindicadores`

-- --------------------------------------------------------

-- Estructura de tabla para la tabla `usuario`

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE IF NOT EXISTS `usuario` (
    `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) NOT NULL,
    `clave` varchar(50) NOT NULL,
    PRIMARY KEY (`id_usuario`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcado de datos para la tabla `usuario`

INSERT INTO `usuario` (`id_usuario`, `nombre`, `clave`) VALUES
                                                            (1, 'Administrador', 'dinora'),
                                                            (2, 'Analista', 'lucia');

COMMIT;
