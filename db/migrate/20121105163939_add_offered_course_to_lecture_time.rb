class AddOfferedCourseToLectureTime < ActiveRecord::Migration
  def change
      add_column :lecture_times, :offered_course_id, :integer
  end
end
