class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def show      
    @course = Course.find(params[:id])
    respond_to do |format|
      format.js
    end
    
  end

  def search 
    search = params[:q]
    search_condition = "%" + search + "%"
    @courses = Course.find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition]) 
  end
end
