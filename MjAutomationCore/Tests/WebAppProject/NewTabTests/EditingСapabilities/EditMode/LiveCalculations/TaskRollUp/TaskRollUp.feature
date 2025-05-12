@retry(2)
Feature: TaskRollUp
Task duration scenario

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-354] @Upd_Qase
Scenario: To_verify_that_Roll_up_task_progress_is_automatically_recounted_when_subtopic_progress_is_changed
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath        |
		| auto_test_SRND.mmap | TaskRollUp.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '25% done' Icon is displayed to the 'Topic A' Topic
	And '25% done' Icon is displayed to the 'Central Topic' Topic
	When User clicks '25% done' icon in 'Topic A' topic
	Then '50% done' Icon is displayed to the 'Topic A' Topic
	And '50% done' Icon is displayed to the 'Central Topic' Topic
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks '75% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '75% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '75% done' Icon is displayed to the 'Topic B' Topic
	And '63%' Icon is displayed to the 'Central Topic' Topic
	When User enters '05/03/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then ': 2 workday(s)' date info is displayed to the 'Topic B' topic infobox
	And ': 2 workday(s)' date info is displayed to the 'Central Topic' topic infobox
	And '67%' Icon is displayed to the 'Central Topic' Topic

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-355] @Upd_Qase @JIRA[MMCV-8859]
Scenario: To_verify_that_roll_up_the_topic_is_automatically_recounted_once_subtopic_is_modified
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                |
		| auto_test_SRND.mmap | TaskRollUpDuration.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/15/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/17/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then ': 3 workday(s)' date info is displayed to the 'Central Topic' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/15/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/22/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then ': 6 workday(s)' date info is displayed to the 'Central Topic' topic infobox
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/13/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/20/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then ': 8 workday(s)' date info is displayed to the 'Central Topic' topic infobox

@MindManager @EditingCapabilities @EditMode @LiveCalculations @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-356] @Upd_Qase @JIRA[MMCV-8859]
Scenario: To_verify_that_Start_and_Due_dates_are_recalculated_automatically_on_roll_up_topic_once_the_dates_are_changed_in_the_branch
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                |
		| auto_test_SRND.mmap | TaskRollUpDuration.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/15/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/17/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/15' Start date is displayed to the 'Topic A' topic infobox
	And '- 3/17' Due date is displayed to the 'Topic A' topic infobox
	And '3/15' Start date is displayed to the 'Central Topic' topic infobox
	And '- 3/17' Due date is displayed to the 'Central Topic' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/15/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/22/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/15' Start date is displayed to the 'Topic B' topic infobox
	And '- 3/22' Due date is displayed to the 'Topic B' topic infobox
	And '3/15' Start date is displayed to the 'Central Topic' topic infobox
	And '- 3/22' Due date is displayed to the 'Central Topic' topic infobox
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/13/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/20/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/13' Start date is displayed to the 'Topic D' topic infobox
	And '- 3/22' Due date is displayed to the 'Topic D' topic infobox
	And '3/13' Start date is displayed to the 'Central Topic' topic infobox
	And '- 3/22' Due date is displayed to the 'Central Topic' topic infobox