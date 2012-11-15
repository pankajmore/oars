include StudentHelper
Given /^a user find spi$/ do
  a = AcademicInformation.create!()
  a.student = Student.create!({:name => "Ajmera", :email => "foo@bar.com", :password => "111111", :password_confirmation => "111111" , :department_id => 1, :roll => 'Y9321'})
  a.save
  ids = Course.find( :all, :select => 'id' ).map( &:id )
  AcademicInformation.all.each do |a|
      ['1','2','3','4','5','6'].each do |s|
          5.times do 
            rand_taken = CourseTaken.create()
            a.course_takens.push(rand_taken)
	    offset = rand(Course.count)
	    rand_course = Course.first(:offset => offset)
	    rand_taken.course = rand_course
	    rand_taken.academic_information = a
	    rand_taken.credits = 2
	    rand_taken.grade = 'A'
	    #lt.credits = [2,4].sample 
	    #lt.grade = ['A','B','C','D','F'].sample
	    rand_taken.semester = 1 
	    rand_taken.save 
          end 
      end 
  end
  calc_spi(1,a.student)==10.0 
end
