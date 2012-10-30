class CreateFaculties < ActiveRecord::Migration
  def change
    create_table :faculties do |t|
      t.string :pfno
      t.string :username
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
