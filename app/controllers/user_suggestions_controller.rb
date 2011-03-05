class UserSuggestionsController < ApplicationController
  def index
		@usersuggestions = UserSuggestion.all
  end

end
