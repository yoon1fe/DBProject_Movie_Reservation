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
    grade varchar2(10), --�������
    score int, --����
    director varchar2(20), --����
    actor varchar2(20),
    run_time int, 
    moviegoers int, --����������
    genre varchar2(20),
    primary key (mid)
);

create table theater(
    tid int, --theater id
    tname varchar2(20), --�����̸�
    phone_number varchar(20),
    location varchar2(20),
    primary key (tid),
    unique (tname)
);

create table screening( --������
    sngid int, --�� id
    mid int, --movie id
    sid int, --�󿵰� id
    time Date, --�� �Ͻ�/�ð�
    sold_seat int, --�Ǹ� �¼� ��
    primary key (sngid),
    unique (sid, time),
    foreign key (mid) references movie (mid)
);
alter table screening add constraint sid_ref foreign key (sid) references screen (sid);


create table screen( --�󿵰�
    sid int, --�󿵰� id
    sno int, --�󿵰� ��ȣ
    tid int, --theater id
    type varchar2(20), --�󿵰� ���� (2d, 3d, imax..)
    total_seat int,
    primary key (sid),
    foreign key (tid) references theater (tid),
    unique (sno, tid)
);

create table seat(
    seat_no int, --�¼�id
    sngid int, --��id
    type varchar2(20), --�¼� ����
    avail char, --�¼� ���ɿ���
    primary key (seat_no, sngid),
    foreign key (sngid) references screening (sngid)
);

create table book(
    bid int, --���Ź�ȣ
    cid varchar2(20), --customer id
    seat_no int,
    sngid int, --�� id
    primary key (bid),
    unique (seat_no, sngid),
    foreign key (cid) references customer (cid),
    foreign key (seat_no, sngid) references seat (seat_no, sngid)
);



--poster image �ֱ�
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
    DBMS_OUTPUT.PUT_LINE('�̹��� ������ ���������� �����Ͽ����ϴ�.');
EXCEPTION WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('�̹��� ������ �����ϴµ� �����Ͽ����ϴ�.');
END;
/

BEGIN
BLOB_TEST;
END;
/

--������ �̹��� ���� Ȯ��
SELECT LENGTHB(poster)
FROM movie
WHERE mid = 3;


--��ȭ
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (1, '�ܿ�ձ�', 7, 1, 'ũ������', '�ȳ�, ����', 130, 1000000, '�ִϸ��̼�');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (2, '���Ӵ�', 15, 3, '������', '������', 150, 2000000, '�׼�');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (3, '�����', 12, 2, '��Һ���', '�δ���', 180, 2000000, 'SF');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (4, '�����', 15, 4, '����ȣ', '�۰�ȣ', 150, 1500000, '�̽��͸�');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (5, '��λ�', 12, 5, '������', '������', 160, 2000000, '�׼�');
insert into movie(mid, title, grade, score, director, actor, run_time, moviegoers, genre) 
    values (6, '�õ�', 12, 6, '������', '������, ������', 130, 500000, '���');

--��ȭ��
insert into theater values (10, 'cgv ����', '053-666-7777', '�뱸');
insert into theater values (20, 'cgv ������ ', '053-555-5555', '�뱸');
insert into theater values (20, 'cgv ���� ', '053-1111-1111', '�뱸');
insert into theater values (30, '�Ե��ó׸� ����', '054-333-3333', '����');
insert into theater values (40, 'cgv ����', '123-123-123', '��õ');
insert into theater values (50, '�ް��ڽ� �ؿ��', '02-666-7777', '�λ�');
insert into theater values (60, 'cgv ����õ', '12-12-12', '���');
insert into theater values (70, 'cgv �����͹̳�', '032-666-7777', '����');
insert into theater values (80, 'cgv �����͹̳�', '111-111111', '����');
insert into theater values (90, 'cgv ����', '0222-666-77', '����');

--�󿵰�
insert into screen values (1, 1, 10, '2d', 20); --(�󿵰�id, �󿵰� no., ��ȭ��, �󿵰�Ÿ��, ���¼���)
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

--������
insert into screening values (1, 1, 1, to_date('2019-12-19 10:00', 'YYYY-MM-DD HH24:MI'), 0); --(��id, ��ȭid, �󿵰�id, ������/�ð�, �Ǹ��¼���)
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

--�������� query ��
select m.title ��ȭ����, s.sno �󿵰�, mm.time ��ȭ�ð�, t.tname ��ȭ��, mm.seat_no �¼���ȣ, t.location ��ġ, mm.bid
from (select scr.mid, scr.sid, scr.time, m.seat_no, m.bid
        from (select b.seat_no, b.sngid, b.bid
                from book b where b.cid = 'dbsdnjscjf') m, screening scr 
        where m.sngid = scr.sngid) mm, movie m, screen s, theater t 
where m.mid = mm.mid and mm.sid = s.sid and t.tid = s.tid;

-- book ���̺� �������� �ִ� ���ν���
create or replace procedure insert_book(p_bid in number, p_cid in varchar2, p_seat_no in number, p_sngid in number)
IS
BEGIN
    insert into seat values(p_seat_no, p_sngid, '�Ϲ�', 'N');
    insert into book values(p_bid, p_cid, p_seat_no, p_sngid);
END;
/

-- �¼����� ���� ���ν���
create or replace procedure update_seatNum(p_sngid in number)
IS
BEGIN
    update screening set sold_seat=(select count(*) from seat where seat.sngid=p_sngid)where sngid=p_sngid;
END;
/


select m.title ��ȭ����, s.sno �󿵰�, mm.time ��ȭ�ð�, t.tname ��ȭ��, mm.seat_no �¼���ȣ, t.location from (select scr.mid, scr.sid, scr.time, m.seat_no from (select b.seat_no, b.sngid from book b where b.cid = 'yoon1fe') m, screening scr where m.sngid = scr.sngid) mm, movie m, screen s, theater t where m.mid = mm.mid and mm.sid = s.sid and t.tid = s.tid;
