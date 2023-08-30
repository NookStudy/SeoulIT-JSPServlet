drop table mvcboard;
drop SEQUENCE seq_mvc2board_num;

create table mvcboard(
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default on null sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);
CREATE SEQUENCE seq_mvc2board_num  
increment by 1  --1씩 증가
    start with 1    --1부터 시작    
    minvalue 1      --최소값 1
    nomaxvalue      -- 최대값 제한없음
    nocycle         --사이클(순환 없음)
    nocache;        --캐쉬안함
    
comment on column mvcboard.idx is '일련번호,기본키';
comment on column mvcboard.name is '작성자 이름';
comment on column mvcboard.title is '제목';
comment on column mvcboard.content is '내용';
comment on column mvcboard.postdate is '작성일';
comment on column mvcboard.ofile is '원본 파일명';
comment on column mvcboard.sfile is '저장된 파일명';
comment on column mvcboard.downcount is '다운로드 횟수';
comment on column mvcboard.pass is '비밀번호';
comment on column mvcboard.visitcount is '조회수';

insert into mvcboard (idx,name,title,content,pass)
    values(seq_mvc2board_num.nextval,'김유신','자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx,name,title,content,pass)
    values(seq_mvc2board_num.nextval,'장보고','자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx,name,title,content,pass)
    values(seq_mvc2board_num.nextval,'이순신','자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx,name,title,content,pass)
    values(seq_mvc2board_num.nextval,'강감찬','자료실 제목4 입니다.','내용','1234');   
insert into mvcboard (idx,name,title,content,pass)
    values(seq_mvc2board_num.nextval,'대조영','자료실 제목5 입니다.','내용','1234');
    
desc mvcboard;

commit;
--select * from mvcboard;

Select * from( select tb.*, rownum rnum from (select * from mvcboard order by idx desc) tb ) where rnum between 1 and 5;
select count(*) from mvcboard ;
Select * from( select tb.*, rownum from (select * from mvcboard where name like '%감찬%' order by idx desc) tb ) where rownum between 1  and 2;