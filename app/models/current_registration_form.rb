# == Schema Information
#
# Table name: current_registration_forms
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CurrentRegistrationForm < ActiveRecord::Base
  attr_accessible :student_id
  belongs_to :student
  has_many :course_doings 
end
