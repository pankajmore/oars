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
  after_initialize :init
  belongs_to :course 
  belongs_to :registration_form
  has_many :course_prereq, :class_name => 'Course'
  serialize :accept_requests
  serialize :drop_requests
  has_and_belongs_to_many :faculties
  has_many :lecture_times
  def init
    self.accept_requests  ||= Set.new()           #will set the default value only if it's nil
    self.drop_requests  ||= Set.new()           #will set the default value only if it's nil
  end
end
