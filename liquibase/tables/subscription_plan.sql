-- liquibase formatted sql

--changeset marshtupa:create_subscriptions_with_features
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
    feature_id      smallint not null references feature (id),
    subscription_id smallint not null references subscription_plan (id)
);
