Feature: Add drop

Scenario: Fail
	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	And the user visits add-drop page 
	When the user drops a course 
	And the user visits the offered_courses page and adds a course
	Then  the databases are not updated according to the removal and addition of the respective courses
	 
