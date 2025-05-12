Feature: OpenAndCloseFile

@MindManager @Cloud_Services @OneDrive @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-60] @Health_Check @Upd_Qase
Scenario: Check_that_maps_can_be_opened_and_closed_from_OneDrive
	Given User uploads following files to 'For QA automation/RuntimeData File' folder of OneDrive cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Then item with Path 'For QA automation/RuntimeData File/auto_test_SRND.mmap' exists in OneDrive cloud via Api
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to OneDrive cloud
	Then 'OneDrive' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Files' item with 'drive' description is exist on page
	Then 'Shared With Me' item with 'drive' description is exist on page
	When User clicks 'Files' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeData File' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User clicks button with 'close' name in 'file' menu
	Then Recent Files Banner is displayed on Content Manager Page