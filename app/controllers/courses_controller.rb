class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end
  def show
   search = params[:q]
    search_condition = "%" + search + "%"
    @courses = Course.find(:all, :conditions => ['name LIKE ? or number LIKE ?', search_condition, search_condition]) 
  end
  
  def apply_template
  end
  
  def add_constraint
  bucket=params[:bucket]
  
  course=Course.find_by_number(params[:course_num])
  if course.nil? or !bucket.integer? then
  	flash[:error]="Invalid course number #{params[:course_num]} or bucket #{bucket}"
  	redirect_to :action => 'modify_template', :template_id =>params[:template_id]
   	return
  	end
  redirect_to :action => 'modify_template', :template_id =>params[:template_id]
  end
  
  def modify_constraint
  
  end
  
  def delete_constraint
  
  end
  
  def modify_template
  @template=TemplateCourse.find(params[:template_id])
  end
  
  def add_template
  a=TemplateCourse.create()
  redirect_to :action=>'modify_template', :template_id =>a.id
  end
  
  def view_templates
  @templates=TemplateCourse.find(:all)
  end
  
  def view_courses_constraint
  @constraints =  CourseConstraint.joins(:course).find(:all,:conditions =>['courses.department_id==?',current_faculty.department_id] )
  end
  
  def get_constraints
  
  end
end
