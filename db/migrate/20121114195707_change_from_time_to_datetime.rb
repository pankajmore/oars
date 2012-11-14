class ChangeFromTimeToDatetime < ActiveRecord::Migration
  def change 
      change_column :lecture_times, :starts_at, :datetime 
  end 

  def up
  end

  def down
  end
end
