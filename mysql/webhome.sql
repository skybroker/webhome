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

delimiter $$

CREATE TABLE `userinfo` (
  `UserID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `LoginName` varchar(64) NOT NULL,
  `Password` varchar(64) NOT NULL,
  `UserName` varchar(64) DEFAULT NULL,
  `UserNamePinYin` varchar(64) DEFAULT NULL,
  `Desc` varchar(64) DEFAULT NULL,
  `Hospital` varchar(64) DEFAULT NULL,
  `Department` varchar(64) DEFAULT NULL,
  `Title` varchar(64) DEFAULT NULL,
  `PhoneNumber` varchar(64) DEFAULT NULL,
  `Address` varchar(64) DEFAULT NULL,
  `RegisterFromOther` int(11) DEFAULT NULL,
  `ExternalToken` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `userid_UNIQUE` (`UserID`),
  UNIQUE KEY `loginname_UNIQUE` (`LoginName`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312$$

delimiter $$

CREATE TABLE `userinfoex` (
  `UserID` int(10) unsigned NOT NULL,
  `PostNumber` int(10) unsigned DEFAULT NULL,
  `CommentsNumber` int(10) unsigned DEFAULT NULL,
  `LikesNumber` int(10) unsigned DEFAULT NULL,
  `ClassicCaesNumber` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `userid_UNIQUE` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312$$

