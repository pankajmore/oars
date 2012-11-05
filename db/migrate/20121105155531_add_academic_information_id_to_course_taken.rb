class AddAcademicInformationIdToCourseTaken < ActiveRecord::Migration
  def change
    add_column :course_takens, :academic_information_id, :integer
  end
end
