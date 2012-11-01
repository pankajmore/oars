# app/controllers/faculty/sessions_controller.rb
class Faculty::SessionsController < Devise::SessionsController
  def new
    super
  end

  def create
    # add custom create logic here
    super
  end

end

