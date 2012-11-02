Feature: Update-info

Scenario: Success

	Given a user visits the signin page
	And the user is registered
	And the user submits correct username and password
	And the user visits the update personal information page
	And the user clicks on update link
	When he submits his valid password
	Then on clicking the data should be inserted in database

