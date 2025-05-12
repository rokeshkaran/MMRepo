@retry(2)
Feature: General
Check General functionality

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-257] @Upd_Qase
Scenario: Side_panel_view
	Then following templates on Side menu panel are displayed to the User:
		| templates           |
		| Filter              |
		| Task Information    |
		| Icons               |
		| Comments            |
		| Tags                |
		| Properties          |
		| Notes               |
		| Attachments & Links |
		| Design              |
		| Format Shape        |
		| Image               |
		| Snap                |
	When User mouse over on 'Filter' button of side toolbox
	Then 'Filter' tooltip is displayed to the User
	When User mouse over on 'Task Information' button of side toolbox
	Then 'Task Information' tooltip is displayed to the User
	When User mouse over on 'Icons' button of side toolbox
	Then 'Icons' tooltip is displayed to the User
	When User mouse over on 'Comments' button of side toolbox
	Then 'Comments' tooltip is displayed to the User
	When User mouse over on 'Tags' button of side toolbox
	Then 'Tags' tooltip is displayed to the User
	When User mouse over on 'Properties' button of side toolbox
	Then 'Properties' tooltip is displayed to the User
	When User mouse over on 'Notes' button of side toolbox
	Then 'Notes' tooltip is displayed to the User
	When User mouse over on 'Attachments & Links' button of side toolbox
	Then 'Attachments & Links' tooltip is displayed to the User
	When User mouse over on 'Design' button of side toolbox
	Then 'Design' tooltip is displayed to the User
	When User mouse over on 'Format Shape' button of side toolbox
	Then 'Format Shape' tooltip is displayed to the User
	When User mouse over on 'Image' button of side toolbox
	Then 'Image' tooltip is displayed to the User
	When User mouse over on 'Snap' button of side toolbox
	Then 'Snap' tooltip is displayed to the User

@MindManager @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-254] @Upd_Qase
Scenario: Check_that_user_can_get_information_about_the_select_ability_of_topics
	When User hovers cursor the 'MT1' topic
	Then 'MT1' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	And 'MT1' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User hovers cursor the 'MT2ST1ST' topic
	Then 'MT2ST1ST' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas

@MindManager @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-259] @Upd_Qase @JIRA[MMCV-8980]
Scenario: Check_it_is_possible_to_add_large_topic_text_to_the_map
	When User clicks 'FT2' topic on Canvas
	And User clicks on text in the 'FT2' topic on Canvas
	And User enters '2000' characters to the topic
	And User clicks by coordinates '100' and '100' on Canvas
	Then User checks the text in the topic

@MindManager @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-258] @Upd_Qase
Scenario: Check_Cut_topics_via_toolbar
	When User clicks 'MT1' topic on Canvas
	And User clicks 'Cut' button on Tools panel
	Then 'MT1' topic is not displayed on Canvas

@MindManager @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-258] @Upd_Qase
Scenario: Check_Copy_Paste_topics_via_toolbar
	When User clicks 'MT1' topic on Canvas
	And User clicks 'Copy' button on Tools panel
	And User clicks 'CT' topic on Canvas
	And User clicks 'Paste' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Single_Click
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	#Single Click on Topic 
	When User clicks on text in the 'MT1' topic on Canvas
	And User enters 'Test1' text to the topic on Canvas
	And User clicks by coordinates '100' and '100' on Canvas
	Then 'MTest1T1' topic is displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Double_Click
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	#Double Click on Topic 
	When User clicks 'FT3' topic on Canvas
	And User double clicks to the 'FT3' topic text on Canvas
	And User waits '1000' miliseconds
	And User enters 'SecondTest2' by character to the 'FT3' topic on Canvas
	And User clicks by coordinates '200' and '70' on Canvas
	Then 'SecondTest2' topic is displayed on Canvas
	And 'FT3' topic is not displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Triple_Click
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	#Triple Click on Topic 
	When User pings all browsers
	And User clicks on text in the 'Text Formatting' topic on Canvas
	And User triple clicks to the 'Text Formatting' topic text on Canvas
	And User enters 'Test3' by character to the 'Text Formatting' topic on Canvas
	And User clicks by coordinates '200' and '70' on Canvas
	Then 'Test3' topic is displayed on Canvas
	And 'Text Formatting' topic is not displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase @JIRA[MMCV-8868]
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Space_Button
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User presses the 'Space' key on the keyboard
	And User presses the 'A' key on the keyboard
	And User clicks by coordinates '200' and '70' on Canvas
	And User clicks 'MT1A' topic on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Press_Any_Key
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User clicks 'MT1' topic on Canvas
	Then 'MT1' is outlined with a blue circuit
	When User presses the 'A' key on the keyboard
	And User presses the 'A' key on the keyboard
	And User clicks by coordinates '200' and '70' on Canvas
	Then 'AA' topic is displayed on Canvas
	And 'MT1' topic is not displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Drag_Cursor
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User remembers 'Properties' topic model id and name
	And User clicks 'Properties' topic on Canvas
	And User clicks on text in the 'Properties' topic on Canvas
	And User clicks and hold editable cursor and moves by '50' '0' coordinates on Canvas
	And User presses the 'A' key on the keyboard
	And User presses the 'A' key on the keyboard
	And User presses the 'Enter' key on the keyboard
	Then 'PropAA' topic is displayed on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Press_Shift_Enter
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User remembers 'Properties' topic model id and name
	And User clicks 'Properties' topic on Canvas
	And User clicks on text in the 'Properties' topic on Canvas
	And User presses the Shift_Enter combination key on the keyboard
	And User clicks by coordinates '200' and '70' on Canvas
	Then text 'Prop' is displayed in '"Segoe UI", "Source Sans Pro"' font in the 'Properties' topic on Canvas
	And text 'erties' is displayed in '"Segoe UI", "Source Sans Pro"' font in the 'Properties' topic on Canvas

@MindManager @Co_Editing @EditingCapabilities @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-250] @Upd_Qase
Scenario: Check_that_it_is_possible_to_add_edit_remove_topic_during_coediting_Backspace_Button
	When User openes 'chrome' browser
	And User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User login to SharePoint cloud
	And User clicks 'Documents' folder
	And User clicks 'For QA automation' folder
	And User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	And User set zoom level to '50' via the side tool bar
	When User clicks 'FT3' topic on Canvas
	And User clicks on text in the 'FT3' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	And User presses the 'Backspace' key on the keyboard
	And User clicks 'FT2' topic on Canvas
	And User waits '2000' miliseconds
	Then 'FT3' topic is not displayed on Canvas