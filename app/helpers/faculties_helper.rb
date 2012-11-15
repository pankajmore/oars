module FacultyHelper
    def submit_grade(student,course,grade,semester,year)
        cd = student.current_registration_form.course_doings.find{|c| c.course==course}
        ac = student.academic_information
        ct = CourseTaken.create()
        ct.credits = cd.credits 
        ct.grade = grade 
        ct.semester = semester 
        ct.year = year 
        ct.course = course 
        ct.academic_information = ac 
        ct.save 
        cd.destroy 
    end 
end
