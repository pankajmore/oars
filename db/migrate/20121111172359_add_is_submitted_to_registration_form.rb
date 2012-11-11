class AddIsSubmittedToRegistrationForm < ActiveRecord::Migration
  def change
      add_column :registration_forms, :is_submitted, :boolean
  end
end
