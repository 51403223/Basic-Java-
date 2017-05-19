create database BasicJava
go
use BasicJava
go

create table section(
id nvarchar(100) primary key,
name nvarchar(100)
)

create table lesson(
id nvarchar(100) primary key,
name nvarchar(100),
section nvarchar(100) foreign key references section(id),
content nvarchar(max)
)

create table account(
username varchar(10) primary key,
pass varchar(10)
)
go

create trigger delSection
on section
instead of delete
as
delete from lesson where lesson.section in (select id from deleted)
delete from section where section.id in (select id from deleted)

go
insert into account values ('admin', 'admin')