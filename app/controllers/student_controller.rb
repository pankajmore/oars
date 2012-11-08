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
            @accepted_courses = CourseRequest.where(:student_id => current_student.id, :status => 'accepted').map{|p| p.offered_course}
            @waiting_courses = CourseRequest.where(:student_id => current_student.id, :status => 'add').map{|p| p.offered_course}
        end
        
        def backlog_list
        end
        
        def transcript
        end
        
        def add_drop
        end
end
