# == Schema Information
#
# Table name: courses
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  number            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  offered_course_id :integer
#  department_id     :integer
#

class Course < ActiveRecord::Base
  attr_accessible :name, :number, :department_id
  has_one :offered, :class_name => 'OfferedCourse'
  belongs_to :offered_course
  belongs_to :department 
  has_many :course_takens
end
