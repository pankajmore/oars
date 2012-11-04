# app/controllers/faculty/sessions_controller.rb
class Faculty::SessionsController < Devise::SessionsController
  before_filter :student_out
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
    stored_location_for(resource) || faculty_personal_info_path
  end


end

def student_out
    if student_signed_in?
        reset_session
    end
end



