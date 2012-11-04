# == Schema Information
#
# Table name: offered_courses
#
#  id              :integer          not null, primary key
#  description     :string(255)
#  accept_requests :text
#  drop_requests   :text
#  credit          :integer
#  pre_reqs        :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class OfferedCourse < ActiveRecord::Base
  attr_accessible :accept_requests, :credit, :description, :drop_requests, :pre_reqs
  has_one :course
end
