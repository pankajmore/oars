class CreateCourseConstraints < ActiveRecord::Migration
  def change
    create_table :course_constraints do |t|
      t.integer :template_course_id
      t.integer :course_id
      t.integer :bucket

      t.timestamps
    end
  end
end
