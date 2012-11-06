class Student::CurrentRegistrationController < ApplicationController
  
  def current_registration
  #student_id = params[:q]
  @currentRegistration=RegistrationForm.find(:all,:conditions =>["form_type==? and student_id==?","pre",current_student.id])[0]
  #@courses=@currentRegistration.offered_courses
  end
end 
