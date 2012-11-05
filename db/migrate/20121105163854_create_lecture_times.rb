class CreateLectureTimes < ActiveRecord::Migration
  def change
    create_table :lecture_times do |t|
      t.string :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
