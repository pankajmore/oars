class OfferedCourse < ActiveRecord::Base
  attr_accessible :accept_requests, :credit, :description, :drop_requests, :pre_reqs
  belongs_to :course, :class_name => 'Course'
  has_many :course_prereq, :class_name => 'Course'
end
