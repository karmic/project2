class UsersController < ApplicationController
  def new
  end

	def create
		name = params[:user][:name]
		username = params[:user][:username]
		password = params[:user][:password]
		division = params[:user][:division]
		department = params[:user][:department]
		conn = ActiveRecord::Base.connection
		sql = "insert into users_view (name,username,password,division,department) " +
			"values ('" + name + "','" + username + "','" + password + "','" + division + 
			"','" + department + "')"
		conn.insert(sql)
		redirect_to :controller => "users", :action => "index"
	end

  def edit
		@user = User.find(params[:id])
  end

  def index
		@users = User.all
  end

	def chooseUser
		@users = User.all
	end

	def update
		@user = User.find(params[:user][:id])
		if @user.update_attributes(:name => params[:user][:name],
			:username => params[:user][:username], :division => params[:user][:division],
			:department => params[:user][:department])
			redirect_to :controller => "users", :action => "index"
		else
			render :action => "edit"
		end
	end

end
