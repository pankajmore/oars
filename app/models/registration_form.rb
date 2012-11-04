class RegistrationForm < ActiveRecord::Base
  attr_accessible :type
  belongs_to :student
  has_many :offered_courses
end
