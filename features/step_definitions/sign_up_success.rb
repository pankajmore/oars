Given /^a user visits the signup page$/ do
  visit student_sign_up_path
end

Given /^the user enters data$/ do
  fill_in "Username",    with: "example"
  fill_in "Email",    with: "example@example.com"
  fill_in "Password",    with: "foobar"
  fill_in "Password confirmation",    with: "foobar"
  fill_in "Name", with: "Example name"
  fill_in "Phone",    with: "1234567890"
  click_button "Sign up"
end

Then /^he should get updated in database$/ do
  not Student.find_by_email("example@example.com").nil?
end

Then /^he should see his profile page$/ do
  page.should have_link('Personal Information')
end

Then /^he should see a signout button$/ do
  page.should have_link('Log Out', href: '/students/sign_out')
end

