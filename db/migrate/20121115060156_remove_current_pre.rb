class RemoveCurrentPre < ActiveRecord::Migration
    def change 
      remove_column :offered_courses, :is_pre , :boolean 
      remove_column :offered_courses, :is_current , :boolean 
    end 
  def up
  end

  def down
  end
end
