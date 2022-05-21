drop table notice_board CASCADE CONSTRAINTS;
drop table member CASCADE CONSTRAINTS ;
drop table event_board CASCADE CONSTRAINTS;
drop table replyBoard CASCADE CONSTRAINTS;
drop table reply CASCADE CONSTRAINTS;
drop table product CASCADE CONSTRAINTS;
drop table chat CASCADE CONSTRAINTS;
drop table report CASCADE CONSTRAINTS;
drop table likes CASCADE CONSTRAINTS;

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
delete from member where id='admin';
insert into member values('admin','1','관리자','매니저',sysdate,'서울','010-2884-1234','dsa@nav.com',0,'n','asd');
select * from member;
select * from product;
select * from notice_board;

CREATE TABLE product(
	p_num NUMBER primary key,
	p_writer varchar2(100) NOT NULL, -- 작성자
	p_name varchar2(100), --제목
	price NUMBER NOT NULL, -- 판매가격
	p_date DATE, -- 등록 날짜
	p_content varchar2(4000) NOT NULL, -- 본문
	p_local VARCHAR2(20) , -- 지역
	p_value varchar2(10) , --판매 구매 나누기	
	readcount number default 0, -- 읽은 횟수
	p_del char(1) default 'n', -- 삭제 여부 
	updateday DATE,-- 게시글수정일
	sel	char(1) default 'n', --거례여부
	likescount NUMBER, -- 좋아요갯수
	p_tag	varchar2(100), --해쉬 테그
	buyer varchar2(100), -- 구매자	
	ip varchar2(20), -- 작성자 ip
	thumnails varchar2(100) NOT NULL, -- 계시글 사진
	thumnails2 varchar2(100),
	thumnails3 varchar2(100),
	thumnails4 varchar2(100),
	thumnails5 varchar2(100),
	id VARCHAR2(500) REFERENCES member ON DELETE CASCADE
);
insert into PRODUCT values(1,'asd','sa5d',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'s',0,'dsa','dsa','ads','das','das2','das3','das4','das5','admin');
insert into PRODUCT values(2,'a2sd','sa2d',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'y',0,'dsa','dsa','ads','das','das2','das3','das4','das5','a1');
insert into PRODUCT values(3,'a3d','sa52d',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'s',0,'dsa','dsa','ads','das','das2','das3','das4','das5','a2');
insert into PRODUCT values(4,'as5d','s3ad',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'y',0,'dsa','dsa','ads','das','das2','das3','das4','das5','a2');
insert into PRODUCT values(5,'as4d','sa2d',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'s',0,'dsa','dsa','ads','das','das2','das3','das4','das5','a1');
insert into PRODUCT values(6,'a6sd','sa1d',12,sysdate,'dasa','dsa','sdad',0,'n',sysdate,'y',0,'dsa','dsa','ads','das','das2','das3','das4','das5','a1');
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
	fileName varchar(1000), --- 파일이름
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
	e_fileName varchar(1000), --- 파일이름
	e_del char(1) default'n',
	id varchar2(20) references member(id)
);
create table reply (
	rno number primary key,
	replytext varchar2(500) not null,
	regdate date not null,
	del char(1) default 'n' ,
	rating number ,
	p_num number not null references product(p_num),
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