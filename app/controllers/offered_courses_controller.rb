class OfferedCoursesController < ApplicationController
  before_filter :authenticate_student! 
  def index
    @courses = OfferedCourse.all
  end
  def show()
    @course = OfferedCourse.find(params[:id])
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
    redirect_to :action => 'index'
  end
  def delete
    id = params[:id]
    @offeredCourse = OfferedCourse.find(params[:id])
    c = CourseRequest.find({:student => current_student, :offered_course => @offeredCourse})
    @offeredCourse.accept_requests.delete(current_student.id)
    @offeredCourse.save
    flash[:success] = "Deleted your request!"
    redirect_to :action => 'index'
  end
end
