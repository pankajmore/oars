class FacultyController < ApplicationController
before_filter :authenticate_faculty!        
        def instructor_home
        end
        
        def welcome_instructor
        end
        
        def faculty_personal_info
        end
        
        def pre_registration
        end
		
        def account
        end
		
		
		
        def accepted

                request=CourseRequest.find(params[:request_id])
                student=request.student
                request.status="accepted"			
                request.save
                flash[:success] = " #{student.name} is successfully pre-registered"
                redirect_to :action => 'course_requests',:id=>params[:course_id] 
        end
		
        def rejected
                request=CourseRequest.find(params[:request_id])
                student=request.student
                request.status="rejected"			
                request.save
                flash[:alert] = " #{student.name} request is rejected"
                redirect_to :action => 'course_requests',:id=>params[:course_id] 
        end
        
        def courses_taken
        	@courses_taken=OfferedCourse.find(:all)
        	@courses_taken.each do |course|
        		if !course.faculties.include? current_faculty
        			@courses_taken=@courses_taken-[course]
        		end
        	end
        end
        
        def update_description
                #@course_described = OfferedCourse.find(params[:id])
                
                desc = params[:q]
                
                courseDesMod = OfferedCourse.find(params[:name])
                courseDesMod.description = desc
                flash[:success] = "Course Description Updated..."
                session[:return_to] = request.referer
                redirect_to session[:return_to]
        end
        def course_description
                @course_described = OfferedCourse.find(params[:id])
        end      
        
        def course_info
                @present_course = OfferedCourse.find(params[:id]).course
                @past_current_student_list = CourseTaken.where(:course_id => @present_course.id).map{|p| p.student}
        end
        
        def course_requests
        @request_list=[]        
        @offered_course=OfferedCourse.find(params[:id])
        request_set=@offered_course.course_requests
        	request_set.each do |request|
        		if request.status=="add"
               		@request_list << request
               		end
            end
        end
        
        
        
end
