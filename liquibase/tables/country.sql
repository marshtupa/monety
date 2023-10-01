-- liquibase formatted sql

--changeset marshtupa:create_country
create table country
(
    id           smallint     not null primary key,
    ico_code     varchar(4)   not null,
    display_name varchar(100) not null
);
