-- liquibase formatted sql

--changeset marshtupa:create_credit_transaction

create type credit_transaction_type as enum ('replenishment', 'withdrawal');

create table credit_transaction
(
    credit_id bigint not null references credit (id),
    type_id   credit_transaction_type

) inherits (transaction);