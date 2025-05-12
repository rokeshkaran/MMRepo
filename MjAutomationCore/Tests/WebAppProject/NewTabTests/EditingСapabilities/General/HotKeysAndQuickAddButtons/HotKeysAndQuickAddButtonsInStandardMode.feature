@retry(2)
Feature: HotKeysAndQuickAddButtonsInStandardMode
Check hotkeys and quick add buttons in standard mode functionality

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-263] @Upd_Qase
Scenario: Add_topic_via_the_keyboard
	#User B logged in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '0' browser
	And User clicks 'MT' topic on Canvas
	And User presses the 'Insert' key on the keyboard
	Then 'Subtopic' topic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Undo' button on Tools panel
	#Add_Subtopic_via_Ctrl_Enter_combination_key_on_the_keyboard
	And User clicks 'MT' topic on Canvas
	And User presses the Ctrl_Enter combination key on the keyboard
	Then 'Subtopic' topic is displayed on Canvas
	And 'Subtopic' is outlined with a blue circuit
	When User clicks 'Undo' button on Tools panel
	#Add_sibling_topic_via_Shift_Enter_combination_key_on_the_keyboard
	And User clicks 'MT' topic on Canvas
	And User presses the Shift_Enter combination key on the keyboard
	Then 'Main Topic' topic is displayed on Canvas
	And 'Main Topic' is outlined with a blue circuit
	When User clicks 'Undo' button on Tools panel
	#Add_Topic_via_Enter_key_on_the_keyboard
	And User clicks 'MT' topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then 'Main Topic' topic is displayed on Canvas
	And 'Main Topic' is outlined with a blue circuit
	And 'Main Topic' topic is assigned 'capsule' shape on Canvas
	When User clicks 'Undo' button on Tools panel
	#Add_Insert_parent_topic_via_Ctrl_Shift_Insert_combination_key_on_the_keyboard
	And User clicks 'MT' topic on Canvas
	And User presses and hold the 'Ctrl' key on the keyboard
	And User presses the Shift and 'Insert' key combination on the keyboard
	Then 'Main Topic' topic is displayed on Canvas
	And 'Main Topic' is outlined with a blue circuit
	And '3' collapse button is displayed on Canvas
	#Add_callout_topic_via_Ctrl_Shift_Enter_combination_key_on_the_keyboard
	When User clicks 'MT' topic on Canvas
	And User presses the Ctrl_Shift_Enter combination key on the keyboard
	Then 'Callout' callout is displayed on Canvas
	And 'Callout' is outlined with a blue circuit
	When User switches to '1' browser
	Then 'Main Topic' topic is displayed on Canvas
	And 'Callout' callout is displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-263] @Upd_Qase
Scenario: Remove_topic_via_Delete_key_during_coediting
	#User B logged in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '0' browser
	And User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	When User presses the 'Delete' key on the keyboard
	Then '12345' topic is not displayed on Canvas
	And '2378' topic is not displayed on Canvas
	When User switches to '1' browser
	Then Web Editor page is displayed to the User
	And '12345' topic is not displayed on Canvas
	And '2378' topic is not displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-263] @Upd_Qase @JIRA[MMCV-9835]
Scenario: Remove_topic_via_Ctrl_Shift_Delete_key_during_coediting
	#User B logged in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '0' browser
	And User clicks '12345' topic on Canvas
	And User presses the Ctrl_Shift_Delete combination key on the keyboard
	Then '12345' topic is not displayed on Canvas
	And '2378' topic is displayed on Canvas
	When User switches to '1' browser
	Then Web Editor page is displayed to the User
	And '12345' topic is not displayed on Canvas
	And '2378' topic is displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-265] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_the_relationship_to_the_topic_via_keyboard_shortcut
	When User clicks 'CT' topic on Canvas
	And User presses the CTRL_SHIFT_R combination key on the keyboard
	And User moves cursor by '-10' '-10' coordinates on Canvas
	And User clicks 'MT' topic on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	And '1' relationship lines are displayed on Canvas
	When User presses the CTRL_SHIFT_R combination key on the keyboard
	And User clicks 'FT' topic on Canvas
	And User moves cursor by '-10' '-10' coordinates on Canvas
	And User clicks '12345' topic on Canvas
	Then '2' relationship lines are displayed on Canvas
	And Bezier has '2' endpoint handlebars on Topics

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-266] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_the_Boundaries_during_coediting
	#User B logged in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User switches to '0' browser
	And User clicks 'MT' topic on Canvas
	And User presses the CTRL_SHIFT_B combination key on the keyboard
	Then 'MT' topic is located in boundary on Canvas
	When User switches to '1' browser
	Then 'MT' topic is located in boundary on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-267] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_topics_during_coediting
	# User A selects a topic
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	#User B logs in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And 'left' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'right' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'top' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'bottom' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# Add subtopic using left quick button
	When User clicks 'left' quick add button on '12345' topic CoEditing frame on Canvas
	Then 'Subtopic' subtopic is displayed on Canvas
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And 'left' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'right' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'top' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'bottom' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# Add main topic using bottom quick button
	When User clicks 'bottom' quick add button on '12345' topic CoEditing frame on Canvas
	Then 'Main Topic' topic is displayed on Canvas
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# subtopic and main topic refects for User A
	When User switches to '0' browser
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Main Topic' topic is displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @Co_Editing @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-267] @Upd_Qase
Scenario: Check_that_it_is_possible_to_edit_topic_via_key_combination_during_coediting
	# User A selects a topic
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	#User B logs in
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'RuntimeDataFiles' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And 'left' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'right' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'top' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'bottom' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# Add subtopic using ctrl+enter
	When User presses the Ctrl_Enter combination key on the keyboard
	Then 'Subtopic' subtopic is displayed on Canvas
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And 'left' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'right' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'top' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And 'bottom' quick add button is displayed on '12345' topic CoEditing frame on Canvas
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# Add relationship using ctrl+shift+R
	When User presses the CTRL_SHIFT_R combination key on the keyboard
	And User moves cursor by '-10' '-10' coordinates on Canvas
	And User clicks 'MT' topic on Canvas
	Then Bezier has '2' endpoint handlebars on Topics
	And '1' relationship lines are displayed on Canvas
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	And lock icon is displayed on '12345' topic CoEditing frame on Canvas
	# Add boundary using ctrl+shift+B
	When User presses the CTRL_SHIFT_B combination key on the keyboard
	Then '12345' topic is located in boundary on Canvas
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	# Add callout using button on tools panel
	When User clicks 'Add callout' button on Tools panel
	Then 'Callout' callout is displayed on Canvas
	# subtopic and callout refects for User A
	When User switches to '0' browser
	Then 'Subtopic' subtopic is displayed on Canvas
	And 'Callout' callout is displayed on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2900] @Upd_Qase
Scenario: Check_that_relationships_can_be_added_via_quick_add_buttons
	When User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	# Add relationship via top add quick button
	When User clicks on 'top' Plus button and hold in '12345' topic on Canvas
	And User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	And cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'Undo' button on Tools panel
	And User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	# Add relationship via left add quick button
	When User clicks on 'left' Plus button and hold in '12345' topic on Canvas
	And User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	And cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'Undo' button on Tools panel
	And User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	# Add relationship via bottom add quick button
	When User clicks on 'bottom' Plus button and hold in '12345' topic on Canvas
	And User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	And cursor relationship added to the 'MT' topic on Canvas
	When User clicks 'Undo' button on Tools panel
	And User clicks '12345' topic on Canvas
	Then '12345' is outlined with a blue circuit
	# Add relationship via right add quick button
	When User clicks on 'right' Plus button and hold in '12345' topic on Canvas
	And User clicks 'MT' topic on Canvas
	Then 'MT' is outlined with a blue circuit
	And cursor relationship added to the 'MT' topic on Canvas

@MindManager @EditingCapabilities @HotKeysAndQuickAddButtons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1486] @Upd_Qase
Scenario Outline: Add_callout
	When User clicks '<TopicName>' topic on Canvas
	And User presses the Ctrl_Shift_Enter combination key on the keyboard
	Then 'Callout' callout is displayed on Canvas
	And 'Callout' is outlined with a blue circuit
Examples:
	| TopicName |
	| 12345     |
	| 2378      |
	| FT        |