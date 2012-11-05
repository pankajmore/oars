# == Schema Information
#
# Table name: academic_informations
#
#  id         :integer          not null, primary key
#  cpi        :float
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AcademicInformation < ActiveRecord::Base
  attr_accessible :cpi, :student_id
  belongs_to :student
  has_many :course_takens
end
