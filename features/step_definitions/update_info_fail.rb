Given /^the user visits the update personal information page$/ do
  visit student_personal_info_path
end

Given /^the user clicks on update link$/ do
  visit "/students/edit"
end

When /^he submits his invalid password$/ do
  #fill_in "student_name" , with: "Not Name"
  #fill_in "student_current_password" , with: "notpassword"
  click_button "Update"
end

Then /^he should see an error message$/ do
  page.should have_selector('div', class:'alert alert-error')
end

Then /^nothing should be updated$/ do
  not Student.find_by_name("Not Name")
end

