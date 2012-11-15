# == Schema Information
#
# Table name: template_courses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)
#

class TemplateCourse < ActiveRecord::Base
    attr_accessible :name
  has_many :course_constraints
  has_many :students 
end
