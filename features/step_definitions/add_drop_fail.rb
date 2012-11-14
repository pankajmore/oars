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

Given /^the user visits add-drop page$/ do
        visit add_drop
end

When /^the user drops a course$/ do
        @drop = find_button ("Drop").value
        click_button "Drop"
end

When /^the user visits the offered_courses page and adds a course$/ do
        visit courses
        click_button "Offered Courses"
        click_link "CS100" #click_link "Add" or click_link_within "course id", "Add"
end

Then /^ the databases are not updated according to the removal and addition of the respective courses$/ do
        !(offered_courses.find("drop_requests", @drop))
        !(!registration_form.find("offered_courses", @drop))
        
        !offered_courses.find("accept_requests", "CS100")
end