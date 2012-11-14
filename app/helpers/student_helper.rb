module StudentHelper 
    def calc_cpi(semester,student)
        total_credits = 0 
        total = 0 
        "1".upto(semester).each do |s|
            credits = calc_credits(s,student)
            total = total + (calc_spi(s,student) * credits)
            total_credits = total_credits + credits 
        end 
        return total/total_credits.to_f

    end 
    def calc_spi(semester,student)
          ai = AcademicInformation.find_or_create_by_student_id(student.id)
          total = ai.course_takens.select{|s| s.semester ==  semester}.map{|s| s.credits * convert_grade(s.grade)}.sum
          credits = calc_credits(semester,student)
          return total/credits.to_f
    end 
    def calc_credits(semester,student)
          ai = AcademicInformation.find_or_create_by_student_id(student.id)
          ai.course_takens.select{|s| s.semester == semester}.map{|s| s.credits}.sum
    end 
    def convert_grade(grade)
        h = Hash.new()
        h["A"] = 10
        h["B"] = 8 
        h["C"] = 6
        h["D"] = 4 
        h["F"] = 2
        return h[grade]
    end 
end 
