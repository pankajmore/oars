Given /^the user visits the update personal information page$/ do
  visit student_personal_info_path
end

Given /^the user clicks on update link$/ do
  click_link "Update Info"
end

When /^he submits his invalid password$/ do
  fill_in "Name" , with: "Not Name"
  fill_in "Password" , with: "notpassword"
  click_button "Update"
end

Then /^nothing should be updated$/ do
  not Student.find_by_name("Not Name")
end

