@retry(2)
Feature: SortFiles

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/Sort File' folder of SharePoint cloud via Api
		| fileName              | FilePath       |
		| z-auto_test_SRND.mmap | SimpleMap.mmap |
		| k-auto_test_SRND.mmap | SimpleMap.mmap |
		| a-auto_test_SRND.mmap | SimpleMap.mmap |
		| f-auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'Sort File' file
	When User clicks settings icon on content navigation panel

@MindManager @Cloud_Services @SharePoint @SortFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-72] @Upd_Qase
Scenario: Check_that_maps_in_SharePoint_can_be_sorted_A_Z
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

@MindManager @Cloud_Services @SharePoint @SortFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-77] @Do_Not_Run_With_SortFileList @Upd_Qase
Scenario: Check_that_maps_in_SharePoint_can_be_sorted_by_recently_modified_maps
	When User clicks 'Sort Alphabetical' content item
	Then following files are displayed on page to the User:
		| files            |
		| a-auto_test_SRND |
		| f-auto_test_SRND |
		| k-auto_test_SRND |
		| z-auto_test_SRND |
	Then the files are sorted by alphabetical order
	When User clicks settings icon on content navigation panel
	When User clicks 'Sort Most Recent' content item
	Then following files are displayed on page to the User:
		| files            |
		| f-auto_test_SRND |
		| a-auto_test_SRND |
		| k-auto_test_SRND |
		| z-auto_test_SRND |
	Then the files are sorted by most recent