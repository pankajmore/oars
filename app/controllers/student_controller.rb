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

        def view_messages
          alfa = Student.find(current_student.id)
          #alfa gets the last conversation (chronologically, the first in the inbox)
          @conversations = alfa.mailbox.inbox
          #@receipts = @conversations.map { |c| c.receipts_for alfa }.flatten
          #alfa gets it receipts chronologically ordered.
          #@receipts = @conversation.receipts_for alfa

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
