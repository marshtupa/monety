-- liquibase formatted sql

--changeset marshtupa:create_currency
create table currency
(
    id           int          not null primary key,
    ico_code     varchar(4)   not null,
    display_name varchar(100) not null,
    symbol       varchar(4)   not null,
    country_id   smallint     not null references country (id)
);