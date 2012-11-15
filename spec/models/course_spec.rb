# == Schema Information
#
# Table name: courses
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  number               :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  offered_course_id    :integer
#  department_id        :integer
#  course_constraint_id :integer
#

require 'spec_helper'

describe Course do
  pending "add some examples to (or delete) #{__FILE__}"
end
