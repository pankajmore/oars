module OfferedCoursesHelper
    def courses_taken(student)
        return student.academic_information.course_takens.map{|ct| ct.course}
    end 
    def satisfy_prereqs(course,student)
       (course.course_prereqs & courses_taken(student)) == course.course_prereqs 
    end 
end
