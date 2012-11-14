# require "webrat"
Given /^a user visits the signin page$/ do
  visit student_sign_in
end

Given /^the user is registered$/ do
  @user = students.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

Given /^the user submits correct username and password$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Given /^a user visits the courses page and click on toggle button$/ do
  visit courses
  click_button "Offered Courses"
  click_link "CS100" #click_link "Add" or click_link_within "course id", "Add"
end

Then /^navigate to pre-registration and course should be added$/ do
  visit pre_registration
end

Then /^course id is not there on the pre_registration page$/ do
  page.should have_no_content('CS100')
end