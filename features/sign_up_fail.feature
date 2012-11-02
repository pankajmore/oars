Feature: Sign-up

Scenario: Fail

	Given a user visits the signup page
	When he submits registeres username or password mismatches or email-id already taken or required informations not provided
	Then he should see an error message

