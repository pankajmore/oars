class OfferedCoursesFaculties < ActiveRecord::Migration
  def up
      create_table :offered_courses_faculties, :id => false do |t|
          t.column :offered_course_id, :integer 
          t.column :faculty_id, :integer 
      end
  end 

  def down
  end
end
