package com.ch.daitso.model;

import java.sql.Date;

import lombok.Data;

@Data
public class Report {
//	신고번호
	private int report_num;
//	신고자
	private String reporter_id;
//	신고대상자
	private String criminal_id;
//	신고 게시글 번호
	private Integer p_num;
//	신고 사유
	private String reasonChk;
//	신고 사유 직접입력
	private String reasonText;
// 신고 진행 상태
	private String progress;
//	신고 날짜
	private Date report_date;
	private int score;
	// paging용
	private int startRow;
	private int endRow;
	// 검색용
	private String search;
	private String keyword;
}
