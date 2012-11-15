Then /^course id is not there on the pre_registration page$/ do
  not page.should have_link('CS101')
end
