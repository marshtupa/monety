-- liquibase formatted sql

--changeset marshtupa:create_transaction
create table transaction
(
    user_id     bigint    not null references app_user (id),
    currency_id smallint  not null references currency (id),
    amount      money,
    note        varchar(200),
    created_at  timestamp not null
);