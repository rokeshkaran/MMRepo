@retry(2)
Feature: Resources
Check that it is possible to add and remove Resource from Task Information side panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @SidePanel @Resources @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-737] @Upd_Qase
Scenario: Verify_it_is_possible_to_add_resources
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'TestResource' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'TestResource' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'TestResource' resource is displayed in 'CT' topic

@MindManager @SidePanel @Resources @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-737] @Upd_Qase
Scenario: Verify_it_is_possible_to_remove_resources
	When User clicks 'MT3' topic on Canvas
	Then Topic Border is highlight blue color in 'MT3' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then 'Resource #1' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Resource #1' resource is displayed in 'MT3' topic
	When User clicks Remove on 'Resource #1' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then 'Resource #1' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Resource #1' resource is not displayed in 'MT3' topic