class UserSuggestionsController < ApplicationController

	def list	
		@usersuggestions = UserSuggestion.all
    render :xml => @usersuggestions.to_xml(:dasherize => false)
	end

	def new
	end

	def create
		@suggestion = Suggestion.new
		@suggestion['user_id'] = cookies.signed[:user_id]
		@suggestion['suggestion'] = params[:suggestion][:suggestion]
		@suggestion.save
		redirect_to :controller => "user_suggestions", :action => "index"
	end
	
	def edit
		@suggestion = Suggestion.find(params[:id])
	end

	def index
		@usersuggestions = UserSuggestion.find(:all, :order => 'created_at')
  end

	def chooseSuggestion
  	user = User.find(cookies.signed[:user_id])
		if user['department'] == user['division']
			@usersuggestions = UserSuggestion.find_all_by_division(user['division'])
		else
			@usersuggestions = UserSuggestion.find_all_by_department(user['department'])
		end
		if user['division'] == "Administrator" and user['department'] == "Administrator"
			@usersuggestions = UserSuggestion.all
		end
	end
	
	def update
		@suggestion = Suggestion.find(params[:suggestion][:id])
		if @suggestion.update_attributes(:suggestion => params[:suggestion][:suggestion])
			redirect_to :controller => "user_suggestions", :action => "index"
		else
			render :action => "edit"			
		end
	end
end
