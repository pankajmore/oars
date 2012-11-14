class RemoveBucket < ActiveRecord::Migration
  def change
      remove_column :course_constraints, :bucket, :integer 
      add_column :courses ,:course_constraints_id, :integer 
      add_column :template_courses, :name, :string 
      add_column :course_constraints, :name, :string 
      add_index :courses, :course_constraints_id, {:name => "course_constraints_index"}
  end 
  def up
  end

  def down
  end
end
