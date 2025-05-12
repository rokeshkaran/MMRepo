@retry(2)
Feature: UndoRedo
Check co-editing mode for undo and Redo Changes

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then User set zoom level to '36' via the side tool bar

@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-237] @Upd_Qase
Scenario: Verify_that_co_editor_can_undo_their_own_changes
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'MT' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Down' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' Icon is displayed to the 'MT' Topic
	#User A Actions
	When User switches to '1' browser
	When User clicks 'Undo' button on Tools panel
	When User waits '1500' miliseconds
	Then 'Floating Topic' topic is not displayed on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'Undo' button on Tools panel
	When User waits '1500' miliseconds
	Then 'Down' Icon is not displayed to the 'MT' Topic
	#User A Actions
	When User switches to '1' browser
	When User clicks 'Redo' button on Tools panel
	When User waits '2000' miliseconds
	Then 'Floating Topic' topic is displayed on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'Redo' button on Tools panel
	When User waits '1500' miliseconds
	Then 'Down' Icon is displayed to the 'MT' Topic
	#User A Actions
	When User switches to '1' browser
	When User clicks '12345' topic on Canvas
	When User clicks 'Tags' button of side Toolbox
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' tag is displayed in '12345' topic infobox
	#User B Actions
	When User switches to '0' browser
	When User clicks 'ImageTopic2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'ImageTopic2' Topic
	#User A Actions
	When User switches to '1' browser
	When User clicks 'To Do' tags in '12345' topic infobox
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' item is displayed as unselected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' tag is not displayed in '12345' topic infobox
	#User B Actions
	When User switches to '0' browser
	When User presses the Ctrl_Z combination key on the keyboard
	Then 'Priority 1' Icon is not displayed to the 'ImageTopic2' Topic
	#User A Actions
	When User switches to '1' browser
	When User presses the Ctrl_Z combination key on the keyboard
	Then 'To Do' tag is displayed in '12345' topic infobox

@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-238] @Upd_Qase
Scenario: Verify_that_co_editor_undo_button_is disactivated_when_other_user_delete_a_topic
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'Floating Topic' topic on Canvas
	When User clicks 'Delete' button on Tools panel
	Then 'Floating Topic' topic is not displayed on Canvas
	#User A Actions
	When User switches to '1' browser
	When User waits '1000' miliseconds
	Then 'Floating Topic' topic is not displayed on Canvas
	Then 'Undo' button is displayed as disabled on the Tools panel

@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-239] @Upd_Qase
Scenario: Verify_that_actions_is_forbiddened_if_topic_is_selected_by_another_user_undo
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'Floating Topic' topic on Canvas
	#User A Actions
	When User switches to '1' browser
	When User waits '1000' miliseconds
	When User clicks 'Undo' button on Tools panel
	When User waits '2000' miliseconds
	Then 'info' dialog is displayed to User
	Then text 'The next undo action cannot be completed because the topic is being edited by another user. Please wait until they are done editing and try again.' displayed in 'info' dialog

@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-239] @Upd_Qase
Scenario: Verify_that_actions_is_forbiddened_if_topic_is_selected_by_another_user_redo
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Icons' button of side Toolbox
	When User clicks 'Down' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Down' Icon is displayed to the 'Floating Topic' Topic
	When User clicks 'Undo' button on Tools panel
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions
	When User switches to '0' browser
	When User clicks 'Floating Topic' topic on Canvas
	#User A Actions
	When User switches to '1' browser
	When User waits '1000' miliseconds
	When User clicks 'Redo' button on Tools panel
	When User waits '2000' miliseconds
	Then 'info' dialog is displayed to User
	Then text 'The next redo action cannot be completed because the topic is being edited by another user. Please wait until they are done editing and try again.' displayed in 'info' dialog

@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-240] @Upd_Qase @JIRA[MMCV-8449]
Scenario: Verify_that_the_undo_redo_function_for_floating_map_branches
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '100', '50' to the Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	When User clicks 'Floating Topic' topic on Canvas
	When User enters 'TestTopic1' text to the topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions	
	When User switches to '0' browser
	When User clicks 'TestTopic1' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	When User clicks 'Subtopic' topic on Canvas
	When User enters 'TestSubtopic1' text to the topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	Then 'TestSubtopic1' topic is displayed on Canvas
	#User A Actions	
	When User switches to '1' browser
	When User waits '1000' miliseconds
	When User clicks 'Undo' button on Tools panel
	When User clicks 'Undo' button on Tools panel
	When User waits '1000' miliseconds
	Then 'TestTopic1' topic is not displayed on Canvas
	Then 'TestSubtopic1' topic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'capsule' shape on Canvas
	#User B Action
	When User switches to '0' browser
	Then 'TestTopic1' topic is not displayed on Canvas
	Then 'TestSubtopic1' topic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'capsule' shape on Canvas
	#User A Actions	
	When User switches to '1' browser
	When User clicks 'Redo' button on Tools panel
	When User clicks 'Redo' button on Tools panel
	When User waits '1000' miliseconds
	Then 'TestTopic1' topic is displayed on Canvas
	Then 'TestTopic1' topic is assigned 'capsule' shape on Canvas
	Then 'TestSubtopic1' subtopic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'none' shape on Canvas
	#User B Action
	When User switches to '0' browser
	Then 'TestTopic1' topic is displayed on Canvas
	Then 'TestTopic1' topic is assigned 'capsule' shape on Canvas
	Then 'TestSubtopic1' subtopic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'none' shape on Canvas


@MindManager @Co_Editing @Co_editing_Undo_Redo @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-240] @Upd_Qase @JIRA[MMCV-8449,MMCV-8862]
Scenario: Verify_that_the_undo_redo_function_for_main_map_branches
	#User A logged in
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'CT' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks 'Main Topic' topic on Canvas
	When User enters 'TestTopic1' text to the topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions	
	When User switches to '0' browser
	When User clicks 'TestTopic1' topic on Canvas
	When User clicks 'Add subtopic' button on Tools panel
	When User clicks 'Subtopic' topic on Canvas
	When User enters 'TestSubtopic1' text to the topic on Canvas
	When User clicks by coordinates '200' and '200' on Canvas
	When User waits '1000' miliseconds
	Then 'TestSubtopic1' topic is displayed on Canvas
	#User A Actions	
	When User switches to '1' browser
	When User clicks 'Undo' button on Tools panel
	When User clicks 'Undo' button on Tools panel
	Then 'TestTopic1' topic is not displayed on Canvas
	Then 'TestSubtopic1' topic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'capsule' shape on Canvas
	#User B Action
	When User switches to '0' browser
	Then 'TestTopic1' topic is not displayed on Canvas
	Then 'TestSubtopic1' topic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'capsule' shape on Canvas
	#User A Actions	
	When User switches to '1' browser
	When User clicks 'Redo' button on Tools panel
	When User clicks 'Redo' button on Tools panel
	When User waits '1000' miliseconds
	Then 'TestTopic1' topic is displayed on Canvas
	Then 'TestTopic1' topic is assigned 'capsule' shape on Canvas
	Then 'TestSubtopic1' subtopic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'none' shape on Canvas
	#User B Action
	When User switches to '0' browser
	Then 'TestTopic1' topic is displayed on Canvas
	Then 'TestTopic1' topic is assigned 'capsule' shape on Canvas
	Then 'TestSubtopic1' subtopic is displayed on Canvas
	Then 'TestSubtopic1' topic is assigned 'none' shape on Canvas