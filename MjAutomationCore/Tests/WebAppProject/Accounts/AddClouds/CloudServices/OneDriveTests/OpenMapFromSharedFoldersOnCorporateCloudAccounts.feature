@retry(2)
Feature: OpenMapFromSharedFoldersOnCorporateCloudAccounts

@MindManager @Cloud_Services @OneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-101] @Upd_Qase
Scenario: Verify_maps_can_be_opened_from_a_shared_folder_from_the_corporate_box_cloud
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Files' item with 'drive' description is exist on page
	Then 'Shared With Me' item with 'drive' description is exist on page
	When User clicks 'Shared With Me' folder
	When User clicks 'OpenMapToTestSharedFolders' file
	Then Web Editor page is displayed to the User