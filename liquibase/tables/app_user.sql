--changeset marshtupa:create_app_user
create table country
(
    id           smallint     not null primary key,
    ico_code     varchar(4)   not null,
    display_name varchar(100) not null
);

create table bank
(
    id           int                              not null primary key,
    swift_code   varchar(50)                      not null,
    display_name varchar(100)                     not null,
    country_id   smallint references country (id) not null
);

create table currency
(
    id           int                              not null primary key,
    ico_code     varchar(4)                       not null,
    display_name varchar(100)                     not null,
    symbol       varchar(4)                       not null,
    country_id   smallint references country (id) not null
);

create table app_language
(
    id           smallint    not null primary key,
    ico_code     varchar(4)  not null,
    display_name varchar(50) not null
);

create table user_setting
(
    user_id             bigint references app_user (id) not null,
    default_currency_id int                             not null,
    default_language    varchar(50)                     not null
);



create table subscription_plan
(
    id          smallint      not null primary key,
    description varchar(1000) not null,
    price       money         not null
);

create table feature
(
    id           smallint      not null primary key,
    display_name varchar(100)  not null,
    description  varchar(1000) not null
);

create table subscription_feature
(
    feature_id      smallint references feature (id)           not null,
    subscription_id smallint references subscription_plan (id) not null
);

create table app_user
(
    id              bigserial                             not null primary key,
    subscription_id int references subscription_plan (id) not null,
    display_name    varchar(100)                          not null unique,
    email           varchar(100),
    phone           varchar(15),
    created         timestamp                             not null,
    blocked         boolean                               not null,
    deleted         timestamp                             not null
);

create table goal
(
    id            bigserial                       not null primary key,
    user_id       bigint references app_user (id) not null,
    currency_id   int references currency (id)    not null,
    display_name  varchar(100)                    not null unique,
    target_amount money                           not null check (target_amount > 0),
    target_date   timestamp                       not null,
    created       timestamp                       not null,
    archived      boolean                         not null
);

create table account
(
    id               bigserial                         not null primary key,
    user_id          bigint references app_user (id)   not null,
    currency_id      smallint references currency (id) not null,
    bank_id          int references bank (id),
    goal_id          bigint references goal (id),
    balance          money                             not null,
    display_name     varchar(100)                      not null,
    include_in_total boolean                           not null default true,
    created_at       timestamp                         not null,
    updated_at       timestamp                         not null,
    deleted          timestamp
);

create table deposit
(
    interest_rate decimal(5, 2) not null check ( 0 <= interest_rate and interest_rate <= 100),
    duration_days int           not null
) inherits (account);


create table credit
(
    lending_interest_rate decimal(5, 2) not null check ( 0 <= lending_interest_rate and lending_interest_rate <= 100),
    duration_days         int           not null
) inherits (account);

create table category
(
    id           bigserial                         not null primary key,
    user_id      bigint references app_user (id)   not null,
    currency_id  smallint references currency (id) not null,
    limit_amount money,
    name         varchar(100)                      not null,
    description  varchar(250),
    ountcome     boolean                           not null
);

create table sub_category
(
    category_id bigint references category (id) not null
) inherits (category);

create table place
(
    id          bigserial                       not null primary key,
    user_id     bigint references app_user (id) not null,
    name        varchar(100)                    not null,
    description varchar(250)
);

create table transaction
(
    user_id     bigint references app_user (id)   not null,
    currency_id smallint references currency (id) not null,
    amount      money,
    note        varchar(200),
    created_at  timestamp                         not null
);

create type account_transaction_type as enum ('income', 'expense');

create table account_transaction
(
    account_id     bigint references account (id) not null,
    category_id    int references category (id),
    subcategory_id int references sub_category (id),
    place_id       int references place (id),
    type_id        account_transaction_type       not null

) inherits (transaction);

create type deposit_transaction_type as enum ('replenishment', 'withdrawal');

create table deposit_transaction
(
    deposit_id bigint references deposit (id) not null,
    type_id    deposit_transaction_type

) inherits (transaction);


create type credit_transaction_type as enum ('replenishment', 'withdrawal');

create table credit_transaction
(
    credit_id bigint references credit (id) not null,
    type_id   credit_transaction_type

) inherits (transaction);

