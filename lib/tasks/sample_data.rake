namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  500.times do |n|
      name  = Faker::Name.name
      number = "CS#{n+100}"
      Course.create!(name: name, number: number)
    end
  end
end

