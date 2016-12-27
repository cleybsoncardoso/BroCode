-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dsoutletdois
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cpf` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nascimento` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `enderecoIDEndereco` int(10) unsigned NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`,`cpf`,`enderecoIDEndereco`),
  KEY `fk_Cliente_Endereco1_idx` (`enderecoIDEndereco`),
  CONSTRAINT `fk_Cliente_Endereco1` FOREIGN KEY (`enderecoIDEndereco`) REFERENCES `endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divida`
--

DROP TABLE IF EXISTS `divida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `divida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(5,2) NOT NULL,
  `parcelasAPagar` int(11) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `cliente_IDCliente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Divida_Cliente1_idx` (`cliente_IDCliente`),
  CONSTRAINT `fk_Divida_Cliente1` FOREIGN KEY (`cliente_IDCliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divida`
--

LOCK TABLES `divida` WRITE;
/*!40000 ALTER TABLE `divida` DISABLE KEYS */;
/*!40000 ALTER TABLE `divida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cep` varchar(9) DEFAULT NULL,
  `logradouro` varchar(80) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linha_de_venda`
--

DROP TABLE IF EXISTS `linha_de_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linha_de_venda` (
  `produto_IDProduto` int(10) unsigned NOT NULL,
  `venda_IDVenda` int(10) unsigned NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  KEY `fk_Linha_De_Venda_Produto1_idx` (`produto_IDProduto`),
  KEY `fk_Linha_De_Venda_Venda1_idx` (`venda_IDVenda`),
  CONSTRAINT `fk_Linha_De_Venda_Produto1` FOREIGN KEY (`produto_IDProduto`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linha_De_Venda_Venda1` FOREIGN KEY (`venda_IDVenda`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linha_de_venda`
--

LOCK TABLES `linha_de_venda` WRITE;
/*!40000 ALTER TABLE `linha_de_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `linha_de_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loja`
--

DROP TABLE IF EXISTS `loja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loja` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `enderecoIDEndereco` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`enderecoIDEndereco`),
  KEY `fk_Loja_Endereco1_idx` (`enderecoIDEndereco`),
  CONSTRAINT `fk_Loja_Endereco1` FOREIGN KEY (`enderecoIDEndereco`) REFERENCES `endereco` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `tamanho` varchar(3) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `precoEntrada` decimal(5,2) DEFAULT NULL,
  `precoSaidaPadrao` decimal(5,2) DEFAULT NULL,
  `maximo` int(11) DEFAULT NULL,
  `minimo` int(11) DEFAULT NULL,
  `dataUltimaCompra` timestamp NULL DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro`
--

DROP TABLE IF EXISTS `registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loja_id` int(10) unsigned NOT NULL,
  `usuario_id` int(10) unsigned NOT NULL,
  `tipo` enum('e','s') DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `produto_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_registro_loja1_idx` (`loja_id`),
  KEY `fk_registro_usuario1_idx` (`usuario_id`),
  KEY `fk_registro_produto1_idx` (`produto_id`),
  CONSTRAINT `fk_registro_loja1` FOREIGN KEY (`loja_id`) REFERENCES `loja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `acesso` enum('A','C') NOT NULL,
  `dataAdmissao` date NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `ativo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (5,'cley','admin','admin','cley@cley','A','2016-12-23','99999',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `valor` decimal(6,2) NOT NULL,
  `tipoDePagamento` enum('debito','credito','dinheiro','fiado','cheque') NOT NULL,
  `usuario_IDUsuario` int(10) unsigned NOT NULL,
  `cliente_IDCliente` int(10) unsigned DEFAULT NULL,
  `dataVenda` date NOT NULL,
  `horaVenda` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Venda_Usuario1_idx` (`usuario_IDUsuario`),
  KEY `fk_Venda_Cliente1_idx` (`cliente_IDCliente`),
  CONSTRAINT `fk_Venda_Cliente1` FOREIGN KEY (`cliente_IDCliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Usuario1` FOREIGN KEY (`usuario_IDUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-23 10:39:35
