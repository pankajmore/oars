class RemoveRequestsFromOfferedCourses < ActiveRecord::Migration
  def change 
      remove_column :offered_courses, :accept_requests, :text 
      remove_column :offered_courses, :drop_requests, :text 

  end 
  def up
  end

  def down
  end
end
