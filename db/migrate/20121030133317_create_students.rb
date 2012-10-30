class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :roll
      t.string :username
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
