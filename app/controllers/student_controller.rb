class StudentController < ApplicationController
        
        def welcome_student
        end
        
        def student_home
        end

        
        def personal_info
            @student = Student.find(params[:id])
        end
        
        def backlog_list
        end
        
        def transcript
        end
end
