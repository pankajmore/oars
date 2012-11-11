# == Schema Information
#
# Table name: registration_forms
#
#  id           :integer          not null, primary key
#  form_type    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :integer
#  is_accepted  :boolean
#  is_submitted :boolean
#

class RegistrationForm < ActiveRecord::Base
  attr_accessible :form_type, :is_accepted, :is_submitted
  after_initialize :init
  belongs_to :student
  has_and_belongs_to_many :offered_courses
  def init 
      self.is_accepted = false
      self.is_submitted = false
  end
end
