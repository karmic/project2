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
create or replace function insertSuggestion(user_id integer,_suggestion text)
	returns integer as
	$func$
	begin
		execute 'insert into suggestions (user_id, suggestion)' 
			'values (cookies.signed[:user_id], params[:suggestion])';
		return currval('suggestion_id_seq');
	end;
	$func$
	language 'plpgsql';
