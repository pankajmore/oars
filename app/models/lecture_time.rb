# == Schema Information
#
# Table name: lecture_times
#
#  id                :integer          not null, primary key
#  day               :string(255)
#  start_time        :time
#  end_time          :time
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  offered_course_id :integer
#

class LectureTime < ActiveRecord::Base
  attr_accessible :day, :end_time, :start_time
  belongs_to :offered_course
end
