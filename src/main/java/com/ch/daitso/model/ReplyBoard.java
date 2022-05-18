package com.ch.daitso.model;
import java.sql.Date;
import lombok.Data;
@Data
public class ReplyBoard {
	private int rno;           // 입력할 때마다 자동으로 1씩 증가하는 pk
	private int bno;           // 원 게시판 글 번호   
	private String replytext;  // 답글
	private String replier;    // 답글 작성자
	private Date regdate;      // 작성일
	private Date updatedate;   // 수정일
	private String del;        // 삭제여부
}