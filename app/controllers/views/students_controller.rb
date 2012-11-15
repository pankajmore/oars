class Views::StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def search
    search = params[:q]
    search_condition = "%" + search + "%"
    @students = Student.find(:all, :conditions => ['name LIKE ? or roll LIKE ?', search_condition, search_condition])   
  end
end
