-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: dsoutlet
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL,
  `valor` decimal(5,2) NOT NULL,
  `parcelasAPagar` int(11) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `cliente_IDCliente` int(10) unsigned NOT NULL,
  `cliente_CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Divida_Cliente1_idx` (`cliente_IDCliente`,`cliente_CPF`),
  CONSTRAINT `fk_Divida_Cliente1` FOREIGN KEY (`cliente_IDCliente`, `cliente_CPF`) REFERENCES `cliente` (`id`, `cpf`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'teste','teste','P',200,300.00,200.00,500,100),(2,'asdf','asdf','P',1212,0.00,121.00,1212,1212),(3,'asdf2','asdf2','P',123,0.00,123.00,123,123),(4,'Kappa','Polo Sewill','M',80,0.00,49.90,200,50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_entrada`
--

DROP TABLE IF EXISTS `registro_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_entrada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lojaIDLoja` int(10) unsigned NOT NULL,
  `produtoIDProduto` int(10) unsigned NOT NULL,
  `usuario_IDUsuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Registro_Entrada_Loja1_idx` (`lojaIDLoja`),
  KEY `fk_Registro_Entrada_Produto1_idx` (`produtoIDProduto`),
  KEY `fk_Registro_Entrada_Usuario1_idx` (`usuario_IDUsuario`),
  CONSTRAINT `fk_Registro_Entrada_Loja1` FOREIGN KEY (`lojaIDLoja`) REFERENCES `loja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Entrada_Produto1` FOREIGN KEY (`produtoIDProduto`) REFERENCES `produto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Entrada_Usuario1` FOREIGN KEY (`usuario_IDUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_entrada`
--

LOCK TABLES `registro_entrada` WRITE;
/*!40000 ALTER TABLE `registro_entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_saida`
--

DROP TABLE IF EXISTS `registro_saida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registro_saida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tempo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lojaIDLoja` int(10) unsigned NOT NULL,
  `usuario_IDUsuario` int(10) unsigned NOT NULL,
  `venda_IDVenda` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Registro_Saida_Loja1_idx` (`lojaIDLoja`),
  KEY `fk_Registro_Saida_Usuario1_idx` (`usuario_IDUsuario`),
  KEY `fk_Registro_Saida_Venda1_idx` (`venda_IDVenda`),
  CONSTRAINT `fk_Registro_Saida_Loja1` FOREIGN KEY (`lojaIDLoja`) REFERENCES `loja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Saida_Usuario1` FOREIGN KEY (`usuario_IDUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Registro_Saida_Venda1` FOREIGN KEY (`venda_IDVenda`) REFERENCES `venda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_saida`
--

LOCK TABLES `registro_saida` WRITE;
/*!40000 ALTER TABLE `registro_saida` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_saida` ENABLE KEYS */;
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
  `telefone` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Eu Mesmo','admin','admin','admin@admin.com','A','1995-01-10','7530215497'),(3,'Lucas Paiva','lvpaiva','1234','lukspaiva@hotmail.com','A','2016-12-01','7530215497'),(4,'Cleybson Cardoso','cleyc','1234','cleybson@gmail.com','A','2016-10-07','7592220297'),(6,'Gabriel Miranda','mirandinha','2424','miranda.24@hotmail.com','C','2024-04-24','7599692424'),(7,'Lindelmo Havallon','haval','1234','lindemo@htormail.com','A','2013-09-28','7536230001'),(8,'Icaro RIos','rock','rios','rockrios@hotmail.com','A','2004-04-24','40028922'),(9,'José Ricardo','rick','123123','rick@hotmail.com','A','2004-04-24','1');
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
  `valor` decimal(5,2) NOT NULL,
  `tipoDePagamento` enum('debito','credito','dinheiro','fiado','cheque') NOT NULL,
  `usuario_IDUsuario` int(10) unsigned NOT NULL,
  `cliente_IDCliente` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Venda_Usuario1_idx` (`usuario_IDUsuario`),
  KEY `fk_Venda_Cliente1_idx` (`cliente_IDCliente`),
  CONSTRAINT `fk_Venda_Cliente1` FOREIGN KEY (`cliente_IDCliente`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Usuario1` FOREIGN KEY (`usuario_IDUsuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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

-- Dump completed on 2016-12-02 21:33:41
