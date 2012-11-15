class ConstraintsToConstraint < ActiveRecord::Migration
    def change 
        rename_column :courses , :course_constraints_id, :course_constraint_id
    end 
  def up
  end

  def down
  end
end
