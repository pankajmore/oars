# require "webrat"
Given /^a user visits the signin page$/ do
  visit student_sign_in_path
end

Given /^the user is registered$/ do
  @user = Student.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar")
end

Given /^the user submits correct username and password$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Given /^a user visits the courses page and click on toggle button$/ do
  click_link "Offered Course"
  find_button("1").click
end

Then /^navigate to pre-registration and course should be added$/ do
  visit course_requests_path
end

Then /^course id should be there on the pre_registration page$/ do
  page.should have_link('CS100')
end
