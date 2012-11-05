class LectureTime < ActiveRecord::Base
  attr_accessible :day, :end_time, :start_time
  belongs_to :offered_course
end
