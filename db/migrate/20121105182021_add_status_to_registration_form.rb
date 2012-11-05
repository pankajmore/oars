class AddStatusToRegistrationForm < ActiveRecord::Migration
  def change
      add_column :registration_forms, :is_accepted, :boolean
  end
end
