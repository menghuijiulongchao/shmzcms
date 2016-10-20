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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='附件表，用于保存用户上传的附件内容。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_attachment`
--

LOCK TABLES `jpress_attachment` WRITE;
/*!40000 ALTER TABLE `jpress_attachment` DISABLE KEYS */;
INSERT INTO `jpress_attachment` VALUES (1,'minsiziyu.jpg',1,NULL,'/attachment/20161012/81ef8958b8c045a58f4cf2cdc34a9300.jpg','image/jpeg','.jpg',NULL,NULL,NULL,NULL,NULL,'2016-10-12 18:16:18'),(2,'shangtaishenju.jpg',1,NULL,'/attachment/20161012/854f6cf43cbe4e71b96e75ce5027dac4.jpg','image/jpeg','.jpg',NULL,NULL,NULL,NULL,NULL,'2016-10-12 18:17:39'),(3,'QQ图片20151212144256.png',1,NULL,'/attachment/20161020/7193f70cef844c3c9f8a378d3ef9e125.png','image/png','.png',NULL,NULL,NULL,NULL,NULL,'2016-10-20 00:56:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='内容表，用于存放比如文章、帖子、商品、问答等用户自定义模型内容。也用来存放比如菜单、购物车、消费记录等系统模型。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_content`
--

LOCK TABLES `jpress_content` WRITE;
/*!40000 ALTER TABLE `jpress_content` DISABLE KEYS */;
INSERT INTO `jpress_content` VALUES (1,'dd','<p>asdgarga</p>',NULL,NULL,0,NULL,'forum',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-09 18:21:48','2016-10-09 18:21:48','dd',NULL,NULL,NULL,NULL,NULL,NULL),(2,'zheshidiyige','<p>adghsthdtyjtadhtjardghwrthwerh</p>',NULL,NULL,0,'/jpress\\attachment\\20161020\\7193f70cef844c3c9f8a378d3ef9e125.png','article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,'open',0,NULL,1,'2016-10-09 19:04:58','2016-10-20 00:56:38','zheshidiyige','aaa',NULL,NULL,NULL,NULL,NULL),(3,'diyige','<p>areghwrhtye</p>',NULL,NULL,0,NULL,'forum',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,'open',0,NULL,0,'2016-10-09 19:05:59','2016-10-09 19:05:59','diyige','ds',NULL,NULL,NULL,NULL,NULL),(4,'第一篇','<p>文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章文章</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 16:00:08','2016-10-20 00:55:12','第一篇',NULL,NULL,NULL,NULL,NULL,NULL),(5,'11111','<p>22222</p>',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 17:21:32','2016-10-10 17:21:32','c11111',NULL,NULL,NULL,NULL,NULL,NULL),(6,'北航基地','<p>这里是北航</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 17:26:11','2016-10-10 17:28:04','北航基地',NULL,NULL,NULL,NULL,NULL,NULL),(7,'活动文化','<p>活动文化活动文化活动文化活动文化活动文化活动文化活动文化活动文化</p>',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 17:51:56','2016-10-10 17:51:56','活动文化',NULL,NULL,NULL,NULL,NULL,NULL),(9,'文化基地','',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:28:14','2016-10-10 18:28:14','文化基地',NULL,NULL,NULL,NULL,NULL,NULL),(10,'体育基地','',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:30:20','2016-10-10 18:30:20','体育基地',NULL,NULL,NULL,NULL,NULL,NULL),(11,'教育基地','',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:31:01','2016-10-10 18:31:01','教育基地',NULL,NULL,NULL,NULL,NULL,NULL),(12,'卫生医疗基地','',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:33:50','2016-10-10 18:33:50','卫生医疗基地',NULL,NULL,NULL,NULL,NULL,NULL),(13,'社区基地','',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:34:13','2016-10-10 18:34:13','社区基地',NULL,NULL,NULL,NULL,NULL,NULL),(14,'社区服务','<p>社区服务社区服务社区服务社区服务社区服务社区服务社区服务社区服务社区服务社区服务社区服务</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,1,'2016-10-10 18:35:22','2016-10-18 16:49:36','社区服务',NULL,NULL,NULL,NULL,NULL,NULL),(15,'体育活动','',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:36:07','2016-10-10 18:36:07','体育活动',NULL,NULL,NULL,NULL,NULL,NULL),(16,'教育活动','',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:36:36','2016-10-10 18:36:36','教育活动',NULL,NULL,NULL,NULL,NULL,NULL),(17,'卫生医疗活动','',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:37:10','2016-10-10 18:37:10','卫生医疗活动',NULL,NULL,NULL,NULL,NULL,NULL),(18,'社区活动','',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:37:31','2016-10-10 18:37:31','社区活动',NULL,NULL,NULL,NULL,NULL,NULL),(19,'社区服务活动','',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-10 18:37:51','2016-10-10 18:37:51','社区服务活动',NULL,NULL,NULL,NULL,NULL,NULL),(20,'国防部新闻发言人杨宇军答记者问','<p>　据外媒报道，总部位于美国华盛顿的非政府组织“冲突中的平民”中心近日发表了一份关于联合国维和部队应对7月份南苏丹首都朱巴大规模冲突事件的报告，其中有关内容对中国驻南苏丹维和部队执行任务时的表现提出指责，请问中方对此有何评论？</p> \n<p>　　答：报告对中国维和部队的指责根本不符合事实，纯属恶意炒作。</p> \n<p>　　今年7月，南苏丹国内爆发冲突，根据联合国南苏丹特派团司令部的指示，中国在南苏丹首都朱巴的维和步兵营负责执行联南苏团朱巴总部及其附近１号难民营的安全防卫等任务，全力保证相关联合国维和人员和难民的安全。</p> \n<p>　　7月10日，武装冲突加剧，中国维和步兵营坚守各个警戒哨位，一辆步战车遭火箭弹袭击，中国维和士兵李磊、杨树朋牺牲，5人受伤。中国维和部队官兵坚守岗位，迅速组织增援，并在救助受伤官兵的同时继续执行联南苏团赋予的各项任务。</p> \n<p>　　7月11日，南苏丹国内冲突双方动用了武装直升机、坦克、步战车等重武器，在联合国营地附近发生激烈交火。期间，有部分武装分子潜入1号难民营，直接威胁难民安全。为及时驱离持枪武装分子，履行保护难民职责，中国维和步兵营迅速派出就近执勤官兵进入难民营搜寻武装分子。由于冲突双方交火时部分流弹落入难民营内，导致部分难民产生惊慌，冲破铁丝网进入联合国营区。根据联南苏团指令，联合国警察、尼泊尔防暴队和中国维和步兵营部分兵力一起，尽力控制局势，平抚难民情绪，并妥善安置。</p> \n<p>　　目前，联合国正在对南苏丹冲突期间维和部队表现进行调查，在联合国的调查结果公布以前，任何针对联合国维和行动和维和人员莫须有的指责都是不负责任的。</p> \n<p><img id=\"{E8C7073B-45E4-4F15-B387-B21AADE7019B}\" title=\"\" src=\"http://news.xinhuanet.com/mil/2016-10/11/1119691397_14761469166351n.png\" alt=\"\" border=\"0\"></p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,1,'2016-10-11 10:05:25','2016-10-19 22:39:43','国防部新闻发言人杨宇军答记者问','11',NULL,NULL,NULL,NULL,NULL),(24,'公告111','<p>据外媒报道，总部位于美国华盛顿的非政府组织“冲突中的平民”中心近日发表了一份关于联合国维和部队应对7月份南苏丹首都朱巴大规模冲突事件的报告，其中有关内容对中国驻南苏丹维和部队执行任务时的表现提出指责，请问中方对此有何评论？</p> \n<p>&nbsp;</p> \n<p>　　答：报告对中国维和部队的指责根本不符合事实，纯属恶意炒作。</p> \n<p>&nbsp;</p> \n<p>　　今年7月，南苏丹国内爆发冲突，根据联合国南苏丹特派团司令部的指示，中国在南苏丹首都朱巴的维和步兵营负责执行联南苏团朱巴总部及其附近１号难民营的安全防卫等任务，全力保证相关联合国维和人员和难民的安全。</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>　　7月10日，武装冲突加剧，中国维和步兵营坚守各个警戒哨位，一辆步战车遭火箭弹袭击，中国维和士兵李磊、杨树朋牺牲，5人受伤。中国维和部队官兵坚守岗位，迅速组织增援，并在救助受伤官兵的同时继续执行联南苏团赋予的各项任务。</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>　　7月11日，南苏丹国内冲突双方动用了武装直升机、坦克、步战车等重武器，在联合国营地附近发生激烈交火。期间，有部分武装分子潜入1号难民营，直接威胁难民安全。为及时驱离持枪武装分子，履行保护难民职责，中国维和步兵营迅速派出就近执勤官兵进入难民营搜寻武装分子。由于冲突双方交火时部分流弹落入难民营内，导致部分难民产生惊慌，冲破铁丝网进入联合国营区。根据联南苏团指令，联合国警察、尼泊尔防暴队和中国维和步兵营部分兵力一起，尽力控制局势，平抚难民情绪，并妥善安置。</p> \n<p>&nbsp;</p> \n<p>&nbsp;</p> \n<p>　　目前，联合国正在对南苏丹冲突期间维和部队表现进行调查，在联合国的调查结果公布以前，任何针对联合国维和行动和维和人员莫须有的指责都是不负责任的。</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,17,'2016-10-11 10:25:25','2016-10-19 21:27:55','公告','公告',NULL,NULL,NULL,NULL,NULL),(26,'列表','',NULL,NULL,0,NULL,'liebiao',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-12 14:46:00','2016-10-19 22:28:39','Empty',NULL,NULL,NULL,NULL,NULL,NULL),(27,'黄浦江两岸公共空间贯通开放概念方案发布','<p>　黄浦江，上海的母亲河，记载着城市的沧桑变迁，引领着时代的发展风潮。黄浦江两岸地区，积淀了深厚的文化底蕴，培育了独特的海派文化，荟萃了城市的亮点与精华。</p> \n<p>　　展望未来，上海面向2040年提出“卓越的全球城市”的发展愿景，建设“创新之城”、“生态之城”、“人文之城”，黄浦江将成为城市生活核心的美好舞台。</p> \n<p>　　此次发布黄浦江两岸公共空间贯通开放概念方案，旨在要把黄浦江塑造得更开放、更绿色、更舒适、更有活力、更具人文特色，同时推进两岸公共空间贯通开放的高标准建设，让市民和游客能够充分体验上海特色、品味历史文化、欣赏风貌景观、感受城市气息，让黄浦江更具魅力，让 “母亲河” 焕发青春。</p> \n<p align=\"center\"><img id=\"{D14D1137-21B6-47BD-B5DD-CCE4499A7485}\" src=\"http://sh.xinhuanet.com/135738724_14759132814801n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{6DE1C266-0F24-4D84-96B8-0ABD6B161C68}\" src=\"http://sh.xinhuanet.com/135738724_14759132815801n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{B2790E2A-5540-4112-BB53-1317DCD7B297}\" src=\"http://sh.xinhuanet.com/135738724_14759132818961n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{3BE15369-99B8-4942-B781-A8064CCDD4C3}\" src=\"http://sh.xinhuanet.com/135738724_14759132819261n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{3B2CA252-0ADA-4619-ADD2-7FAD099C5111}\" src=\"http://sh.xinhuanet.com/135738724_14759132821661n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{A32C28ED-AC25-48FF-B2A8-1E0F39978F40}\" src=\"http://sh.xinhuanet.com/135738724_14759132822161n.jpg\" alt=\"\"></p> \n<p align=\"center\"><img id=\"{86B6D5CA-7D98-45E1-A5A4-609B391F22B2}\" src=\"http://sh.xinhuanet.com/135738724_14759132822861n.jpg\" alt=\"\"></p>',NULL,NULL,0,'/jpress\\attachment\\20161012\\81ef8958b8c045a58f4cf2cdc34a9300.jpg','activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-12 18:16:24','2016-10-12 18:16:24','黄浦江两岸公共空间贯通开放概念方案发布',NULL,NULL,NULL,NULL,NULL,NULL),(28,'红色暖民心——“夕阳红 志愿情”关爱米粮村老年人志愿服务项目','<p align=\"center\"><img src=\"http://gdftp.oss-cn-shenzhen.aliyuncs.com/upload/magicImg/temp/201610080957058.jpg\" alt=\"\"></p> \n<h3><strong>【服务时间】</strong></h3> \n<p>2016-10-15 到 2016-10-15</p> \n<h3><strong>【联系方式】</strong></h3> \n<p>联系人： 谭小虹<br>联系电话：18926748929</p> \n<h3><strong>【详细地址】</strong></h3> \n<p>高新区米粮村</p> \n<h3><strong>【活动简介】</strong></h3> \n<p class=\"new-comment-content\">1.关爱米粮村老年人，通过便民服务进村，方便、丰富老人的生活，为老人提供更多温暖的陪伴。 2.在村中弘扬爱老敬老的美德，教育引导村民爱老敬老。 3.在村民中普及志愿服务精神，形成邻里互帮互助氛围。</p> \n<h3><strong>【服务内容】</strong></h3> \n<p class=\"new-comment-content\">1.便民服务进乡村。为村中老人、儿童、妇女集中提供义诊、义剪、法律咨询、健康知识讲座、文艺表演等便民关爱服务。 2.高龄孤寡老人探访。走进行动不便的高龄孤寡老人家人，为其打扫卫生、聊天陪伴等。</p> \n<h3><strong>【服务要求】</strong></h3> \n<p class=\"new-comment-content\">具有医疗、理发、电器维修等技能的志愿者优先</p>',NULL,NULL,0,'/jpress\\attachment\\20161012\\854f6cf43cbe4e71b96e75ce5027dac4.jpg','activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-12 18:17:42','2016-10-12 18:17:42','红色暖民心夕阳红_志愿情关爱米粮村老年人志愿服务项目',NULL,NULL,NULL,NULL,NULL,NULL),(29,'公益活动',NULL,NULL,NULL,0,NULL,'menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-19 21:50:08','2016-10-19 21:50:08',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'公益组织',NULL,NULL,NULL,0,NULL,'menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-17 14:04:44','2016-10-17 14:04:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'亲子体验',NULL,NULL,NULL,0,NULL,'menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-17 14:04:48','2016-10-17 14:04:48',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'时长公示',NULL,NULL,NULL,0,NULL,'menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-17 14:04:53','2016-10-17 14:04:53',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'帮助中心',NULL,NULL,NULL,0,NULL,'menu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-17 14:04:59','2016-10-17 14:04:59',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'dsadsadsaadas','<p>顶顶顶顶</p>',NULL,NULL,0,NULL,'activity',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-18 16:42:36','2016-10-20 07:35:30','dsadsadsaadas',NULL,NULL,NULL,NULL,NULL,NULL),(35,'aaa','<p>bbb</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-19 18:03:35','2016-10-19 19:40:08','aaa',NULL,NULL,NULL,NULL,NULL,NULL),(36,'文化基地标题','<p>文化基地内容</p>',NULL,NULL,0,NULL,'base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-19 19:13:30','2016-10-19 19:13:30','文化基地标题',NULL,NULL,NULL,NULL,NULL,NULL),(37,'基地体育标题','<p>基地体育内容</p>',NULL,NULL,0,'/jpress/attachment/20161020/7193f70cef844c3c9f8a378d3ef9e125.png','base',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-19 19:49:33','2016-10-20 01:12:45','基地体育标题',NULL,NULL,NULL,NULL,NULL,NULL),(38,'信息公告222','<p>信息公告222</p>',NULL,NULL,0,NULL,'article',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,0,'normal',0,0,NULL,0,0.00,NULL,0,NULL,0,'2016-10-19 20:06:26','2016-10-19 21:27:47','信息公告222',NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COMMENT='内容和分类的多对多映射关系。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_mapping`
--

LOCK TABLES `jpress_mapping` WRITE;
/*!40000 ALTER TABLE `jpress_mapping` DISABLE KEYS */;
INSERT INTO `jpress_mapping` VALUES (1,7,1),(2,9,7),(3,10,8),(4,11,9),(5,12,10),(6,13,11),(8,15,2),(9,16,3),(10,17,4),(11,18,5),(12,19,6),(18,27,1),(19,28,3),(25,14,12),(29,36,28),(30,35,26),(35,38,33),(36,38,24),(37,24,33),(38,24,24),(39,20,33),(40,20,23),(41,4,33),(42,4,22),(46,2,22),(47,2,33),(48,2,22),(49,37,29),(50,34,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COMMENT='元数据表，用来对其他表的字段扩充。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_metadata`
--

LOCK TABLES `jpress_metadata` WRITE;
/*!40000 ALTER TABLE `jpress_metadata` DISABLE KEYS */;
INSERT INTO `jpress_metadata` VALUES (1,'_meta1',NULL,'content',2),(2,'_meta2',NULL,'content',2),(3,'_meta1','长宁','content',5),(4,'_meta2','2016-10-11','content',5),(5,'_meta3','环境保护','content',5),(6,'_meta4','北航','content',5),(7,'_meta5','长宁长宁！！！','content',6),(8,'_meta6','2016-8-8','content',6),(9,'_meta7','环境保护','content',6),(10,'_meta1','长宁','content',7),(11,'_meta2','2016-10-15','content',7),(12,'_meta3','文化','content',7),(13,'_meta4','北航','content',7),(14,'_meta5','长宁','content',9),(15,'_meta6','2016-10-15','content',9),(16,'_meta7','文化','content',9),(17,'_meta5','长宁','content',10),(18,'_meta6','2016-10-16','content',10),(19,'_meta7','体育','content',10),(20,'_meta5','长宁','content',11),(21,'_meta6','2016-10-14','content',11),(22,'_meta7','教育','content',11),(23,'_meta5','cn','content',12),(24,'_meta6','2016','content',12),(25,'_meta7','卫生','content',12),(26,'_meta5','cn','content',13),(27,'_meta6','2016','content',13),(28,'_meta7','社区','content',13),(29,'_meta5','cn','content',14),(30,'_meta6','2016','content',14),(31,'_meta7','社区服务','content',14),(32,'_meta1','dd','content',15),(33,'_meta2','dd','content',15),(34,'_meta3','体育','content',15),(35,'_meta4','dd','content',15),(36,'_meta1','dd','content',16),(37,'_meta2','dd','content',16),(38,'_meta3','教育','content',16),(39,'_meta4','dd','content',16),(40,'_meta1','dd','content',17),(41,'_meta2','dd','content',17),(42,'_meta3','卫生医疗','content',17),(43,'_meta4','dd','content',17),(44,'_meta1','dd','content',18),(45,'_meta2','dd','content',18),(46,'_meta3','社区','content',18),(47,'_meta4','dd','content',18),(48,'_meta1','dd','content',19),(49,'_meta2','dd','content',19),(50,'_meta3','社区服务','content',19),(51,'_meta4','dd','content',19),(52,'_meta1','长宁区','content',27),(53,'_meta2','2016-11-15','content',27),(54,'_meta3','环境保护','content',27),(55,'_meta4','bh','content',27),(56,'_meta1','才能','content',28),(57,'_meta2','2016-11-11','content',28),(58,'_meta3','教育','content',28),(59,'_meta4','bh','content',28),(60,'_meta1','飞机开始的回归的健康撒谎都看见爱上空间大师','content',34),(61,'_meta2',NULL,'content',34),(62,'_meta3',NULL,'content',34),(63,'_meta4',NULL,'content',34),(64,'_meta5',NULL,'content',35),(65,'_meta6',NULL,'content',35),(66,'_meta7',NULL,'content',35),(67,'_meta5',NULL,'content',36),(68,'_meta6',NULL,'content',36),(69,'_meta7',NULL,'content',36),(70,'_meta5',NULL,'content',37),(71,'_meta6',NULL,'content',37),(72,'_meta7',NULL,'content',37);
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
INSERT INTO `jpress_option` VALUES (1,'web_name','test'),(2,'web_template_id','shmz');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='分类表。标签、专题、类别等都属于taxonomy。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_taxonomy`
--

LOCK TABLES `jpress_taxonomy` WRITE;
/*!40000 ALTER TABLE `jpress_taxonomy` DISABLE KEYS */;
INSERT INTO `jpress_taxonomy` VALUES (1,'文化',NULL,'culture','category',NULL,'activity',3,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'体育',NULL,'sport','category',NULL,'activity',1,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'教育',NULL,'education','category',NULL,'activity',2,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'卫生医疗',NULL,'medication','category',NULL,'activity',1,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'社区',NULL,'social','category',NULL,'activity',1,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'社区服务',NULL,'socialservice','category',NULL,'activity',1,NULL,25,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'政策法规',NULL,'policy','category',NULL,'article',3,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'新闻资讯',NULL,'news','category',NULL,'article',1,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'信息公告',NULL,'information','category',NULL,'article',2,NULL,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'全部活动',NULL,'allactivities','category',NULL,'activity',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'全部基地',NULL,'allbases','category',NULL,'base',1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'社会服务',NULL,'socialservice','category',NULL,'base',0,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'文化',NULL,'culture','category',NULL,'base',1,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'体育',NULL,'sport','category',NULL,'base',1,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'教育',NULL,'education','category',NULL,'base',0,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'卫生医疗',NULL,'medication','category',NULL,'base',0,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'社区',NULL,'social','category',NULL,'base',0,NULL,26,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'所有信息',NULL,'allarticles','category',NULL,'article',5,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `username` varchar(128) DEFAULT NULL COMMENT '登录名',
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
  `logged` datetime DEFAULT NULL COMMENT '最后的登录时间',
  `activated` datetime DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `content_count` (`content_count`),
  KEY `comment_count` (`comment_count`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表，保存用户信息。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jpress_user`
--

LOCK TABLES `jpress_user` WRITE;
/*!40000 ALTER TABLE `jpress_user` DISABLE KEYS */;
INSERT INTO `jpress_user` VALUES (1,'admin',NULL,NULL,'12a85a5b1190d06ab396708784c5b4d4608525f44dc7fcafd5d6eec1378b398d','f84d829059300b1b0c3983',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'administrator',NULL,26,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'activited','2016-10-09 17:19:36',NULL,'2016-10-17 17:05:43',NULL),(2,'huyk',NULL,NULL,'4fb9932802e83bba88c23024f504771af314768c5bae289d30fc521bed4a2110','d07c369853a505',NULL,NULL,NULL,NULL,NULL,0.00,NULL,'visitor',NULL,1,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'normal','2016-10-09 18:23:02',NULL,'2016-10-09 18:23:02',NULL);
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

-- Dump completed on 2016-10-20  8:31:50
