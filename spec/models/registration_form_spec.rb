# == Schema Information
#
# Table name: registration_forms
#
#  id           :integer          not null, primary key
#  form_type    :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  student_id   :integer
#  is_accepted  :boolean
#  is_submitted :boolean
#

require 'spec_helper'

describe RegistrationForm do
  pending "add some examples to (or delete) #{__FILE__}"
end
