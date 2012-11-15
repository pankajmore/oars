# == Schema Information
#
# Table name: course_constraints
#
#  id                 :integer          not null, primary key
#  template_course_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  name               :string(255)
#

class CourseConstraint < ActiveRecord::Base
  attr_accessible :course_id, :template_course_id, :name 
  belongs_to :template_course 
  has_many :courses 
end
