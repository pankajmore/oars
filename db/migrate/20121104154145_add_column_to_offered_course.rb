class AddColumnToOfferedCourse < ActiveRecord::Migration
  def change
    add_column :offered_courses, :course_id, :integer
  end
end
