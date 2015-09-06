-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: bbs2
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (1,1,'test_title','test_content'),(2,1,'test_title_2','test_content_2'),(3,1,'test_title_3','test_content_3'),(4,1,'test_title_4','test_content_4'),(5,1,'test_title','test_content'),(6,1,'test_title_2','test_content_2'),(7,1,'test_title_3','test_content_3'),(8,1,'test_title_4','test_content_4');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_code`
--

DROP TABLE IF EXISTS `tb_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_code` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `value` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '数值',
  `displayname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '显示名称',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对应的属性名称',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='代码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_code`
--

LOCK TABLES `tb_code` WRITE;
/*!40000 ALTER TABLE `tb_code` DISABLE KEYS */;
INSERT INTO `tb_code` VALUES (25,'01','管理员','sysrole','2010-09-07 01:47:55'),(27,'03','普通用户','sysrole','2010-09-07 01:48:13'),(28,'04','版主','sysrole','2010-06-15 08:49:19'),(29,'01','男','sex','2010-06-15 08:49:19'),(30,'02','女','sex','2010-06-15 08:49:19'),(31,'01','小学生','usertitle','2010-06-15 08:49:19'),(32,'02','中学生','usertitle','2010-06-15 08:49:19'),(33,'03','大学生','usertitle','2010-06-15 08:49:19'),(34,'04','教师','usertitle','2010-06-15 08:49:19');
/*!40000 ALTER TABLE `tb_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_image`
--

DROP TABLE IF EXISTS `tb_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_image` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='社区图片';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_image`
--

LOCK TABLES `tb_image` WRITE;
/*!40000 ALTER TABLE `tb_image` DISABLE KEYS */;
INSERT INTO `tb_image` VALUES (1,'http://localhost:8080/bbs/upload/articleimage/86_topic_12838281838135178.378486140415.jpg',NULL),(2,'http://localhost:8080/bbs/upload/articleimage/88_topic_12838375058242802.9674218737764.jpg',NULL),(3,'http://localhost:8080/bbs/upload/articleimage/88_topic_12838387421664688.20753302615.jpg',NULL),(4,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386653564439612.964229473553.jpg',NULL),(5,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386655757514641.296625171657.jpg',NULL),(6,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386656657383464.0385900328583.jpg',NULL),(7,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386657397841569.3182416014151.jpg',NULL),(8,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386777110957508.001349352068.jpg',NULL),(9,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386779165924155.692994069612.jpg',NULL),(10,'http://localhost:8080/bbs/upload/articleimage/93_topic_14386780929258618.622276318763.jpg',NULL);
/*!40000 ALTER TABLE `tb_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_notice`
--

DROP TABLE IF EXISTS `tb_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_notice` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `content` varchar(5000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '内容',
  `publisher` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者',
  `publishtime` timestamp NULL DEFAULT NULL COMMENT '发布时间',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COMMENT='公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notice`
--

LOCK TABLES `tb_notice` WRITE;
/*!40000 ALTER TABLE `tb_notice` DISABLE KEYS */;
INSERT INTO `tb_notice` VALUES (65,'欢迎新会员','热烈欢迎新会员，新会员报道有礼！','admin','2010-06-14 16:00:00','2010-09-07 02:19:16');
/*!40000 ALTER TABLE `tb_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reply`
--

DROP TABLE IF EXISTS `tb_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_reply` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tid` int(4) DEFAULT NULL COMMENT '主题帖ID',
  `uid` int(4) DEFAULT NULL COMMENT '回帖人ID',
  `sendtime` timestamp NULL DEFAULT NULL COMMENT '回帖时间',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回帖标题',
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回帖内容',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reply`
--

LOCK TABLES `tb_reply` WRITE;
/*!40000 ALTER TABLE `tb_reply` DISABLE KEYS */;
INSERT INTO `tb_reply` VALUES (19,72,84,'2010-09-07 02:30:11','Re:我会唱歌，也会破解，嘎嘎','<p>真丢人！！<img border=\"0\" alt=\"\" src=\"/bbs/comm/kindeditor/plugins/emoticons/11.gif\" width=\"24\" height=\"24\" /></p>\r\n<p>你妈叫你回家吃饭了</p>','2010-09-07 02:30:11'),(20,72,85,'2010-09-07 02:46:02','Re:我会唱歌，也会破解，嘎嘎','<p>果然丢人，这都不知道！<img border=\"0\" alt=\"\" src=\"/bbs/comm/kindeditor/plugins/emoticons/48.gif\" width=\"24\" height=\"24\" /></p>\r\n<p>&nbsp;</p>\r\n<p>不知道可以问人吗？请问破解什么意思？</p>','2010-09-07 02:46:02'),(21,72,86,'2010-09-07 02:56:27','Re:我会唱歌，也会破解，嘎嘎','<p>阿华，你好聪明哦，我爱死你了！</p>\r\n<p>&nbsp;</p>\r\n<p>看我漂亮吗</p>\r\n<p>&nbsp;</p>\r\n<p><img border=\"0\" alt=\"\" src=\"http://localhost:8080/bbs/upload/articleimage/86_topic_12838281838135178.378486140415.jpg\" width=\"300\" height=\"300\" /></p>','2010-09-07 02:56:27'),(22,73,82,'2015-06-27 03:59:32','Re:找女朋友了','什么情况啊，简直不能忍','2015-06-27 03:59:32'),(23,73,82,'2015-06-27 04:01:05','Re:找女朋友了','我不相信，你打我呀','2015-06-27 04:01:05'),(24,73,82,'2015-06-27 04:01:23','Re:找女朋友了','都走开，楼主是我的','2015-06-27 04:01:23'),(25,73,82,'2015-06-27 04:01:55','Re:找女朋友了','这种时候还虐狗，还能不能好好做朋友了','2015-06-27 04:01:55'),(26,73,82,'2015-06-27 04:02:18','Re:找女朋友了','StrikeFreedom','2015-06-27 04:02:18'),(27,80,89,'2015-07-18 02:54:09','Re:我来了！！！','你的人在哪里呀？<br />','2015-07-18 02:54:09'),(28,80,93,'2015-07-18 13:51:34','Re:我来了！！！','Strike Freedom&nbsp;，这有意思？<br />','2015-07-18 13:51:33'),(29,92,93,'2015-08-04 04:45:06','Re:sssfff','aaaaa','2015-08-04 04:45:05'),(30,92,93,'2015-08-04 04:45:33','Re:sssfff','aaaaaaaasasasasas','2015-08-04 04:45:33'),(31,92,93,'2015-08-04 04:46:22','Re:sssfff','<h1>HAHA</h1>','2015-08-04 04:46:22'),(32,92,93,'2015-08-04 04:47:34','Re:sssfff','<h2>Strike Freedom</h2>\r\n<p>进化</p>','2015-08-04 04:47:34'),(33,92,93,'2015-08-04 04:47:52','Re:sssfff','水水水啊啊啊啊啊啊','2015-08-04 04:47:52'),(34,92,93,'2015-08-04 05:16:38','Re:sssfff','<img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386653564439612.964229473553.jpg\" height=\"500\" align=\"left\" alt=\"\" border=\"0\" /><br />','2015-08-04 05:16:38'),(35,92,93,'2015-08-04 05:19:41','Re:sssfff','<img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386655757514641.296625171657.jpg\" width=\"700\" height=\"500\" alt=\"\" border=\"0\" /><br />','2015-08-04 05:19:41'),(36,92,93,'2015-08-04 05:21:11','Re:sssfff','<img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386656657383464.0385900328583.jpg\" width=\"700\" height=\"500\" alt=\"\" border=\"0\" /><br />','2015-08-04 05:21:10'),(37,92,93,'2015-08-04 05:22:27','Re:sssfff','<img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386657397841569.3182416014151.jpg\" width=\"700\" height=\"500\" alt=\"\" border=\"0\" /><br />','2015-08-04 05:22:26'),(38,92,93,'2015-08-04 08:48:49','Re:sssfff','<p><img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386777110957508.001349352068.jpg\" width=\"700\" alt=\"\" border=\"0\" /></p>\r\n<p><img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386779165924155.692994069612.jpg\" alt=\"\" border=\"0\" /><img src=\"http://localhost:8080/bbs/upload/articleimage/93_topic_14386780929258618.622276318763.jpg\" width=\"700\" alt=\"\" border=\"0\" /></p>','2015-08-04 08:48:48');
/*!40000 ALTER TABLE `tb_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_section`
--

DROP TABLE IF EXISTS `tb_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_section` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '板块名称',
  `profile` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '板块简介',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='父板块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_section`
--

LOCK TABLES `tb_section` WRITE;
/*!40000 ALTER TABLE `tb_section` DISABLE KEYS */;
INSERT INTO `tb_section` VALUES (6,'资源共享区','资源共享区','2010-06-15 08:57:16','2010-06-15 08:57:16','samLee'),(7,'软件技术频道','软件技术频道','2010-06-15 08:57:33','2010-06-15 08:57:33','samLee'),(8,'Strike','Freedom','2015-08-04 13:04:43','2015-08-04 13:04:43','admin');
/*!40000 ALTER TABLE `tb_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_subsection`
--

DROP TABLE IF EXISTS `tb_subsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_subsection` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` int(4) DEFAULT NULL COMMENT '外键，父板块ID',
  `managerId` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '版主ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '块板名称',
  `profile` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '板块简介',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `createtime` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `createuser` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  CONSTRAINT `tb_subsection_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `tb_section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='子版块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_subsection`
--

LOCK TABLES `tb_subsection` WRITE;
/*!40000 ALTER TABLE `tb_subsection` DISABLE KEYS */;
INSERT INTO `tb_subsection` VALUES (40,6,'83','windows专区','windows专区','2010-09-07 05:45:33','2010-06-15 08:58:39','samLee'),(41,6,'84','精品软件','精品软件','2010-09-07 03:18:06','2010-06-15 08:58:47','samLee'),(42,6,NULL,'风格美化','风格美化','2010-06-15 08:59:01','2010-06-15 08:59:01','samLee'),(43,6,NULL,'注册破解','注册破解','2010-06-15 08:59:09','2010-06-15 08:59:09','samLee'),(44,7,NULL,'软件应用技巧','软件应用技巧','2010-06-15 08:59:37','2010-06-15 08:59:37','samLee'),(45,7,NULL,'编程语言专区','编程语言专区','2010-06-15 08:59:49','2010-06-15 08:59:49','samLee'),(46,7,NULL,'系统应用技巧','系统应用技巧','2010-06-15 09:00:07','2010-06-15 09:00:07','samLee');
/*!40000 ALTER TABLE `tb_subsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_topic`
--

DROP TABLE IF EXISTS `tb_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_topic` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sid` int(4) DEFAULT NULL COMMENT '外键，所属板块ID',
  `uid` int(4) DEFAULT NULL COMMENT '外键，发帖人ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '帖子标题',
  `content` varchar(20000) DEFAULT NULL COMMENT '帖子正文',
  `sendtime` timestamp NULL DEFAULT NULL COMMENT '发帖时间',
  `click_num` int(11) DEFAULT '0' COMMENT '点击量',
  `reply_num` int(11) DEFAULT '0' COMMENT '回复量',
  `topic_status` varchar(2) DEFAULT NULL COMMENT '帖子状态',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `last_replytime` timestamp NULL DEFAULT NULL COMMENT '最后回复时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  CONSTRAINT `tb_topic_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `tb_subsection` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_topic_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='主题帖';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_topic`
--

LOCK TABLES `tb_topic` WRITE;
/*!40000 ALTER TABLE `tb_topic` DISABLE KEYS */;
INSERT INTO `tb_topic` VALUES (72,43,83,'我会唱歌，也会破解，嘎嘎','破解什么意思？','2010-09-07 02:25:34',18,3,'01','2015-08-04 05:18:04','2010-09-07 02:56:27'),(73,40,88,'找女朋友了','<p>本人是帅哥：</p>\r\n<p><img style=\"width:563px;height:324px;\" border=\"0\" alt=\"\" src=\"http://localhost:8080/bbs/upload/articleimage/88_topic_12838375058242802.9674218737764.jpg\" width=\"700\" height=\"500\" /></p>','2010-09-07 05:31:59',24,5,'01','2015-08-03 18:10:34','2015-06-27 04:02:19'),(74,40,88,'节省时间换生命，玩转Win7必知的15个快捷键','<table cellspacing=\"0\" cellpadding=\"0\">\r\n<tbody>\r\n<tr>\r\n<td id=\"postmessage_22295128\" class=\"t_msgfont\">效率就是时间，时间就是生命，于是，效率就是生命。听起来有点绕口，请原谅，笨笨好久没发文章，脑袋有点秀逗。 <br />\r\n任何的操作<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%B3%BB%E7%BB%9F\">系统</span>、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%BD%AF%E4%BB%B6\">软件</span>、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%B8%B8%E6%88%8F\">游戏</span>，只有熟练使用快捷键，才能最大效率的工作、娱乐，我们不能把所有的时间都浪费在一台机器上，这是不行的。快捷键带给我们的不只是快速，还能感受到机器带来的快感。很难想象一个不用键盘的魔兽争霸玩家。 <br />\r\n<br />\r\n在此文之前，笨笨已经发过n多的关于Win7快捷键的文章，还曾经汇总了一篇《<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=Windows\">Windows</span>7 键盘快捷键大全》，今天再发一些比较实用却又有些偏门的快捷键，希望能对大家有所帮助。当然当然，有些朋友肯定早已经知晓啦。 <br />\r\n<br />\r\n1. Ctrl + Shift + N ? 创建一个新的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%96%87%E4%BB%B6\">文件</span>夹 <br />\r\n<br />\r\n你需要在文件夹窗口中按 Ctrl + Shift + N 才行，当然，在桌面上，也一样OK。 <br />\r\n<br />\r\n<br />\r\n2. Ctrl + Shift + 左键 ? 用管理员权限打开<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%A8%8B%E5%BA%8F\">程序</span> (Ctrl+Shift+Click to Open a Program As Administrator) <br />\r\n<br />\r\n有些程序，需要右键选择 <span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=Windows7\">Windows7</span> 的管理员权限才可以正常运行，而这个蛋疼的快捷键我没有测试成功，@sfufoet 在受限制帐户下测试的软件 AirVideoServer 可以在 Touch 上成功连接 AirVideoServer 并播放<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%A7%86%E9%A2%91\">视频</span>。 <br />\r\n<br />\r\n3. Shift+ 鼠标右键 ? 增强版右键发送到 <br />\r\n<br />\r\n右键发送到 是一个很常用的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%8A%9F%E8%83%BD\">功能</span>，一般情况下可以发送到：桌面快捷方式、邮件联系人、压缩文档、移动设备等等。而通过 Shift+ 鼠标右键 的发送到，增加了 Windows7个人文件夹内的所有内容，包括：我的文档、我的照片、我的音乐、桌面等等 <br />\r\n<br />\r\n<br />\r\n<br />\r\n4. Shift + 右键 ? 在当前文件夹用命令行打开。 <br />\r\n<br />\r\n开始 &gt; 运行 &gt; cmd 就是命令行界面，传说中的 DOS 命令。最常用的可能就是 ping 了吧？用命令行来修改文件扩展名也是好办法，ren name.txt name.bat 就可以把一个文本文件改成批处理文件了。而 Shift + 右键 在当前文件夹用命令行打开的作用就是不用频繁的 cd 打开各级文件夹了。 <br />\r\n<br />\r\n<br />\r\n5. Win + 空格 ? 闪现桌面 <br />\r\n<br />\r\n效果与鼠标停留在<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%BB%BB%E5%8A%A1\">任务</span>栏最右端相同，松开 Win 键即恢复窗口。恩，你可以用来看看桌面背景的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%BE%8E%E5%A5%B3\">美女</span>。 <br />\r\n<br />\r\n6. Win+ 上/下/左/右 ? 移动当前激活窗口 <br />\r\n<br />\r\n其中，Win +左/右 为移动窗口到屏幕两边，占半屏，Win + 上 为最大化当前窗口，下为恢复当前窗口 <br />\r\n<br />\r\n7. 针对双显示器: Win + Shift + 左 ? 移动当前窗口到左边的显示器上 <br />\r\n<br />\r\n针对让人羡慕的双显示器，可以很方便的移动当前窗口到另外一个显示器上，比如把视频窗口移到一边去，还可以继续<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%B8%8A%E7%BD%91\">上网</span>。 <br />\r\n<br />\r\n8. 针对双显示器: Win + Shift + 右 ? 移动当前窗口到右边的显示器上 <br />\r\n<br />\r\n我认为是老外为了凑数才把这个快捷键单独列出来的。 <br />\r\n<br />\r\n9. Win + T ? 显示任务栏窗口微缩图并回车切换 <br />\r\n<br />\r\n多按几次 T 可以在不同的任务栏窗口中显示，回车则切换。很方便的快捷键。切换窗口还可以用 Win + Tab。 <br />\r\n<br />\r\n10. Shift + 左键 ? 在任务栏对已打开的程序/文件夹再打开一次 <br />\r\n<br />\r\n话比较绕，比如你对着任务栏里的 Chrome Shift + 左键 则会新打开一个窗口。而对着记事本按也会再打开一个记事本。 <br />\r\n<br />\r\n11. Win + B ? 移动光标到系统托盘 <br />\r\n<br />\r\n针对键盘爱好者，不需要在狂按 TAB 键才切换到系统托盘了。Win + B 直达托盘，之后就可以用方向键控制了，也可以控制时间区域。 <br />\r\n<br />\r\n12. Win + P ? 在显示器与投影间相互切换 <br />\r\n<br />\r\n13. Win + 1, Win + 2 ? 在任务栏中快速切换程序 <br />\r\n<br />\r\n任务栏从左到右 1，2，3，快速切换用的。对当前窗口的作用是最小化，另外一个最小化快捷键是 Win + M。 <br />\r\n<br />\r\n14. Win + Pause ? 打开系统属性 <br />\r\n<br />\r\n通过开始菜单 &gt; 计算机右键属性，是一个东西 <br />\r\n<br />\r\n15. Ctrl + Shift + Esc ? 快速打开 Windows 任务管理器 <br />\r\n<br />\r\n俗话说最好的留在最后，自从升级 Windows7 后，想调用任务管理器，需要先 Ctrl + Alt + Del 标准快捷键，再点击任务管理器，并且屏幕还会被锁定。而 Ctrl + Shift + Esc 让很多小白用户知晓后内牛满面啊。。。</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n效率就是时间，时间就是生命，于是，效率就是生命。听起来有点绕口，请原谅，笨笨好久没发文章，脑袋有点秀逗。 <br />\r\n任何的操作<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%B3%BB%E7%BB%9F\">系统</span>、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%BD%AF%E4%BB%B6\">软件</span>、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%B8%B8%E6%88%8F\">游戏</span>，只有熟练使用快捷键，才能最大效率的工作、娱乐，我们不能把所有的时间都浪费在一台机器上，这是不行的。快捷键带给我们的不只是快速，还能感受到机器带来的快感。很难想象一个不用键盘的魔兽争霸玩家。 <br />\r\n<br />\r\n在此文之前，笨笨已经发过n多的关于Win7快捷键的文章，还曾经汇总了一篇《<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=Windows\">Windows</span>7 键盘快捷键大全》，今天再发一些比较实用却又有些偏门的快捷键，希望能对大家有所帮助。当然当然，有些朋友肯定早已经知晓啦。 <br />\r\n<br />\r\n1. Ctrl + Shift + N ? 创建一个新的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%96%87%E4%BB%B6\">文件</span>夹 <br />\r\n<br />\r\n你需要在文件夹窗口中按 Ctrl + Shift + N 才行，当然，在桌面上，也一样OK。 <br />\r\n2. Ctrl + Shift + 左键 ? 用管理员权限打开<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%A8%8B%E5%BA%8F\">程序</span> (Ctrl+Shift+Click to Open a Program As Administrator) <br />\r\n<br />\r\n有些程序，需要右键选择 <span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=Windows7\">Windows7</span> 的管理员权限才可以正常运行，而这个蛋疼的快捷键我没有测试成功，@sfufoet 在受限制帐户下测试的软件 AirVideoServer 可以在 Touch 上成功连接 AirVideoServer 并播放<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%A7%86%E9%A2%91\">视频</span>。 <br />\r\n<br />\r\n3. Shift+ 鼠标右键 ? 增强版右键发送到 <br />\r\n<br />\r\n右键发送到 是一个很常用的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%8A%9F%E8%83%BD\">功能</span>，一般情况下可以发送到：桌面快捷方式、邮件联系人、压缩文档、移动设备等等。而通过 Shift+ 鼠标右键 的发送到，增加了 Windows7个人文件夹内的所有内容，包括：我的文档、我的照片、我的音乐、桌面等等 <br />\r\n<br />\r\n<br />\r\n<br />\r\n4. Shift + 右键 ? 在当前文件夹用命令行打开。 <br />\r\n<br />\r\n开始 &gt; 运行 &gt; cmd 就是命令行界面，传说中的 DOS 命令。最常用的可能就是 ping 了吧？用命令行来修改文件扩展名也是好办法，ren name.txt name.bat 就可以把一个文本文件改成批处理文件了。而 Shift + 右键 在当前文件夹用命令行打开的作用就是不用频繁的 cd 打开各级文件夹了。 <br />\r\n<br />\r\n<br />\r\n5. Win + 空格 ? 闪现桌面 <br />\r\n<br />\r\n效果与鼠标停留在<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%BB%BB%E5%8A%A1\">任务</span>栏最右端相同，松开 Win 键即恢复窗口。恩，你可以用来看看桌面背景的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%BE%8E%E5%A5%B3\">美女</span>。 <br />\r\n<br />\r\n6. Win+ 上/下/左/右 ? 移动当前激活窗口 <br />\r\n<br />\r\n其中，Win +左/右 为移动窗口到屏幕两边，占半屏，Win + 上 为最大化当前窗口，下为恢复当前窗口 <br />\r\n<br />\r\n7. 针对双显示器: Win + Shift + 左 ? 移动当前窗口到左边的显示器上 <br />\r\n<br />\r\n针对让人羡慕的双显示器，可以很方便的移动当前窗口到另外一个显示器上，比如把视频窗口移到一边去，还可以继续<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%B8%8A%E7%BD%91\">上网</span>。 <br />\r\n<br />\r\n8. 针对双显示器: Win + Shift + 右 ? 移动当前窗口到右边的显示器上 <br />\r\n<br />\r\n我认为是老外为了凑数才把这个快捷键单独列出来的。 <br />\r\n<br />\r\n9. Win + T ? 显示任务栏窗口微缩图并回车切换 <br />\r\n<br />\r\n多按几次 T 可以在不同的任务栏窗口中显示，回车则切换。很方便的快捷键。切换窗口还可以用 Win + Tab。 <br />\r\n<br />\r\n10. Shift + 左键 ? 在任务栏对已打开的程序/文件夹再打开一次 <br />\r\n<br />\r\n话比较绕，比如你对着任务栏里的 Chrome Shift + 左键 则会新打开一个窗口。而对着记事本按也会再打开一个记事本。 <br />\r\n<br />\r\n11. Win + B ? 移动光标到系统托盘 <br />\r\n<br />\r\n针对键盘爱好者，不需要在狂按 TAB 键才切换到系统托盘了。Win + B 直达托盘，之后就可以用方向键控制了，也可以控制时间区域。 <br />\r\n<br />\r\n12. Win + P ? 在显示器与投影间相互切换 <br />\r\n<br />\r\n13. Win + 1, Win + 2 ? 在任务栏中快速切换程序 <br />\r\n<br />\r\n任务栏从左到右 1，2，3，快速切换用的。对当前窗口的作用是最小化，另外一个最小化快捷键是 Win + M。 <br />\r\n<br />\r\n14. Win + Pause ? 打开系统属性 <br />\r\n<br />\r\n通过开始菜单 &gt; 计算机右键属性，是一个东西 <br />\r\n<br />\r\n15. Ctrl + Shift + Esc ? 快速打开 Windows 任务管理器 <br />\r\n<br />\r\n俗话说最好的留在最后，自从升级 Windows7 后，想调用任务管理器，需要先 Ctrl + Alt + Del 标准快捷键，再点击任务管理器，并且屏幕还会被锁定。而 Ctrl + Shift + Esc 让很多小白用户知晓后内牛满面啊。。。','2010-09-07 05:48:08',3,0,'01','2015-08-04 05:05:46',NULL),(75,41,88,'PM硬盘分区魔术师9.3┊硬盘分区工具┊绿色免费版','硬盘分区魔术师v9.3<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%AE%98%E6%96%B9\">官方</span>版<br />\r\n---------------------------------------------------------<br />\r\n如果您对该<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%BD%AF%E4%BB%B6\">软件</span>有任何<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%B8%8B%E8%BD%BD\">下载</span>的问题、软件安装上的质疑，都可以在软件下载下方的留言处写出您对我们的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%BB%BA%E8%AE%AE\">建议</span>。windows7软件下载<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%AC%A2%E8%BF%8E\">欢迎</span>大家对我们的下载站或软件下载提出自己的想法。<br />\r\n　　一套磁盘管理软件，是目前为止最好用的磁盘管理工具之一，能够优化磁盘使应用<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%A8%8B%E5%BA%8F\">程序</span>和<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%B3%BB%E7%BB%9F\">系统</span>速度变得更快，不损失磁盘数据下调整分区大小，对磁盘进行分区，并可以在不同的分区以及分区之间进行大小调整、移动、隐藏、合并、<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%88%A0%E9%99%A4\">删除</span>、格式化、搬移分区等操作，可复制整个硬盘资料到分区，恢复丢失或者删除的分区和数据，无需恢复受到破坏的系统就可磁盘数据恢复或拷贝到其他磁盘。能够管理安装多<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F\">操作系统</span>，方便的转换系统分区格式，也有备份数据的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%8A%9F%E8%83%BD\">功能</span>，支持 Vista 系统下操作。<br />\r\n　　windows7常用软件下载频道所有软件都经过四种杀毒软件检测，绝对无带病毒软件，请大家放心安装。如果您感觉本站不错，请<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%8E%A8%E8%8D%90\">推荐</span>给您的朋友<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%88%86%E4%BA%AB\">分享</span>，<a onclick=\"checkurl(this.href);return false;\" href=\"http://www.qqenet.com/\" target=\"_blank\"><font color=\"#007ba8\">www.qqenet.com</font></a>感谢您的推荐.<br />\r\n<a onclick=\"checkurl(this.href);return false;\" href=\"http://qqenet.com/soft/sort07/100.html\" target=\"_blank\">[B]PM硬盘分区魔术师9.2┊硬盘分区工具┊绿色免费版[/B]</a> <br />\r\n<br />\r\n<img alt=\"\" src=\"http://www.qqenet.com/skins/icons/icon_download.gif\" width=\"16\" height=\"16\" /><a onclick=\"checkurl(this.href);return false;\" href=\"thunder://QUFodHRwOi8vMS4zM2xjLmNvbTo4MDEvc21hbGwvSEREZmVucXUucmFyWlo=/\" target=\"_blank\"><strong><font color=\"#0000ff\">点这里下载 → 远程下载一</font></strong></a><br />\r\n<font color=\"#0000ff\"><img alt=\"\" src=\"http://www.qqenet.com/skins/icons/icon_download.gif\" width=\"16\" height=\"16\" /></font><a onclick=\"checkurl(this.href);return false;\" href=\"thunder://QUFodHRwOi8vMS4zM2xjLmNvbTo4MDEvc21hbGwvSEREZmVucXUucmFyWlo=/\" target=\"_blank\"><strong><font color=\"#0000ff\">点这里下载 → 远程下载二</font></strong></a>','2010-09-07 05:49:29',2,0,'01','2015-08-04 05:05:01',NULL),(76,42,88,'Windows 8 Aquatic by yanomami【启动界面】','搜索标题未找到，如重复请<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E5%88%A0%E9%99%A4\">删除</span>，见谅，删除请不要短信通知，先谢谢！ <br />\r\n内容均来自互联网，如涉及侵犯您的权利，请通知我们，我们将在第一时间予以更改或删除！<br />\r\n运行环境：&nbsp;&nbsp;WinXP <br />\r\n修改之前首先要安装TuneUp Utilities<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%BD%AF%E4%BB%B6\">软件</span>，它支持所有格式的启动界面和登陆界面<br />\r\n<img border=\"0\" alt=\"\" src=\"http://localhost:8080/bbs/upload/articleimage/88_topic_12838387421664688.20753302615.jpg\" />','2010-09-07 05:52:25',3,0,'01','2015-08-04 05:04:56',NULL),(77,44,88,'四个ping命令搞定网络故障','<p align=\"center\">如果你的<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%94%B5%E8%84%91\">电脑</span>不能<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E4%B8%8A%E7%BD%91\">上网</span>或者突然不能上网了怎么办？请专业人员来维修还是自己瞎急一通呢，下面给大家介绍如何准确地判断电脑不能上网问题出在哪里？又如何能快捷地<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%A7%A3%E5%86%B3\">解决</span>这故障？希望下文的一些小技巧能帮到大家，这也是本人多年总结的经验，希望对大家有用。<br />\r\n<br />\r\n其实，电脑不能上网大致可分以下几个原因：<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%B3%BB%E7%BB%9F\">系统</span>的IP<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E8%AE%BE%E7%BD%AE\">设置</span>、网卡、MODEM和线路故障。排除硬件及线路的故障问题，我们可以利用Ping命令来快速检测<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%BD%91%E7%BB%9C\">网络</span>状况。<br />\r\n<br />\r\n首先，我们点击系统中开始里的运行，在运行栏中输入cmd命令，<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F\">操作系统</span>中的DOS窗口就会弹出，在这里我们可以直观和方便地输入各种DOS命令。 <br />\r\n电脑左边-开始-运行-输入CMD确定<br />\r\n接着，我们可以在DOS里输入Ping 127.0.0.1，该地址是本地循环地址，如发现本地址无法Ping通，就表明本地机TCP/IP协议不能正常工作,那么请重装TCP/IP协议。 <br />\r\n键入指令判断TCP/IP协议是否正常。<br />\r\n如果上面的操作成功，可Ping通的话，我们接下来可以输入IPConfig来查看本地的IP地址，然后Ping该IP也就是自己的IP，通则表明网卡或MODEM工作正常，不通则是网络适配器出现故障。<br />\r\n键入指令判断网卡或MODEM工作情况<br />\r\nping自己的IP有反还值说明网卡和MODEM正常<br />\r\n然后Ping默认网关的IP，ping默认网关之前要先检查路由器设置里面是不是允许ping网关，检查防火墙设置允许ping出、ping入吗？检查完这些我们开始ping默认网关，不通则此段线路有问题，那么检查网线和路由器是否工作正常。<br />\r\nping默认网关来判断本机到路由之间是否正常。<br />\r\n最后，检测一个带DNS服务的网络，简单的说就是ping一个网站，比如Ping <a onclick=\"checkurl(this.href);return false;\" href=\"http://www.google.com/\" target=\"_blank\">www.google.com</a>，正常情况下会出现返还值，这表明本机的DNS设置正确而且DNS<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%9C%8D%E5%8A%A1%E5%99%A8\">服务器</span>工作正常，那就是我说我们的机器可以连接广域网了。<br />\r\nping检测Internet网。<br />\r\n当以上四个步骤执行完毕后，我们就可轻易判断出到底是某个环节出现了故障问题，该重新设置的设置，该换硬件的换硬件。</p>','2010-09-07 05:54:34',2,0,'01','2015-07-18 02:03:48',NULL),(78,46,88,'原来这样装系统也可以','遇到的问题：<br />\r\n我朋友的一台电脑，一开机就显示：<br />\r\nmsisadrv.sys文件丢失，电脑开不了机，不管怎样也修复不了。进不了系统。（由于是老主板不支持U盘启动，也没光驱，）<br />\r\n想重装系统 。<br />\r\n步骤：<br />\r\n1：将他的硬盘插到我的主板上。（此时我的主板就有两个硬盘了）<br />\r\n2：用U盘启动，将GHOST 文件写入我朋友的硬盘中（这里最好对这个硬盘的系统分去做个标识。比如命名为自己好看一点的名字）。<br />\r\n这里要注意了。当ghost文件写到100%时，要选择是“继续”还是“重启电脑”。<br />\r\n这里选择“继续”（平时对自己的盘装系统就是选择重启电脑），因为选择重启电脑的话，它就会根据你现在用PE这他机子的配置装驱动程序。<br />\r\n此时 请关掉电源。<br />\r\n3：将我朋友的硬盘再接回到他自己的主板上，开机，此时它就会根据我朋友的主板，电脑配置装驱动程序之类的。这跟装自己的系统没什么区别。<br />\r\n4：重启开机。就行了。<br />\r\n<br />\r\n没想到这样也能装系统，当初我只是抱着试一试的想法，结果真的成功了，现在与大家一起分享，希望对大家有帮助。<br />\r\n也许各位大侠早就试过，小弟在此献丑了，请不要<img border=\"0\" alt=\"\" src=\"/bbs/comm/kindeditor/plugins/emoticons/20.gif\" width=\"24\" height=\"24\" />。','2010-09-07 05:56:36',3,0,'01','2015-08-04 05:05:26',NULL),(79,45,88,'我想创作一个网站，请大家进来看一下','我下次昂创作一个服务行的网站，就向政府那样的网站，但也要求带点商业性质的，请问大家创作网站需要的有哪些<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%A8%8B%E5%BA%8F\">程序</span>，以及需要什么编辑<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E7%B3%BB%E7%BB%9F\">系统</span>，资金是多少？就拿<span class=\"t_tag\" onclick=\"tagshow(event)\" href=\"tag.php?name=%E6%B7%B1%E5%BA%A6\">深度</span>来说吧，平常网站都需要怎样管理？希望感兴趣的朋友帮助一下！谢...','2010-09-07 05:58:19',4,0,'01','2015-08-02 11:39:08',NULL),(80,40,89,'我来了！！！','<div align=\"center\" style=\"font-family:;\" !important;\"=\"\" sans-serif=\"\" unicode\",=\"\" sans=\"\" \"lucida=\"\" grande\",=\"\" lucida=\"\">\r\n        <table width=\"600\" style=\"border:1px solid #cccccc;border-image:none;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr style=\"height:100px;\">\r\n                <td style=\"width:130px;text-align:center;\">\r\n                    <a title=\"http://www.meschina.cn\" href=\"http://www.meschina.cn\" target=\"_blank\"> \r\n                        <img width=\"128\" height=\"56\" style=\"padding-top:20px;padding-left:20px;\" alt=\"logo\" src=\"http://www.meschina.cn/edmweb/logo.png\" />                     </a>                 </td>\r\n                <td>\r\n                    <span style=\"color:#c7009c;padding-left:20px;font-family:simhei;font-size:40px;font-weight:bold;text-shadow:3px 0px #9c9c9c;\">                         移动电子行业商机速递\r\n                    </span>                 </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"padding-top:10px;border-right-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr style=\"height:40px;\">\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"6月焦点\" src=\"http://www.meschina.cn/edmweb/focus1.png\" />                 </td>\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"7月最新活动\" src=\"http://www.meschina.cn/edmweb/activity1.png\" />                 </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"border-right-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr>\r\n                <td style=\"width:270px;text-align:center;\">\r\n                    <p style=\"text-align:center;font-family:simsun;font-size:15px;font-weight:bold;\">高端零售商联盟6月集体采购活动 总结</p>\r\n                    <img width=\"251\" height=\"141\" alt=\"高端零售商联盟6月集体采购活动照片\" src=\"http://www.meschina.cn/Uploadfiles/image/20150622/20150622144360666066.jpg\" />                     <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\"><span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">中国消费电子区域性高端零售商联盟</span>集体采购活动于6月3日在深圳圆满结束，通过联盟及组织方特邀的近百家品牌商获邀参加，其中经初步筛选的品牌商受邀进行产品展示并与联盟各成员采购负责人面对面深入洽谈交流。</p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\"><span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">采购品类</span> : 移动终端及配件/健康及运动类产品/智能硬件及穿戴式设备/蓝牙及无线产品/智能家居</p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">\"联盟\"6月集体采购活动详情请点击\r\n                        <a title=\"http://www.meschina.cn/activity.asp?id=116\" style=\"color:#4100ff;\" href=\"http://www.meschina.cn/activity.asp?id=116\" target=\"_blank\">阅读详情</a>                     </p>\r\n                </td>\r\n                <td style=\"width:270px;text-align:center;padding-left:20px;\">\r\n                    <p style=\"text-align:left;padding-left:10px;font-size:14px;font-weight:bold;\">精英操盘手训练营(山东站）</p>\r\n                    <img width=\"270\" height=\"83\" alt=\"精英操盘手训练营(山东站）\" src=\"http://www.meschina.cn/edmweb/jingying.png\" />                     <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">中国精英操盘手训练营”将带您深入华东、华南、西南、东北等市场，深度考察当地不同渠道业态，与当地零售买家采购决策者直接对接，建立销售渠道，把握市场蓬勃商机。 <br />\r\n<span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">本场时间</span>:2015年7月10日&amp;11日 <br />\r\n<span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">本场目的地</span>:山东青岛 <br />\r\n<span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">训练营招募对象</span>：以下产品品牌商/代理商： <br />\r\n移动终端及配件/健康及运动类产品/智能硬件及可穿戴设备/蓝牙及无线产品/智能家居等产品 </p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\"><span style=\"font-family:simsun;font-size:12px;font-weight:bold;\">三大理由，训练营不容错过</span>： <br />\r\n1. 与中国区域市场知名零售商、分销商、代理商等渠道商管理层面对面交流 <br />\r\n2. 中国本土市场环境与规则深度的考察与探讨 <br />\r\n3. 深入了解中国内贸电子与通讯市场，把脉前线第一信息 </p>\r\n                    \r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">评选活动详情请点击\r\n                        <a title=\"http://www.meschina.cn/activity.asp?id=120\" style=\"color:#4100ff;\" href=\"http://www.meschina.cn/activity.asp?id=120\" target=\"_blank\">阅读详情</a>                     </p>\r\n                </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"padding-top:10px;border-right-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr style=\"height:40px;\">\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"展会介绍\" src=\"http://www.meschina.cn/edmweb/introduction1.png\" />                 </td>\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"展商精品\" src=\"http://www.meschina.cn/edmweb/selected1.png\" />                 </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"border-right-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr>\r\n                <td style=\"width:290px;\">\r\n                    <table>\r\n                        <tbody><tr>\r\n                            <td style=\"width:140px;text-align:left;padding-right:0px;padding-left:5px;border-right-color:currentcolor;border-right-width:0px;border-right-style:none;\">\r\n                                <img width=\"128\" height=\"56\" alt=\"logo\" src=\"http://www.meschina.cn/edmweb/logo.png\" />                             </td>\r\n                            <td style=\"width:140px;text-align:left;padding-left:10px;\">\r\n                                <p><span style=\"font-family:simsun;font-size:14px;font-weight:bold;\">深圳会展中心</span><br />\r\n                                    <span style=\"font-family:simsun;font-size:14px;font-weight:bold;\">2015年8月26-28日</span>                                 </p>\r\n                            </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td>\r\n                                <span style=\"text-align:left;padding-left:10px;font-family:simsun;font-size:14px;font-weight:bold;\">展区规划</span><br />\r\n                                <ul style=\"margin:0px;padding:5px;text-align:left;font-size:12px;list-style-type:none;\">\r\n                                    <li><span style=\"font-weight:bold;\">√</span>移动终端及配件</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>蓝牙及无线产品</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>健康及运动类产品</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>设计师专区</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>创客专区</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>智能家居</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>智能硬件及可穿戴设备</li>\r\n                                </ul>\r\n                                <span style=\"text-align:left;padding-left:10px;font-family:simsun;font-size:14px;font-weight:bold;\">展会现场活动</span><br />\r\n                                <ul style=\"margin:0px;padding:5px;text-align:left;font-size:12px;list-style-type:none;\">\r\n                                    <li><span style=\"font-weight:bold;\">√</span>顶级买家现场采购会</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>渠道中国百佬汇</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>CEO学院</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>移动电子渠道峰会</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>智能硬件高峰论坛</li>\r\n                                </ul>\r\n                            </td>\r\n                            <td style=\"padding-left:10px;\">\r\n                                <span style=\"text-align:left;padding-top:0px;padding-left:10px;font-family:simsun;font-size:14px;font-weight:bold;margin-top:0px;\">展前系列活动</span><br />\r\n                                <ul style=\"margin:0px;padding:0px;text-align:left;font-size:12px;list-style-type:none;\">\r\n                                    <li><span style=\"font-weight:bold;\">√</span>MES China 大奖</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>CEO智慧风暴活动</li>\r\n                                    <li><span style=\"font-weight:bold;\">√</span>贸促大讲堂-渠道百佬汇</li>\r\n                                </ul>\r\n                                <p style=\"height:130px;\"></p>\r\n                                <p style=\"font-family:simsun;font-size:12px;\">点击<a title=\"http://www.meschina.cn/activity.asp?id=89\" style=\"color:#4100ff;\" href=\"http://www.meschina.cn/activity.asp?id=89\" target=\"_blank\">了解更多</a></p>\r\n                            </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                </td>\r\n                <td style=\"width:270px;text-align:left;padding-left:20px;\">\r\n                    <table>\r\n                        <tbody><tr>\r\n                            <td style=\"width:110px;font-size:12px;\">\r\n                                <a title=\"http://www.evutec.com\" href=\"http://www.evutec.com\" target=\"_blank\">                                     <p style=\"font-family:simsun;font-weight:bold;\">新秀电子有限公司</p>\r\n                                </a>                                 <p style=\"font-family:simsun;font-weight:bold;\">公司自主品牌：</p>\r\n                                <img width=\"88\" height=\"38\" alt=\"com-logo\" src=\"http://www.meschina.cn/edmweb/com-logo.png\" />                             </td>\r\n                            <td style=\"width:150px;\">\r\n                                <img width=\"123\" height=\"96\" alt=\"product\" src=\"http://www.meschina.cn/edmweb/product.png\" /><br />\r\n                                <span style=\"text-align:center;font-family:simsun;font-size:12px;font-weight:bold;\">iPhone 6 凯夫拉 - Osprey</span>                             </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                    <table>\r\n                        <tbody><tr>\r\n                            <td>\r\n                                <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">Evutec是Apple公司授权的美国手机配件品牌于Apple Store上有售卖</p>\r\n                                <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\"><span style=\"font-family:simsun;font-weight:bold;\">产品独特卖点</span>：有杜邦凯夫拉织造型纤维的双融合层和可拆卸式防震 (TPU) 衬里，可提供强劲保护。这款时尚而强劲的保护壳仅厚 0.7 毫米，可为 iPhone 提供完美贴合的保护屏障。</p>\r\n                                <p style=\"height:30px;\"></p>\r\n                            </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"padding-top:10px;border-right-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-left-width:1px;border-right-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr style=\"height:40px;\">\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"参展品牌重点推荐\" src=\"http://www.meschina.cn/edmweb/command1.png\" />                 </td>\r\n                <td style=\"width:290px;\">\r\n                    <img alt=\"联络我们\" src=\"http://www.meschina.cn/edmweb/contact1.png\" />                 </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n        <table width=\"600\" style=\"padding-top:10px;border-right-color:#cccccc;border-bottom-color:#cccccc;border-left-color:#cccccc;border-right-width:1px;border-bottom-width:1px;border-left-width:1px;border-right-style:solid;border-bottom-style:solid;border-left-style:solid;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n            <tbody><tr>\r\n                <td style=\"width:270px;\">\r\n                    <table>\r\n                        <tbody><tr>\r\n                            <td style=\"width:270px;text-align:center;\">\r\n                                <img width=\"60\" height=\"34\" title=\"HUAWEI\" alt=\"HUAWEI\" src=\"http://www.meschina.cn/Uploadfiles/image/20150511/20150511174064996499.png\" />                                 <img width=\"60\" height=\"34\" title=\"PHILIPS\" alt=\"PHILIPS\" src=\"http://www.meschina.cn/Uploadfiles/image/20150511/20150511174610441044.png\" />                                 <img width=\"60\" height=\"34\" title=\"ROCK\" alt=\"ROCK\" src=\"http://www.meschina.cn/Uploadfiles/image/20150511/20150511174264296429.png\" />                                 <img width=\"60\" height=\"34\" title=\"REMAX\" alt=\"REMAX\" src=\"http://www.meschina.cn/Uploadfiles/image/20150430/2015043018530532532.jpg\" />                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width:270px;text-align:center;\">\r\n                                <img width=\"60\" height=\"34\" title=\"prolink\" alt=\"prolink\" src=\"http://www.meschina.cn/Uploadfiles/image/20150430/20150430155744644464.jpg\" />                                 <img width=\"60\" height=\"34\" title=\"anker\" alt=\"anker\" src=\"http://www.meschina.cn/Uploadfiles/image/20150511/20150511174595799579.png\" />                                 <img width=\"60\" height=\"34\" title=\"irobot\" alt=\"irobot\" src=\"http://www.meschina.cn/Uploadfiles/image/20150511/20150511174995189518.png\" />                                 <img width=\"60\" height=\"17\" title=\"thecoo\" alt=\"thecoo\" src=\"http://www.meschina.cn/edmweb/thecoo.png\" />                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width:270px;text-align:center;\">\r\n                                <img width=\"71\" height=\"25\" title=\"fitbit\" alt=\"fitbit\" src=\"http://www.meschina.cn/edmweb/fitbit.png\" />                                 <img width=\"36\" height=\"37\" title=\"LRT\" alt=\"LRT\" src=\"http://www.meschina.cn/edmweb/LRT.png\" />                                 <img width=\"54\" height=\"22\" title=\"Cuptime\" alt=\"Cuptime\" src=\"http://www.meschina.cn/edmweb/Cuptime.png\" />                                 <img width=\"50\" height=\"20\" title=\"lepow\" alt=\"lepow\" src=\"http://www.meschina.cn/edmweb/lepow.png\" />                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td style=\"width:270px;text-align:center;\">\r\n                                <img width=\"70\" height=\"28\" title=\"Lifesense\" alt=\"Lifesense\" src=\"http://www.meschina.cn/edmweb/Lifesense.png\" />                                 <img width=\"59\" height=\"27\" title=\"Fencer\" alt=\"Fencer\" src=\"http://www.meschina.cn/edmweb/Fencer.png\" />                                 <img width=\"29\" height=\"26\" title=\"UBL\" alt=\"UBL\" src=\"http://www.meschina.cn/edmweb/UBL.png\" />                                 <img width=\"48\" height=\"40\" title=\"8thday\" alt=\"8thday\" src=\"http://www.meschina.cn/edmweb/8thday.png\" />                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td>\r\n                                <p style=\"text-align:left;padding-left:220px;font-size:12px;\">更多...</p>\r\n                            </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                    <table>\r\n                        <tbody><tr>\r\n                            <td style=\"width:80px;padding-left:10px;\">\r\n                                <img width=\"68\" height=\"67\" title=\"MES官方微信\" alt=\"MES官方微信\" src=\"http://www.meschina.cn/edmweb/mes-wechat.png\" />                             </td>\r\n                            <td style=\"width:190px;\">\r\n                                <span style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">关注展会官方微信</span><br />\r\n                                <span style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;\">获得更多内贸商机</span>                                 <span style=\"text-align:left;padding-right:5px;padding-left:5px;font-size:12px;font-weight:bold;background-color:#00ffff;\"><a style=\"color:black;text-decoration:none;\" href=\"http://www.meschina.cn\" target=\"_blank\">www.meschina.cn</a></span>                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                        <td></td>\r\n                        <td>\r\n                        <a title=\"http://www.meschina.cn/visit.asp?id=117\" href=\"http://www.meschina.cn/visit.asp?id=117\" target=\"_blank\"><img width=\"184\" height=\"96\" alt=\"提前登记获展会免费入场证\" src=\"http://www.meschina.cn/edmweb/tiqian.png\" /></a>                         </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                </td>\r\n                <td style=\"width:270px;text-align:left;padding-left:20px;\">\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-family:simsun;font-size:12px;font-weight:bold;\">媒体合作及预约VIP买家免费服务</p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-family:simsun;font-size:12px;font-weight:bold;\">(0755) 88662153 <span style=\"color:#4100ff;text-decoration:underline;\">forrestzhang@meschina.cn</span></p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-family:simsun;font-size:12px;font-weight:bold;\">展会咨询及区域性高端零售商联盟产品合作</p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-family:simsun;font-size:12px;font-weight:bold;\">(0755) 88662155 <span style=\"color:#4100ff;text-decoration:underline;\"> sunnyzhang@meschina.cn</span></p>\r\n                    <p style=\"text-align:left;padding-right:5px;padding-left:5px;font-family:simsun;font-size:12px;font-weight:bold;\">论坛嘉宾：0755-88662153 <span style=\"color:#4100ff;text-decoration:underline;\">info@meschina.cn</span></p>\r\n                    <p style=\"font-family:simsun;font-weight:bold;\">行业微信群</p>\r\n<table>\r\n                        <tbody><tr>\r\n                            \r\n                        </tr>\r\n                        <tr>\r\n                            <td rowspan=\"2\">\r\n                                <img width=\"102\" height=\"198\" alt=\"入场证\" src=\"http://www.meschina.cn/edmweb/ruchang.png\" />                             </td>\r\n                            <td>\r\n                                <img width=\"62\" height=\"62\" alt=\"MES渠道百佬汇群（2）\" src=\"http://www.meschina.cn/edmweb/mes-wechat2.png\" />                             </td>\r\n                            <td>\r\n                                <span style=\"text-align:left;font-size:12px;\">MES渠道<br />\r\n百佬汇群（2）</span>                             </td>\r\n                        </tr>\r\n                        <tr>\r\n                            <td>\r\n                                <img width=\"62\" height=\"62\" alt=\"MES渠道百佬汇群（3）\" src=\"http://www.meschina.cn/edmweb/mes-wechat3.png\" />                             </td>\r\n                            <td>\r\n                                <span style=\"text-align:left;font-size:12px;\">MES渠道<br />\r\n百佬汇群（3）</span>                             </td>\r\n                        </tr>\r\n                    </tbody>\r\n</table>\r\n                </td>\r\n            </tr>\r\n        </tbody>\r\n</table>\r\n    </div>','2015-07-18 02:53:08',12,2,'01','2015-08-04 05:03:53','2015-07-18 13:51:34'),(92,40,93,'sssfff','sssfff','2015-08-04 03:23:11',88,10,'01','2015-08-07 14:09:52','2015-08-04 08:48:49'),(93,40,93,'aaaaaaa','bbbvvvddd','2015-08-04 10:15:16',0,0,'01','2015-08-04 10:15:15',NULL),(94,40,93,'AAAAAA','bbbbbbbbbbbee','2015-08-04 10:19:04',0,0,'01','2015-08-04 10:19:04',NULL),(95,40,93,'AAAAAAn','bbbbbbbbbbbbbbbbbbbbbbbbbvvvvvvvvvvvvvvvvvvvvvvvvvvvvccccccccccccccccccccccccddddddddddddddddddddddddd','2015-08-04 10:20:35',2,0,'01','2015-08-04 13:12:25',NULL);
/*!40000 ALTER TABLE `tb_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `userpwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户密码',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (82,'admin','000000','admin@hotmail.com','2010-09-05 16:00:00'),(83,'刘德华','111111','liudehua@qq.com','2010-09-07 02:23:13'),(84,'张学友','111111','zhangxueyou@qq.com','2010-09-07 02:28:26'),(85,'李连杰','111111','lilianjie@qq.com','2010-09-07 02:42:58'),(86,'张曼玉','111111','zhangmanyu@qq.com','2010-09-07 02:48:59'),(87,'郑伊健','111111','zhengyijian@qq.com','2010-09-07 03:19:17'),(88,'王力宏','111111','wanglihong@qq.com','2010-09-07 03:23:05'),(89,'Jkbob2','88343840JKBOB@','635560243@qq.com','2015-07-18 02:50:04'),(93,'Jkbob3','123456','635560243@qq.com','2015-07-18 13:39:08'),(94,'Jkbob4','88343840','635560243@qq.com','2015-07-19 14:32:48'),(99,'Jkbob6','88343840','635560243@qq.com','2015-07-25 02:01:23'),(100,'Jkbob8','88343840','635560243@qq.com','2015-07-25 02:04:54'),(101,'Jkbob9','88343840','635560243@qq.com','2015-07-25 02:10:43'),(102,'Jkbob10','88343840JKBOB#','635560243@qq.com','2015-07-25 10:33:39'),(103,'Jkbob11','123456','635560243@qq.com','2015-07-25 10:36:46');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_userinfo`
--

DROP TABLE IF EXISTS `tb_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_userinfo` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '详细信息表主键\r\n',
  `uid` int(4) DEFAULT NULL COMMENT '外键，关联用户基本信息表',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `birthday` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生日',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'QQ号码',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '' COMMENT '用户头像',
  `realname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `address` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '来自哪里',
  `website` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人网站',
  `usersign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人签名',
  `introduction` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '自我简介',
  `postsign` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '帖子签名',
  `syslevel` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户级别',
  `sysrole` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户角色',
  `usertitle` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户头衔',
  `scores` int(4) unsigned NOT NULL DEFAULT '50' COMMENT '积分',
  `regtime` timestamp NULL DEFAULT NULL COMMENT '注册时间',
  `logintime` timestamp NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(20) DEFAULT NULL COMMENT '登录IP',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户状态',
  `updatetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `onlinetime` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '在线时长',
  `question` varchar(20) DEFAULT NULL,
  `answer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `tb_userinfo_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_userinfo`
--

LOCK TABLES `tb_userinfo` WRITE;
/*!40000 ALTER TABLE `tb_userinfo` DISABLE KEYS */;
INSERT INTO `tb_userinfo` VALUES (16,82,'01','1986-11-20',NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,'地球','http://www.javaeye.com','千江有水千江月，万里无云万里天','发帖就要发好帖','发帖就要发好帖',NULL,'01',NULL,50,NULL,'2015-08-04 13:13:31','0:0:0:0:0:0:0:1',NULL,'2015-08-04 13:13:30',0,NULL,NULL),(17,83,'01','1958-01-01',NULL,NULL,NULL,'images/user_images/83/1283835177909.png',NULL,'中国','','我是刘德华','我不是留得花，我叫刘德华','发帖不好玩','01','04','01',50,'2010-09-07 02:23:13','2015-07-18 02:00:21','0:0:0:0:0:0:0:1','01','2015-07-18 02:00:21',0,NULL,NULL),(18,84,'01','',NULL,NULL,NULL,'images/user_images/84/1283835720852.png',NULL,'中国','http://www.zhangxueyou.com','我当然是张学友了','张学友就是我','我要扯淡的','01','04','01',50,'2010-09-07 02:28:26','2010-09-07 05:01:50','127.0.0.1','01','2010-09-07 05:02:02',0,NULL,NULL),(19,85,'00','1990-01-01',NULL,NULL,NULL,'images/user_images/85/1283835825991.png',NULL,'中国','','叫我阿杰','我是阿杰','扯淡就好','01','03','01',50,'2010-09-07 02:42:58','2010-09-07 05:03:38','127.0.0.1','01','2010-09-07 05:03:47',0,NULL,NULL),(20,86,'02','1950-09-10',NULL,NULL,NULL,'images/user_images/86/1283835782856.png',NULL,'中国','','我是阿玉','阿玉啊','发帖是干嘛','01','03','01',50,'2010-09-07 02:48:59','2010-09-07 05:02:32','127.0.0.1','01','2010-09-07 05:03:04',0,NULL,NULL),(21,87,'01','1978-02-03',NULL,NULL,NULL,'images/user_images/87/1283835853060.png',NULL,'中国','','我是郑伊健','我是郑伊健','我是郑伊健','01','03','01',50,'2010-09-07 03:19:17','2010-09-07 05:17:24','127.0.0.1','01','2010-09-07 05:17:24',0,NULL,NULL),(22,88,'01','1978-02-09',NULL,NULL,NULL,'images/user_images/88/1283837461859.png',NULL,'中国','','我是王力宏','王力宏','王力宏','01','03','01',50,'2010-09-07 03:23:05','2010-09-07 05:30:41','127.0.0.1','01','2010-09-07 05:31:03',0,NULL,NULL),(23,89,NULL,NULL,NULL,NULL,NULL,'images/user_images/89/1437187860307.png',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-18 02:50:04','2015-07-18 11:36:51','0:0:0:0:0:0:0:1','01','2015-07-18 11:36:50',0,NULL,NULL),(27,93,'00','1994-11-10','020-37364365','18814122691','635560243','/bbs/UserFiles/User/UserHeadImage/20150808093058381.png',NULL,'广州','http://www.baidu.com','我就是我，是颜色不一样的焰火','杜绝水贴，从我做起','杜绝水贴，从我做起','01','03','01',50,'2015-07-18 13:39:09','2015-08-08 01:30:28','0:0:0:0:0:0:0:1','01','2015-08-08 01:31:10',0,NULL,NULL),(28,94,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-19 14:32:49','2015-07-19 14:32:49','0:0:0:0:0:0:0:1','01','2015-07-19 14:32:49',0,NULL,NULL),(33,99,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-25 02:01:23','2015-07-25 02:01:23','0:0:0:0:0:0:0:1','01','2015-07-25 02:01:23',0,NULL,NULL),(34,100,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-25 02:04:54','2015-07-25 02:04:54','0:0:0:0:0:0:0:1','01','2015-07-25 02:04:54',0,NULL,NULL),(35,101,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-25 02:10:43','2015-07-25 02:10:43','0:0:0:0:0:0:0:1','01','2015-07-25 02:10:43',0,NULL,NULL),(36,102,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-25 10:33:39','2015-07-25 10:33:39','0:0:0:0:0:0:0:1','01','2015-07-25 10:33:39',0,NULL,NULL),(37,103,NULL,NULL,NULL,NULL,NULL,'images/system_image/default_image_boy.gif',NULL,NULL,NULL,NULL,NULL,NULL,'01','03','01',50,'2015-07-25 10:36:47','2015-07-25 10:36:47','0:0:0:0:0:0:0:1','01','2015-07-25 10:36:46',0,NULL,NULL);
/*!40000 ALTER TABLE `tb_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `userAge` int(11) DEFAULT NULL,
  `userAddress` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'summer',100,'shanghai,pudong'),(3,'飞鸟',80,'原来是魔都的浦东创新园区');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-25 21:53:34
