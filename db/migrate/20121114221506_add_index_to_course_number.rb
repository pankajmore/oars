class AddIndexToCourseNumber < ActiveRecord::Migration
  def change
    add_index :courses, :number, {:name => "course_number_index", :unique => true}
  end
end
