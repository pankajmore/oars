class CreateTemplateCourses < ActiveRecord::Migration
  def change
    create_table :template_courses do |t|
      t.integer :student_id

      t.timestamps
    end
  end
end
