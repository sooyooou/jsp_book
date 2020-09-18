show databases;
show tables;

drop table member;

create table member(
	id varchar(50) not null primary key,
	passwd varchar(16) not null,
	name varchar(10) not null,
	address varchar(100) not null,
	tel varchar(20) not null,
	reg_date datetime not null
);

create table writer(
	num int not null primary key auto_increment,
	name varchar(20) not null,
	title varchar(50) not null,
	passwd varchar(16) not null,
	reg_date datetime not null,
	readcount int default 0,
	ref int not null,
	re_step smallint not null,
	re_level smallint not null,
	contents text not null,
	ip varchar(20) not null
);

select * from writer;

desc member;

create table test(
	num_id int not null primary key auto_increment,
	title varchar(50) not null,
	content text not null
);

desc test;

drop table member;
drop table test;

select * from member;
select id, passwd from member;
select id, passwd from member where id = '33';
select * from member where id = '11';
update member set passwd = '1111' where id = '11';

delete from member where id = '11';

delete from member;



alter table member
add address varchar(100) not null;

alter table member
add tel varchar(20) not null;


create table board(
num int not null primary key auto_increment,
writer varchar(10) not null,
email varchar(30),
subject varchar(50) not null,
passwd varchar(12) not null,
reg_date datetime not null,
readcount int default 0,
ref int not null,
re_step smallint not null,
re_level smallint not null,
content text not null,
ip varchar(20) not null
);

delete from board;
drop table board;