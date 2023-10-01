-- liquibase formatted sql

--changeset marshtupa:create_place
create table place
(
    id          bigserial    not null primary key,
    user_id     bigint       not null references app_user (id),
    name        varchar(100) not null,
    description varchar(250)
);
