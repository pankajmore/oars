# app/controllers/faculty/sessions_controller.rb
class Faculty::SessionController < Devise::SessionsController
  def new
    super
  end

  def create
    # add custom create logic here
    super
  end

  def destroy
    super
  end


  def after_sign_in_path_for(resource)
    stored_location_for(resource) || welc_student_path
  end


end

