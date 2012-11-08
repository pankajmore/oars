# == Schema Information
#
# Table name: course_requests
#
#  id                :integer          not null, primary key
#  student_id        :integer
#  offered_course_id :integer
#  status            :string(255)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class CourseRequest < ActiveRecord::Base
  attr_accessible :offered_course_id, :status, :student_id
  belongs_to :offered_course
  belongs_to :student 
end
