# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  roll                   :string(255)
#  username               :string(255)
#  name                   :string(255)
#  phone                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  department_id          :integer
#  template_course_id     :integer
#

class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_messageable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :department_id
  attr_accessible :name, :phone, :roll, :username
  belongs_to :department
  belongs_to :template_course
  has_many :registration_forms, :dependent => :destroy
  has_many :course_requests
  has_one :academic_information
  has_one :current_registration_form
end
