package com.ch.daitso.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeBoard {
	private int num;
	private String subject;
	private String content;
	private int readcount;
	private Date reg_date;
	private Date update_date;
	private String fileName;
	private String del;
	private String id;  
	// upload용
	private MultipartFile file;
	// paging용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;
}
