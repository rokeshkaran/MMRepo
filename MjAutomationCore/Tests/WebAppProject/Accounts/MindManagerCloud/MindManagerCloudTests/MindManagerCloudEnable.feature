@retry(2)
Feature: MindManagerCloudEnable
Check the restriction on MM When mm files is disable

Background: Pre-condition
	#Creating an account in the MM app
	Given User account
		| Email                                         | Password   |
		| auto.test+245SRND@mindmanager.onmicrosoft.com | 6j9k2!SRND |
	Given User account user metadata
		| FirstName  | LastName   | AcceptedTerms |
		| Automation | Automation | true          |
	When User creates given user and confirms the account via Api
	Then newly created account successfully created
	#Creating Customer on Sales portal
	When User creates new Customer on Sales portal via Api
		| Name                | Type       |
		| Automation_testSRND | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName        | Seats | ProductId      | EndDate |
		| Automation_testSRND | 2     | MMSUBSCRIPTION | D(10)   |
	#Admin portal
	When User is logged in to 'Automation_testSRND' customer on Admin portal via Api
	When admin 'Automation_testSRND' accepts BULA terms via API
	When 'Automation_testSRND' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails                                        |
		| add        | MMSUBSCRIPTION | auto.test+245SRND@mindmanager.onmicrosoft.com |
	When User refresh page
	When User clicks 'Settings' button
	When User close 'analytics-opt-in-dialog' dialog
	Then 'Allow MindManager Files' checkbox is checked in section content group with 'Online Storage Providers' header
	#MM app
	When User open new tab in browser
	Given User is logged into 'auto.test+245SRND@mindmanager.onmicrosoft.com' newly created account of MindManager web app via Api

@MindManager @MindManagerCloud @App_QA @App_Staging @Qase[WEB-2197] @Cleanup @Upd_Qase
Scenario: Verify_that_MindManager_Files_is__displayed_in_Browse_menu_when_allow_MMfiles_is_checked_on_admin_portal
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then 'MindManager Files' content item is displayed on content manager page