drop table notice_board CASCADE CONSTRAINTS;
drop table member CASCADE CONSTRAINTS ;
drop table event_board CASCADE CONSTRAINTS;
drop table replyBoard CASCADE CONSTRAINTS;
drop table reply CASCADE CONSTRAINTS;
drop table product CASCADE CONSTRAINTS;
drop table chat;
drop table report;
drop table likes;

create table member (
	id varchar2(500) primary key,
	password varchar2(500) not null,
	name varchar2(500) not null,
	nickName varchar2(500) not null,
	regdate date,
	address varchar2(500),
	phone varchar2(500) not null,
	email varchar2(500) not null,
	grade number,
	del char(1) default 'n',
	photoName varchar2(500)
);
select * from product;
CREATE TABLE product(
	p_num NUMBER primary key,
	p_writer varchar2(500) NOT NULL, -- 작성자
	p_name varchar2(500), --제목
	price NUMBER NOT NULL, -- 판매가격
	p_date DATE, -- 등록 날짜
	p_content varchar2(4000) NOT NULL, -- 본문
	p_local VARCHAR2(500) , -- 지역
	p_value varchar2(500) , --판매 구매 나누기	
	readcount number default 0, -- 읽은 횟수
	p_del char(1) default 'n', -- 삭제 여부 
	updateday DATE,-- 게시글수정일
	sel	char(1), --거례여부
	likescount NUMBER, -- 좋아요갯수
	p_tag	varchar2(500), --해쉬 테그
	buyer varchar2(500), -- 구매자	
	ip varchar2(500), -- 작성자 ip
	thumnails varchar2(500) NOT NULL, -- 계시글 사진
	thumnails2 varchar2(500),
	thumnails3 varchar2(500),
	thumnails4 varchar2(500),
	thumnails5 varchar2(500),
	id VARCHAR2(500) REFERENCES member ON DELETE CASCADE
);

create table chat(
	room_num NUMBER primary key,
	seller_nick varchar2(500),
	buyer_nick varchar2(500),
	text varchar2(1000),
	chat_time DATE
);
create table notice_board(
	num number primary key, -- key
	subject varchar2(1000) not null, -- 제목
	content varchar2(2000) not null, -- 본문
	readcount number default 0, -- 읽은 횟수
	reg_date date not null, -- 작성일
	update_date date not null,  --업데이트 날짜
	fileName varchar(1000) , --- 파일이름
	del char(1) default'n',
	id varchar2(20) references member(id)
);
-- 이벤트 게시판
create table event_board(
	e_num number primary key, -- key
	e_subject varchar2(1000) not null, -- 제목
	e_content varchar2(2000) not null, -- 본문
	e_readcount number default 0, -- 읽은 횟수
	e_start_date date not null, -- 작성일
	e_end_date date not null,  --업데이트 날짜
	e_fileName varchar(1000) , --- 파일이름
	e_del char(1) default'n',
	id varchar2(20) references member(id)
);
create table reply (
	rno number primary key,
	replytext varchar2(500) not null,
	regdate date not null,
	del char(1) default 'n' ,
	rating number ,
	num number not null references product(p_num),
	id  varchar2(100) not null references member(id)
);

create table replyBoard (
	rno number primary key,
	bno number not null references product(p_num),
	replytext varchar2(500) not null,
	replier varchar2(50) not null,
	regdate date not null,
	updatedate date not null,
	del char(1) 
);
select * from replyBoard;
create table report(
	report_num number primary key,
	reporter_id VARCHAR2(100) REFERENCES member ON DELETE CASCADE,
	criminal_id VARCHAR2(100) REFERENCES member ON DELETE CASCADE,
	p_num NUMBER REFERENCES product ON DELETE CASCADE,
	reasonChk VARCHAR2(1000) not null,
	reasonText VARCHAR2(2000),
	progress VARCHAR2(20) not null,
	report_date date
);

CREATE TABLE likes(
    id VARCHAR2(100) REFERENCES member ON DELETE CASCADE,
    p_num NUMBER REFERENCES product ON DELETE CASCADE,
    primary key (id,p_num)
);