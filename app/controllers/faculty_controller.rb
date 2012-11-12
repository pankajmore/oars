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
		
		def approve_form
			if !(current_faculty.department.dugc.faculty==current_faculty)
				flash[:error]="#{current_faculty.name}!! you are not authorized for this action"
				redirect_to :action=>'instructor_home'
				end 
			@regform=RegistrationForm.find(params[:regform_id])
		end
		
		def registration_forms
			if !(current_faculty.department.dugc.faculty==current_faculty)
				flash[:error]="#{current_faculty.name}!! you are not authorized for this action"
				redirect_to :action=>'instructor_home'
				end 
			@registration_forms=[]
			current_faculty.department.students.each do |student|
				 student.registration_forms.each do |regform|
				 	if regform.type=="pre" and regform.is_submitted==true and regform.is_accepted.nil?
					 	@registration_forms << regform
				 		end
				 	end
				end
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
