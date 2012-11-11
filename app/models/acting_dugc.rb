class ActingDugc < ActiveRecord::Base
  attr_accessible :department_id, :faculty_id
  belongs_to :department
  belongs_to :faculty
end
