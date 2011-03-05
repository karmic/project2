# == Schema Information
#
# Table name: suggestions
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  suggestion :text
#  created_at :datetime
#  updated_at :datetime
#

class Suggestion < ActiveRecord::Base
end
