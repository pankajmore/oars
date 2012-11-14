module Student::PreRegistrationHelper
    def clash(course_to_add,form)
        form.offered_courses.each do |r|
            r.lecture_times.each do |l|
                course_to_add.lecture_times.each do |c|
                    if l.day == c.day
                        if l.starts_at >= c.starts_at and l.starts_at < c.ends_at 
                            return r 
                        elsif c.starts_at >= l.starts_at and c.starts_at < l.ends_at 
                            return r
                        end 
                    end 
                end
            end
        end
        return nil 
    end 
    def is_submitted?
      RegistrationForm.find_or_create_by_student_id_and_form_type(current_student.id,'pre').is_submitted
    end
end
