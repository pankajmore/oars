class CreateActingDugcs < ActiveRecord::Migration
  def change
    create_table :acting_dugcs do |t|
      t.integer :faculty_id
      t.integer :department_id

      t.timestamps
    end
  end
end
