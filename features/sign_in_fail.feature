Feature: Sign-in

Scenario: Fail

	Given a user visits the signin page
	When he submits invalid username or password
	Then he should see an error message


