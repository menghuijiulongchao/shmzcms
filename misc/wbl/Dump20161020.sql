-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: jpress
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `jpress_attachment`
--

DROP TABLE IF EXISTS `jpress_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_attachment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID主键',
  `title` text COMMENT '标题',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '上传附件的用户ID',
  `content_id` bigint(20) unsigned DEFAULT NULL COMMENT '附件所属的内容ID',
  `path` varchar(512) DEFAULT NULL COMMENT '路径',
  `mime_type` varchar(128) DEFAULT NULL COMMENT 'mime',
  `suffix` varchar(32) DEFAULT NULL COMMENT '附件的后缀',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `flag` varchar(256) DEFAULT NULL COMMENT '标示',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `order_number` int(11) DEFAULT NULL COMMENT '排序字段',
  `created` datetime DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `created` (`created`),
  KEY `suffix` (`suffix`),
  KEY `mime_type` (`mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='附件表，用于保存用户上传的附件内容。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_attachment`
--

LOCK TABLES `jpress_attachment` WRITE;
/*!40000 ALTER TABLE `jpress_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jpress_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_comment`
--

DROP TABLE IF EXISTS `jpress_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '回复的评论ID',
  `content_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论的内容ID',
  `content_module` varchar(32) DEFAULT NULL COMMENT '评论的内容模型',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论的回复数量',
  `order_number` int(11) unsigned DEFAULT '0' COMMENT '排序编号，常用语置顶等',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '评论的用户ID',
  `ip` varchar(64) DEFAULT NULL COMMENT '评论的IP地址',
  `author` varchar(128) DEFAULT NULL COMMENT '评论的作者',
  `type` varchar(32) DEFAULT 'comment' COMMENT '评论的类型，默认是comment',
  `text` longtext COMMENT '评论的内容',
  `agent` text COMMENT '提交评论的浏览器信息',
  `created` datetime DEFAULT NULL COMMENT '评论的时间',
  `slug` varchar(128) DEFAULT NULL COMMENT '评论的slug',
  `email` varchar(64) DEFAULT NULL COMMENT '评论用户的email',
  `status` varchar(32) DEFAULT NULL COMMENT '评论的状态',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '“顶”的数量',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '“踩”的数量',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '经度',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `content_id` (`content_id`),
  KEY `user_id` (`user_id`),
  KEY `email` (`email`),
  KEY `created` (`created`),
  KEY `parent_id` (`parent_id`),
  KEY `content_module` (`content_module`),
  KEY `comment_count` (`comment_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='评论表，用于保存content内容的回复、分享、推荐等信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_comment`
--

LOCK TABLES `jpress_comment` WRITE;
/*!40000 ALTER TABLE `jpress_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `jpress_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_content`
--

DROP TABLE IF EXISTS `jpress_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_content` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` text COMMENT '标题',
  `text` longtext COMMENT '内容',
  `summary` text COMMENT '摘要',
  `link_to` varchar(256) DEFAULT NULL COMMENT '连接到(常用于谋文章只是一个连接)',
  `markdown_enable` tinyint(1) DEFAULT '0' COMMENT '是否启用markdown',
  `thumbnail` varchar(128) DEFAULT NULL COMMENT '缩略图',
  `module` varchar(32) DEFAULT NULL COMMENT '模型',
  `style` varchar(32) DEFAULT NULL COMMENT '样式',
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
  `author` varchar(128) DEFAULT NULL COMMENT '匿名稿的用户',
  `user_email` varchar(128) DEFAULT NULL COMMENT '匿名稿的邮箱',
  `user_ip` varchar(128) DEFAULT NULL COMMENT 'IP地址',
  `user_agent` text COMMENT '发布浏览agent',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父级内容ID',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联的对象ID',
  `order_number` int(11) unsigned DEFAULT '0' COMMENT '排序编号',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `vote_up` int(11) unsigned DEFAULT '0' COMMENT '支持人数',
  `vote_down` int(11) unsigned DEFAULT '0' COMMENT '反对人数',
  `rate` int(11) DEFAULT NULL COMMENT '评分分数',
  `rate_count` int(10) unsigned DEFAULT '0' COMMENT '评分次数',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格',
  `comment_status` varchar(32) DEFAULT NULL COMMENT '评论状态',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论总数',
  `comment_time` datetime DEFAULT NULL COMMENT '最后评论时间',
  `view_count` int(11) unsigned DEFAULT '0' COMMENT '访问量',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `modified` datetime DEFAULT NULL COMMENT '最后更新日期',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述信息',
  `remarks` text COMMENT '备注信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `user_id` (`user_id`),
  KEY `parent_id` (`parent_id`),
  KEY `content_module` (`module`),
  KEY `created` (`created`),
  KEY `vote_down` (`vote_down`),
  KEY `vote_up` (`vote_up`),
  KEY `view_count` (`view_count`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='内容表，用于存放比如文章、帖子、商品、问答等用户自定义模型内容。也用来存放比如菜单、购物车、消费记录等系统模型。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_content`
--

LOCK TABLES `jpress_content` WRITE;
/*!40000 ALTER TABLE `jpress_content` DISABLE KEYS */;
INSERT INTO `jpress_content` VALUES (1,'政策法规标题1','<p>政策法规内容1</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 11:24:20','2016-10-20 13:17:52','信息公告标题1',NULL,NULL,NULL,NULL,NULL,NULL),(2,'文化基地标题1','<p>文化基地内容1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 11:26:22','2016-10-20 11:50:09','文化基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(3,'文化活动标题1','<p>文化活动内容1</p>',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 12:41:53','2016-10-20 12:41:53','文化活动标题1',NULL,NULL,NULL,NULL,NULL,NULL),(4,'新闻资讯标题1','<p>新闻资讯内容1</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:16:38','2016-10-20 13:17:08','新闻资讯标题1',NULL,NULL,NULL,NULL,NULL,NULL),(10,'信息公告标题1','<p>信息公告内容1</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:19:17','2016-10-20 13:19:32','信息公告内容1',NULL,NULL,NULL,NULL,NULL,NULL),(11,'政策法规标题2','<p>政策法规内容2</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:19:56','2016-10-20 13:19:56','政策法规标题2',NULL,NULL,NULL,NULL,NULL,NULL),(12,'体育基地标题1','<p>体育基地内容1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:20:51','2016-10-20 13:20:51','体育基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(13,'教育基地标题1','<p>教育基地内容1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:21:34','2016-10-20 13:21:34','教育基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(14,'卫生医疗基地标题1','<p>卫生医疗基地标题1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:26:36','2016-10-20 13:26:36','卫生医疗基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(15,'社区基地标题1','<p>社区基地内容1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:27:14','2016-10-20 13:27:14','社区基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(16,'社区服务基地标题1','<p>社区服务基地内容1</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:27:51','2016-10-20 13:27:51','社区服务基地标题1',NULL,NULL,NULL,NULL,NULL,NULL),(17,'文化基地标题2','<p>文化基地内容2</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:28:27','2016-10-20 13:28:27','文化基地标题2',NULL,NULL,NULL,NULL,NULL,NULL),(18,'文化基地标题3','<p>文化基地内容3</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:28:41','2016-10-20 13:28:41','文化基地标题3',NULL,NULL,NULL,NULL,NULL,NULL),(19,'文化基地标题4','<p>文化基地内容4</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:28:56','2016-10-20 13:28:56','文化基地标题4',NULL,NULL,NULL,NULL,NULL,NULL),(20,'文化基地标题5','<p>文化基地内容5</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:29:14','2016-10-20 13:29:14','文化基地标题5',NULL,NULL,NULL,NULL,NULL,NULL),(21,'文化基地标题6','<p>文化基地内容6</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:29:47','2016-10-20 13:29:47','文化基地标题6',NULL,NULL,NULL,NULL,NULL,NULL),(22,'政策法规标题3','<p>政策法规标题3</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:30:56','2016-10-20 13:30:56','政策法规标题3',NULL,NULL,NULL,NULL,NULL,NULL),(23,'政策法规标题4','<p>政策法规标题4</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:31:07','2016-10-20 13:31:07','政策法规标题4',NULL,NULL,NULL,NULL,NULL,NULL),(24,'政策法规标题5','<p>政策法规标题5</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:31:15','2016-10-20 13:31:15','政策法规标题5',NULL,NULL,NULL,NULL,NULL,NULL),(25,'政策法规标题6','<p>政策法规标题6</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:31:23','2016-10-20 13:31:23','政策法规标题6',NULL,NULL,NULL,NULL,NULL,NULL),(26,'政策法规标题7','<p>政策法规标题7</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:31:37','2016-10-20 13:31:37','政策法规标题7',NULL,NULL,NULL,NULL,NULL,NULL),(27,'政策法规标题8','<p>政策法规标题8</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:31:56','2016-10-20 13:31:56','政策法规标题8',NULL,NULL,NULL,NULL,NULL,NULL),(28,'政策法规标题9','<p>政策法规标题9</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-20 13:32:09','2016-10-20 13:32:09','政策法规标题9',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jpress_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_mapping`
--

DROP TABLE IF EXISTS `jpress_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_mapping` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `content_id` bigint(20) unsigned NOT NULL COMMENT '内容ID',
  `taxonomy_id` bigint(20) unsigned NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`),
  KEY `taxonomy_id` (`taxonomy_id`),
  KEY `content_id` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COMMENT='内容和分类的多对多映射关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_mapping`
--

LOCK TABLES `jpress_mapping` WRITE;
/*!40000 ALTER TABLE `jpress_mapping` DISABLE KEYS */;
INSERT INTO `jpress_mapping` VALUES (4,2,10),(5,2,11),(6,3,17),(7,3,19),(12,4,1),(13,4,8),(16,1,1),(17,1,9),(18,10,1),(19,10,2),(20,11,1),(21,11,9),(22,12,10),(23,12,12),(24,13,10),(25,13,13),(26,14,10),(27,14,14),(28,15,10),(29,15,15),(30,16,10),(31,16,16),(34,17,10),(35,17,11),(36,18,10),(37,18,11),(38,19,10),(39,19,11),(40,20,10),(41,20,11),(42,21,10),(43,21,11),(44,22,1),(45,22,9),(46,23,1),(47,23,9),(48,24,1),(49,24,9),(50,25,1),(51,25,9),(52,26,1),(53,26,9),(54,27,1),(55,27,9),(56,28,1),(57,28,9);
/*!40000 ALTER TABLE `jpress_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_metadata`
--

DROP TABLE IF EXISTS `jpress_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_metadata` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `meta_key` varchar(255) DEFAULT NULL COMMENT '元数据key',
  `meta_value` text COMMENT '元数据value',
  `object_type` varchar(32) DEFAULT NULL COMMENT '元数据的对象类型',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '元数据的对象ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='元数据表，用来对其他表的字段扩充。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_metadata`
--

LOCK TABLES `jpress_metadata` WRITE;
/*!40000 ALTER TABLE `jpress_metadata` DISABLE KEYS */;
INSERT INTO `jpress_metadata` VALUES (1,'_meta1','文化地点1','content',2),(2,'_meta2',NULL,'content',2),(3,'_meta3',NULL,'content',2),(4,'_meta1','文化地点1','content',3),(5,'_meta2',NULL,'content',3),(6,'_meta3',NULL,'content',3),(7,'_meta4',NULL,'content',3),(8,'_meta5',NULL,'content',4),(9,'_meta5',NULL,'content',1),(10,'_meta5',NULL,'content',10),(11,'_meta5',NULL,'content',11),(12,'_meta5',NULL,'content',12),(13,'_meta6',NULL,'content',12),(14,'_meta7',NULL,'content',12),(15,'_meta5',NULL,'content',13),(16,'_meta6',NULL,'content',13),(17,'_meta7',NULL,'content',13),(18,'_meta5',NULL,'content',14),(19,'_meta6',NULL,'content',14),(20,'_meta7',NULL,'content',14),(21,'_meta5',NULL,'content',15),(22,'_meta6',NULL,'content',15),(23,'_meta7',NULL,'content',15),(24,'_meta5',NULL,'content',16),(25,'_meta6',NULL,'content',16),(26,'_meta7',NULL,'content',16),(27,'_meta5',NULL,'content',17),(28,'_meta6',NULL,'content',17),(29,'_meta7',NULL,'content',17),(30,'_meta5',NULL,'content',18),(31,'_meta6',NULL,'content',18),(32,'_meta7',NULL,'content',18),(33,'_meta5',NULL,'content',19),(34,'_meta6',NULL,'content',19),(35,'_meta7',NULL,'content',19),(36,'_meta5',NULL,'content',20),(37,'_meta6',NULL,'content',20),(38,'_meta7',NULL,'content',20),(39,'_meta5',NULL,'content',21),(40,'_meta6',NULL,'content',21),(41,'_meta7',NULL,'content',21),(42,'_meta5',NULL,'content',22),(43,'_meta5',NULL,'content',23),(44,'_meta5',NULL,'content',24),(45,'_meta5',NULL,'content',25),(46,'_meta5',NULL,'content',26),(47,'_meta5',NULL,'content',27),(48,'_meta5',NULL,'content',28);
/*!40000 ALTER TABLE `jpress_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_option`
--

DROP TABLE IF EXISTS `jpress_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `option_key` varchar(128) DEFAULT NULL COMMENT '配置KEY',
  `option_value` text COMMENT '配置内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='配置信息表，用来保存网站的所有配置信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_option`
--

LOCK TABLES `jpress_option` WRITE;
/*!40000 ALTER TABLE `jpress_option` DISABLE KEYS */;
INSERT INTO `jpress_option` VALUES (1,'web_name','jpress'),(2,'web_template_id','shmz');
/*!40000 ALTER TABLE `jpress_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_taxonomy`
--

DROP TABLE IF EXISTS `jpress_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_taxonomy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(512) DEFAULT NULL COMMENT '标题',
  `text` text COMMENT '内容描述',
  `slug` varchar(128) DEFAULT NULL COMMENT 'slug',
  `type` varchar(32) DEFAULT NULL COMMENT '类型',
  `icon` varchar(128) DEFAULT NULL COMMENT '图标',
  `content_module` varchar(32) DEFAULT NULL COMMENT '对于的内容模型',
  `content_count` int(11) unsigned DEFAULT '0' COMMENT '该分类的内容数量',
  `order_number` int(11) DEFAULT NULL COMMENT '排序编码',
  `parent_id` bigint(20) unsigned DEFAULT NULL COMMENT '父级分类的ID',
  `object_id` bigint(20) unsigned DEFAULT NULL COMMENT '关联的对象ID',
  `flag` varchar(256) DEFAULT NULL COMMENT '标识',
  `lat` decimal(20,16) DEFAULT NULL COMMENT '经度',
  `lng` decimal(20,16) DEFAULT NULL COMMENT '纬度',
  `meta_keywords` varchar(256) DEFAULT NULL COMMENT 'SEO关键字',
  `meta_description` varchar(256) DEFAULT NULL COMMENT 'SEO描述内容',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `object_id` (`object_id`),
  KEY `content_module` (`content_module`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='分类表。标签、专题、类别等都属于taxonomy。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_taxonomy`
--

LOCK TABLES `jpress_taxonomy` WRITE;
/*!40000 ALTER TABLE `jpress_taxonomy` DISABLE KEYS */;
INSERT INTO `jpress_taxonomy` VALUES (1,'全部信息',NULL,'allarticles','category',NULL,'article',11,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'信息公告',NULL,'announcement','category',NULL,'article',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'新闻资讯',NULL,'news','category',NULL,'article',1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'政策法规',NULL,'policy','category',NULL,'article',9,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'全部基地',NULL,'allbases','category',NULL,'base',11,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'文化',NULL,'culture','category',NULL,'base',6,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'体育',NULL,'sport','category',NULL,'base',1,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'教育',NULL,'education','category',NULL,'base',1,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'卫生医疗',NULL,'healthcare','category',NULL,'base',1,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'社区',NULL,'social','category',NULL,'base',1,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'社会服务',NULL,'socialservice','category',NULL,'base',1,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'全部活动',NULL,'allactivities','category',NULL,'activity',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'文化',NULL,'culture','category',NULL,'activity',1,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'体育',NULL,'sport','category',NULL,'activity',0,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'教育',NULL,'education','category',NULL,'activity',0,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'卫生医疗',NULL,'healthcare','category',NULL,'activity',0,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'社区',NULL,'social','category',NULL,'activity',0,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'社会服务',NULL,'socialservice','category',NULL,'activity',0,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jpress_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jpress_user`
--

DROP TABLE IF EXISTS `jpress_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jpress_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(128) DEFAULT NULL COMMENT '登陆名',
  `nickname` varchar(128) DEFAULT NULL COMMENT '昵称',
  `realname` varchar(128) DEFAULT NULL COMMENT '实名',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐',
  `email` varchar(64) DEFAULT NULL COMMENT '邮件',
  `email_status` varchar(32) DEFAULT NULL COMMENT '邮箱状态（是否认证等）',
  `mobile` varchar(32) DEFAULT NULL COMMENT '手机电话',
  `mobile_status` varchar(32) DEFAULT NULL COMMENT '手机状态（是否认证等）',
  `telephone` varchar(32) DEFAULT NULL COMMENT '固定电话',
  `amount` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '金额（余额）',
  `gender` varchar(16) DEFAULT NULL COMMENT '性别',
  `role` varchar(32) DEFAULT 'visitor' COMMENT '权限',
  `signature` varchar(2048) DEFAULT NULL COMMENT '签名',
  `content_count` int(11) unsigned DEFAULT '0' COMMENT '内容数量',
  `comment_count` int(11) unsigned DEFAULT '0' COMMENT '评论数量',
  `qq` varchar(16) DEFAULT NULL COMMENT 'QQ号码',
  `wechat` varchar(32) DEFAULT NULL COMMENT '微信号',
  `weibo` varchar(256) DEFAULT NULL COMMENT '微博',
  `facebook` varchar(256) DEFAULT NULL,
  `linkedin` varchar(256) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `company` varchar(256) DEFAULT NULL COMMENT '公司',
  `occupation` varchar(256) DEFAULT NULL COMMENT '职位、职业',
  `address` varchar(256) DEFAULT NULL COMMENT '地址',
  `zipcode` varchar(128) DEFAULT NULL COMMENT '邮政编码',
  `site` varchar(256) DEFAULT NULL COMMENT '个人网址',
  `graduateschool` varchar(256) DEFAULT NULL COMMENT '毕业学校',
  `education` varchar(256) DEFAULT NULL COMMENT '学历',
  `avatar` varchar(256) DEFAULT NULL COMMENT '头像',
  `idcardtype` varchar(128) DEFAULT NULL COMMENT '证件类型：身份证 护照 军官证等',
  `idcard` varchar(128) DEFAULT NULL COMMENT '证件号码',
  `status` varchar(32) DEFAULT 'normal' COMMENT '状态',
  `created` datetime DEFAULT NULL COMMENT '创建日期',
  `create_source` varchar(128) DEFAULT NULL COMMENT '用户来源（可能来之oauth第三方）',
  `logged` datetime DEFAULT NULL COMMENT '最后的登陆时间',
  `activated` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `content_count` (`content_count`),
  KEY `comment_count` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表，保存用户信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_user`
--

LOCK TABLES `jpress_user` WRITE;
/*!40000 ALTER TABLE `jpress_user` DISABLE KEYS */;
INSERT INTO `jpress_user` VALUES (1,'admin',NULL,NULL,'d6f92ec98e6799f36b1aa118402017e04e12d46b4d239c628717f28b6aaa7b0a','4298b0e6d3b326cc427c',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'administrator',NULL,23,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'activited','2016-10-20 11:21:45',NULL,NULL,NULL);
/*!40000 ALTER TABLE `jpress_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-20 21:38:09
