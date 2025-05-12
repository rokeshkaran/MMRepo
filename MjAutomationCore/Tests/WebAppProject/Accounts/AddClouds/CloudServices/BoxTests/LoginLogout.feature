@retry(2)
Feature: LoginLogout

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User

@MindManager @Cloud_Services @Box @LoginLogout @App_QA @App_Staging @App_Prod @Qase[WEB-58] @Upd_Qase
Scenario: Check_that_it_possible_to_add_Box_cloud_service_account
	When User clicks 'Add Place' content item
	When User clicks 'Box' content item
	When User login to Box
	Then content page is displayed to User
	Then 'Box' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'For QA automation' folder with 'Folder' description is exist on page

@MindManager @Cloud_Services @Box @LoginLogout @Do_Not_Run_With_Box @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-80] @Health_Check @Upd_Qase
Scenario: Log_out_from_Box
	When User login to Box cloud
	Then on the page exist 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	When User select 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	Then 'Box' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'For QA automation' item with 'Folder' description is exist on page
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of Box' item with 'auto.test@mindmanagercloudqa.com' description is exist on page
	When User clicks 'Sign Out of Box' content item with 'auto.test@mindmanagercloudqa.com' description
	Then 'Box' item with 'auto.test@mindmanagercloudqa.com' description is not dislayed on content manager page