@retry(2)
Feature: DropContextMenu
Check functionality of topic drop context menu

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-290] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_it_is_possible_to_add_the_relationship_via_topic_drag_and_drop
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	Then 'drop-context-menu' dropdown menu is displayed to User
	When User clicks 'Insert Relationship' item in 'drop-context-menu' dropdown menu
	Then '2' relationship lines are displayed on Canvas

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-292] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_it_is_possible_to_add_the_link_via_topic_drag_and_drop
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	When User clicks 'Insert Link' item in 'drop-context-menu' dropdown menu
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	Then 'MT1' item is displayed in 'Related Topics' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Links icon is displayed to the 'MT3' topic infobox

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-294] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_that_it_is_possible_to_move_the_topic_and_add_it_as_a_subtopic_for_the_selected_one
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	When User clicks 'Drop as Subtopic' item in 'drop-context-menu' dropdown menu
	Then 'MT3' topic is displayed on Canvas
	Then 'MT1' subtopic is displayed on Canvas
	Then 'MT1' is a subtopic of 'MT3' topic on Canvas

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-295] @Upd_Qase @JIRA[MMCV-9732]
Scenario: Check_that_it_is_possible_to_move_the_topic_and_add_it_as_a_parent_topic_for_the_selected_one
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	When User clicks 'Drop as Parent Topic' item in 'drop-context-menu' dropdown menu
	Then 'MT1' topic is displayed on Canvas
	Then 'MT3' subtopic is displayed on Canvas
	Then 'MT3' is a subtopic of 'MT1' topic on Canvas

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-296] @Upd_Qase @JIRA[MMCV-5467,MMCV-9732]
Scenario: Check_that_it_is_possible_to_move_the_topic_and_add_it_as_a_sibling_before_topic_for_the_selected_one
	When User remembers location of 'MT4ST2ST2' topic on Canvas
	When User Drag 'MT4ST2ST3' topic on 'MT4ST2ST2' topic and hold then release
	When User clicks 'Drop as Sibling Topic Before' item in 'drop-context-menu' dropdown menu
	Then topic with name 'MT4ST2ST3' is displayed in place of topic with name 'MT4ST2ST2'

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-297] @Upd_Qase @JIRA[MMCV-5467,MMCV-9732]
Scenario: Check_that_it_is_possible_to_move_the_topic_and_add_it_as_a_sibling_after_topic_for_the_selected_one
	When User remembers location of 'MT4ST2ST2' topic on Canvas
	When User Drag 'MT4ST2ST1' topic on 'MT4ST2ST2' topic and hold then release
	When User clicks 'Drop as Sibling Topic After' item in 'drop-context-menu' dropdown menu
	Then topic with name 'MT4ST2ST1' is displayed in place of topic with name 'MT4ST2ST2'

@MindManager @EditingCapabilities @Topics @DropContextMenu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-298] @Upd_Qase  @JIRA[MMCV-9732]
Scenario: Check_that_it_is_possible_to_convert_the_topic_to_the_Note_and_drop_it_to_another_one
	When User Drag 'MT1' topic on 'MT3' topic and hold then release
	When User clicks 'Drop as Note' item in 'drop-context-menu' dropdown menu
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	Then 'MT1' text is dipslayed in Note field on Notes panel