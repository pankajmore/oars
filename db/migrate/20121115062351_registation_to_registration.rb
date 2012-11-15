class RegistationToRegistration < ActiveRecord::Migration
    def change 
        rename_column :course_doings, :current_registation_form_id, :current_registration_form_id
    end 
  def up
  end

  def down
  end
end
