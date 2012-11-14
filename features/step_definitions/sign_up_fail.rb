require "webrat"
Given /^a user visits the signup page$/ do
  visit student_sign_up
end

When /^he submits registeres username or password mismatches or email\-id already taken or required informations not provided$/ do
  click_button "Sign up"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end


