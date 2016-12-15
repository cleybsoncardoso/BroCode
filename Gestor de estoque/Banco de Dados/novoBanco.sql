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
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'12313131','cley','2016-12-07','a@a.com',3,'888231231'),(2,'545454','havallon','1995-03-02','fdfsd@dsds',4,'545');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `divida`
--

LOCK TABLES `divida` WRITE;
/*!40000 ALTER TABLE `divida` DISABLE KEYS */;
INSERT INTO `divida` VALUES (1,200.00,2,'2016-06-10',1),(2,200.00,1,'2016-12-09',2);
/*!40000 ALTER TABLE `divida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` VALUES (3,'1231241','ras',11,'ba','feira'),(4,'54','54',54,'54','545');
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `linha_de_venda`
--

LOCK TABLES `linha_de_venda` WRITE;
/*!40000 ALTER TABLE `linha_de_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `linha_de_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loja`
--

LOCK TABLES `loja` WRITE;
/*!40000 ALTER TABLE `loja` DISABLE KEYS */;
INSERT INTO `loja` VALUES (1,'aaa',4);
/*!40000 ALTER TABLE `loja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (4,'teste','testes','GG',302,100.00,200.00,500,10,'2016-12-08 03:00:00',0),(5,'teste','testes','GG',40,150.00,200.00,500,10,'2016-12-08 03:00:00',0),(6,'teste','testes','PP',50,150.00,200.00,500,10,'2016-12-08 03:00:00',0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `registro`
--

LOCK TABLES `registro` WRITE;
/*!40000 ALTER TABLE `registro` DISABLE KEYS */;
INSERT INTO `registro` VALUES (1,'2016-12-09 21:26:09',1,3,'e',30,4),(2,'2016-12-09 21:26:34',1,3,'s',40,5);
/*!40000 ALTER TABLE `registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (3,'cley','admin','admin','cley@cley','A','2016-12-08','77',0),(4,'thyago','thya','123','dsadsa@fd','C','2016-12-08','(32) 32323-2323',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (3,0.00,'dinheiro',3,NULL,'2016-12-08','00:00:00'),(4,300.00,'dinheiro',3,NULL,'2016-12-08','00:00:00'),(5,600.00,'dinheiro',3,NULL,'2016-12-08','00:00:00'),(6,600.00,'dinheiro',3,NULL,'2016-12-08','00:00:00'),(7,600.00,'fiado',3,1,'2016-12-08','00:00:00'),(8,800.00,'fiado',3,1,'2016-12-08','00:00:00'),(9,400.00,'fiado',3,1,'2016-12-08','00:00:00'),(10,400.00,'fiado',3,1,'2016-12-08','00:00:00'),(11,200.00,'fiado',4,2,'2016-12-08','00:00:00');
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

-- Dump completed on 2016-12-15  1:15:35
