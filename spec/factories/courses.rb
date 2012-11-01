# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    sequence(:name)  { |n| "Course #{n}" }
    sequence(:number) { |n| "CS#{n}"} 
  end
end
