# app/controllers/student/registrations_controller.rb
class Student::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
    super
  end

  def update
    super
  end
end

