class CreateCourseTakens < ActiveRecord::Migration
  def change
    create_table :course_takens do |t|
      t.integer :credits
      t.string :grate
      t.string :semester
      t.string :year
      t.integer :course_id

      t.timestamps
    end
  end
end
