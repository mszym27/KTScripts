-- select 1 as one;

-- select case
-- 	when 1 = 1 then 1 
-- 	when 1 = 0 then 1/0 
-- end as one;

create schema test;

create table test.test (testColumn integer);

select * from test.test;

-- create table ##temptest (testColumn integer);

-- select ExampleColumnWithUpperCaseLettersInTheName from UpperCaseTest;

 select ExampleColumnWithUpperCaseLettersInTheName from dbo.uppercasetest;
 
 select ExampleColumnWithUpperCaseLettersInTheName from dbo.UpperCaseTest;
-
 
 CREATE TABLE films (
    code        char(5) CONSTRAINT firstkey PRIMARY KEY,
    title       varchar(40) NOT NULL,
    did         integer NOT NULL,
    date_prod   date,
    kind        varchar(10),
    len         interval hour to minute
);
 