Feature: Pre-reg

Scenario: Success

	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	And a user visits the courses page and click on toggle button
	Then navigate to pre-registration and course should be added
	And course id should be there on the pre_registration page
