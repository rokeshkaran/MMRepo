@retry(2)
Feature: FromRoot
Check that files can be opened on root folder in MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1913] @Health_Check @Upd_Qase
Scenario: Verify_that_it_is_possible_to_open_mmap_file_from_root_folder
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'auto_test_SRND' file
	Then Web Editor page is displayed to the User
	Then 'auto_test_SRND' map name is displayed on Toolbar

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1914] @Health_Check @Upd_Qase
Scenario: Verify_that_it_is_possible_to_open_mdeck_file_from_root_folder
	Given User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName             | ItemPath    |
		| auto_test_SRND.mdeck | Slide.mdeck |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits '1000' miliseconds
	When User clicks 'auto_test_SRND.mdeck' file
	Then Web Editor page is displayed to the User