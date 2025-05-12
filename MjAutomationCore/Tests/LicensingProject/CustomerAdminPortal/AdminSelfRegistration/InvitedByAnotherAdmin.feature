@retry(2)
Feature: InvitedByAnotherAdmin
Check invited by another admin

Background: Pre-condition
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	And User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	And User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	And admin 'Automation_testSRND' accepts BULA terms via API
	And User refresh page
	And User clicks 'Add Admin' button
	And User enters 'auto.test+SRND@mindmanager.onmicrosoft.com' value in the 'email' field in 'add-admin' dialog
	And User clicks 'Submit' button in 'add-admin' dialog
	
@Licensing @CustomerAdminPortal @InvitedByAnotherAdmin @QA @Staging @Qase[LICENSE-95] @Do_Not_Run_With_InvitedByAnotherAdmin @CleanupOutlookEmail @Cleanup @Upd_Qase
Scenario: Via_link_in_the_email
	When User navigates on self registration link in the received email for email address 'auto.test@mindmanager.onmicrosoft.com'
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	And User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	When User clicks 'Sign In' button
	And User enters '<emailAddress>' in the 'email' field
	And User enters '<password>' in the 'password' field
	And User clicks 'Sign In' button
	And User clicks 'Something Else' button for use case options on Right Side panel
	Then Rows with following values is displayed in 'admin-home-admins' table:
		| ColumnName    | Value1                    | Value2         |
		| Administrator | auto.test.mm.lc@gmail.com | <emailAddress> |

Examples:
	| emailAddress                               | password   |
	| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @CustomerAdminPortal @InvitedByAnotherAdmin @QA @Staging @Qase[LICENSE-96] @Do_Not_Run_With_InvitedByAnotherAdmin @AccountCreationEmailCleanup @Cleanup @Upd_Qase
Scenario: Via_the_admin
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	And User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	Given User is on Customer Admin Portal website
	When User clicks 'Sign In' button
	And User enters '<emailAddress>' in the 'email' field
	And User enters '<password>' in the 'password' field
	And User clicks 'Sign In' button
	And User clicks 'Something Else' button for use case options on Right Side panel
	Then Rows with following values is displayed in 'admin-home-admins' table:
		| ColumnName    | Value1                    | Value2         |
		| Administrator | auto.test.mm.lc@gmail.com | <emailAddress> |

Examples:
	| emailAddress                               | password   |
	| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |

@Licensing @CustomerAdminPortal @InvitedByAnotherAdmin @QA @Staging @Qase[LICENSE-438] @Do_Not_Run_With_InvitedByAnotherAdmin @CleanupOutlookEmail @Cleanup @Upd_Qase
Scenario: To_verify_it_is_possible_to_self_register_as_an_admin_in_case_UserA_was_invited_as_admin_by_UserB
	#MM app
	Given User account
		| Email          | Password   |
		| <emailAddress> | <password> |
	And User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	When User navigates on self registration link in the received email for email address 'auto.test@mindmanager.onmicrosoft.com'
	And User clicks 'Sign In' button
	And User enters '<emailAddress>' in the 'email' field
	And User enters '<password>' in the 'password' field
	And User clicks 'Sign In' button
	And User clicks 'Something Else' button for use case options on Right Side panel
	Then Rows with following values is displayed in 'admin-home-admins' table:
		| ColumnName    | Value1                    | Value2         |
		| Administrator | auto.test.mm.lc@gmail.com | <emailAddress> |

Examples:
	| emailAddress                               | password   |
	| auto.test+SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |