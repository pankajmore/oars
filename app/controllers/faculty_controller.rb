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
			student=Student.find(params[:student_id])
			course=OfferedCourse.find(params[:course_id])
			regform=nil
			
			student.registration_forms.each do |form|
				if form.form_type=="pre"
					regform=form
					break
				end
			end
			if regform.nil?
				regform=RegistrationForm.create()
				student.registration_forms << regform
			end
			regform.offered_courses << course
			
            puts params[:student_id]
			course.accept_requests.delete(Integer(params[:student_id]))
			course.save
			regform.save
			student.save
			
			flash[:success] = " #{student.name} is successfully pre-registered"
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
                
        @student_list=[]
        @offered_course=OfferedCourse.find(params[:id])
        request_set=@offered_course.accept_requests.to_a()
        	request_set.each do |id|
               	@student_list<<Student.find(id)
            end
        
        end
end
