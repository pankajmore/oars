class ChangeName < ActiveRecord::Migration
  def change 
      rename_column :lecture_times, :start_time, :starts_at
      rename_column :lecture_times, :end_time, :ends_at
  end 
  def up
  end

  def down
  end
end
