namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  50.times do |n|
      name  = Faker::Name.name
      number = "CS#{n+100}"
      Course.create!(name: name, number: number)
    end
  Student.create!({:email => "foo@bar.com", :password => "111111", :password_confirmation => "111111" })
  Faculty.create!({:email => "foo@bar.com", :password => "111111", :password_confirmation => "111111" })
  ids = Course.find( :all, :select => 'id' ).map( &:id )
  courses = Course.find( (1..20).map { ids.delete_at( ids.size * rand ) } )
  courses.each { |x| 
      offset = rand(Faculty.count)
      rand_faculty = Faculty.first(:offset => offset)
      lt = LectureTime.create()
      day = rand(0..5)
      start_time = rand(8..17)
      end_time = start_time + [1,2].sample
      lt.start_time = Time.parse("#{start_time}:00")
      lt.end_time = Time.parse("#{end_time}:00")
      h = Hash.new()
      h[0] = 'monday'
      h[1] = 'tuesday'
      h[2] = 'wednesday'
      h[3] = 'thursday'
      h[4] = 'friday'
      h[5] = 'saturday'
      h[6] = 'sunday'
      lt.day = h[day]
      lt.save!()
      y = OfferedCourse.create()
      y.credit = 4
      y.course = x
      y.faculties.push(rand_faculty)
      y.lecture_times.push(lt)
      y.save!() 
      }
  # lecture times 
  end
end
