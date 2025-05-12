@retry(2)
Feature: Tags
Check the functionality of Tags multi select

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-482] @Upd_Qase
Scenario: Topics_with_different_tags
	When User selects first 'MT4' and second 'MT4ST1' topic on Canvas
	And User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	And 'Doing' item is displayed as unselected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'To Do' item is displayed as unselected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-483] @Upd_Qase
Scenario: Topics_with_same_tags
	When User selects first 'MT4ST1' and second 'MT4ST2' topic on Canvas
	And User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	And 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-484] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_the_same_tag_to_multiple_topi_s_at_the_same_time
	When User selects first 'MT4ST1ST3' and second 'MT4ST1ST5' topic on Canvas
	And User clicks 'Tags' button of side Toolbox
	And User clicks 'Tags_3' item in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	Then 'Tags_3' item is displayed as selected in 'General Tags' section of 'PanelByName' side panel with 'Tags' header
	And 'Tags_3' tag is displayed in 'MT4ST1ST3' topic infobox
	And 'Tags_3' tag is displayed in 'MT4ST1ST5' topic infobox

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-485] @Upd_Qase
Scenario: Check_it_is_possible_to_edit_the_topic_tag_on_some_topics_at_the_same_time
	When User selects first 'MT4' and second 'MT4ST2' topic on Canvas
	And User clicks 'Tags' button of side Toolbox
	And User clicks 'Doing' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'Doing' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'Doing' tag is displayed in 'MT4' topic infobox
	And 'Done' tag is not displayed in 'MT4' topic infobox
	And 'Doing' tag is displayed in 'MT4ST2' topic infobox
	And 'To Do' tag is not displayed in 'MT4ST2' topic infobox

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-486] @Upd_Qase
Scenario: Check_it_is_possible_to_remove_the_topic_tag_for_all_the_selected_topics_if_they_currently_have_the_same_value
	When User selects first 'MT4ST1' and second 'MT4ST2' topic on Canvas
	Then 'MT4ST1' is outlined with a blue circuit
	And 'MT4ST2' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' item is displayed as unselected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	And 'To Do' tag is not displayed in 'MT4ST1' topic infobox
	And 'To Do' tag is not displayed in 'MT4ST2' topic infobox

@MindManager @EditingCapabilities @MultiSelect @Tags @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1391] @Upd_Qase
Scenario: To_verify_that_it_possible_to_add_a_Custom_tag_to_any_group
	When User selects first 'MT4ST1' and second 'MT4ST2' topic on Canvas
	Then 'MT4ST1' is outlined with a blue circuit
	And 'MT4ST2' is outlined with a blue circuit
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User hovers over at 'Kanban' section header on 'PanelByName' side panel with 'Tags' header and clicks ellips button
	And User clicks button with 'Add custom tag' name in 'group-header-context-menu' menu
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'Custom Tag 1' item is displayed in 'Kanban' section of 'PanelByName' side panel with 'Tags' header