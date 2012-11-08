class StudentController < ApplicationController
        before_filter :authenticate_student! 
        def welcome_student
        end
        
        def student_home
        end

        def personal_info
        end
        
        def current_registration
        end
        
        def pre_registration
        	@waiting_courses=[]
        	@accepted_courses=[]
        	allcour=OfferedCourse.find(:all)
        	allcour.each do |course|
        		if course.accept_requests.include?(current_student.id)
        			@waiting_courses << course
        			end
        		end
        	current_student.registration_forms.each do |form|
        			if form.form_type=="pre" 
        			@accepted_courses=form.offered_courses
        			break
        			end
        		end
        end
        
        def backlog_list
        end
        
        def transcript
        end
        
        def add_drop
        end
end
