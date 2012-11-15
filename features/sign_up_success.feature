Feature: Sign-up

Scenario: Success

	Given a user visits the signup page
	And the user enters data
	Then he should get updated in database
	And he should see his profile page
	And he should see a logout button
