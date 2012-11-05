class OfferedCoursesController < ApplicationController
  def index
    @courses = OfferedCourse.all
  end
  def show
    search = params[:q]
    search_condition = "%" + search + "%"
    @courses = OfferedCourse.find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition]) 
  end
  def add
    id = params[:id]
    @offeredCourse = OfferedCourse.find(params[:id])
    @offeredCourse.accept_requests << current_student.id
    @offeredCourse.save
    flash[:success] = "Hold tight, Request Sent!"
    redirect_to :action => 'index'
  end
  
end
