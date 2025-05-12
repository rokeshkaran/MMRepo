@retry(2)
Feature: LoginLogout

@MindManager @Cloud_Services @OneDrive @LoginLogout @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-56] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_OneDrive_cloud_service_account
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Files' item with 'drive' description is exist on page
	Then 'Shared With Me' item with 'drive' description is exist on page

@MindManager @Cloud_Services @OneDrive @LoginLogout @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-83] @Health_Check @Upd_Qase
Scenario: Log_out_from_OneDrive
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Files' item with 'drive' description is exist on page
	Then 'Shared With Me' item with 'drive' description is exist on page
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of OneDrive' item with 'auto.test@mindmanagercloudqa.com' description is exist on page
	When User clicks 'Sign Out of OneDrive' content item with 'auto.test@mindmanagercloudqa.com' description
	Then 'OneDrive' item with 'auto.test@mindmanagercloudqa.com' description is not dislayed on content manager page