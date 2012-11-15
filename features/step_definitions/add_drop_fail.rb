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
        not (offered_courses.find("drop_requests", @drop))
        not(not registration_form.find("offered_courses", @drop))
        
        not offered_courses.find("accept_requests", "CS100")
end
