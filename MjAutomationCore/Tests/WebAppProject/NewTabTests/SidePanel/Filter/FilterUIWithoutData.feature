@retry(2)
Feature: FilterUIWithoutData

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-696] @Upd_Qase @JIRA[MMCV-10097]
Scenario: Check_the_filter_UI
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath              |
		| auto_test_SRND.mmap | CommonEmptyATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Filter' button of side Toolbox
	Then 'This file does not contain any content that can be used by these filters.' text of empty content is displayed in 'General' section of 'PanelWithMenuButton' side panel with 'Filter' header