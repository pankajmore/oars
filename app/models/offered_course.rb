class OfferedCourse < ActiveRecord::Base
  attr_accessible :accept_requests, :credit, :description, :drop_requests, :pre_reqs
  has_one :course
end