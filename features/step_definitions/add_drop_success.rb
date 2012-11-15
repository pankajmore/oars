Then /^ remove and add the respective courses from\/to databases$/ do
        offered_courses.find("drop_requests", @drop)
        !registration_form.find("offered_courses", @drop)
        
        offered_courses.find("accept_requests", "CS100")
end
