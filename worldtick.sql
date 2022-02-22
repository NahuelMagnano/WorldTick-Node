-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-02-2022 a las 23:24:47
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `worldtick`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `cuerpo` text NOT NULL,
  `img_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `cuerpo`, `img_id`) VALUES
(14, 'Un nuevo equipo podría ingresar a la F1', 'En los últimos años, el Andretti Autosport incursionó en categorías como A1 Grand Prix, American Le Mans Series, Fórmula E con BMW y el Campeonato de RallyCross. También Michael tuvo acercamientos con Alfa Romeo para hacer algo en conjunto con Sauber Motorsports, pero no prosperó. Ahora parece que el rumbo es hacer un equipo propio que ingresaría a la F1 desde la temporada 2024.', 'irqojmngrs0skpdvgz6e'),
(16, 'Compara el Mercedes W13 con el Ferrari F1-75', 'Dos de los equipos más relevantes de la Fórmula 1 ya presentaron su coches para el nuevo campeonato que comenzará el 20 de marzo con el Gran Premio de Bahréin en el estreno de un nuevo reglamento técnico de la categoría.', 'lkbbwwlfs2sbzluhr07t'),
(17, 'El subidón de la Fórmula 1', 'La Fórmula 1 ha crecido... y de qué manera. No es de extrañar teniendo en cuenta que el Mundial de 2021 se decidió en la última vuelta de la carrera final que se disputó en el circuito de Yas Marina. Max Verstappen destronó al heptacampeón Lewis Hamilton en el último suspiro. Mercedes logró su octava corona en Constructores, pero Red Bull le arrebató el título en Pilotos. Hubo drama, emoción a raudales y polémica, mucha polémica.', 'n6ihjeforvqu0uamw8a3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(8, 'flavia', 'e10adc3949ba59abbe56e057f20f883e'),
(9, 'Nahuel', 'a9be4c2a4041cadbf9d61ae16dd1389e'),
(6, 'juan', '81dc9bdb52d04dc20036dbd8313ed055');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
