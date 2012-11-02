Feature: Change role

Scenario: Success

	Given an dugc visits the signin page
	And the dugc is registered
	And the dugc submits correct username and password
	And the dugc visits the change role page and assigns the role to a user from instructor
	Then then when the new dugc logins then its attribute is_dugc should be updated and should be able to visit change_role page 
