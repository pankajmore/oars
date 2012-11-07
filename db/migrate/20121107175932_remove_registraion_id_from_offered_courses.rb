class RemoveRegistraionIdFromOfferedCourses < ActiveRecord::Migration
  def change
      remove_column :offered_courses, :registration_form_id, :integer
  end 
  def up
  end

  def down
  end
end
