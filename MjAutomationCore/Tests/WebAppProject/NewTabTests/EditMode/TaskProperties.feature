@retry(2)
Feature: TaskProperties
Check Task Properties functionality

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
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit

@MindManager @TaskProperties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-309] @Upd_Qase
Scenario: Check_Remove_Task_Information
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Defer' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Cost' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks Close button of 'PanelByName' side panel with 'Icons' header
	Then 'PanelByName' side panel with 'Icons' header is not displayed to the User
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Icons' button of side Toolbox
	Then 'Priority 1' item is displayed as selected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then '25% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' item is displayed as selected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Defer' item is displayed as selected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' item is displayed as selected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Cost' item is displayed as selected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' item is displayed as unselected in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' Icon is not displayed to the 'CT' Topic
	When User clicks '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '25% done' item is displayed as unselected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '25% done' Icon is not displayed to the 'CT' Topic
	When User clicks 'Up' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' item is displayed as unselected in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Up' Icon is not displayed to the 'CT' Topic
	When User clicks 'Defer' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Defer' item is displayed as unselected in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Defer' Icon is not displayed to the 'CT' Topic
	When User clicks 'Happy' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' item is displayed as unselected in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Happy' Icon is not displayed to the 'CT' Topic
	When User clicks 'Cost' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Cost' item is displayed as unselected in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Cost' Icon is not displayed to the 'CT' Topic

@MindManager @TaskProperties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-310] @Upd_Qase
Scenario: Check_that_there_is_the_possibility_to_change_task_priority_by_clicking_on_the_priority_item_on_the_topic
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 1' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 1' icon in 'CT' topic
	Then 'Priority 2' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 2' icon in 'CT' topic
	Then 'Priority 3' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 3' icon in 'CT' topic
	Then 'Priority 4' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 4' icon in 'CT' topic
	Then 'Priority 5' Icon is displayed to the 'CT' Topic
	When User clicks 'Priority 5' icon in 'CT' topic
	Then 'Priority 1' Icon is displayed to the 'CT' Topic

@MindManager @TaskProperties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-311] @Upd_Qase
Scenario: Check_that_there_is_the_possibility_to_change_task_progress_by_clicking_on_the_progress_item_on_the_topic
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Not done' item in 'Progress' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Not done' Icon is displayed to the 'CT' Topic
	When User clicks 'Not done' icon in 'CT' topic
	Then '25% done' Icon is displayed to the 'CT' Topic
	When User clicks '25% done' icon in 'CT' topic
	Then '50% done' Icon is displayed to the 'CT' Topic
	When User clicks '50% done' icon in 'CT' topic
	Then '75% done' Icon is displayed to the 'CT' Topic
	When User clicks '75% done' icon in 'CT' topic
	Then 'Task done' Icon is displayed to the 'CT' Topic
	Then 'CT' topic has Fill Color 'rgb(171, 229, 149)' on Canvas
	When User clicks 'Task done' icon in 'CT' topic
	Then 'Not done' Icon is displayed to the 'CT' Topic

@MindManager @EditingCapabilities @TaskProperties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-313] @Upd_Qase
Scenario: Check_that_there_is_possiblity_to_add_general_tags_via_the_side_panel
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Tags_1' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_1' tag is displayed in 'CT' topic infobox
	Then 'Tags_1' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	When User clicks 'Tags_1' tags in 'CT' topic infobox
	When User clicks 'Tags_1' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_1' item is displayed as unselected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_1' tag is not displayed in 'CT' topic infobox
	When User refresh page
	Then Web Editor page is displayed to the User
	Then 'Tags_1' tag is not displayed in 'CT' topic infobox

@MindManager @EditingCapabilities @TaskProperties @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-313] @Upd_Qase
Scenario: Check_that_there_is_possiblity_to_add_custom_tags_via_the_side_panel
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' tag is displayed in 'CT' topic infobox
	Then 'Tag #1' item is displayed as selected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	When User clicks 'Tag #1' tags in 'CT' topic infobox
	When User clicks 'Tag #1' item in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tag #1' item is displayed as unselected in 'Custom tag group' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags #1' tag is not displayed in 'CT' topic infobox
	When User refresh page
	Then Web Editor page is displayed to the User
	Then 'Tags #1' tag is not displayed in 'CT' topic infobox