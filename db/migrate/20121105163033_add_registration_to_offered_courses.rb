class AddRegistrationToOfferedCourses < ActiveRecord::Migration
  def change
      add_column :offered_courses, :registration_form_id, :integer
  end
end
