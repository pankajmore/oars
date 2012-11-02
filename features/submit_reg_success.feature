Feature: Submit-reg

Scenario: Success

	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	And the user visits Registration page and clicks on Pre Registration button
	When the user clicks on accepted courses' Add button and submits the form do
	Then the course is removed from the database of accepted_courses and is added to the registration_form
