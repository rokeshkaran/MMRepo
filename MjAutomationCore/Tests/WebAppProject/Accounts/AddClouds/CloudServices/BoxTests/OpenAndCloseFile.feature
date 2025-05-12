@retry(2)
Feature: OpenAndCloseFile

@MindManager @Cloud_Services @Box @OpenAndCloseFile @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-63] @Health_Check @Upd_Qase
Scenario: Verify_that_maps_can_be_opened_and_closed_from_Box
	Given User uploads following files to 'For QA automation' folder of Box cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Box cloud
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'close' name in 'file' menu
	Then 'My Files' tab is active on file manager header page