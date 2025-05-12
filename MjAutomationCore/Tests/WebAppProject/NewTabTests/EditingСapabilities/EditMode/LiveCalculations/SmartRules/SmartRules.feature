@retry(2)
Feature: SmartRules
To verify that SmartRules behavior is the same as in MMD

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-361] @Upd_Qase @JIRA[MMCV-9092]
Scenario: To_verify_that_Reader_allows_manual_override_in_SmartRules_Priority2
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath            |
		| auto_test_SRND.mmap | ManualOverride.mmap |
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
	And 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 2' Icon is displayed to the 'Topic A' Topic
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 2' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 2' Icon is displayed to the 'Topic A' Topic

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-361] @Upd_Qase @JIRA[MMCV-9092]
Scenario: To_verify_that_Reader_allows_manual_override_in_SmartRules_Priority4
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath            |
		| auto_test_SRND.mmap | ManualOverride.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '50% done' Icon is displayed to the 'Topic B' Topic
	And 'Priority 4' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 4' Icon is displayed to the 'Topic B' Topic
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 1' Icon is displayed to the 'Topic B' Topic

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-362] @Upd_Qase
Scenario: To_verify_that_Reader_ignores_SmartRules_for_excluded_topics_purple
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | ExcludedRule.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then following items is displayed in 'Kanban' section of 'PanelByName' side panel with 'Tags' header:
		| item  |
		| To Do |
		| Doing |
		| Done  |
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' tag is displayed in 'Topic A' topic infobox
	And 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'Topic A' is outlined with a blue circuit
	And 'Topic A' topic has Fill Color 'rgb(106, 110, 235)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-362] @Upd_Qase
Scenario: To_verify_that_Reader_ignores_SmartRules_for_excluded_topics_normal
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath          |
		| auto_test_SRND.mmap | ExcludedRule.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then following items is displayed in 'Kanban' section of 'PanelByName' side panel with 'Tags' header:
		| item  |
		| To Do |
		| Doing |
		| Done  |
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' tag is displayed in 'Topic B' topic infobox
	And 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'Topic B' is outlined with a blue circuit
	And 'Topic B' topic has Fill Color 'rgb(236, 244, 250)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Sad_Icon
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic A' topic on Canvas
	Then 'Topic A' is outlined with a blue circuit
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' Icon is displayed to the 'Topic A' Topic
	And 'Sad' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	And 'Topic A' is outlined with a blue circuit
	And 'Topic A' topic has Fill Color 'rgb(93, 93, 102)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_add_attachments
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then 'FruitImages.jpg' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	And Attachment icon is displayed to the 'Topic B' topic infobox
	When User uploads 'FruitsOutlineIcon.png' file through 'add-attachment-input' input
	Then 'FruitsOutlineIcon.png' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	And Attachment icon is displayed to the 'Topic B' topic infobox
	And 'Topic B' topic text is displayed 'bold' style

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_add_links
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	And User enters 'https://www.facebook.com/' in the 'url' field
	And User enters 'Facebook' in the 'title' field
	And User clicks 'Add' footer button on Add Link panel
	Then 'Facebook' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	And Links icon is displayed to the 'Topic B' topic infobox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	And User enters 'https://www.google.com/' in the 'url' field
	And User enters 'Google' in the 'title' field
	And User clicks 'Add' footer button on Add Link panel
	Then 'Google' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	And Links icon is displayed to the 'Topic B' topic infobox
	And 'Topic B' topic text has 'rgba(68, 71, 191, 1)' color on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase @JIRA[MMCV-8825]
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_subtopics
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic CZ' topic on Canvas
	Then 'Topic CZ' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then '4' subtopics are displayed on Canvas
	When User clicks 'Topic CZ' topic on Canvas
	Then 'Topic CZ' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then '5' subtopics are displayed on Canvas
	And 'Topic CZ' topic text is displayed 'underline' style

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_subtopic
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then '4' subtopics are displayed on Canvas
	And 'Topic D' topic text is displayed 'italic' style

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_resource
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User remembers 'Topic E' topic model id and name
	And User clicks 'Topic E' topic on Canvas
	Then 'Topic E' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	And 'Smart' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	When User clicks 'Smart' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Smart' item is displayed as unselected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	And 'Smart' tag is not displayed in 'Topic E' topic infobox
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'Paul' value in the 'Resources' field of 'Task Information' panel
	And User presses the 'Enter' key on the keyboard
	Then 'Paul' resource is displayed in 'Topic E' topic
	When User clicks 'Topic E' topic on Canvas
	Then 'Topic E' is outlined with a blue circuit
	And text 'Topic E' has font size of '48px' in the 'Topic E' topic on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_strikethrough
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Smart' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Smart' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	And 'Smart' tag is displayed in 'Topic B' topic infobox
	And 'Topic B' topic text is displayed 'strikethrough' style

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_underline
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic B' topic on Canvas
	Then 'Topic B' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'To Do' tag is displayed in 'Topic B' topic infobox
	And 'Topic B' topic text is displayed 'underline' style

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_today_due_date
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic G' topic on Canvas
	Then 'Topic G' is outlined with a blue circuit
	And 'Topic G' topic has Fill Color 'rgb(255, 204, 204)' on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters 'D(0)' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Sad' Icon is displayed to the 'Topic G' Topic
	And 'Topic G' topic has Fill Color 'rgb(255, 255, 185)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_General_Cost
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic H' topic on Canvas
	Then 'Topic H' is outlined with a blue circuit
	When User remembers 'Topic H' topic model id and name
	And User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '1550' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then 'Topic H' topic line color is 'rgb(251, 184, 25)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Sparrow
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic I' topic on Canvas
	Then 'Topic I' is outlined with a blue circuit
	And 'Jack' resource is displayed in 'Topic I' topic
	And 'Sparrow' resource is displayed in 'Topic I' topic
	And Cost icon with value '$1,600.00' is displayed on 'Topic I' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks Remove on 'Sparrow' resource in 'Resources' section on 'PanelByName' panel with 'Task Information' header
	Then 'Sparrow' resource is not displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	And 'Sparrow' resource is not displayed in 'Topic I' topic
	And 'To Do' tag is displayed in 'Topic I' topic infobox
	And Cost icon with value '$800.00' is displayed on 'Topic I' topic on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Increase_2000
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic J' topic on Canvas
	Then 'Topic J' is outlined with a blue circuit
	And 'Jack' resource is displayed in 'Topic J' topic
	And 'Sparrow' resource is displayed in 'Topic J' topic
	And Cost icon with value '$1,700.00' is displayed on 'Topic J' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enters '400' in input field of 'General' in costs section of 'PanelByName' side panel with 'Task Information' header
	And User presses the 'Enter' key on the keyboard
	Then Cost icon with value '$2,000.00' is displayed on 'Topic J' topic on Canvas
	And 'Harry' resource is displayed in 'Topic J' topic

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Start_Date
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic K' topic on Canvas
	Then 'Topic K' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	And checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And '03/02/2023' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/01/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/1' Start date is displayed to the 'Topic K' topic infobox
	And 'To Do' tag is displayed in 'Topic K' topic infobox

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Due_Date
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic K' topic on Canvas
	Then 'Topic K' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	And '03/22/2023' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/23/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/23' Due date is displayed to the 'Topic K' topic infobox
	And 'Priority 2' Icon is displayed to the 'Topic K' Topic

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Duration_more_21days
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic L' topic on Canvas
	Then 'Topic L' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	And checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	And '03/17/2023' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/01/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/1' Start date is displayed to the 'Topic L' topic infobox
	When User enters '03/29/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/29' Due date is displayed to the 'Topic L' topic infobox
	And 'Priority 4' Icon is displayed to the 'Topic L' Topic

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Milestone
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic M' topic on Canvas
	Then 'Topic M' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	And User checks 'Milestone' checkbox of 'PanelByName' side panel with 'Task Information' header
	Then Milestone icon is displayed 'Topic M' topic infobox
	And 'Topic M' topic is assigned 'octagon' shape on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_oval
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic H' topic on Canvas
	Then 'Topic H' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	And 'Priority 1' Icon is displayed to the 'Topic H' Topic
	And 'Topic H' topic is assigned 'oval' shape on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_Document
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic D' topic on Canvas
	Then 'Topic D' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	And '25% done' Icon is displayed to the 'Topic D' Topic
	And 'Topic D' topic is assigned 'document' shape on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase @JIRA[MMCV-10334]
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_add_subtopic
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	And User clicks button with 'collapse-all' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks 'Topic N' topic on Canvas
	Then 'Topic N' is outlined with a blue circuit
	When User clicks 'Add subtopic' button on Tools panel
	Then '1' subtopics are displayed on Canvas
	And 'Subtopic' topic text has 'rgba(221, 22, 82, 1)' color on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_move_topic_outside
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '32' via the side tool bar
	When User clicks 'Topic O' topic on Canvas
	Then 'Topic O' is outlined with a blue circuit
	When User drags 'Topic O' topic by '200' and '100' coordinates on Canvas and holds
	Then 'Topic O' topic has Fill Color 'rgb(18, 180, 176)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_move_topic_overlapping
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	And User set zoom level to '82' via the side tool bar
	When User clicks 'Topic O' topic on Canvas
	Then 'Topic O' is outlined with a blue circuit
	When User drags 'Topic O' topic by '-30' and '100' coordinates on Canvas and holds
	Then 'Topic O' topic has Fill Color 'rgb(18, 179, 47)' on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_add_note
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic P' topic on Canvas
	Then 'Topic P' is outlined with a blue circuit
	When User clicks 'Notes' button of side Toolbox
	And User enters 'SmartRules' text to input note field on Notes panel
	And User clicks Close button of 'PanelByName' side panel with 'Notes' header
	Then 'PanelByName' side panel with 'Task Information' header is not displayed to the User
	And Notes icon is displayed to the 'Topic P' topic infobox
	And 'Topic P' topic is assigned 'parallelogram' shape on Canvas

@MindManager @EditingCapabilities @LiveCalculations @SmartRules @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-363] @Upd_Qase
Scenario: To_verify_that_SmartRules_behavior_is_the_same_as_in_MMD_add_text_hello
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath               |
		| auto_test_SRND.mmap | SmartRulesCheck12.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Topic P' topic on Canvas
	Then 'Topic P' is outlined with a blue circuit
	When User remembers 'Topic P' topic model id and name
	And User clicks 'Topic P' topic on Canvas
	And User waits '500' miliseconds
	And User double clicks to the 'Topic P' topic text on Canvas
	And User waits '500' miliseconds
	And User presses the 'End' key on the keyboard
	And User releases all keys on keyboard
	And User enters ' Hello' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'Topic P' topic line color is 'rgb(18, 179, 47)' on Canvas