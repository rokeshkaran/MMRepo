@retry(2)
Feature: Duplicate
Check that files can be duplicate on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1911] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_duplicate_mmap_file
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User clicks 'RuntimeData File' folder
	When User hovers on 'auto_test_SRND' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Duplicate' item in 'service-items-action' dropdown menu
	Then 'choose-name-dialog' dialog is displayed to User
	When User clicks 'Duplicate' button in 'choose-name-dialog' dialog
	Then 'Copy of auto_test_SRND' item is displayed on content manager page
	When User remembers 'Copy of auto_test_SRND.mmap' mindmanager cloud item details from 'For QA Automation/RuntimeData File' directory via API

@MindManager @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1912] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_duplicate_mdeck_file
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName             | ItemPath    |
		| auto_test_SRND.mdeck | Slide.mdeck |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User clicks 'For QA Automation' folder
	When User waits for data loading
	When User clicks 'RuntimeData File' folder
	When User waits for data loading
	When User hovers on 'auto_test_SRND.mdeck' file and clicks on 'triple-dot-actions' action button
	Then 'service-items-action' dropdown menu is displayed to User
	When User clicks 'Duplicate' item in 'service-items-action' dropdown menu
	Then 'choose-name-dialog' dialog is displayed to User
	When User clicks 'Duplicate' button in 'choose-name-dialog' dialog
	When User waits for data loading
	Then 'Copy of auto_test_SRND.mdeck' item is displayed on content manager page
	When User remembers 'Copy of auto_test_SRND.mdeck' mindmanager cloud item details from 'For QA Automation/RuntimeData File' directory via API