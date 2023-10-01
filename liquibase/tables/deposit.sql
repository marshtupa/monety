-- liquibase formatted sql

--changeset marshtupa:create_deposit
create table deposit
(
    id               bigserial     not null primary key,
    user_id          bigint        not null references app_user (id),
    currency_id      smallint      not null references currency (id),
    bank_id          int references bank (id),
    goal_id          bigint references goal (id),
    balance          money         not null,
    display_name     varchar(100)  not null,
    include_in_total boolean       not null default true,
    created_at       timestamp     not null,
    updated_at       timestamp     not null,
    deleted          timestamp,
    interest_rate    decimal(5, 2) not null check (0 <= interest_rate and interest_rate <= 100),
    duration_days    int           not null
);
