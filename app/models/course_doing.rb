class CourseDoing < ActiveRecord::Base
  attr_accessible :course_id, :credits, :current_registration_form_id, :faculty_id
  belongs_to :current_registration_form
  belongs_to :faculty 
  belongs_to :course 
end
