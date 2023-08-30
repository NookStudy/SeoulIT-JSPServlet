--테이블 목록 조회
select TNAME ,
TABTYPE ,
CLUSTERID  from tab;
select  * from tab;

drop table member;
drop table board;
drop sequence seq_board_num;

-- 회원 테이블 생성
create table member(
    id varchar2(10) not null,
    pass varchar(10) not null,
    name varchar2(30) not null,
    regidate date default on null sysdate not null,
    primary key(id)
);

--모델 1방식의 테이블 게시판 만들기
create table board(
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default on null sysdate not null,
    visitcount number(6) 
);

--외래키 설정
alter table board
    add constraint board_mem_fk foreign key(id) --board_mem_fk라는 이름으로 계약조건 걸고
    --외래키는 id로 쓸꺼고 
    references member(id); -- 그건 멤버테이블의 id랑 연결되어 있다.

--sequence 설정
create SEQUENCE seq_board_num
    increment by 1  --1씩 증가
    start with 1    --1부터 시작    
    minvalue 1      --최소값 1
    nomaxvalue      -- 최대값 제한없음
    nocycle         --사이클(순환 없음)
    nocache;        --캐쉬안함
    

-- 더미데이터 입력
--부모키 필요하므로 멤버부터 박아넣고
insert into member(id,pass, name) values ('musthave','1234','머스트해브');
--이후 보드에 더미데이터 입력
insert into board (num, title, content, id, postdate, visitcount)
    values(seq_board_num.nextval, '제목1입니다','내용1입니다','musthave','',0);

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);    

commit;
--하기 전까지는 오라클 내부에서는 레코드 조회가 가능하지만,
--외부에서는 조회가 불가능하다.
    