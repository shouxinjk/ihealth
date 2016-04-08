package com.shouxin.entity.admin;

import java.util.Date;

public class Article {
	
	private String ARTICLE_ID;// varchar(100) NOT NULL,
	private String TITLE;// varchar(255) DEFAULT NULL COMMENT '标题',
	private String AUTHOR;// varchar(255) DEFAULT NULL COMMENT '作者',
	private String LOGOURL;// varchar(255) DEFAULT NULL COMMENT '照片url',
	private String URL;// varchar(255) DEFAULT NULL COMMENT '内容url',
	private String SUMMARY;// varchar(255) DEFAULT NULL COMMENT '摘要',
	private String PUBLISHTIME;// varchar(32) DEFAULT NULL COMMENT '发布时间',
	private String CREATEBY;// varchar(255) DEFAULT NULL COMMENT '创建记录员工id',
	private Date CREATEON;// varchar(32) DEFAULT NULL COMMENT '创建记录时间',
	

}
