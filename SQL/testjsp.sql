use testjsp;

create table user(
	userID varchar(20) primary key,
    userPassword varchar(20),
    userName varchar(20),
    userGender varchar(20),
    userEmail varchar(50)
);

select * from user;

insert into user values('user01','1234','홍길동','남자','user01@naver.com');

CREATE TABLE BBS(
	bbsNum INT primary key, -- 게시글 번호
    bbsTitle VARCHAR(50), -- 제목
    userID varchar(20), -- ID
    bbsDate DATETIME, -- 등록일자
    bbsContent VARCHAR(2048), -- 내용
    bbsAvailable INT -- 글 삭제 목적
);

select * from BBS;
