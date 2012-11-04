class Offered_coursesController < ApplicationController
  def index
    @courses = Offered_course.all
  end
  def show
    search = params[:q]
    search_condition = "%" + search + "%"
    @courses = Offered_course.find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition]) 
  end
end
