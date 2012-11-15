Given /^a user visits the courses page and click on toggle button$/ do
  click_link "Offered Course"
  find_button("1")
end

Then /^navigate to pre-registration and course should be added$/ do
  visit course_requests_path
end

Then /^course id should be there on the pre_registration page$/ do
  page.should have_link('CS101')
end
