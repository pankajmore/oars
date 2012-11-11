class FacultyController < ApplicationController
before_filter :authenticate_faculty!        
        def instructor_home
        end
        
        def welcome_instructor
        end
        
        def faculty_personal_info
        end
        
        def current_registration
        end
        
        def pre_registration
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
            flash[:success] = " #{student.name} request is rejected"
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
        def course_requests
        @request_list=[]        
        @offered_course=OfferedCourse.find(params[:id])
        request_set=@offered_course.course_requests
        	request_set.each do |request|
        		if request.status=="add"
               		@request_list<<request
               		end
            end
        
        end
end
