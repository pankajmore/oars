class Student::PreRegistrationController < ApplicationController
   def current_registration
  @currentRegistration=RegistrationForm.find(:all,:conditions =>["form_type==?","current"])
  #@courses=@currentRegistration.offered_courses
  end
  def preregistration
  end
end
