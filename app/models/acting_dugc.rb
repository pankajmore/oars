# == Schema Information
#
# Table name: acting_dugcs
#
#  id            :integer          not null, primary key
#  faculty_id    :integer
#  department_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ActingDugc < ActiveRecord::Base
  attr_accessible :department_id, :faculty_id
  belongs_to :department
  belongs_to :faculty
end
