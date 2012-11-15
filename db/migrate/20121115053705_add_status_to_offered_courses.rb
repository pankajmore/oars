class AddStatusToOfferedCourses < ActiveRecord::Migration
  def change
      add_column :offered_courses, :status, :string 
  end
end
