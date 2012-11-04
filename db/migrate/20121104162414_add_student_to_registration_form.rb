class AddStudentToRegistrationForm < ActiveRecord::Migration
  def change
    add_column :registration_forms, :student_id, :integer
  end
end
