package com.ch.daitso.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EventBoard {
	private int e_num;
	private String e_subject;
	private String e_content;
	private int e_readcount;
	private Date e_start_date;
	private Date e_end_date;
	private String e_fileName;
	private String e_del;
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
