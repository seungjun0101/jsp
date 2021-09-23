create table customer(
	idx int auto_increment primary key,
	name varchar(20) not null,
	password varchar(10) not null,
	email varchar(30) not null,
	addr varchar(30),
	gender varchar(10) not null,
	age tinyint,
	hobby varchar(30)
);
-- varchar의 크기는 문자수 (영어,한글 모두)
select * from customer;
insert into customer(name,password,email,addr,gender,age,hobby)
	values('이하니','12345678','honey@naver.com','서울','여자',20,'축구');
-- drop table customer ;