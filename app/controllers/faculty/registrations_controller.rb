# app/controllers/faculty/registrations_controller.rb
class Faculty::RegistrationsController < Devise::RegistrationsController
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
    welc_instructor_path
  end

  def after_update_up_path_for(resource)
    instructor_personal_info_path
  end


end

