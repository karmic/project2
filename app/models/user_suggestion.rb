# == Schema Information
#
# Table name: user_suggestion_view
#
#  userid       :integer
#  name         :text
#  department   :text
#  division     :text
#  suggestionid :integer
#  suggestion   :text
#  created_at   :datetime
#  updated_at   :datetime
#

class UserSuggestion < ActiveRecord::Base
	set_table_name "user_suggestion_view"
end
