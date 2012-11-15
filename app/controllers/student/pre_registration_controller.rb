class Student::PreRegistrationController < ApplicationController
  helper Student::PreRegistrationHelper
  def index
    @preform = RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id, 'pre')
    @prereg_courses = @preform.offered_courses
    @is_submitted = @preform.is_submitted
    @is_accepted = @preform.is_accepted
  end

  def add
    @preform = RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id, 'pre')
    id = params[:id]
    @offeredCourse = OfferedCourse.find(params[:id])
    cl = view_context.clash(@offeredCourse,@preform)
    if cl.nil?
        cr = CourseRequest.find_by_student_id_and_offered_course_id(current_student.id, id)
        cr.status = "added"
        cr.save!
        @preform.offered_courses << @offeredCourse
        @preform.save!
        flash[:success] = "Hurray, added to Pre-Registration Form!"
    else 
        flash[:failure] = "Timetable clash with #{cl.course.name}"
    end 
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
  def delete
    @preform = RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id, 'pre')
    id = params[:id]
    cr = CourseRequest.find_by_student_id_and_offered_course_id(current_student.id, id)
    cr.status = "accepted"
    cr.save!
    @offeredCourse = OfferedCourse.find(params[:id])
    @preform.offered_courses.delete(@offeredCourse)
    @preform.save!
    flash[:success] = "Hurray, added to Pre-Registration Form!"
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end

  def submit
    @preform = RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id, 'pre')
    template = current_student.template_course
    if template.nil? or satisfy_template(@preform,template)
        @preform.is_submitted = true
        @preform.save!
        flash[:success] = "Hurray, submitted you Pre-Registration Form to DUGC for approval!"
    else 
        flash[:failure] = "Template Not Satisfied"
    end 

    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end

  def withdraw
    @preform = RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id, 'pre')
    @preform.is_submitted = false
    @preform.save!
    flash[:success] = "Withdrew your Pre-Registration Form from DUGC :("
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
end

