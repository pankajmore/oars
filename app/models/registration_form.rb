# == Schema Information
#
# Table name: registration_forms
#
#  id         :integer          not null, primary key
#  form_type  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :integer
#

class RegistrationForm < ActiveRecord::Base
  attr_accessible :form_type
  belongs_to :student
  has_many :offered_courses
end
