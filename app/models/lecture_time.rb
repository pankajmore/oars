# == Schema Information
#
# Table name: lecture_times
#
#  id                :integer          not null, primary key
#  day               :string(255)
#  starts_at         :datetime
#  ends_at           :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  offered_course_id :integer
#

class LectureTime < ActiveRecord::Base
  attr_accessible :day, :end_time, :start_time
  belongs_to :offered_course
end
