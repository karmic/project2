# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :text
#  username   :text
#  password   :text
#  enc_pass   :text
#  salt       :text
#  department :text
#  division   :text
#

class User < ActiveRecord::Base
	attr_accessible :name,:username,:division,:department
end
