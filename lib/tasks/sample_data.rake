namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  Department.create!({:name => "cse"})
  50.times do |n|
      name  = Faker::Name.name
      number = "CS#{n+100}"
      Course.create!(name: name, number: number, :department_id => 1)
    end
  a = AcademicInformation.create!()
  a.student = Student.create!({:name => "Ajmera", :email => "foo@bar.com", :password => "111111", :password_confirmation => "111111" , :department_id => 1})
  a.save
  a = AcademicInformation.create!()
  a.student = Student.create!({:name => "bakait chhora", :email => "test@test.com", :password => "111111", :password_confirmation => "111111" , :department_id => 1}) 
  a.save
  Faculty.create!({:name => "Shubham", :email => "foo@bar.com", :password => "111111", :password_confirmation => "111111" , :department_id => 1})
  Faculty.create!({:name => "Cool Dude", :email => "test@test.com", :password => "111111", :password_confirmation => "111111",:department_id => 1})

  Dugc.create!({:department_id => 1, :faculty_id => 1})
  ActingDugc.create!({:department_id => 1})
  ids = Course.find( :all, :select => 'id' ).map( &:id )
  courses = Course.find( (1..20).map { ids.delete_at( ids.size * rand ) } )
  AcademicInformation.all.each do |a|
      ['1','2','3','4','5','6'].each do |s|
          5.times do 
            rand_taken = rand_course_taken(a,s)
            a.course_takens.push(rand_taken)
          end 
      end 
  end 

  courses.each { |x| 
      offset = rand(Faculty.count)
      rand_faculty = Faculty.first(:offset => offset)
      lt1 = rand_lecturetime
      lt2 = rand_lecturetime 
      lt3 = rand_lecturetime 
      y = OfferedCourse.create()
      y.credit = 4
      y.course = x
      y.faculties.push(rand_faculty)
      y.lecture_times.push(lt1)
      y.lecture_times.push(lt2)
      y.lecture_times.push(lt3)
      y.save!() 
      }
  # lecture times 
  end
end

def rand_lecturetime 
      lt = LectureTime.create()
      day = rand(2..6)
      start_time = rand(8..17)
      end_time = start_time + [1,2].sample
      #lt.starts_at = Time.parse("#{start_time}:00")
      #lt.ends_at = Time.parse("#{end_time}:00")
      h = Hash.new()
      h[0] = 'saturday'
      h[1] = 'sunday'
      h[2] = 'monday'
      h[3] = 'tuesday'
      h[4] = 'wednesday'
      h[5] = 'thursday'
      h[6] = 'friday'
      lt.day = h[day]
      lt.starts_at = Time.utc(2000,1,day+1,start_time,0)
      lt.ends_at = Time.utc(2000,1,day+1,end_time,0)
      lt.save
      return lt 
end 

def rand_course_taken(academic_information,semester) 
    lt = CourseTaken.create()
    offset = rand(Course.count)
    rand_course = Course.first(:offset => offset)
    lt.course = rand_course
    lt.academic_information = academic_information
    lt.credits = [2,4].sample 
    lt.grade = ['A','B','C','D','F'].sample
    lt.semester = semester 
    lt.save 
    return lt 
end 

    




