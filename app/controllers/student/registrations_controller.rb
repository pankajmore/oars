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
  def after_sign_up_path_for(resource)
    welc_student_path
  end
end

