@retry(2)
Feature: CreateAccountOnJoiningSession
Verification that it is possible to create MM account on joining the co-editing session

@MindManager @CreateAccountOnJoiningSession @App_QA @App_Staging @Cleanup @Qase[WEB-23] @Upd_Qase @JIRA[MMCV-9693,MMCV-9720]
Scenario: Create_account_on_joining_session
	#Sales portal
	When User creates new Customer on Sales portal via Api
		| Name           | Type       |
		| <customerName> | enterprise |
	When User creates new Purchase on Sales portal via Api
		| CustomerName   | Seats | ProductId      | EndDate |
		| <customerName> | 1     | MMSUBSCRIPTION | D(1)    |
	#Admin portal
	When User is logged in to '<customerName>' customer on Admin portal via Api
	When '<customerName>' Admin makes subscription action via API
		| ActionType | PurchaseId     | Emails         |
		| add        | MMSUBSCRIPTION | <emailAddress> |
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	#MM app
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When User clicks 'Create Account' button
	Then User sees 'Create your free account' header on Right Side panel
	Then User sees 'Sign up today and start building your first map in minutes.' text messege on Right Side panel
	When User fills account creation fields for new UI
		| Email          | FullName       | Password   |
		| <emailAddress> | Automation_RND | 6j9k2!SRND |
	When User clicks 'Create Account' button
	Then User sees 'Verify your account to continue' subheader on Right Side panel
	Then User sees 'An email was just sent to <emailAddress>(change email) from noreply@mindmanager.com. Please follow the instructions in the email, then come back here and click "Continue" to complete your account setup.' text messege on Right Side panel
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '1' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User login to SharePoint
	Then Web Editor page is displayed to the User
	Then text 'FTCO' is displayed to the topic on Canvas

Examples:
	| customerName        | emailAddress                               |
	| Automation_testSRND | auto.test+SRND@mindmanager.onmicrosoft.com |