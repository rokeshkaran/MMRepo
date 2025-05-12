@retry(2)
Feature: FromSubFolder
Check that files can be open from subfolder on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1915] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_open_mmap_file_from_sub_folder
	When User create 'Test_WEB_1915_SRND' folder in '/' directory of Mind Manager Cloud via API
	Given User uploads following files to 'Test_WEB_1915_SRND' folder of Mind Manager cloud via Api
		| ItemName                     | ItemPath       |
		| auto_test_WEB_1915_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'Test_WEB_1915_SRND' folder
	When User clicks 'auto_test_WEB_1915_SRND' file
	Then Web Editor page is displayed to the User
	Then 'auto_test_WEB_1915_SRND' map name is displayed on Toolbar

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1916] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_open_mdeck_file_from_sub_folder
	When User create 'Test_WEB_1916_SRND' folder in '/' directory of Mind Manager Cloud via API
	Given User uploads following files to 'Test_WEB_1916_SRND' folder of Mind Manager cloud via Api
		| ItemName                      | ItemPath    |
		| auto_test_WEB_1916_SRND.mdeck | Slide.mdeck |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'Test_WEB_1916_SRND' folder
	When User clicks 'auto_test_WEB_1916_SRND.mdeck' file
	Then Web Editor page is displayed to the User