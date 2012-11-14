class AddIndexToRollNumber < ActiveRecord::Migration
  def change
    add_index :students, :roll , {:name => "roll_number_index", :unique => true}
    add_index :departments, :name , {:name => "department_name_index", :unique => true}
  end
end
