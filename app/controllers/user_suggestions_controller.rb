class UserSuggestionsController < ApplicationController
  def index
		@usersuggestions = UserSuggestion.all
  end

	def findByDivision
		@usersuggestions = UserSuggestion.find_all_by_division(params[:division])
	end

end
