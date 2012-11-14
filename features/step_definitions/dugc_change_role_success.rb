# require "webrat"
Given /^an dugc visits the signin page$/ do
  visit instructor_sign_in
end

Given /^the dugc is registered$/ do
  @user = instructor.create(name: "Example User", email: "user@example.com",
                      password: "foobar", password_confirmation: "foobar" , is_dugc: True)
end

Given /^the dugc submits correct username and password$/ do
  fill_in "Email",    with: @user.email
  fill_in "Password", with: @user.password 
  click_button "Sign in"
end

Given /^the dugc visits the change role page and assigns the role to a user from instructor$/ do
  click_link "Change Role"
  fill_in "Password", with: @user.password 
  @newdugc = instructor.create(name: "New Dugc", email: "newdugc@example.com",
                      password: "newpassword", password_confirmation: "newpassword")
  fill_in "Name" , with: @newdugc.name
  click_link "Log out"
end

Then /^then when the new dugc logins then its attribute is_dugc should be updated and should be able to visit change_role page $/ do
  visit instructor_sign_in
  fill_in "Email",    with: @newdugc.email
  fill_in "Password", with: @newdugc.password 
  click_button "Sign in"
  page.should have_link("Change Role", href: instructor_change_role)
  instructor.find("name",@newdugc).get_attribute("is_dugc")==True
end

