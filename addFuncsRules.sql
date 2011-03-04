-- create pspgsql language
drop language if exists plpgsql cascade;
create language plpgsql;

-- create function for adding User and returning id
create or replace function insertUser(_name text, _department text, _division text)
	returns integer as
	$func$
	begin
		execute 'insert into users (name, department, division)' ||
			'values (' || quote_literal(_name) || ',' || quote_literal(_department) || ',' || quote_literal(_division) || ')';
		return currval('user_id_seq');
	end;
	$func$
	language 'plpgsql';

-- create function for adding Suggestion and returning id
create or replace function insertSuggestion(_suggestion text)
	returns integer as
	$func$
	begin
		execute 'insert into suggestions (suggestion, creation_date, mod_date) ' ||
			'values (' || quote_literal(_suggestion) || ',' || quote_literal(now()) || ',' || quote_literal(now()) || ')';
		return currval('suggestion_id_seq');
	end;
	$func$
	language 'plpgsql';

-- create function for inserting Users and Suggestions
create or replace function insertUserSuggestion(_name text, _department text, _division text, _suggestion text)
	returns boolean as
	$func$
	declare
		sql1 text;
		sql2 text;
	begin
		sql1 := 'coalesce((select id from users where department = ' 
			|| quote_literal(_department) || '),insertUser('
			|| quote_literal(_name) || ',' || quote_literal(_department) || 
			',' || quote_literal(_division) || '))';
		sql2 := 'coalesce((select id from suggestions where suggestion  = '
			|| quote_literal(_suggestion) || '),insertSuggestion(' || quote_literal(_suggestion) || '))';
		execute 'insert into user_suggestion (user_id, suggestion_id) values (' || sql1 || ',' || sql2 || ')';
		return 't';
	end;
	$func$
	language 'plpgsql';

-- create rule
create or replace rule user_suggest_ins as on insert to user_suggestion_view 
	do instead select insertUserSuggestion(new.name, new.department, new.division, new.suggestion);
