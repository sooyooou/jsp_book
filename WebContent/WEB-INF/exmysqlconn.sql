show databases;
show tables;

create table member(
  id varchar(50) not null primary key,
  passwd varchar(16) not null,
  name varchar(10) not null,
  reg_date datetime not null
);

desc member;

create table test(
  num_id int not null primary key auto_increment,
  title varchar(50) not null,
  content text not null
);

desc test;

show tables;

drop table test;
drop table member;

insert into member(id, passwd, name, reg_date) 
values('kingdora@dragon.com','1234','김개동', now());

insert into member(id, passwd, name, reg_date) 
values('hongkd@aaa.com','1111','홍길동', now());

select * from member;

select id, passwd from member;

select id, passwd from member where id='hongkd@aaa.com';

select * from member where id='hongkd@aaa.com';
update member set passwd='1111' where id='hongkd@aaa.com';

update member set passwd='3579' where id='hongkd@aaa.com';

delete from member where id='hongkd@aaa.com';

delete from member; 

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

drop table board;

desc board;
select * from board;
delete from board where num=3;


alter table member
add address varchar(100) not null;

alter table member
add tel varchar(20) not null;

desc member;

update member 
set address='서울시 마포구 양화로6길 9', tel='010-1111-1111'
where id='aaaa@king.com';

update member 
set address='인천시 남동구 정각로 29', tel='010-2222-1234'
where id='hongkd@aaa.com';

update member 
set address='경기도 구리시 아차산로 439', tel='010-3333-3333'
where id='kingdora@dragon.com';

select * from member;

create table manager(
 managerId varchar(50) not null primary key,
 managerPasswd varchar(16) not null
);

insert into manager(managerId, managerPasswd)
values('bookmaster@shop.com','123456');

select * from manager;

create table book(
  book_id int not null primary key auto_increment,
  book_kind varchar(3) not null,
  book_title varchar(100) not null,
  book_price int not null,
  book_count smallint not null,
  author varchar(40) not null,
  publishing_com varchar(30) not null,
  publishing_date varchar(15) not null,
  book_image varchar(16) default 'nothing.jpg',
  book_content text not null,
  discount_rate tinyint default 10,
  reg_date datetime not null
);

drop table book;

desc book;

select * from book;

create table bank(
  account varchar(30) not null,
  bank varchar(10) not null,
  name varchar(10) not null
);
drop table bank;
insert into bank(account, bank, name)
values('11111-111-11111','내일은행','오내일');

select * from bank;

create table cart(
  cart_id int not null primary key auto_increment,
  buyer varchar(50) not null,
  book_id int not null,
  book_title varchar(100) not null,
  buy_price int not null,
  buy_count tinyint not null,
  book_image varchar(16) default 'nothing.jpg'
);

desc cart;

drop table cart;

select * from cart;

create table buy(
  buy_id bigint not null ,
  buyer varchar(50) not null,
  book_id varchar(12) not null,
  book_title varchar(100) not null,
  buy_price int not null,
  buy_count tinyint not null,
  book_image varchar(16) default 'nothing.jpg',
  buy_date datetime not null,
  account varchar(50) not null,
  deliveryName varchar(10) not null,
  deliveryTel varchar(20) not null,
  deliveryAddress varchar(100) not null,
  sanction varchar(10) default '상품준비중'
);

drop table buy;

delete from buy;

desc buy;
select * from buy;
select * from book;

update book 
set book_image='1000001.png' where book_id='1';

update book 
set book_price='35000'where book_id='31';