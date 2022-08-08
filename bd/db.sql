show tables;
create extension if not exists "uuid-ossp";
drop table if exists corajosers;

create table if not exists corajosers (
    email       varchar(254) not null primary key, -- RFC 2821,
    name        varchar(120)  not null,
    created_at  timestamp    not null default now(),
    modified_at timestamp    null
    );

select * from corajosers;

drop table if exists livros;

create table if not exists livros (
    isbn        varchar(14)     not null primary key,
    title       varchar(255)    not null,
    pages       smallint        null,
    language    varchar(20)     null,
    publisher   varchar(60)     not null,
    writers     varchar(120)[]  not null,
    amazon_link varchar(512)    null,
    cover_link  varchar(512)    null,
    created_at  timestamp       not null default now(),
    modified_at timestamp       null
    );

select * from livros;

drop table if exists locacao;

create table if not exists locacao (
    id            uuid          not null primary key default uuid_generate_v4(),
    corajoser_id  varchar(254)  not null,
    book_id       varchar(14)   not null,
    created_at    timestamp     not null default now(),

    foreign key (corajoser_id) references corajosers(email),
    foreign key (book_id) references livros(isbn)
    );

select * from locacao;
drop table if exists locacao;

insert into corajosers (name, email)
values ('Adjamilton Junior', 'jr@cora.com.br'),
       ('Talita Valéria', 't.valeria@cora.com.br');

update corajosers set email = 'junior@cora.com.br' where email = 'jr@cora.com.br';

delete from corajosers where email = 'junior@cora.com.br';
delete from corajosers;

insert into livros
values ('978-8576089728', 'Data science para negócios: O que você precisa saber sobre mineração de dados e pensamento analítico de dados', null, 'Português', 'Alta Books', array['Foster Provost', 'Tom Fawcett'], 'https://www.amazon.com.br/Data-Science-para-neg%C3%B3cios-Fawcett/dp/8576089726', 'https://m.media-amazon.com/images/P/B07HQTW1X6.01._SCLZZZZZZZ_SX500_.jpg', default, null);

insert into locacao (corajoser_id, book_id)
values ('t.valeria@cora.com.br', '978-8576089728');