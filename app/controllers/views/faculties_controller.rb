class Views::FacultiesController < ApplicationController
def index
    @faculties = Faculty.all
  end
  def search
    search = params[:q]
    search_condition = "%" + search + "%"
    @faculties = Faculty.find(:all, :conditions => ['name LIKE ? ', search_condition])   
  end
end
