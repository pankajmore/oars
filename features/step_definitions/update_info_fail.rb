Given /^the user visits the update personal information page$/ do
  visit personal_info
end

Given /^the user clicks on update link$/ do
  click_link "Update_info"
end

When /^he submits his invalid password$/ do
  fill_in "Name" , with: "Not Name"
  fill_in "Password" , with: "notpassword"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

Then /^nothing should be updated$/ do
  student.find("name","Not Name")
end

