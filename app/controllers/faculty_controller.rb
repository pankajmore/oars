class FacultyController < ApplicationController
before_filter :authenticate_faculty!        
include FacultiesHelper
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


        def transfer_role
            email = params[:q]
            faculty = Faculty.find_by_email(email)
            if faculty.nil?
                flash[:failure] = "No such faculty exists"
            else 
                acting = current_faculty.department.acting_dugc
                acting.faculty = faculty
                acting.save 
                flash[:success] = "Successfully roll changed"
            end 
            session[:return_to] = request.referer
            redirect_to session[:return_to]
        end

        def revoke_role 
            acting = current_faculty.department.acting_dugc
            acting.faculty = nil 
            acting.save 
            session[:return_to] = request.referer
            redirect_to session[:return_to]
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
        
		def submit_grade
		grade=params[:grade]
		semester=params[:semester]
		year=params[:year]
		course=Course.find(params[:course_id])
		student=Student.find(params[:student_id])
		submit_grader(student,course,grade,semester,year)
		flash[:success]="Grade successfully submitted for #{student.name} "
		redirect_to :action => 'course_taking', :id=>params[:course_id]
		end
		        
        def current_sem
            courses = []
            @courses_taken = [] 
            current_faculty.course_doings.each do |cd|
                if not courses.include?(cd.course)
                    @courses_taken << cd 
                end 
            end 
        end

        def course_taking 
            @course = Course.find(params[:id])
            @forms_list = @course.course_doings.map{|c| c.current_registration_form}
        end 
        
        
end
