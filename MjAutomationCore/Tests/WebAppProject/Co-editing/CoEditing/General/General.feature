@retry(2)
Feature: General
Check General functionality

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

@MindManager @EditingCapabilities @Co_Editing @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-251] @Health_Check @Upd_Qase
Scenario: Verify_that_it_is_possible_to_cut_copy_paste_topic_during_coediting
	#User A logged in
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When '1' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User clicks 'MT1' topic on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User clicks to the 'MT1' topic text on Canvas
	When User presses the Ctrl_A combination key on the keyboard
	When User enters 'TestTopic1' text to the topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	When User clicks 'Main Topic' topic on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	Then 'MT1' is a subtopic of 'Main Topic' topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	#User B Actions
	When User switches to '0' browser
	Then 'TestTopic1' topic is displayed on Canvas
	Then 'MT1' is a subtopic of 'Main Topic' topic on Canvas
	When User clicks 'TestTopic1' topic on Canvas
	When User presses the Ctrl_X combination key on the keyboard
	Then 'TestTopic1' topic is not displayed on Canvas
	#User A Actions
	When User switches to '1' browser
	Then 'TestTopic1' topic is not displayed on Canvas

@MindManager @EditingCapabilities @Co_Editing @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-252] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_cut_copy_paste_topic_text_during_coediting
	#User A logged in
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When '1' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User triple clicks to the 'MT1' topic text on Canvas
	When User presses the Ctrl_C combination key on the keyboard
	When User enters 'TestTopic1' text to the topic on Canvas
	When User clicks by coordinates '120' and '75' on Canvas
	Then 'MT1' topic is not displayed on Canvas
	When User triple clicks to the 'TestTopic1' topic text on Canvas
	When User presses the Ctrl_V combination key on the keyboard
	When User clicks by coordinates '120' and '75' on Canvas
	Then 'MT1' topic is displayed on Canvas
	Then 'TestTopic1' topic is not displayed on Canvas
	#User B Actions
	When User switches to '0' browser
	Then 'MT1' topic is displayed on Canvas
	Then 'TestTopic1' topic is not displayed on Canvas
	When User triple clicks to the 'MT1' topic text on Canvas
	When User presses the Ctrl_X combination key on the keyboard
	When User clicks by coordinates '120' and '75' on Canvas
	Then 'MT1' topic is not displayed on Canvas
	#User A Actions
	When User switches to '1' browser
	Then 'MT1' topic is not displayed on Canvas

@MindManager @EditingCapabilities @Co_Editing @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-255] @Upd_Qase @JIRA[MMCV-7848]
Scenario: Verify_that_expanded_state_of_the_map_is_saved_after_coediting
	#User A logged in
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When '1' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'collapse-all' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'expand-all' name in 'view' menu
	Then all subtopics are expanded on Canvas
	When User clicks on the toolbar logo of Tools panel
	Then 'New' tab is active on file manager header page
	#User B Actions
	When User switches to '0' browser
	When User clicks on the toolbar logo of Tools panel
	Then 'New' tab is active on file manager header page
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then all subtopics are expanded on Canvas

@MindManager @EditingCapabilities @Co_Editing @General @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-256] @Upd_Qase @JIRA[MMCV-7848]
Scenario: Verify_that_collapsed_state_of_the_map_is_saved_after_coediting
	#User A logged in
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'copy-link' name in 'share-contextmenu' menu
	Then Invite others to edit link is copied to clipboard
	When User openes 'chrome' browser
	When User switches to '1' browser
	When '1' User opens shared map link in browser
	When User clicks 'Web' button
	When User switches to '1' tab
	Then Right Side panel is displayed
	When '1' User provides the Login and Password
	Then Web Editor page is displayed to the User
	Then User set zoom level to '32' via the side tool bar
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	When User clicks button with 'collapse-all' name in 'view' menu
	Then all subtopics are collapsed on Canvas
	When User clicks on the toolbar logo of Tools panel
	Then 'New' tab is active on file manager header page
	#User B Actions
	When User switches to '0' browser
	When User clicks on the toolbar logo of Tools panel
	Then 'New' tab is active on file manager header page
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then all subtopics are collapsed on Canvas