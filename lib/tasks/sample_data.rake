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
      y = OfferedCourse.create()
      y.credit = 4
      y.course = x
      y.faculties.push(rand_faculty)
      y.save!() 
      }
  end
end
