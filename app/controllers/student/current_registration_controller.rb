class Student::CurrentRegistrationController < ApplicationController
  
  def current_registration
  #student_id = params[:q]
  @currentRegistration=current_student.current_registration_form
  #@courses=@currentRegistration.offered_courses
  end
end 
