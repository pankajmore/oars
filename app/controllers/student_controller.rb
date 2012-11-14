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
        
        def backlog_list
        end
        
        def transcript
          
        end
        
        def add_drop
        end

        def time_table 
            @start_date = Date.new(2000,1,3)
            @end_date = Date.new(2000,1,7)
            @date = Date.new(2000,1,3)
            @events  = RegistrationForm.find_by_student_id_and_form_type(current_student.id, 'pre').offered_courses.map{|c| c.lecture_times}.flatten 
        end 
end
