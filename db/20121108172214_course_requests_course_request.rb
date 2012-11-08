class CourseRequestsCourseRequest < ActiveRecord::Migration
  def up
      rename_table :course_requests, :course_request
  end

  def down
      rename_table :course_request, :course_requests
  end
end
