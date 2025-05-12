@retry(2)
Feature: EditAndAddByDragAndDrop
Check functionality of drag and drop

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-326] @Health_Check @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Priority_icon
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	Then following items is displayed in 'Priority' section of 'PanelByName' side panel with 'Icons' header:
		| Items      |
		| Priority 1 |
		| Priority 2 |
		| Priority 3 |
		| Priority 4 |
		| Priority 5 |
	When User drags 'Priority 5' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Priority 5' Icon is displayed to the 'Main Topic' Topic
	Then 'Priority 5' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Priority 5' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Priority 5' Icon is displayed to the 'MT1' Topic
	Then 'Priority 5' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User drags 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Priority 1' Icon is displayed to the 'Main Topic' Topic
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Priority 1' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Priority 1' Icon is displayed to the 'MT1' Topic
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' Icon is displayed to the 'Main Topic' Topic
	Then 'Priority 1' Icon is not displayed to the 'MT1' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-327] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Progress_icon
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	Then following items is displayed in 'Progress' section of 'PanelByName' side panel with 'Icons' header:
		| Items     |
		| Not done  |
		| 25% done  |
		| 50% done  |
		| 75% done  |
		| Task done |
	When User drags '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then '25% done' Icon is displayed to the 'Main Topic' Topic
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	When User drags '25% done' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then '25% done' Icon is displayed to the 'MT1' Topic
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User drags '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then '50% done' Icon is displayed to the 'Main Topic' Topic
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	When User drags '50% done' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then '50% done' Icon is displayed to the 'MT1' Topic
	Then '50% done' Icon is displayed to the 'Main Topic' Topic
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is not displayed to the 'MT1' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-328] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Flags_icons
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	Then following items is displayed in 'Flags' section of 'PanelByName' side panel with 'Icons' header:
		| Items   |
		| Yes     |
		| Maybe   |
		| Discuss |
		| Risk    |
		| Move    |
		| Defer   |
		| No      |
	When User drags 'Discuss' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Discuss' Icon is displayed to the 'Main Topic' Topic
	Then 'Discuss' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Discuss' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Discuss' Icon is displayed to the 'MT1' Topic
	Then 'Discuss' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User drags 'Yes' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Yes' Icon is displayed to the 'Main Topic' Topic
	Then 'Yes' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Yes' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Yes' Icon is displayed to the 'MT1' Topic
	Then 'Yes' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Yes' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Yes' item is displayed as unselected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Yes' Icon is displayed to the 'Main Topic' Topic
	Then 'Yes' Icon is not displayed to the 'MT1' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-329] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Arrows_icons
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	Then following items is displayed in 'Arrows' section of 'PanelByName' side panel with 'Icons' header:
		| Items |
		| Up    |
		| Down  |
		| Left  |
		| Right |
	When User drags 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Up' Icon is displayed to the 'Main Topic' Topic
	Then 'Up' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Up' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Up' Icon is displayed to the 'MT1' Topic
	Then 'Up' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Right' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Right' Icon is displayed to the 'Main Topic' Topic
	Then 'Right' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Right' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Right' Icon is displayed to the 'MT1' Topic
	Then 'Right' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Right' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Right' item is displayed as unselected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Right' Icon is displayed to the 'Main Topic' Topic
	Then 'Right' Icon is not displayed to the 'MT1' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-330] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Smileys_icons
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	Then following items is displayed in 'Smileys' section of 'PanelByName' side panel with 'Icons' header:
		| Items   |
		| Happy   |
		| Neutral |
		| Sad     |
	When User drags 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Happy' Icon is displayed to the 'Main Topic' Topic
	Then 'Happy' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Happy' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Happy' Icon is displayed to the 'MT1' Topic
	Then 'Happy' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User drags 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Sad' Icon is displayed to the 'Main Topic' Topic
	Then 'Sad' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'FT2' topic on Canvas
	When User drags 'Sad' Icon from 'Main Topic' topic on 'MT1' topic
	Then 'MT1' is outlined with a blue circuit
	Then 'Sad' Icon is displayed to the 'MT1' Topic
	Then 'Sad' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Sad' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' item is displayed as unselected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Sad' Icon is not displayed to the 'MT1' Topic
	Then 'Sad' Icon is displayed to the 'Main Topic' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-331] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_Single_icons
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User drags 'Pro' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Con' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Question' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Attention' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Decision' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Date' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Cost' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	When User drags 'Alarm' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic' topic of Canvas
	Then 'Main Topic' is outlined with a blue circuit
	Then 'Pro' Icon is displayed to the 'Main Topic' Topic
	Then 'Con' Icon is displayed to the 'Main Topic' Topic
	Then 'Question' Icon is displayed to the 'Main Topic' Topic
	Then 'Attention' Icon is displayed to the 'Main Topic' Topic
	Then 'Decision' Icon is displayed to the 'Main Topic' Topic
	Then 'Date' Icon is displayed to the 'Main Topic' Topic
	Then 'Cost' Icon is displayed to the 'Main Topic' Topic
	Then 'Alarm' Icon is displayed to the 'Main Topic' Topic
	Then 'Pro' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Con' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Question' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Attention' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Decision' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Date' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Cost' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Alarm' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User drags 'Question' Icon from 'Main Topic' topic on 'Floating Topic' topic
	Then 'Floating Topic' is outlined with a blue circuit
	Then 'Question' Icon is displayed to the 'Floating Topic' Topic
	Then 'Question' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Question' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Question' item is displayed as unselected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Question' Icon is not displayed to the 'Floating Topic' Topic

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-332] @Upd_Qase @JIRA[MMCV-9700]
Scenario: Check_that_there_is_the_possibility_to_drag_and_drop_tags
	When User clicks 'Tags' button of side Toolbox
	Then following items is displayed in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header:
		| item   |
		| Tag #1 |
		| Tag #2 |
		| Tag #3 |
	Then following items is displayed in 'Kanban' section of 'PanelByName' side panel with 'Tags' header:
		| item  |
		| To Do |
		| Doing |
		| Done  |
	Then following items is displayed in 'General Tags' section of 'PanelByName' side panel with 'Tags' header:
		| item   |
		| Tags_1 |
		| Tags_2 |
		| Tags_3 |
	When User drags 'Tags_1' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header on 'Main Topic' topic of Canvas
	Then 'Tags_1' tag is displayed in 'Main Topic' topic infobox
	Then 'Tags_1' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Main Topic' is outlined with a blue circuit
	When User drag 'Tags_1' tag icon from 'Main Topic' topic on 'Subtopic' topic
	Then 'Tags_1' tag is displayed in 'Subtopic' topic infobox
	Then 'Tags_1' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Subtopic' is outlined with a blue circuit
	When User clicks 'Tags_1' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_1' tag is not displayed in 'Subtopic' topic infobox
	When User clicks 'FT2' topic on Canvas
	When User drags 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header on 'Floating Topic' topic of Canvas
	Then 'Tag #1' tag is displayed in 'Floating Topic' topic infobox
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Floating Topic' is outlined with a blue circuit
	When User drag 'Tag #1' tag icon from 'Floating Topic' topic on 'Subtopic' topic
	Then 'Tag #1' tag is displayed in 'Subtopic' topic infobox
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Subtopic' is outlined with a blue circuit
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is not displayed in 'Subtopic' topic infobox
	When User drags 'Tags_1' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header on 'Main Topic' topic of Canvas
	When User drags 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header on 'Floating Topic' topic of Canvas
	When User clicks Remove button to 'Tag #1' tag in 'Floating Topic' topic infobox
	When User clicks Remove button to 'Tags_1' tag in 'Main Topic' topic infobox
	Then 'Tag #1' tag is not displayed in 'Floating Topic' topic infobox
	Then 'Tags_1' tag is not displayed in 'Main Topic' topic infobox

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-333] @Upd_Qase
Scenario: Check_that_it_is_possible_to_copy_the_start_date_from_one_topic_to_another_via_drag_and_drop
	When User clicks 'F1ST4' topic on Canvas
	Then 'F1ST4' is outlined with a blue circuit
	When User drag '7/20' Start date from 'F1ST4' topic on 'FT1ST1' topic
	Then '7/20' Start date is displayed to the 'FT1ST1' topic infobox
	Then 'FT1ST1' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '07/20/2022' date is displayed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '09/20/2022' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '9/20' Start date is displayed to the 'FT1ST1' topic infobox
	When User drag '9/20' Start date from 'FT1ST1' topic on 'F1ST4' topic
	Then '9/20' Start date is displayed to the 'F1ST4' topic infobox
	Then 'F1ST4' is outlined with a blue circuit

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-334] @Upd_Qase
Scenario: Check_that_it_is_possible_to_copy_the_due_date_from_one_topic_to_another_via_drag_and_drop
	When User clicks 'F1ST12ST12' topic on Canvas
	Then 'F1ST12ST12' is outlined with a blue circuit
	When User drag '- 7/25' Due date from 'F1ST12ST12' topic on 'Main Topic' topic
	Then '- 7/25' Due date is displayed to the 'Main Topic' topic infobox
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '07/25/2022' date is displayed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '08/25/2022' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '- 8/25' Due date is displayed to the 'Main Topic' topic infobox
	When User drag '- 8/25' Due date from 'Main Topic' topic on 'F1ST12ST12' topic
	Then '- 8/25' Due date is displayed to the 'F1ST12ST12' topic infobox
	Then 'F1ST12ST12' is outlined with a blue circuit

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-335] @Upd_Qase
Scenario: Check_that_it_is_possible_to_copy_resource_from_one_topic_to_another_via_drag_and_drop
	Then User set zoom level to '90' via the side tool bar
	When User clicks 'MT3' topic on Canvas
	Then 'MT3' is outlined with a blue circuit
	When User drag 'Resource #1' resource icon from 'MT3' topic on 'MT4' topic
	Then 'Resource #1' resource is displayed in 'MT4' topic
	Then 'Resource #1' resource is displayed in 'MT3' topic
	Then Topic Border is highlight blue color in 'MT4' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	Then 'Resource #1' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	When User clicks 'FT3' topic on Canvas
	When User enter 'TestTestTest' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'TestTestTest' resource is displayed in 'FT3' topic
	When User drag 'TestTestTest' resource icon from 'FT3' topic on 'MT4' topic
	Then 'Resource #1' resource is displayed in 'MT4' topic
	Then 'TestTestTest' resource is displayed in 'MT4' topic
	Then Topic Border is highlight blue color in 'MT4' topic on Canvas

@MindManager @EditingCapabilities @EditAndAddByDragAndDrop @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-336] @Upd_Qase
Scenario: Verify_it_is_possible_to_add_and_edit_properties_on_topics_by_drag_and_drop
	When User clicks 'MT7' topic on Canvas
	Then 'MT7' is outlined with a blue circuit
	When User drag 'Property_#1' property icon from 'MT7' topic on 'MT6' topic
	Then 'Property_#1' property is displayed in 'MT6' topic infobox
	Then value 'pp_text' is displayed for 'Property_#1' property in 'MT6' topic infobox
	Then 'MT6' is outlined with a blue circuit
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	When User enters 'Test' value in 'Property_#1' property input field of 'PanelByName' side panel with 'Properties' header
	When User clicks 'MT6' topic on Canvas
	Then 'Test' value is displayed in 'Property_#1' property input field of 'PanelByName' side panel with 'Properties' header
	Then value 'Test' is displayed for 'Property_#1' property in 'MT6' topic infobox
	When User drag 'Property_#1' property icon from 'MT6' topic on 'MT7' topic
	Then value 'Test' is displayed for 'Property_#1' property in 'MT7' topic infobox
	Then 'MT7' is outlined with a blue circuit