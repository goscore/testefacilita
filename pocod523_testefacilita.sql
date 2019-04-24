-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 24, 2019 at 04:13 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pocod523_testefacilita`
--

-- --------------------------------------------------------

--
-- Table structure for table `carros`
--

CREATE TABLE `carros` (
  `carroid` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `marca` int(11) NOT NULL,
  `preco` double NOT NULL,
  `excluido` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `carros`
--

INSERT INTO `carros` (`carroid`, `nome`, `marca`, `preco`, `excluido`) VALUES
(1, 'Palio ', 1, 40000, 'N'),
(2, 'Palio edit', 1, 40000, 'S'),
(3, 'Gol', 2, 50499.9, 'N'),
(4, 'i30 ', 3, 70900, 'N'),
(5, 'Palio Weekend ', 1, 85000, 'N');

-- --------------------------------------------------------

--
-- Table structure for table `cores`
--

CREATE TABLE `cores` (
  `coreid` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `variacao` float NOT NULL,
  `excluido` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cores`
--

INSERT INTO `cores` (`coreid`, `nome`, `variacao`, `excluido`) VALUES
(1, 'Branco', 12, 'N'),
(2, 'Preto', 5, 'N'),
(3, 'Prata', 13, 'N'),
(4, 'Branco edit', 14, 'S');

-- --------------------------------------------------------

--
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `marcaid` int(11) NOT NULL,
  `nome` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `excluido` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`marcaid`, `nome`, `excluido`) VALUES
(1, 'FIAT', 'N'),
(2, 'Volkswagen', 'N'),
(3, 'Hyundai', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarioid` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `grupo` varchar(55) DEFAULT NULL,
  `datacadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `excluido` varchar(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`usuarioid`, `nome`, `email`, `senha`, `grupo`, `datacadastro`, `excluido`) VALUES
(1, 'Rychard Hiago', 'rychardhiago@gmail.com', '$2y$10$Hfm3vstHgKo2WEG6GkJ8/.7S1/E4k8ggZTn0DzV2n.eT04A/SLlcW', 'Admin', '2019-04-24 15:53:37', 'N'),
(2, 'Admin Facilita', 'adm@facilita.com.br', '$2y$10$3UYIO.TDtKvKgnDaNxgz9eTl0/tmrzGoMtIzL8R5L8cYN7BH2uJMK', 'Admin', '2019-04-24 17:27:33', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `vendas`
--

CREATE TABLE `vendas` (
  `vendaid` int(11) NOT NULL,
  `carroid` int(11) NOT NULL,
  `coreid` int(11) NOT NULL,
  `variacao` float NOT NULL,
  `desconto` double DEFAULT NULL,
  `valorfinal` double NOT NULL,
  `cliente` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rodas` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `vl_rodas` double NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `excluido` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vendas`
--

INSERT INTO `vendas` (`vendaid`, `carroid`, `coreid`, `variacao`, `desconto`, `valorfinal`, `cliente`, `rodas`, `vl_rodas`, `data`, `excluido`) VALUES
(1, 1, 1, 12, 0, 44800, 'JoÃ£o', 'N', 0, '2019-04-24 20:26:24', 'N'),
(2, 4, 2, 5, 0, 74445, 'Pedro', 'S', 0, '2019-04-24 20:26:24', 'N'),
(3, 5, 2, 5, 0, 90450, 'Maria', 'S', 1200, '2019-04-24 20:26:24', 'N'),
(4, 4, 1, 12, 7, 73849.44, 'JosÃ©', 'N', 0, '2019-04-24 20:34:00', 'S'),
(5, 4, 1, 12, 5558.56, 73849.44, 'Jose', 'N', 0, '2019-04-24 20:35:52', 'N'),
(6, 3, 3, 13, 0, 57064.887, 'Rychard', 'N', 0, '2019-04-24 20:52:31', 'N'),
(7, 4, 3, 13, 5608.19, 74508.81, 'Hiago', 'N', 0, '2019-04-24 20:52:44', 'N');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`carroid`),
  ADD KEY `carros_marcas` (`marca`);

--
-- Indexes for table `cores`
--
ALTER TABLE `cores`
  ADD PRIMARY KEY (`coreid`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marcaid`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarioid`);

--
-- Indexes for table `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`vendaid`),
  ADD KEY `vendas_carros` (`carroid`),
  ADD KEY `vendas_cores` (`coreid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carros`
--
ALTER TABLE `carros`
  MODIFY `carroid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cores`
--
ALTER TABLE `cores`
  MODIFY `coreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marcaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarioid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vendas`
--
ALTER TABLE `vendas`
  MODIFY `vendaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carros`
--
ALTER TABLE `carros`
  ADD CONSTRAINT `carros_marcas` FOREIGN KEY (`marca`) REFERENCES `marcas` (`marcaid`);

--
-- Constraints for table `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_carros` FOREIGN KEY (`carroid`) REFERENCES `carros` (`carroid`),
  ADD CONSTRAINT `vendas_cores` FOREIGN KEY (`coreid`) REFERENCES `cores` (`coreid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
