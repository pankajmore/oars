class OfferedCoursesRegistrationForms < ActiveRecord::Migration
  def up
      create_table :offered_courses_registration_forms , :id => false do |t|
          t.integer :offered_course_id
          t.integer :registration_form_id
      end
  end 

  def down
      drop_table :offered_courses_registration_forms
  end
end
