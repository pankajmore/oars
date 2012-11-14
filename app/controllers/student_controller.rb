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
          @ai = AcademicInformation.find_or_create_by_student_id(current_student.id)
          @ss = CourseTaken.where(:academic_information_id => @ai.id).group("semester").count
          @semesters = []
          @ss.keys.each do |no|
              semester = Hash.new
              semester[:number] = no 
              semester[:courses] = CourseTaken.where(:academic_information_id => @ai.id, :semester => no)
              @semesters << semester
          end 
        end
        
        def add_drop
        end
end
