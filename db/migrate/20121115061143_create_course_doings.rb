class CreateCourseDoings < ActiveRecord::Migration
  def change
    create_table :course_doings do |t|
      t.integer :current_registation_form_id
      t.integer :course_id
      t.integer :credits
      t.integer :faculty_id

      t.timestamps
    end
  end
end
