@retry(2)
Feature: Dates
Check that it is possible add Start date and Due date

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Dates @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-734] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_Start_Date_to_the_topic
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header ignore weekend
	Then 'D(0)' Start date is displayed to the 'CT' topic infobox ignore weekend

@MindManager @SidePanel @Dates @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-735] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_Due_Date_to_the_topic
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'D(0)' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header ignore weekend
	Then 'D(0)' Due date is displayed to the 'CT' topic infobox ignore weekend