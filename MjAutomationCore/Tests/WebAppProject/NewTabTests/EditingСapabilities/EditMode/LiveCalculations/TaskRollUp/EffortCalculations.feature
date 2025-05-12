@retry(2)
Feature: EffortCalculations
Effort Calculation Scenarios

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                 |
		| auto_test_SRND.mmap | AddResourceDuration.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-357] @Upd_Qase @JIRA[MMCV-9090,MMCV-9410]
Scenario: To_verify_that_the_absence_of_duration_results_in_zero_efforts
	When User mouses over 'John' resource in 'Topic A' topic infobox
	Then 'Resources: John@200%' tooltip is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '05/02/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '5/2' Start date is displayed to the 'Topic A' topic infobox
	And '- __' Due date is displayed to the 'Topic A' topic infobox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '05/02/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 5/2' Due date is displayed to the 'Topic A' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Topic A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	And User enters '05/03/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 5/3' Due date is displayed to the 'Topic A' topic infobox
	And ': 2 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And 'Effort: 4 workday(s)' effort info is displayed to the 'Topic A' topic infobox
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is unchecked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And '- 5/3' Due date is not displayed to the 'Topic A' topic infobox
	And '- __' Due date is displayed to the 'Topic A' topic infobox
	When User unchecks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is unchecked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And '5/2' Start date is not displayed to the 'Topic A' topic infobox
	And Date box is not displayed in the 'Topic A' topic infobox on Canvas
	And ': 2 workday(s)' date info is not displayed to the 'Topic A' topic infobox
	And 'Effort: 4 workday(s)' effort info is not displayed to the 'Topic A' topic infobox

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-358] @Upd_Qase
Scenario: To_verify_that_empty_resources_result_in_zero_efforts
	Then ': 1 workday(s)' date info is displayed to the 'Topic B' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'Tester' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Tester' resource is displayed in 'Topic B' topic
	And ': 1 workday(s)' date info is displayed to the 'Topic B' topic infobox
	When User enter 'Developer' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Tester' resource is displayed in 'Topic B' topic
	And 'Developer' resource is displayed in 'Topic B' topic
	And ': 1 workday(s)' date info is displayed to the 'Topic B' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Topic B' topic infobox

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-359] @Upd_Qase
Scenario: To_verify_that_the_Efforts_are_recounted_once_the_Resources_are_modified
	Then ': 2 workday(s)' date info is displayed to the 'Topic D' topic infobox
	And 'Garen' resource is displayed in 'Topic D' topic
	And 'Effort: 4 workday(s)' effort info is not displayed to the 'Topic D' topic infobox
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'Jarvan' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Jarvan' resource is displayed in 'Topic D' topic
	And ': 2 workday(s)' date info is displayed to the 'Topic D' topic infobox
	And 'Effort: 4 workday(s)' effort info is displayed to the 'Topic D' topic infobox
	When User enter 'John' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'John' resource is displayed in 'Topic D' topic
	And ': 2 workday(s)' date info is displayed to the 'Topic D' topic infobox
	And 'Effort: 6 workday(s)' effort info is displayed to the 'Topic D' topic infobox

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-360] @Upd_Qase
Scenario: To_verify_that_the_Efforts_will_be_recounted_once_the_duration_is_modified
	Then ': 1 workday(s)' date info is displayed to the 'Topic E' topic infobox
	And 'Garen' resource is displayed in 'Topic E' topic
	And 'John' resource is displayed in 'Topic E' topic
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Topic E' topic infobox
	When User clicks 'Topic E' topic on Canvas
	Then 'Topic E' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '05/08/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 5/8' Due date is displayed to the 'Topic E' topic infobox
	And ': 6 workday(s)' date info is displayed to the 'Topic E' topic infobox
	And 'Garen' resource is displayed in 'Topic E' topic
	And 'John' resource is displayed in 'Topic E' topic
	And 'Effort: 12 workday(s)' effort info is displayed to the 'Topic E' topic infobox