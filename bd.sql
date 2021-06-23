-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 02, 2021 at 05:34 AM
-- Server version: 5.7.32
-- PHP Version: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `Seguros`
--

-- --------------------------------------------------------

--
-- Table structure for table `aseguradoras`
--

CREATE TABLE `aseguradoras` (
  `id_aseguradora` int(11) NOT NULL,
  `raz_soc_asc` varchar(50) NOT NULL,
  `ruc_asc` varchar(20) NOT NULL,
  `tel_ven` int(11) NOT NULL,
  `tel_emergencia` int(11) NOT NULL,
  `id_clinica` int(11) NOT NULL,
  `id_taller` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `aseguradoras`
--

INSERT INTO `aseguradoras` (`id_aseguradora`, `raz_soc_asc`, `ruc_asc`, `tel_ven`, `tel_emergencia`, `id_clinica`, `id_taller`) VALUES
(1, 'RIMAC SEGUROS Y REASEGUROS', '20100041953', 981252444, 14111111, 0, 0),
(2, 'Pacífico Compañía de Seguros y Reaseguros ', '20332970411', 15135000, 14151515, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `des_cate` varchar(200) NOT NULL,
  `est_cate` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `des_cate`, `est_cate`) VALUES
(1, 'SOAT Vehicular', '1'),
(2, 'Seguro Vehicular', '1');

-- --------------------------------------------------------

--
-- Table structure for table `coberturas`
--

CREATE TABLE `coberturas` (
  `id_cobertura` int(11) NOT NULL,
  `des_cober` varchar(200) NOT NULL,
  `rest_cober` varchar(200) NOT NULL,
  `est_cobe` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `coberturas`
--

INSERT INTO `coberturas` (`id_cobertura`, `des_cober`, `rest_cober`, `est_cobe`) VALUES
(1, 'Ahorro en gasolina repsol', 'valido a nivel nacional', '2'),
(2, '30% de descuento en revision tecnica', 'valido en cedive a nivel nacional', '1'),
(3, '20% de descuento en barerias ETNA', '', '1'),
(4, 'Te incluye 2 servicios de chofer de remplazo', 'Para cualquier evento social que tengas', '1'),
(5, 'SOAT asistencia vial ', 'te cubre cambio de llantas, suministro de gasolina (hasta 2 galones pagados por el asegurado), paso de corriente y apertura', '1'),
(6, 'Servicio de grua', '2 servicios de grua en caso de emergencia', '1'),
(7, 'Seguro vehicular flexible', 'Adios a pagar coberturas y asistencias que nunca usas', ''),
(8, 'robo toal', '', ''),
(9, 'asistencia Vehicular', '', ''),
(10, 'soat gratis', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_cobertura`
--

CREATE TABLE `detalle_cobertura` (
  `id_detalle_cobe` int(11) NOT NULL,
  `id_cobertura` int(11) NOT NULL,
  `id_seguro` int(11) NOT NULL,
  `des_cobe` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `detalle_cobertura`
--

INSERT INTO `detalle_cobertura` (`id_detalle_cobe`, `id_cobertura`, `id_seguro`, `des_cobe`) VALUES
(1, 1, 1, ''),
(2, 2, 1, ''),
(4, 7, 5, 'Paga por kilometros'),
(5, 8, 5, ''),
(6, 5, 5, 'Ten tu SOAt abslutamente gratis con asistencia vial');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_exclusion`
--

CREATE TABLE `detalle_exclusion` (
  `id_detalle_exclu` int(11) NOT NULL,
  `id_seguro` int(11) NOT NULL,
  `id_exclusion` int(11) NOT NULL,
  `des_exclu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exclusiones`
--

CREATE TABLE `exclusiones` (
  `id_exclusion` int(11) NOT NULL,
  `des_exclu` varchar(200) NOT NULL,
  `rest_exclu` varchar(200) NOT NULL,
  `est_exclu` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RedClinicas`
--

CREATE TABLE `RedClinicas` (
  `id_clinica` int(11) NOT NULL,
  `nombre_clinica` varchar(40) NOT NULL,
  `tipo_entidad` varchar(20) NOT NULL,
  `departamento` varchar(20) NOT NULL,
  `provincia` varchar(20) NOT NULL,
  `distrito` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` int(11) NOT NULL,
  `capacidad_emer` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RedTalleres`
--

CREATE TABLE `RedTalleres` (
  `id_taller` int(11) NOT NULL,
  `nombre_taller` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `zona` varchar(20) NOT NULL,
  `telefono` int(11) NOT NULL,
  `categoria` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `seguros`
--

CREATE TABLE `seguros` (
  `id_seguro` int(11) NOT NULL,
  `nombre_seguro` varchar(50) NOT NULL,
  `prima_desde` int(11) NOT NULL,
  `detalle` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  `id_aseguradora` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `seguros`
--

INSERT INTO `seguros` (`id_seguro`, `nombre_seguro`, `prima_desde`, `detalle`, `url`, `id_aseguradora`, `id_categoria`) VALUES
(1, 'Plan SOAT', 60, 'plan vigente por 1 año', '', 1, 1),
(2, 'Plan SOAT Plus', 199, 'Plan vigente por 1 año', '', 1, 1),
(3, 'SOAT TAXI SALUD', 299, '', '', 1, 1),
(4, 'SOAT con asistencia VIAL', 99, '', '', 1, 1),
(5, 'Plan Vehicular Flexible', 51, 'Personaliza tu seguro', '', 1, 2),
(6, 'Plan Premier Plata', 103, 'Nuevo con 30% dcto', '', 1, 2),
(7, 'Plan pago por Kilometros', 82, 'Protege tu carro al maximo', '', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aseguradoras`
--
ALTER TABLE `aseguradoras`
  ADD PRIMARY KEY (`id_aseguradora`),
  ADD KEY `id_clinica` (`id_clinica`),
  ADD KEY `id_taller` (`id_taller`);

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `coberturas`
--
ALTER TABLE `coberturas`
  ADD PRIMARY KEY (`id_cobertura`);

--
-- Indexes for table `detalle_cobertura`
--
ALTER TABLE `detalle_cobertura`
  ADD PRIMARY KEY (`id_detalle_cobe`),
  ADD KEY `id_cobertura` (`id_cobertura`),
  ADD KEY `id_seguro` (`id_seguro`);

--
-- Indexes for table `detalle_exclusion`
--
ALTER TABLE `detalle_exclusion`
  ADD PRIMARY KEY (`id_detalle_exclu`),
  ADD KEY `id_seguro` (`id_seguro`),
  ADD KEY `id_exclusion` (`id_exclusion`);

--
-- Indexes for table `exclusiones`
--
ALTER TABLE `exclusiones`
  ADD PRIMARY KEY (`id_exclusion`);

--
-- Indexes for table `RedClinicas`
--
ALTER TABLE `RedClinicas`
  ADD PRIMARY KEY (`id_clinica`);

--
-- Indexes for table `RedTalleres`
--
ALTER TABLE `RedTalleres`
  ADD PRIMARY KEY (`id_taller`);

--
-- Indexes for table `seguros`
--
ALTER TABLE `seguros`
  ADD PRIMARY KEY (`id_seguro`),
  ADD KEY `id_categoria` (`id_categoria`) USING BTREE,
  ADD KEY `id_aseguradora_2` (`id_aseguradora`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_cobertura`
--
ALTER TABLE `detalle_cobertura`
  ADD CONSTRAINT `detalle_cobertura_ibfk_1` FOREIGN KEY (`id_seguro`) REFERENCES `seguros` (`id_seguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_cobertura_ibfk_2` FOREIGN KEY (`id_cobertura`) REFERENCES `coberturas` (`id_cobertura`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `detalle_exclusion`
--
ALTER TABLE `detalle_exclusion`
  ADD CONSTRAINT `detalle_exclusion_ibfk_1` FOREIGN KEY (`id_seguro`) REFERENCES `seguros` (`id_seguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_exclusion_ibfk_2` FOREIGN KEY (`id_exclusion`) REFERENCES `exclusiones` (`id_exclusion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RedClinicas`
--
ALTER TABLE `RedClinicas`
  ADD CONSTRAINT `redclinicas_ibfk_1` FOREIGN KEY (`id_clinica`) REFERENCES `aseguradoras` (`id_clinica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `RedTalleres`
--
ALTER TABLE `RedTalleres`
  ADD CONSTRAINT `redtalleres_ibfk_1` FOREIGN KEY (`id_taller`) REFERENCES `aseguradoras` (`id_taller`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `seguros`
--
ALTER TABLE `seguros`
  ADD CONSTRAINT `seguros_ibfk_1` FOREIGN KEY (`id_aseguradora`) REFERENCES `aseguradoras` (`id_aseguradora`),
  ADD CONSTRAINT `seguros_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;
