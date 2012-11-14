class HasManyStudentsInTemplate < ActiveRecord::Migration
    def change 
        remove_column :template_courses, :student_id, :integer 
        add_column :students, :template_course_id , :integer 
    end 
  def up
  end

  def down
  end
end
