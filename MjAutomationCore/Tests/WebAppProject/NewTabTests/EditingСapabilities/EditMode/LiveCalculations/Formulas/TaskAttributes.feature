@retry(2)
Feature: TaskAttributes
Verify task info formula

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-342] @Upd_Qase @JIRA[MMCV-10549]
Scenario: To_verify_that_task_info_Resource_Cost_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath           |
		| auto_test_SRND.mmap | ResourceCostA.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Resource Cost Paul' property is displayed in 'Topic A' topic infobox
	And value '0' is displayed for 'Resource Cost Paul' property in 'Topic A' topic infobox
	And 'Paul' resource is displayed in 'Callout A' topic
	When User clicks 'Callout A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Callout A' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/24/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then '2/24' Start date is displayed to the 'Callout A' topic infobox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/24/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then '2/24' Due date is displayed to the 'Callout A' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Callout A' topic infobox
	And Cost icon with value '$80.00' is displayed on 'Callout A' topic on Canvas
	And value '80' is displayed for 'Resource Cost Paul' property in 'Topic A' topic infobox
	When User enters '200' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then Cost icon with value '$280.00' is displayed on 'Callout A' topic on Canvas
	And value '80' is displayed for 'Resource Cost Paul' property in 'Topic A' topic infobox
	When User waits '1000' miliseconds
	And User enters '02/22/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then '2/22' Start date is displayed to the 'Callout A' topic infobox
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	And User enters '02/24/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/24' Due date is displayed to the 'Callout A' topic infobox
	And ': 3 workday(s)' date info is displayed to the 'Callout A' topic infobox
	And Cost icon with value '$440.00' is displayed on 'Callout A' topic on Canvas
	And value '240' is displayed for 'Resource Cost Paul' property in 'Topic A' topic infobox
	When User mouses over cost icon with value '$440.00' is displayed on 'Callout A' topic on Canvas
	Then '2/22 - 2/24Duration: 3 workday(s)Resources: PaulGeneral Cost: $200.00Paul: $240.00Resource Cost: $240.00Total Cost: $440.00' tooltip is displayed to the User
	And '2/22' Start date is displayed to the 'Callout B' topic infobox
	And '2/22' Due date is displayed to the 'Callout B' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Callout B' topic infobox
	And 'Paul: 2 workday(s)' resource is displayed in 'Callout B' topic
	And Cost icon with value '$160.00' is displayed on 'Callout B' topic on Canvas
	And value '160' is displayed for 'Resource Cost Paul' property in 'Topic B' topic infobox
	When User clicks 'Callout B' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Callout B' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/24/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/22' Start date is displayed to the 'Callout B' topic infobox
	And '2/24' Due date is displayed to the 'Callout B' topic infobox
	And ': 3 workday(s)' date info is displayed to the 'Callout B' topic infobox
	And 'Effort: 6 workday(s)' effort info is displayed to the 'Callout B' topic infobox
	And Cost icon with value '$480.00' is displayed on 'Callout B' topic on Canvas
	And value '480' is displayed for 'Resource Cost Paul' property in 'Topic B' topic infobox
	When User mouses over cost icon with value '$480.00' is displayed on 'Callout B' topic on Canvas
	Then '2/22 - 2/24Duration: 3 workday(s)Effort: Effort: 6 workday(s)Resources: Paul: 6 workday(s)Paul: $480.00Resource Cost: $480.00Total Cost: $480.00' tooltip is displayed to the User

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-343] @Upd_Qase
Scenario: To_verify_that_task_info_General_Cost_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | GeneralCostA.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'General Cost' property is displayed in 'Callout A' topic infobox
	And value '0' is displayed for 'General Cost' property in 'Callout A' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '200' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then Cost icon with value '$200.00' is displayed on 'Topic A' topic on Canvas
	And value '200' is displayed for 'General Cost' property in 'Callout A' topic infobox
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/27/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then '2/27' Start date is displayed to the 'Topic A' topic infobox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/27/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	Then '2/27' Due date is displayed to the 'Topic A' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Topic A' topic infobox
	When User enter 'John' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'John' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'John' resource is displayed in 'Topic A' topic
	And value '200' is displayed for 'General Cost' property in 'Callout A' topic infobox
	And Cost icon with value '$320.00' is displayed on 'Topic A' topic on Canvas
	When User mouses over cost icon with value '$320.00' is displayed on 'Topic A' topic on Canvas
	Then '2/27 - 2/27Duration: 1 workday(s)Resources: JohnGeneral Cost: $200.00John: $120.00Resource Cost: $120.00Total Cost: $320.00' tooltip is displayed to the User
	When User enters '300' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then value '300' is displayed for 'General Cost' property in 'Callout A' topic infobox
	And Cost icon with value '$420.00' is displayed on 'Topic A' topic on Canvas
	When User enters '150.20' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then value '150.2' is displayed for 'General Cost' property in 'Callout A' topic infobox
	And Cost icon with value '$270.20' is displayed on 'Topic A' topic on Canvas

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-344] @Upd_Qase
Scenario: To_verify_that_task_info_Total_Resource_Cost_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | TotalResourceCost.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '2/27' Start date is displayed to the 'Topic A' topic infobox
	And '2/27' Due date is displayed to the 'Topic A' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And 'Total Resource Cost' property is displayed in 'Callout' topic infobox
	And value '0' is displayed for 'Total Resource Cost' property in 'Callout' topic infobox
	When User clicks 'Topic A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'Jack' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Jack' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'Jack' resource is displayed in 'Topic A' topic
	And value '84.8' is displayed for 'Total Resource Cost' property in 'Callout' topic infobox
	And Cost icon with value '$84.80' is displayed on 'Topic A' topic on Canvas
	When User enters '200' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then value '84.8' is displayed for 'Total Resource Cost' property in 'Callout' topic infobox
	And Cost icon with value '$284.80' is displayed on 'Topic A' topic on Canvas
	When User enter 'John' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'John' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'John' resource is displayed in 'Topic A' topic
	And value '164.8' is displayed for 'Total Resource Cost' property in 'Callout' topic infobox
	And Cost icon with value '$364.80' is displayed on 'Topic A' topic on Canvas
	When User mouses over cost icon with value '$364.80' is displayed on 'Topic A' topic on Canvas
	Then '2/27 - 2/27Duration: 1 workday(s)Effort: Effort: 2 workday(s)Resources: Jack,JohnGeneral Cost: $200.00Jack: $84.80John: $80.00Resource Cost: $164.80Total Cost: $364.80' tooltip is displayed to the User
	When User clicks Remove on 'Jack' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then 'Jack' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'Jack' resource is not displayed in 'Topic A' topic
	And 'Effort: 2 workday(s)' effort info is not displayed to the 'Topic A' topic infobox
	And value '80' is displayed for 'Total Resource Cost' property in 'Callout' topic infobox
	And Cost icon with value '$280.00' is displayed on 'Topic A' topic on Canvas

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-345] @JIRA[MMCV-10549] @Upd_Qase
Scenario: To_verify_that_task_info_Total_Cost_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | TotalCost.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '2/22' Start date is displayed to the 'Topic A' topic infobox
	And '2/22' Due date is displayed to the 'Topic A' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Topic A' topic infobox
	And 'Pierre' resource is displayed in 'Topic A' topic
	And 'Paul' resource is displayed in 'Topic A' topic
	And value '366.4' is displayed for 'Total Cost' property in 'Callout' topic infobox
	And Cost icon with value '$366.40' is displayed on 'Topic A' topic on Canvas
	When User mouses over cost icon with value '$366.40' is displayed on 'Topic A' topic on Canvas
	Then '2/22 - 2/22Duration: 1 workday(s)Effort: Effort: 2 workday(s)Resources: Pierre,PaulGeneral Cost: $200.00Pierre: $86.40Paul: $80.00Resource Cost: $166.40Total Cost: $366.40' tooltip is displayed to the User
	When User clicks '2/22' Due date on 'Topic A' topic infobox
	Then Date calender pop up is displayed on canvas
	#Cannot interact with it on automation 
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User waits '1000' miliseconds
	And User enters '02/23/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then ': 2 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And 'Effort: 4 workday(s)' effort info is displayed to the 'Topic A' topic infobox
	And value '532.8' is displayed for 'Total Cost' property in 'Callout' topic infobox
	And Cost icon with value '$532.80' is displayed on 'Topic A' topic on Canvas
	When User mouses over cost icon with value '$532.80' is displayed on 'Topic A' topic on Canvas
	Then '2/22 - 2/23Duration: 2 workday(s)Effort: Effort: 4 workday(s)Resources: Pierre,PaulGeneral Cost: $200.00Pierre: $172.80Paul: $160.00Resource Cost: $332.80Total Cost: $532.80' tooltip is displayed to the User
	When User clicks Remove on 'Paul' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	And 'Paul' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'Paul' resource is not displayed in 'Topic A' topic
	And ': 2 workday(s)' date info is displayed to the 'Topic A' topic infobox
	And value '372.8' is displayed for 'Total Cost' property in 'Callout' topic infobox
	And Cost icon with value '$372.80' is displayed on 'Topic A' topic on Canvas
	When User clicks on Cost icon with value '$372.80' is displayed on 'Topic A' topic on Canvas
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '100' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then value '272.8' is displayed for 'Total Cost' property in 'Callout' topic infobox
	And Cost icon with value '$272.80' is displayed on 'Topic A' topic on Canvas
	And '$100.00' value is displayed in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And '$172.80' value is displayed in input field of 'Resource' in costs section of 'PanelByName' side panel with 'Task Information' header
	And '$272.80' value is displayed in input field of 'Total' in costs section of 'PanelByName' side panel with 'Task Information' header

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-346] @Upd_Qase
Scenario: To_verify_that_task_info_Priority_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | Priority.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And value '' is displayed for 'Max' property in 'Central Topic' topic infobox
	And value '' is displayed for 'Min' property in 'Central Topic' topic infobox
	And 'Topic A' topic is displayed on Canvas
	And 'Topic B' topic is displayed on Canvas
	When User clicks 'Topic A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 1' Icon is displayed to the 'Topic A' Topic
	And value '1' is displayed for 'Max' property in 'Central Topic' topic infobox
	And value '1' is displayed for 'Min' property in 'Central Topic' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic B' topic on Canvas
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 2' Icon is displayed to the 'Topic B' Topic
	And value '2' is displayed for 'Max' property in 'Central Topic' topic infobox
	And value '1' is displayed for 'Min' property in 'Central Topic' topic infobox
	When User clicks by coordinates '200' and '200' on Canvas
	And User waits '500' miliseconds
	And User clicks 'Topic A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	When User clicks 'Priority 5' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 5' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 5' Icon is displayed to the 'Topic A' Topic
	And value '5' is displayed for 'Max' property in 'Central Topic' topic infobox
	And value '2' is displayed for 'Min' property in 'Central Topic' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-347] @Upd_Qase
Scenario: To_verify_that_task_info_Progress_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath      |
		| auto_test_SRND.mmap | Progress.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And value '0' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	And 'Topic A' topic is displayed on Canvas
	And 'Topic B' topic is displayed on Canvas
	And 'TopicC' topic is displayed on Canvas
	And 'Topic D' topic is displayed on Canvas
	And 'Topic E' topic is displayed on Canvas
	When User clicks 'Topic A' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic A' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks 'Not done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Not done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And 'Not done' Icon is displayed to the 'Topic A' Topic
	And value '0' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	When User clicks 'Topic B' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic B' topic on Canvas
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '25% done' Icon is displayed to the 'Topic B' Topic
	And value '0.25' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	When User clicks 'TopicC' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'TopicC' topic on Canvas
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '50% done' Icon is displayed to the 'TopicC' Topic
	And value '0.75' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	When User clicks 'Topic D' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic D' topic on Canvas
	When User clicks '75% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '75% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '75% done' Icon is displayed to the 'Topic D' Topic
	And value '1.5' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	When User clicks 'Topic E' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic E' topic on Canvas
	When User clicks 'Task done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Task done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And 'Task done' Icon is displayed to the 'Topic E' Topic
	And value '2.5' is displayed for 'Total Progress' property in 'Central Topic' topic infobox
	When User clicks 'TopicC' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'TopicC' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'TopicC' topic is not displayed on Canvas
	And value '2' is displayed for 'Total Progress' property in 'Central Topic' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-348] @Upd_Qase
Scenario: To_verify_that_task_info_Duration_Days_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | DurationDays.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '2/27' Start date is displayed to the 'Minute(s)' topic infobox
	And '2/27' Due date is displayed to the 'Minute(s)' topic infobox
	And ': 1 minute(s)' date info is displayed to the 'Minute(s)' topic infobox
	And value '0.002083' is displayed for 'DurationDays' property in 'Topic A' topic infobox
	And '2/27' Start date is displayed to the 'Hour(s)' topic infobox
	And '2/27' Due date is displayed to the 'Hour(s)' topic infobox
	And ': 1 hour(s)' date info is displayed to the 'Hour(s)' topic infobox
	And value '0.125' is displayed for 'DurationDays' property in 'Topic B' topic infobox
	And '2/27' Start date is displayed to the 'Workday(s)' topic infobox
	And '2/27' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '1' is displayed for 'DurationDays' property in 'Topic C' topic infobox
	When User clicks 'Workday(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Workday(s)' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/28/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/28' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 2 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '2' is displayed for 'DurationDays' property in 'Topic C' topic infobox
	And '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/3' Due date is displayed to the 'Week(s)' topic infobox
	And ': 1 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '5' is displayed for 'DurationDays' property in 'Topic D' topic infobox
	When User clicks 'Week(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Week(s)' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/17/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/17' Due date is displayed to the 'Week(s)' topic infobox
	And ': 3 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '15' is displayed for 'DurationDays' property in 'Topic D' topic infobox
	When User clicks 'Month(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Month(s)' topic on Canvas
	And '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '3/24' Due date is displayed to the 'Month(s)' topic infobox
	And ': 1 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '20' is displayed for 'DurationDays' property in 'Topic E' topic infobox
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '04/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '4/21' Due date is displayed to the 'Month(s)' topic infobox
	And ': 2 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '40' is displayed for 'DurationDays' property in 'Topic E' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-349] @Upd_Qase
Scenario: To_verify_that_task_info_Duration_Hours_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath           |
		| auto_test_SRND.mmap | DurationHours.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '2/27' Start date is displayed to the 'Minute(s)' topic infobox
	And '2/27' Due date is displayed to the 'Minute(s)' topic infobox
	And ': 1 minute(s)' date info is displayed to the 'Minute(s)' topic infobox
	And value '0.01666666667' is displayed for 'DurationHours' property in 'Topic A' topic infobox
	And '2/27' Start date is displayed to the 'Hour(s)' topic infobox
	And '2/27' Due date is displayed to the 'Hour(s)' topic infobox
	And ': 1 hour(s)' date info is displayed to the 'Hour(s)' topic infobox
	And value '1' is displayed for 'DurationHours' property in 'Topic B' topic infobox
	And '2/27' Start date is displayed to the 'Workday(s)' topic infobox
	And '2/27' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '8' is displayed for 'DurationHours' property in 'Topic C' topic infobox
	When User clicks 'Workday(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Workday(s)' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/28/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/28' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 2 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '16' is displayed for 'DurationHours' property in 'Topic C' topic infobox
	And '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/3' Due date is displayed to the 'Week(s)' topic infobox
	And ': 1 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '40' is displayed for 'DurationHours' property in 'Topic D' topic infobox
	When User clicks 'Week(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Week(s)' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/17/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/17' Due date is displayed to the 'Week(s)' topic infobox
	And ': 3 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '120' is displayed for 'DurationHours' property in 'Topic D' topic infobox
	And '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '3/24' Due date is displayed to the 'Month(s)' topic infobox
	And ': 1 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '160' is displayed for 'DurationHours' property in 'Topic E' topic infobox
	When User clicks 'Month(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Month(s)' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '04/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '4/21' Due date is displayed to the 'Month(s)' topic infobox
	And ': 2 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '320' is displayed for 'DurationHours' property in 'Topic E' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-350] @Upd_Qase
Scenario: To_verify_that_task_info_Duration_Minutes_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath             |
		| auto_test_SRND.mmap | DurationMinutes.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And '2/27' Start date is displayed to the 'Minute(s)' topic infobox
	And '2/27' Due date is displayed to the 'Minute(s)' topic infobox
	And ': 1 minute(s)' date info is displayed to the 'Minute(s)' topic infobox
	And value '1' is displayed for 'DurationMinutes' property in 'Topic A' topic infobox
	And '2/27' Start date is displayed to the 'Hour(s)' topic infobox
	And '2/27' Due date is displayed to the 'Hour(s)' topic infobox
	And ': 1 hour(s)' date info is displayed to the 'Hour(s)' topic infobox
	And value '60' is displayed for 'DurationMinutes' property in 'Topic B' topic infobox
	And '2/27' Start date is displayed to the 'Workday(s)' topic infobox
	And '2/27' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '480' is displayed for 'DurationMinutes' property in 'Topic C' topic infobox
	When User clicks 'Workday(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Workday(s)' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '02/28/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/28' Due date is displayed to the 'Workday(s)' topic infobox
	And ': 2 workday(s)' date info is displayed to the 'Workday(s)' topic infobox
	And value '960' is displayed for 'DurationMinutes' property in 'Topic C' topic infobox
	And '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/3' Due date is displayed to the 'Week(s)' topic infobox
	And ': 1 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '2400' is displayed for 'DurationMinutes' property in 'Topic D' topic infobox
	When User clicks 'Week(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Week(s)' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/17/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Week(s)' topic infobox
	And '3/17' Due date is displayed to the 'Week(s)' topic infobox
	And ': 3 week(s)' date info is displayed to the 'Week(s)' topic infobox
	And value '7200' is displayed for 'DurationMinutes' property in 'Topic D' topic infobox
	And '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '3/24' Due date is displayed to the 'Month(s)' topic infobox
	And ': 1 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '9600' is displayed for 'DurationMinutes' property in 'Topic E' topic infobox
	When User clicks 'Month(s)' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Month(s)' topic on Canvas
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '04/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '2/27' Start date is displayed to the 'Month(s)' topic infobox
	And '4/21' Due date is displayed to the 'Month(s)' topic infobox
	And ': 2 month(s)' date info is displayed to the 'Month(s)' topic infobox
	And value '19200' is displayed for 'DurationMinutes' property in 'Topic E' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-351] @Upd_Qase
Scenario: To_verify_that_task_info_Effort_Days_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | EffortDays2.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Effort: 1 minute(s)' effort info is displayed to the 'Minute(s)' topic infobox
	And value '0.00208333333' is displayed for 'Effort Days' property in 'Topic A' topic infobox
	And 'Effort: 1 hour(s)' effort info is displayed to the 'Hour(s)' topic infobox
	And value '0.125' is displayed for 'Effort Days' property in 'Topic B' topic infobox
	And 'Effort: 1 workday(s)' effort info is displayed to the 'Workday(s)' topic infobox
	And value '1' is displayed for 'Effort Days' property in 'Topic C' topic infobox
	And 'Effort: 1 week(s)' effort info is displayed to the 'Week(s)' topic infobox
	And value '5' is displayed for 'Effort Days' property in 'Topic D' topic infobox
	And 'Effort: 1 month(s)' effort info is displayed to the 'Month(s)' topic infobox
	And value '20' is displayed for 'Effort Days' property in 'Topic E' topic infobox
	And '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/9' Due date is displayed to the 'Change' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Change' topic infobox
	And 'John' resource is displayed in 'Change' topic
	And value '2' is displayed for 'Effort Days' property in 'Topic F' topic infobox
	When User clicks 'Change' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Change' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/21' Due date is displayed to the 'Change' topic infobox
	And ': 9 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 18 workday(s)' effort info is displayed to the 'Change' topic infobox
	And value '18' is displayed for 'Effort Days' property in 'Topic F' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-352] @Upd_Qase
Scenario: To_verify_that_task_info_Effort_Hours_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | EffortHours.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Effort: 1 minute(s)' effort info is displayed to the 'Minute(s)' topic infobox
	And value '0.01666666667' is displayed for 'Effort Hours' property in 'Topic A' topic infobox
	And 'Effort: 1 hour(s)' effort info is displayed to the 'Hour(s)' topic infobox
	And value '1' is displayed for 'Effort Hours' property in 'Topic B' topic infobox
	And 'Effort: 1 workday(s)' effort info is displayed to the 'Workday(s)' topic infobox
	And value '8' is displayed for 'Effort Hours' property in 'Topic C' topic infobox
	And 'Effort: 1 week(s)' effort info is displayed to the 'Week(s)' topic infobox
	And value '40' is displayed for 'Effort Hours' property in 'Topic D' topic infobox
	And 'Effort: 1 month(s)' effort info is displayed to the 'Month(s)' topic infobox
	And value '160' is displayed for 'Effort Hours' property in 'Topic E' topic infobox
	And '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/9' Due date is displayed to the 'Change' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Change' topic infobox
	And 'John' resource is displayed in 'Change' topic
	And value '16' is displayed for 'Effort Hours' property in 'Topic F' topic infobox
	When User clicks 'Change' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Change' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/21' Due date is displayed to the 'Change' topic infobox
	And ': 9 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 18 workday(s)' effort info is displayed to the 'Change' topic infobox
	And value '144' is displayed for 'Effort Hours' property in 'Topic F' topic infobox

@MindManager @EditingCapabilities @EditMode @Formulas @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-353] @Upd_Qase
Scenario: To_verify_that_task_info_Effort_Minutes_references_in_formulas_work_properly
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath            |
		| auto_test_SRND.mmap | EffortMinutes3.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And 'Effort: 1 minute(s)' effort info is displayed to the 'Minute(s)' topic infobox
	And value '1' is displayed for 'EffortMinutes' property in 'Topic A' topic infobox
	And 'Effort: 1 hour(s)' effort info is displayed to the 'Hour(s)' topic infobox
	And value '60' is displayed for 'EffortMinutes' property in 'Topic B' topic infobox
	And 'Effort: 1 workday(s)' effort info is displayed to the 'Workday(s)' topic infobox
	And value '480' is displayed for 'EffortMinutes' property in 'Topic C' topic infobox
	And 'Effort: 1 week(s)' effort info is displayed to the 'Week(s)' topic infobox
	And value '2400' is displayed for 'EffortMinutes' property in 'Topic D' topic infobox
	And 'Effort: 1 month(s)' effort info is displayed to the 'Month(s)' topic infobox
	And value '9600' is displayed for 'EffortMinutes' property in 'Topic E' topic infobox
	And '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/9' Due date is displayed to the 'Change' topic infobox
	And ': 1 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 2 workday(s)' effort info is displayed to the 'Change' topic infobox
	And 'John' resource is displayed in 'Change' topic
	And value '960' is displayed for 'EffortMinutes' property in 'Topic F' topic infobox
	When User clicks 'Change' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Change' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User unchecks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	And User enters '03/21/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/9' Start date is displayed to the 'Change' topic infobox
	And '3/21' Due date is displayed to the 'Change' topic infobox
	And ': 9 workday(s)' date info is displayed to the 'Change' topic infobox
	And 'Effort: 18 workday(s)' effort info is displayed to the 'Change' topic infobox
	And value '8640' is displayed for 'EffortMinutes' property in 'Topic F' topic infobox