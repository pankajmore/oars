class Course < ActiveRecord::Base
  attr_accessible :name, :number
  has_one :offered_course
  belongs_to :offered_course
end
