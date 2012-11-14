Feature: Add drop

Scenario: Success

	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	And the user visits add-drop page
	When the user drops a course
	When the user visits the offered_courses page and adds a course
	Then  remove and add the respective courses from to databases
