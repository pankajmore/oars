class CreateCourseRequests < ActiveRecord::Migration
  def change
    create_table :course_requests do |t|
      t.integer :student_id
      t.integer :offered_course_id
      t.string :status

      t.timestamps
    end
  end
end
