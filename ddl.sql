drop database bbs;
create database bbs;
use bbs;
create table users (
    id int primary key auto_increment,
    name varchar(20) not null,
    password varchar(20) not null,
    email varchar(20),
    phone varchar(11)
);

create table posts (
    id int primary key auto_increment,
    username varchar(20) not null,
    title varchar(30) not null,
    content text not null,
    time timestamp
);

create table replys (
    id int primary key auto_increment,
    postid int not null,
    username varchar(20) not null,
    content text not null,
    time timestamp
)





