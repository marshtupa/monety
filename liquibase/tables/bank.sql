-- liquibase formatted sql

--changeset marshtupa:create_bank
create table bank
(
    id           int          not null primary key,
    swift_code   varchar(50)  not null,
    display_name varchar(100) not null,
    country_id   smallint     not null references country (id)
);
