class FacultiesOfferedCourses < ActiveRecord::Migration
  def up
      create_table :faculties_offered_courses , :id => false do |t|
          t.integer :faculty_id
          t.integer :offered_course_id
      end
  end 

  def down
      drop_table :faculties_offered_courses
  end
end

