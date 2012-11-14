Given /^a user visits the signin page$/ do
  visit student_sign_in
end

Given /^the user is registered$/ do
  @user = students.create(name: "Example", email: "uid@example.com",
                      password: "123456", password_confirmation: "123456")
end

Given /^the user submits correct username and password$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end


Given /^the user visits the update personal information page$/ do
  visit personal_info
end

Given /^the user clicks on update link$/ do
  click_link "Update_info"
end

When /^he submits his valid password$/ do
  fill_in "Name" , with: "Test Name"
  fill_in "Password" , with: @user.password
  click_button "Update"
end

Then /^on clicking the data should be inserted in database$/ do
  student.find("Test Name")
end

