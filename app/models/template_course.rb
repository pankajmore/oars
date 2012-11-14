# == Schema Information
#
# Table name: template_courses
#
#  id         :integer          not null, primary key
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TemplateCourse < ActiveRecord::Base
  attr_accessible :student_id
  has_many :course_constraints
  belongs_to :student
end
