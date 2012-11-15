class CurrentRegistrationForm < ActiveRecord::Base
  attr_accessible :student_id
  belongs_to :student
  has_many :course_doings 
end
