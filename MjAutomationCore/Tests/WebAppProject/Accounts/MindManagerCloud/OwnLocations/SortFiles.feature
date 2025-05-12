@retry(2)
Feature: SortFiles

@MindManager @Cloud_Services @SortFileList @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase @JIRA[MMCV-9701,MMCV-10066]
Scenario: Check_that_number_of_maps_in_MMC
	Given User is logged into MindManager web app via Api
	Then '150' files count is located in 'MMCFileSorting' folder on Mind Manager сloud for regular user via API
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits for data loading
	When User clicks 'MMCFileSorting' folder
	When User waits for data loading
	Then '100' Files is displayed on page
	When User scrolls down content manager files
	Then '150' Files is displayed on page