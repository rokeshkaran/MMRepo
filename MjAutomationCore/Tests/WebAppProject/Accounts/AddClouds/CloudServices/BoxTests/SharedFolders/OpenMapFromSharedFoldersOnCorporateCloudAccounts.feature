@retry(2)
Feature: OpenMapFromSharedFoldersOnCorporateCloudAccounts

@MindManager @Cloud_Services @Box @SharedFoldersBox @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-99] @Upd_Qase
Scenario: Verify_maps_can_be_opened_from_a_shared_folder_from_the_corporate_box_cloud
Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Box cloud
	Then on the page exist 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	When User select 'Box' content item with 'auto.test@mindmanagercloudqa.com' description
	Then 'Box' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks 'For Automation' folder
	Then 'OpenMapToTestSharedFolders.mmap' file is exist on page
	When User clicks 'OpenMapToTestSharedFolders.mmap' file
	Then Web Editor page is displayed to the User