-- tablesViews.sql

-- create sequences
drop sequence if exists user_id_seq cascade;
create sequence user_id_seq;
drop sequence if exists suggestion_id_seq cascade;
create sequence suggestion_id_seq;

-- create tables
drop table if exists users cascade;
create table users(
	id integer not null primary key default nextval('user_id_seq'),
	name text,
	username text unique,
	password text,
	division text,
	department text,
	enc_pass text,
	salt text
);
drop table if exists suggestions cascade;
create table suggestions(
	id integer not null primary key default nextval('suggestion_id_seq'),
	suggestion text,
	created_at timestamp,
	updated_at timestamp
);
drop table if exists user_suggestions cascade;
create table user_suggestions(
	user_id integer references users(id),
	suggestion_id integer references suggestions(id)
);
-- create view
drop view if exists user_suggestion_view cascade;
create view user_suggestion_view as
	select users.id as userid,users.name,users.department,users.division,suggestions.id as 
	suggestionid,suggestions.suggestion,suggestions.created_at,suggestions.updated_at from 
	users join user_suggestions on users.id=user_suggestions.user_id join suggestions on 
	user_suggestions.suggestion_id=suggestions.id; 
