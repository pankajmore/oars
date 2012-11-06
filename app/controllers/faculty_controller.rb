class FacultyController < ApplicationController
        
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
        request_set=OfferedCourse.find(params[:id]).accept_requests.to_a()
        	request_set.each do |id|
               	@student_list<<Student.find(id)
            end
        
        end
end
