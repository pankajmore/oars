# app/controllers/student/sessions_controller.rb
class Student::SessionsController < Devise::SessionsController
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
  
end

