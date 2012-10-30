# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :offered_course do
    description "MyString"
    accept_requests "MyText"
    drop_requests "MyText"
    credit 1
    pre_reqs "MyText"
  end
end
