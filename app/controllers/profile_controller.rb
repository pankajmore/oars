class ProfileController < ApplicationController
  def login
  end

  def student_home
  end

	def instructor_home
			respond_to do |format|
      format.html # student_home.html.erb
      end
	end

end
