class AddRegistrationFormToStudents < ActiveRecord::Migration
  def change
    add_column :students, :registration_form_id, :integer
  end
end
