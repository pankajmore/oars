# == Schema Information
#
# Table name: course_takens
#
#  id                      :integer          not null, primary key
#  credits                 :integer
#  grate                   :string(255)
#  semester                :string(255)
#  year                    :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  academic_information_id :integer
#

class CourseTaken < ActiveRecord::Base
  attr_accessible :credits, :grade, :semester, :year
  belongs_to :academic_information
  belongs_to :course
end
