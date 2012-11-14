module Student::PreRegistrationHelper
    def clash(course_to_add,form)
        form.offered_courses.each do |r|
            r.lecture_times.each do |l|
                course_to_add.lecture_times.each do |c|
                    if l.day == c.day
                        if l.start_time >= c.start_time and l.start_time < c.end_time 
                            return r 
                        elsif c.start_time >= l.start_time and c.start_time < l.end_time 
                            return r
                        end 
                    end 
                end
            end
        end
        return nil 
    end 
    end
    def is_submitted?
      RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id,'pre').is_submitted
    end
end
