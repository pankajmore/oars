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
        
        def course_info
                @present_course = OfferedCourse.find(params[:id]).course
                @past_current_student_list = CourseTaken.where(:course_id => @present_course.id).map{|p| p.student}
        end

        def send_message
          s = Student.find(params[:student_id])
          f = Faculty.find(current_faculty.id)
          f.send_message(s, "Addition details required", "Meet")
          flash[:success] = "Sent a Meet message to the student!!"
          
          session[:return_to] = request.referer
          redirect_to session[:return_to]
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
        
        def current_sem
          
        end
        
        
end
