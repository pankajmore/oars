When /^he submits his valid password$/ do
  fill_in "Name" , with: "Test Name"
  fill_in "Password" , with: "foobar"
  click_button "Update"
end

Then /^on clicking the data should be inserted in database$/ do
  Student.find_by_name("Test Name")
end

