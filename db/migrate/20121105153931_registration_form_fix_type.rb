class RegistrationFormFixType < ActiveRecord::Migration
  def change
    rename_column :registration_forms, :type, :form_type
  end
  def up
  end

  def down
  end
end
