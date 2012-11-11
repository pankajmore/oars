# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Department < ActiveRecord::Base
  attr_accessible :name
  has_one :dugc 
  has_one :acting_dugc 
  has_many :students
  has_many :faculties
end
