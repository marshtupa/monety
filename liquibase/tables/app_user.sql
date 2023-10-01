-- liquibase formatted sql

--changeset marshtupa:create_app_user
create table app_user
(
    id              bigserial    not null primary key,
    subscription_id int          not null references subscription_plan (id),
    display_name    varchar(100) not null unique,
    email           varchar(100),
    phone           varchar(15),
    created         timestamp    not null,
    blocked         boolean      not null,
    deleted         timestamp    not null
);
