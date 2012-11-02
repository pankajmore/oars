# require "webrat"
Given /^a user visits the signin page$/ do
  visit student_sign_in_path
end

When /^he submits invalid username or password$/ do
  click_button "Sign in"
end

Then /^he should see an error message$/ do
  page.should have_selector('div', class:'alert alert-error')
end




