class PagesController < ApplicationController
  def login
		if params[:user] == nil
			username = password = ""
		else
			username = params[:user][:username]
			password = params[:user][:password]
  	end
		conn = ActiveRecord::Base.connection
		user_id = conn.select_value("select get_id('" + username + "','" + password + "')").to_i
		if username == password && username == "guest"
			redirect_to :controller => "user_suggestions", :action => "index"
		elsif user_id > 0
			cookies.signed[:user_id] = user_id
			redirect_to :controller => "pages", :action => "continue"
		end
	end

  def logout
  end
end
