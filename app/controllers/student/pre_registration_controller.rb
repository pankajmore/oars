class Student::PreRegistrationController < ApplicationController
   
  def index
    r = RegistrationForm.where(:student_id => current_student.id, :form_type => 'pre')
    #@prereg_courses = nil | r[0].offerred_courses unless r.empty?
    if r.empty?
      @prereg_courses = nil
    else
      @prereg_courses = r[0].offered_courses
    end
  end
  def add
    r = RegistrationForm.where(:student_id => current_student.id, :form_type => 'pre')
    if r != [] then
        @preform = r[0]
    else
        @preform = RegistrationForm.create!(:student_id => current_student.id, :form_type => 'pre')
    end
    id = params[:id]
    courseRequest = CourseRequest.find(params[:crid])
    courseRequest.status = "added"
    courseRequest.save
    @offeredCourse = OfferedCourse.find(params[:id])
    @preform.offered_courses << @offeredCourse
    @preform.save!
    flash[:success] = "Hurray, added to Pre-Registration Form!"
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
  def delete
    r = RegistrationForm.where(:student_id => current_student.id, :form_type => 'pre')
    if r != [] then
        @preform = r[0]
    else
        @preform = RegistrationForm.create!(:student_id => current_student.id, :form_type => 'pre')
    end
    id = params[:id]
    courseRequest = CourseRequest.where(:student_id => current_student.id, :offered_course_id => id).each do |cr|
      cr.status = "accepted"
      cr.save
    end
    @offeredCourse = OfferedCourse.find(params[:id])
    @preform.offered_courses.delete(@offeredCourse)
    @preform.save!
    flash[:success] = "Hurray, added to Pre-Registration Form!"
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
end
