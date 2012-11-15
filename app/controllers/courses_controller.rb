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
  
  def apply_template
  end
  
  def add_constraint
  name=params[:name]
  if name.blank? then
  	flash[:error]="Give a proper name dont't leave black"
  	redirect_to :action => 'modify_template', :template_id =>params[:template_id]
   	return
  	end
  	constraint=CourseConstraint.create(:name=>name)
  redirect_to :action => 'modify_constraint', :template_id =>params[:template_id], :constraint_id => constraint.id
  end
  

  def modify_constraint
  @constraint=CourseConstraint.find(params[:constraint_id])
  @template=TemplateCourse.find(params[:template_id])
  end
  
  def delete_constraint
  constraint=CourseConstraint.find(params[:constraint_id])
  constraint.destroy!  
  redirect_to :action => 'modify_constraint', :template_id =>params[:template_id] , :constraint_id => params[:constraint_id] 
  end

  def add_constraint_course
  course=Course.find_by_number(params[:course_num])
  if course.nil? then
  	flash[:error]="not a valid course number #{params[:course_num]} "
  else
  	constraint=CourseConstraint.find(params[:course_num])
  	constraint.courses+[course]
  	constraint.save!
  	flash[:success]="Course #{course.name} add to the constraint"
  end
  redirect_to :action => 'modify_constraint', :template_id =>params[:template_id] , :constraint_id => params[:constraint_id] 
  end
  
  def remove_course
  constraint=CourseConstraint.find(params[:constraint_id])
  constraint.courses-[Course.find(params[:course_id])]
  constraint.save!  
  redirect_to :action => 'modify_constraint', :template_id =>params[:template_id] , :constraint_id => params[:constraint_id] 
  
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
