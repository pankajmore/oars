Given /^a user visits the signin page$/ do
        visit student_sign_in
end

Given /^the user is registered$/ do
        @user = students.create(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
end

Given /^the user submits correct username and password$/ do
        fill_in "Email",    with: @user.email
        fill_in "Password", with: @user.password 
        click_button "Sign in"
end

Given /^the user visits Registration page and clicks on Pre Registration button$/ do
        visit current_registration
        click_button "Pre Registration"
end

When /^the user clicks on accepted courses' Add button and submits the form/ do
        @added = find_button ("Add").value
        click_button "Add"
        click_button "Submit Form"
end

Then /^the course is removed from the database of accepted_courses and is added to the registration_form$/ do
        !student.find("accepted_courses", @added)
        registration_form.find("offered_courses", @added)
end
