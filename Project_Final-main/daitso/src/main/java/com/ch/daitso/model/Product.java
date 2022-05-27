package com.ch.daitso.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int p_num; // 게시판 번호
	private String p_writer; //작성자
	private String p_name; // 게시판 이름
	private int price; //판매가격
	private Date p_date; //등록 날짜
	private String p_content; // 본문
	private String p_local; // 지역
	private String p_value; // 판매 구매 나누기	
	private int readcount; // 조회수
	private String p_del;// 삭제 여부 
	private String sel;//거례여부
	private int likescount;// 좋아요갯수
	private String p_tag;	//해쉬 테그
	private String buyer; //구매자
//	private int ref;// 답변글 끼리 모음
//	private int re_step; //ref내의 순서
//	private int re_level; // 들여쓰기
	private String ip; //작성자 ip
	private String id;
	private String thumnails; //계시글 사진
	private String thumnails2; //계시글 사진
	private String thumnails3; //계시글 사진
	private String thumnails4; //계시글 사진
	private String thumnails5; //계시글 사진
	private Date updateday;
	//페이징
	private int startRow;
	private int endRow;
	//upload용
	private MultipartFile file;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	//검색용
	private String search;
	private String keyword;
	// 판매,구매 select바
	private String search2;
	private String keyword2;
}
