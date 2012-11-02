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
end
