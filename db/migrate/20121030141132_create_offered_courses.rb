class CreateOfferedCourses < ActiveRecord::Migration
  def change
    create_table :offered_courses do |t|
      t.string :description
      t.text :accept_requests
      t.text :drop_requests
      t.integer :credit
      t.text :pre_reqs

      t.timestamps
    end
  end
end
