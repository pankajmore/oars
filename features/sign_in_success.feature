Feature: Sign-in

Scenario: Success

	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	Then he should see his profile page
	And he should see a logout button

