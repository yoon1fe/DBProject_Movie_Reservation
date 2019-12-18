--3RD version

create table customer(
    cid varchar2(20), --customer id
    pw varchar2(20),
    cname varchar2(20), --customer name
    birthdate date,
    phone_number varchar2(20),
    city varchar2(20), --my city
    sex char(3),
    primary key (cid)
);

create table movie(
    mid int, --movie id
    title varchar2(20), --movie title
    poster BLOB,
    grade varchar2(10), --관람등급
    score int, --평점
    director varchar2(20), --감독
    actor varchar2(20),
    run_time int, 
    moviegoers int, --누적관객수
    genre varchar2(20),
    primary key (mid)
);

create table theater(
    tid int, --theater id
    tname varchar2(20), --극장이름
    phone_number varchar(20),
    location varchar2(20),
    primary key (tid),
    unique (tname)
);

create table screening( --상영정보
    sngid int, --상영 id
    mid int, --movie id
    sid int, --상영관 id
    time Date, --상영 일시/시간
    sold_seat int, --판매 좌석 수
    primary key (sngid),
    unique (sid, time),
    foreign key (mid) references movie (mid)
);
alter table screening add constraint sid_ref foreign key (sid) references screen (sid);


create table screen( --상영관
    sid int, --상영관 id
    sno int, --상영관 번호
    tid int, --theater id
    type varchar2(20), --상영관 종류 (2d, 3d, imax..)
    total_seat int,
    primary key (sid),
    foreign key (tid) references theater (tid),
    unique (sno, tid)
);

create table seat(
    seat_no int, --좌석id
    sngid int, --상영id
    type varchar2(20), --좌석 종류
    avail char, --좌석 가능여부
    primary key (seat_no, sngid),
    foreign key (sngid) references screening (sngid)
);

create table book(
    bid int, --예매번호
    cid varchar2(20), --customer id
    seat_no int,
    sngid int, --상영 id
    primary key (bid),
    unique (seat_no, sngid),
    foreign key (cid) references customer (cid),
    foreign key (seat_no, sngid) references seat (seat_no, sngid)
);



--poster image 넣기
update movie set poster = empty_blob();

create or replace directory poster_test as 'C:\Users\1Fe\Documents\eclipse-workspace\DBProject_Movie_Reservation\WebContent\poster';

CREATE OR REPLACE PROCEDURE BLOB_TEST
AS
    BLOB_LOCATOR BLOB;
    FILE_LOCATOR BFILE := BFILENAME('POSTER_TEST', 'POSTER_AVENGERS.jpg');
    DB_SYSTEM_OFFSET NUMBER := 1;
    FILE_OFFSET NUMBER := 1;
BEGIN
    DBMS_OUTPUT.ENABLE(100000);
    UPDATE movie
        SET poster = EMPTY_BLOB()
        WHERE mid  = 3
        RETURNING poster INTO BLOB_LOCATOR;
    DBMS_LOB.OPEN(FILE_LOCATOR, DBMS_LOB.LOB_READONLY);
    dbms_lob.loadblobfromfile(BLOB_LOCATOR, FILE_LOCATOR, DBMS_LOB.GETLENGTH(FILE_LOCATOR), DB_SYSTEM_OFFSET, FILE_OFFSET);
    DBMS_LOB.CLOSE(FILE_LOCATOR);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('이미지 파일을 성공적으로 저장하였습니다.');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('이미지 파일을 저장하는데 실패하였습니다.');
END;
/

BEGIN
BLOB_TEST;
END;
/

--포스터 이미지 들어갔나 확인
SELECT LENGTHB(poster)
FROM movie
WHERE mid = 3;


--영화
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (1, '겨울왕국', 7, 1, '크리스벅', '안나, 엘사', 130, 1000000, '애니메이션');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (2, '블랙머니', 15, 3, '정지영', '조진웅', 150, 2000000, '액션');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (3, '어벤져스', 12, 2, '루소브라더', '로다주', 180, 2000000, 'SF');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (4, '기생충', 15, 4, '봉준호', '송강호', 150, 1500000, '미스터리');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (5, '백두산', 12, 5, '이해준', '하정우', 160, 2000000, '액션');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (6, '시동', 12, 6, '최정열', '마동석, 박정민', 130, 500000, '드라마');

--영화관
insert into theater values (10, 'cgv 월성', '053-666-7777', '대구');
insert into theater values (20, 'cgv 동성로 ', '053-555-5555', '대구');
insert into theater values (20, 'cgv 한일 ', '053-1111-1111', '대구');
insert into theater values (30, '롯데시네마 강남', '054-333-3333', '서울');
insert into theater values (40, 'cgv 부평', '123-123-123', '인천');
insert into theater values (50, '메가박스 해운대', '02-666-7777', '부산');
insert into theater values (60, 'cgv 울산신천', '12-12-12', '울산');
insert into theater values (70, 'cgv 광주터미널', '032-666-7777', '광주');
insert into theater values (80, 'cgv 대전터미널', '111-111111', '대전');
insert into theater values (90, 'cgv 제주', '0222-666-77', '제주');

--상영관
insert into screen values (1, 1, 10, '2d', 20); --(상영관id, 상영관 no., 영화관, 상영관타입, 총좌석수)
insert into screen values (2, 2, 10, '2d', 20);
insert into screen values (3, 3, 10, '2d', 20);
insert into screen values (4, 4, 10, '4dx', 20);
insert into screen values (5, 5, 10, 'imax', 20);
insert into screen values (6, 1, 20, '2d', 20);
insert into screen values (7, 2, 20, '3d', 20);
insert into screen values (8, 1, 30, '2d', 20);
insert into screen values (9, 2, 30, '3d', 20);
insert into screen values (10, 1, 40, '2d', 20);
insert into screen values (11, 2, 40, '3d', 20);
insert into screen values (12, 1, 50, '2d', 20);
insert into screen values (13, 2, 50, '3d', 20);
insert into screen values (14, 1, 60, '2d', 20);
insert into screen values (15, 2, 60, '3d', 20);
insert into screen values (16, 1, 70, '2d', 20);
insert into screen values (17, 1, 80, '2d', 20);
insert into screen values (18, 1, 90, '2d', 20);
insert into screen values (19, 2, 90, '2d', 20);

--상영정보
insert into screening values (1, 1, 1, to_date('2019-12-19 10:00', 'YYYY-MM-DD HH24:MI'), 0); --(상영id, 영화id, 상영관id, 상영일자/시간, 판매좌석수)
insert into screening values (2, 1, 1, to_date('2019-12-19 14:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (3, 1, 1, to_date('2019-12-19 17:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (4, 1, 1, to_date('2019-12-20 10:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (5, 1, 1, to_date('2019-12-20 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (6, 2, 2, to_date('2019-12-19 14:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (7, 3, 3, to_date('2019-12-19 14:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (8, 4, 4, to_date('2019-12-19 14:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (9, 5, 5, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (10, 6, 6, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (11, 1, 8, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (12, 2, 10, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (13, 3, 12, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (14, 4, 14, to_date('2019-12-19 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (15, 5, 16, to_date('2019-12-20 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (16, 5, 17, to_date('2019-12-20 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (17, 5, 18, to_date('2019-12-21 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (18, 5, 19, to_date('2019-12-21 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (19, 5, 19, to_date('2019-12-22 15:00', 'YYYY-MM-DD HH24:MI'), 0);
insert into screening values (20, 5, 19, to_date('2019-12-23 15:00', 'YYYY-MM-DD HH24:MI'), 0);



select m.title
from (select m.title 
        from movie m, screening scr
        where m.mid = scr.mid) m
;

--예약정보 query 문
select m.title 영화제목, s.sno 상영관, mm.time 영화시간, t.tname 영화관, mm.seat_no 좌석번호, t.location 위치, mm.bid
from (select scr.mid, scr.sid, scr.time, m.seat_no, m.bid
        from (select b.seat_no, b.sngid, b.bid
                from book b where b.cid = 'dbsdnjscjf') m, screening scr 
        where m.sngid = scr.sngid) mm, movie m, screen s, theater t 
where m.mid = mm.mid and mm.sid = s.sid and t.tid = s.tid;

-- book 테이블에 예약정보 넣는 프로시져
create or replace procedure insert_book(p_bid in number, p_cid in varchar2, p_seat_no in number, p_sngid in number)
IS
BEGIN
    insert into seat values(p_seat_no, p_sngid, '일반', 'N');
    insert into book values(p_bid, p_cid, p_seat_no, p_sngid);
END;
/

-- 좌석개수 갱신 프로시져
create or replace procedure update_seatNum(p_sngid in number)
IS
BEGIN
    update screening set sold_seat=(select count(*) from seat where seat.sngid=p_sngid)where sngid=p_sngid;
END;
/


select m.title 영화제목, s.sno 상영관, mm.time 영화시간, t.tname 영화관, mm.seat_no 좌석번호, t.location from (select scr.mid, scr.sid, scr.time, m.seat_no from (select b.seat_no, b.sngid from book b where b.cid = 'yoon1fe') m, screening scr where m.sngid = scr.sngid) mm, movie m, screen s, theater t where m.mid = mm.mid and mm.sid = s.sid and t.tid = s.tid;
