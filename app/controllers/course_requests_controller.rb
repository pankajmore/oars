class CourseRequestsController < ApplicationController
  def index
    @course_requests = CourseRequest.where(:student_id => current_student.id)
  end
end
