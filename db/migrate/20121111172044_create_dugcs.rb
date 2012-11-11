class CreateDugcs < ActiveRecord::Migration
  def change
    create_table :dugcs do |t|
      t.integer :faculty_id
      t.integer :department_id

      t.timestamps
    end
  end
end
