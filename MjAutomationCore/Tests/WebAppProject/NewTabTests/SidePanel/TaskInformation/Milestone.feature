@retry(2)
Feature: Milestone
Check that it is possible to set and to remove the milestone to the topic from Task Information side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Milestone @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-726] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_set_the_milestone_to_the_topic
	When User clicks 'FT1ST2' topic on Canvas
	Then Topic Border is highlight blue color in 'FT1ST2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks 'Milestone' checkbox of 'PanelByName' side panel with 'Task Information' header
	Then checkbox by label 'Milestone' is checked in 'PanelByName' side panel with 'Task Information' header
	Then Milestone icon is displayed 'FT1ST2' topic infobox
	Then 'D(0)' Start date is displayed to the 'FT1ST2' topic infobox ignore weekend
	Then 'D(0)' Due date is not displayed to the 'FT1ST2' topic infobox 

@MindManager @SidePanel @Milestone @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-727] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_remove_milestone_from_the_topic
	When User clicks 'FT1ST2' topic on Canvas
	Then Topic Border is highlight blue color in 'FT1ST2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks 'Milestone' checkbox of 'PanelByName' side panel with 'Task Information' header
	Then checkbox by label 'Milestone' is checked in 'PanelByName' side panel with 'Task Information' header
	Then Milestone icon is displayed 'FT1ST2' topic infobox
	When User unchecks 'Milestone' checkbox of 'PanelByName' side panel with 'Task Information' header
	Then checkbox by label 'Milestone' is unchecked in 'PanelByName' side panel with 'Task Information' header
	Then Milestone icon not is displayed 'FT1ST2' topic infobox
	Then 'D(0)' Start date is displayed to the 'FT1ST2' topic infobox ignore weekend
	Then 'D(0)' Due date is displayed to the 'FT1ST2' topic infobox ignore weekend