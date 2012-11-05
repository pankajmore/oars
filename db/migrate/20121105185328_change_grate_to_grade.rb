class ChangeGrateToGrade < ActiveRecord::Migration
  def change 
      rename_column :course_takens, :grate, :grade
  end 
  def up
  end

  def down
  end
end
