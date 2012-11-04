class Course < ActiveRecord::Base
  attr_accessible :name, :number
  has_many :offered_course
end
