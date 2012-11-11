class AddDepartmentToCourse < ActiveRecord::Migration
  def change
      add_column :courses, :department_id, :integer 
  end
end
