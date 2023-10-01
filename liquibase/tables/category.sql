-- liquibase formatted sql

--changeset marshtupa:create_category_and_sub_categories
create type category_type as enum ('income', 'expense');

create table category
(
    id           bigserial     not null primary key,
    user_id      bigint        not null references app_user (id),
    currency_id  smallint      not null references currency (id),
    limit_amount money,
    name         varchar(100)  not null,
    description  varchar(250),
    ountcome     category_type not null
);

create table sub_category
(
    id           bigserial     not null primary key,
    category_id  bigint        not null references category (id),
    user_id      bigint        not null references app_user (id),
    currency_id  smallint      not null references currency (id),
    limit_amount money,
    name         varchar(100)  not null,
    description  varchar(250),
    ountcome     category_type not null
);
