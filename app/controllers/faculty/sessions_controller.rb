# app/controllers/faculty/sessions_controller.rb
class Faculty::SessionsController < Devise::SessionsController
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
    stored_location_for(resource) || faculty_personal_info
  end


end

