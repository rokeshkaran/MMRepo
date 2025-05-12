@retry(2)
Feature: SupportMultipleCloudStorageAccountsForSameProvider
Background: Pre-condition
	Given User is on the Mindmanager website
	When User clicks 'Create Account' button
	When User fills account creation fields for new UI
		| Email                                      | FullName            | Password  |
		| auto.test+SRND@mindmanager.onmicrosoft.com | Automation_RND Test | TYf78!RND |
	When User clicks 'Create Account' button
	When User waits for data loading
	When User accepts Optanon cookies
	When User activates newly created Mind Manager account in outlook for 'auto.test@mindmanager.onmicrosoft.com' email address with 'Please verify your MindManager account' email title header and 'Something Else' use case button
	When User switches to '0' tab
	When User clicks 'Something Else' button for use case options on Right Side panel
	When User waits for data loading
	Then User sees 'You don't have a license to use this product.' header on Right Side panel
	When User clicks 'Start Free Trial' button

@MindManager @Cloud_Services @OneDrive @SupportMultipleCloudStorageAccountsForSameProvider @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-97] @Upd_Qase @Not_Run
Scenario: Check_that_it_possible_to_add_multiple_onedrive_cloud_service_account
	When User close Admin System Message for User '<emailAddress>' and Password '<password>' via API
	When User refresh page
	When User waits for data loading
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	# User '1' logs in onedrive
	When User login to OneDrive cloud
	When User clicks close button in 'upsell-dialog' dialog
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'My Files' tab is active on file manager header page
	When User clicks Back button on content navigation panel
	Then on the page exist 'Add Place' content item with 'Tap to Select Storage Provider' description
	When User clicks 'Add Place' content item
	# User '2' logs in onedrive
	When User '2' login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test.2@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	# Verify account occurance
	Then 'OneDrive' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page
	Then 'OneDrive' item with 'auto.test.2@mindmanagercloudqa.com' description is displayed on content manager page
	Then on the page exist 'Add Place' content item with 'Tap to Select Storage Provider' description
	When User clicks 'OneDrive' content item with 'auto.test.2@mindmanagercloudqa.com' description
	Then content page is displayed to User
	Then 'OneDrive' cloud with 'auto.test.2@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of OneDrive' item with 'auto.test.2@mindmanagercloudqa.com' description is exist on page
	# Verify sign out
	When User clicks 'Sign Out of OneDrive' content item with 'auto.test.2@mindmanagercloudqa.com' description
	Then 'My Files' tab is active on file manager header page
	Then 'OneDrive' item with 'auto.test.2@mindmanagercloudqa.com' description is not dislayed on content manager page
	Then 'OneDrive' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page
	
Examples:
	| emailAddress								  | password  |
	|  auto.test+SRND@mindmanager.onmicrosoft.com | TYf78!RND |