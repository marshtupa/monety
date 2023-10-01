-- liquibase formatted sql

--changeset marshtupa:create_account_transaction

create type account_transaction_type as enum ('income', 'expense');

create table account_transaction
(
    account_id     bigint                   not null references account (id),
    category_id    bigint references category (id),
    subcategory_id bigint references sub_category (id),
    place_id       bigint references place (id),
    type_id        account_transaction_type not null
) inherits (transaction);

