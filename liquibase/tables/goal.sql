-- liquibase formatted sql

--changeset marshtupa:create_goal
create table goal
(
    id            bigserial    not null primary key,
    user_id       bigint       not null references app_user (id),
    currency_id   int          not null references currency (id),
    display_name  varchar(100) not null unique,
    target_amount money        not null,
    target_date   timestamp    not null,
    created       timestamp    not null,
    archived      boolean      not null
);