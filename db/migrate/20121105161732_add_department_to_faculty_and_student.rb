class AddDepartmentToFacultyAndStudent < ActiveRecord::Migration
  def change
      add_column :faculties, :department_id, :integer  
      add_column :students, :department_id, :integer
  end
end
