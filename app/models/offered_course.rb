# == Schema Information
#
# Table name: offered_courses
#
#  id          :integer          not null, primary key
#  description :string(255)
#  credit      :integer
#  pre_reqs    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :integer
#

class OfferedCourse < ActiveRecord::Base
  attr_accessible :credit, :description, :course
  belongs_to :course 
  has_many :course_prereqs, :foreign_key => 'offered_course_id', :class_name => 'Course'
  has_and_belongs_to_many :faculties
  has_and_belongs_to_many :registration_forms
  has_many :lecture_times
  has_many :course_requests
end
