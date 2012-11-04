# app/controllers/student/sessions_controller.rb
class Student::SessionsController < Devise::SessionsController
  before_filter :faculty_out

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
    stored_location_for(resource) || student_personal_info_path
  end
  
end

def faculty_out
    if faculty_signed_in?
        reset_session
    end
end


