-- liquibase formatted sql

--changeset marshtupa:create_deposit_transaction

create type deposit_transaction_type as enum ('replenishment', 'withdrawal');

create table deposit_transaction
(
    deposit_id bigint not null references deposit (id),
    type_id    deposit_transaction_type

) inherits (transaction);
