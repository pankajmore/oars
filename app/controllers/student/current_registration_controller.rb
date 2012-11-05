class Student::CurrentRegistrationController < ApplicationController
  
  def current_registration
  @currentRegistration=RegistrationForm.find(:all,:conditions =>["form_type==?","current"])[0]
  #@courses=@currentRegistration.offered_courses
  end
end 
