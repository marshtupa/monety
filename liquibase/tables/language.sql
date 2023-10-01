-- liquibase formatted sql

--changeset marshtupa:create_language
create table language
(
    id           smallint    not null primary key,
    ico_code     varchar(4)  not null,
    display_name varchar(50) not null
);