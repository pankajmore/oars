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
#  course_id       :integer
#

require 'spec_helper'

describe OfferedCourse do
  pending "add some examples to (or delete) #{__FILE__}"
end
