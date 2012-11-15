class CreateCurrentRegistrationForms < ActiveRecord::Migration
  def change
    create_table :current_registration_forms do |t|
      t.integer :student_id

      t.timestamps
    end
  end
end
