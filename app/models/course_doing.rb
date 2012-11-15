# == Schema Information
#
# Table name: course_doings
#
#  id                           :integer          not null, primary key
#  current_registration_form_id :integer
#  course_id                    :integer
#  credits                      :integer
#  faculty_id                   :integer
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class CourseDoing < ActiveRecord::Base
  attr_accessible :course_id, :credits, :current_registration_form_id, :faculty_id
  belongs_to :current_registration_form
  belongs_to :faculty 
  belongs_to :course 
end
