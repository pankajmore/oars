class ChangeFromTimeToDatetimeEndsAt < ActiveRecord::Migration
  def change 
      change_column :lecture_times, :ends_at, :datetime 
  end 

  def up
  end

  def down
  end
end
