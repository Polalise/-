package com.ch.daitso.model;

import java.sql.Date;

import lombok.Data;
@Data
public class Reply {
private int	rno;
private String	replytext;
private Date regdate;
private String	del;
private int	p_num;
private String id;
private int rating;
}
