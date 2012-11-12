# == Schema Information
#
# Table name: course_takens
#
#  id                      :integer          not null, primary key
#  credits                 :integer
#  grade                   :string(255)
#  semester                :string(255)
#  year                    :string(255)
#  course_id               :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  academic_information_id :integer
#

class CourseTaken < ActiveRecord::Base
  attr_accessible :credits, :grade, :semester, :year
  belongs_to :academic_information
  belongs_to :course
end
