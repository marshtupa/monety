-- liquibase formatted sql

--changeset marshtupa:create_user_setting
create table user_setting
(
    user_id             bigint      not null references app_user (id),
    default_currency_id int         not null,
    default_language    smallint    not null references language (id)
);