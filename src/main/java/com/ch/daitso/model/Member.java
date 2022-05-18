package com.ch.daitso.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Member {

	private String id;
	private String password;
	private String name;
	private String nickName;
	private Date regdate;
	private String address;
	private String phone;
	private String email;
	private int grade;
	private String del;
	private String photoName;
	// paging용
    private int startRow;
    private int endRow;
	// 검색용
    private String search;
    private String keyword;
	// upload용
	private MultipartFile file;
}
