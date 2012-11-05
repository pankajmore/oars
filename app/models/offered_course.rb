# == Schema Information
#
# Table name: offered_courses
#
#  id              :integer          not null, primary key
#  description     :string(255)
#  accept_requests :text
#  drop_requests   :text
#  credit          :integer
#  pre_reqs        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  course_id       :integer
#

class OfferedCourse < ActiveRecord::Base
  attr_accessible :accept_requests, :credit, :description, :drop_requests, :course
  belongs_to :course 
  has_many :course_prereq, :class_name => 'Course'
  serialize :accept_requests
  serialize :drop_requests
  has_and_belongs_to_many :faculties
  has_many :lecture_times
end
