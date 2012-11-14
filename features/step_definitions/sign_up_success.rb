require "webrat"
Given /^a user visits the signup page$/ do
  visit student_sign_up
end

Given /^the user enters data$/ do
  fill_in "Username",    with: "example"
  fill_in "Email",    with: "example@example.com"
  fill_in "Password",    with: "foobar"
  fill_in "Password confirmation",    with: "foobar"
  fill_in "Name", with: "Example name"
  fill_in "Phone",    with: "1234567890"
  fill_in "Roll no",    with: "11111"
  click_button "Sign in"
end

Then /^he should get updated in database$/ do
  students.find("username","example")
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^he should see a signout button$/ do
  page.should have_link('Log Out', href: '/students/sign_out')
end

