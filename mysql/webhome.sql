CREATE DATABASE `webhome` /*!40100 DEFAULT CHARACTER SET gb2312 */;

USE webhome;

delimiter $$

CREATE TABLE `post` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `content` varchar(4096) DEFAULT NULL,
  `findings` varchar(4096) DEFAULT NULL,
  `diagnosis` varchar(4096) DEFAULT NULL,
  `discussion` varchar(4096) DEFAULT NULL,
  `thumbnail` varchar(256) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  `updatedtime` datetime DEFAULT NULL,
  `patientname` varchar(32) DEFAULT NULL,
  `patientgender` varchar(16) DEFAULT NULL,
  `patientage` varchar(16) DEFAULT NULL,
  `studyiuid` varchar(256) DEFAULT NULL,
  `modalitytype` varchar(32) DEFAULT NULL,
  `bodypart` varchar(32) DEFAULT NULL,
  `icd10` varchar(32) DEFAULT NULL,
  `icd9` varchar(32) DEFAULT NULL,
  `acrcode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312$$;

delimiter $$

CREATE TABLE `reply` (
  `replyid` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `content` varchar(4096) DEFAULT NULL,
  `quotedreplyid` int(11) DEFAULT NULL,
  `createdtime` datetime DEFAULT NULL,
  `updatedtime` datetime DEFAULT NULL,
  PRIMARY KEY (`replyid`),
  UNIQUE KEY `replyid_UNIQUE` (`replyid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312$$;



