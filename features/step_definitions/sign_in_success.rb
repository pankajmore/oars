# require "webrat"
Given /^a user visits the signin page$/ do
  visit student_sign_in
end

Given /^the user is registered$/ do
  @user = students.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
end

Given /^the user submits correct username and password$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Then /^he should see his profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^he should see a logout button$/ do
  page.should have_link('Log Out', href: '/students/sign_out')
end
