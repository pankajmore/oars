class RemoveCourseId < ActiveRecord::Migration
    def change
        remove_column :course_constraints, :course_id, :integer 
    end 
  def up
  end

  def down
  end
end
