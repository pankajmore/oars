class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def show
    search = params[:q]
    search_condition = "%" + search + "%"
    @courses = Course.find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition]) 
  end
end
