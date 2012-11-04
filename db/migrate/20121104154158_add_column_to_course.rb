class AddColumnToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :offered_course_id, :integer
  end
end
