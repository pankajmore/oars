class OfferedCoursesController < ApplicationController
  before_filter :authenticate_student! 
  def index
    @courses = OfferedCourse.all
  end
  def show      
    @course = OfferedCourse.find(params[:id])
    @timings = @course.lecture_times
    
    respond_to do |format|
      format.js
    end
    
  end
  def search
    search = params[:q]
    search_condition = "%" + search + "%"
    @courses = OfferedCourse.joins(:course).find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition])   
  end
  def add
    id = params[:id]
    @offeredCourse = OfferedCourse.find(params[:id])
    c = CourseRequest.create!()
    c.student = current_student
    c.offered_course = @offeredCourse
    c.status = 'add' 
    c.save!
    flash[:success] = "Hold tight, Request Sent!"
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end

  def delete
    id = params[:id]
    @offeredCourse = OfferedCourse.find(params[:id])
    CourseRequest.where({:student_id => current_student.id, :offered_course_id => @offeredCourse.id}).destroy_all
    flash[:success] = "Deleted your request!"
    session[:return_to] = request.referer
    redirect_to session[:return_to]
  end
end
