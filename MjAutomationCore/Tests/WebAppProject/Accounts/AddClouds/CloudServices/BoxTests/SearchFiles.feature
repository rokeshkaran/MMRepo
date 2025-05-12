@retry(2)
Feature: SearchFiles

@MindManager @Cloud_Services @Box @Search @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-69] @Upd_Qase @JIRA[MMCV-9261]
Scenario: Check_that_mmap_files_can_be_searched_on_box
	Given User uploads following files to 'For QA automation' folder of Box cloud via Api
		| fileName                | FilePath           |
		| BoxFileSearch_SRND.mmap | 12_Test_Title.mmap |
	When User login to Box cloud
	When User clicks 'For QA automation' folder
	When User waits for data loading
	When User enters 'BoxFileSearch' value in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	Then value 'BoxFileSearch' is displayed in 'service-search-input' field of 'ContentManagerNavigationPanelElement' container
	When User presses the 'Enter' key on the keyboard
	When User waits for data loading
	Then 'BoxFileSearch_SRND.mmap' file is exist on page
	Then '1' Files is displayed on page