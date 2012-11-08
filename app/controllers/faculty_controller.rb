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
		
		def accepted
			student=Student.find(params[:student_id])
			@course=OfferedCourse.find(params[:course_id])
			
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
			regform.offered_courses << @course
                        acc = CourseRequest.where(:student_id => student.id, :offered_course_id => @course.id).each do
                                |p|  p.status = 'accepted'
                                p.save
                                end
            
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
                @offered_course=OfferedCourse.find(params[:id])
                @student_list=CourseRequest.where(:offered_course_id => @offered_course.id, :status => 'add').map{|p| p.student}
      
        end
        
        def current_registration
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
end
