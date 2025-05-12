@retry(2)
Feature: SortFiles

@MindManager @Cloud_Services @Box @SortFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-74] @Upd_Qase
Scenario: Check_that_maps_in_Box_can_be_sorted_by_A_to_Z
	Given User uploads following files to 'Sort File' folder of Box cloud via Api
		| fileName              | FilePath       |
		| z-auto_test_SRND.mmap | SimpleMap.mmap |
		| k-auto_test_SRND.mmap | SimpleMap.mmap |
		| a-auto_test_SRND.mmap | SimpleMap.mmap |
		| f-auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to Box cloud
	When User clicks 'For QA automation' folder
	When User clicks 'Sort File' file
	When User clicks settings icon on content navigation panel
	Then 'Sort Most Recent' content item is selected
	When User clicks 'Sort Alphabetical' content item
	Then following files are displayed on page to the User:
		| files            |
		| a-auto_test_SRND |
		| f-auto_test_SRND |
		| k-auto_test_SRND |
		| z-auto_test_SRND |
	Then the files are sorted by alphabetical order
	When User clicks settings icon on content navigation panel
	Then 'Sort Alphabetical' content item is selected

@MindManager @Cloud_Services @Box @SortFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-79] @Upd_Qase
Scenario: Check_that_maps_in_Box_can_be_sorted_by_recently_modified_maps
	Given User uploads following files to 'Sort File' folder of Box cloud via Api
		| fileName              | FilePath       |
		| z-auto_test_SRND.mmap | SimpleMap.mmap |
		| k-auto_test_SRND.mmap | SimpleMap.mmap |
		| a-auto_test_SRND.mmap | SimpleMap.mmap |
		| f-auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to Box cloud
	When User clicks 'For QA automation' folder
	When User clicks 'Sort File' file
	When User clicks settings icon on content navigation panel
	Then 'Sort Most Recent' content item is selected
	When User clicks Back button on content navigation panel
	Then the files are sorted by most recent