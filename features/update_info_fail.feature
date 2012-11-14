Feature: Update-info

Scenario: Fail

	Given the user visits the update personal information page
	And the user clicks on update link
	When he submits his invalid password
	Then he should see an error message
	And nothing should be updated
