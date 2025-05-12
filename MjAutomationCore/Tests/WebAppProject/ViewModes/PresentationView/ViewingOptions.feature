@retry(2)
Feature: ViewingOptions
Checking different viewing options

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath            |
		| auto_test_SRND.mmap | ViewingOptions.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'presentational-settings' name in 'settings' menu
	Then 'Presentation Options' screen is displayed to User

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1242] @Upd_Qase
Scenario: To_verify_that_Expand_Subtopics_On_Topic_Select_expands_topic_subtopics_when_the_parent_topic_is_selected
	Then 'Expand Subtopics On Topic Select' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User checks 'Expand Subtopics On Topic Select' checkbox in the 'General' section of 'Presentation Options' screen
	Then 'Expand Subtopics On Topic Select' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	Then "2" collapsed subtopic are displayed to User
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Start' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1242] @Upd_Qase
Scenario: To_verify_that_Expand_Subtopics_On_Topic_Select_not_expands_topic_subtopics_when_the_parent_topic_is_selected
	Then 'Expand Subtopics On Topic Select' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	Then "2" collapsed subtopic are displayed to User
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Start' button on Menu toolbar
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1243] @Upd_Qase
Scenario: To_verify_that_the_Collapse_Other_Branches_On_Topic_Select_collapses_the_other_topic_branches_when_the_current_topic_is_selected
	Then 'Collapse Other Branches On Topic Select' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User checks 'Collapse Other Branches On Topic Select' checkbox in the 'General' section of 'Presentation Options' screen
	Then 'Collapse Other Branches On Topic Select' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	Then '2' collapsed subtopic of 'Main2' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub2' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub2' topic are displayed to User
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test2' subtopic is displayed on Canvas
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1243] @Upd_Qase
Scenario: To_verify_that_the_Collapse_Other_Branches_On_Topic_Select_not_collapses_the_other_topic_branches_when_the_current_topic_is_selected
	Then 'Collapse Other Branches On Topic Select' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then '2' collapsed subtopic of 'Main1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub1' topic are displayed to User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then '2' collapsed subtopic of 'Main2' topic are displayed to User
	Then 'Sub1' subtopic is displayed on Canvas
	Then 'Test1' subtopic is displayed on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub2' subtopic is displayed on Canvas
	Then "1" collapsed subtopic are displayed to User
	Then '1' collapsed subtopic of 'Sub2' topic are displayed to User
	Then 'Sub1' subtopic is displayed on Canvas
	Then 'Test1' subtopic is displayed on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1244] @Upd_Qase
Scenario: To_verify_that_Fade_Topics_That_Are_Not_Selected_fades_the_topics_that_are_not_on_focus
	Then 'Fade Topics That Are Not Selected' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	Then 'Central Topic' is displayed with at 50 percent opacity on Canvas
	Then 'Main2' is displayed with at 50 percent opacity on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then '1' collapsed subtopic of 'Sub1' topic are displayed to User
	Then 'Central Topic' is displayed with at 50 percent opacity on Canvas
	Then 'Main1' is displayed with at 50 percent opacity on Canvas
	Then 'Main2' is displayed with at 50 percent opacity on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1244] @Upd_Qase
Scenario: To_verify_that_Fade_Topics_That_Are_Not_Selected_does_not_fades_the_topics_that_are_not_on_focus
	When User unchecks 'Fade Topics That Are Not Selected' checkbox in the 'General' section of 'Presentation Options' screen
	Then 'Fade Topics That Are Not Selected' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	Then 'Central Topic' topic is displayed with '1' opacity on Canvas
	Then 'Main2' topic is displayed with '1' opacity on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1245] @Upd_Qase
Scenario: To_verify_that_Animate_Transitions_animates_the_transitions_while_changing_focus
	Then 'Animate Transitions' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Animation transition occurs when changing focus to another topic
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Animation transition occurs when changing focus to another topic
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1245] @Upd_Qase
Scenario: To_verify_that_Animate_Does_Not_Transitions_animates_the_transitions_while_changing_focus
	When User unchecks 'Animate Transitions' checkbox in the 'General' section of 'Presentation Options' screen
	Then 'Animate Transitions' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Animation transition does not occur when changing focus to another topic
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Animation transition does not occur when changing focus to another topic
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1246] @Upd_Qase @JIRA[MMCV-8776]
Scenario: To_verify_that_it_is_possible_to_set_up_custom_Auto_Zoom_settings
	Then 'Auto-Zoom' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User enter '50' value in 'Min Topic Width' input field in the 'General' section of 'Presentation Options' screen
	When User enter '90' value in 'Max Topic Width' input field in the 'General' section of 'Presentation Options' screen
	When User enter '400' value in 'Max Zoom' input field in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then User set zoom level to '400' via the side tool bar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas

@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1247] @Upd_Qase
Scenario: To_verify_that_custom_Zoom_settings_override_the_Auto_Zoom_settings
	Then 'Auto-Zoom' checkbox is checked in the 'General' section of 'Presentation Options' screen
	Then 'Custom zoom overrides auto zoom' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User remembers map size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then map is Zoomed out
	Then map zoom is '40%' on the side tool box
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then map zoom is '40%' on the side tool box
	
@MindManager @View_Modes @ViewingOptions @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1247] @Upd_Qase
Scenario: To_verify_that_custom_Zoom_settings_is_unchecked_in_the_Auto_Zoom_settings
	Then 'Auto-Zoom' checkbox is checked in the 'General' section of 'Presentation Options' screen
	When User enter '200' value in 'Max Zoom' input field in the 'General' section of 'Presentation Options' screen
	When User unchecks 'Custom zoom overrides auto zoom' checkbox in the 'General' section of 'Presentation Options' screen
	Then 'Custom zoom overrides auto zoom' checkbox is unchecked in the 'General' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User remembers map size
	When User clicks Zoom Out button on zoom bar of side toolbox
	Then map is Zoomed out
	Then map zoom is '40%' on the side tool box
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	When User waits '1000' miliseconds
	Then map zoom is '200%' on the side tool box

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1248] @Upd_Qase
Scenario: To_verify_that_the_comments_inspector_opens_when_the_map_is_focused_on_the_topic_with_the_comment_if_Next_Button_Shows_Comments_in_presentation_checkbox_is_checked
	Then '"Start" Button Shows Comments in presentation' checkbox is checked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	Then 'PanelPublished' side panel with 'Comments' header is displayed to the User
	When User clicks 'Next' button on Menu toolbar
	Then 'PanelPublished' side panel with 'Comments' header is not displayed to the User
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1248] @Upd_Qase
Scenario: To_verify_that_the_comments_inspector_opens_when_the_map_is_focused_on_the_topic_with_the_comment_if_Next_Button_Shows_Comments_in_presentation_checkbox_is_unchecked
	When User unchecks '"Start" Button Shows Comments in presentation' checkbox in the 'Content' section of 'Presentation Options' screen
	Then '"Start" Button Shows Comments in presentation' checkbox is unchecked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	Then 'PanelPublished' side panel with 'Comments' header is not displayed to the User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1249] @Upd_Qase
Scenario: To_verify_that_the_Notes_inspector_opens_when_the_map_is_focused_on_the_topic_with_the_comment_if_Next_Button_Shows_Note_in_presentation_checkbox_is_checked
	Then '"Start" Button Shows Notes in presentation' checkbox is checked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	Then 'PanelPublished' side panel with 'Notes' header is displayed to the User
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	Then 'PanelPublished' side panel with 'Notes' header is not displayed to the User

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1249] @Upd_Qase
Scenario: To_verify_that_the_Notes_inspector_opens_when_the_map_is_focused_on_the_topic_with_the_comment_if_Next_Button_Shows_Note_in_presentation_checkbox_is_unchecked
	When User unchecks '"Start" Button Shows Notes in presentation' checkbox in the 'Content' section of 'Presentation Options' screen
	Then '"Start" Button Shows Notes in presentation' checkbox is unchecked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	Then 'PanelPublished' side panel with 'Notes' header is not displayed to the User

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1250] @Upd_Qase
Scenario: To_verify_that_the_Links_Attachments_inspector_opens_when_the_map_is_focused_on_the_topic_with_Links_and_Attachments_if_Next_Button_Shows_Note_in_presentation_checkbox_is_checked
	Then '"Start" Button Shows Attachments & Links in presentation' checkbox is checked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub2' topic on Canvas
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1250] @Upd_Qase @JIRA[MMCV-7268]
Scenario: To_verify_that_the_Links_Attachments_inspector_opens_when_the_map_is_focused_on_the_topic_with_Links_and_Attachments_if_Next_Button_Shows_Note_in_presentation_checkbox_is_unchecked
	When User unchecks '"Start" Button Shows Attachments & Links in presentation' checkbox in the 'Content' section of 'Presentation Options' screen
	Then '"Start" Button Shows Attachments & Links in presentation' checkbox is unchecked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	When User clicks 'Restart' button on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub2' topic on Canvas
	Then 'PanelPublished' side panel with 'Attachments & Links' header is not displayed to the User

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1251] @Upd_Qase
Scenario: To_verify_that_when_Show_Callouts_For_Selected_Topic_Only_is_enabled_the_callouts_for_the_topic_on_focus_are_displayed
	Then 'Show Callouts For Selected Topic Only' checkbox is checked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Test2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main3' topic on Canvas
	Then 'Cal1' callout is displayed on Canvas
	Then 'Cal1' topic is displayed with '1' opacity on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Cal1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Cal1' callout is not displayed on Canvas
	Then Topic Border is highlight blue color in 'Main4' topic on Canvas
	Then 'Cal2' callout is displayed on Canvas
	Then 'Cal2' topic is displayed with '1' opacity on Canvas

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1251] @Upd_Qase
Scenario: To_verify_that_when_Show_Callouts_For_Selected_Topic_Only_is_disable_the_callouts_for_the_topic_on_focus_are_displayed
	When User unchecks 'Show Callouts For Selected Topic Only' checkbox in the 'Content' section of 'Presentation Options' screen
	Then 'Show Callouts For Selected Topic Only' checkbox is unchecked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User waits '2000' miliseconds
	Then 'Cal1' topic is displayed with '0.3' opacity on Canvas
	Then 'Cal2' topic is displayed with '0.3' opacity on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Test2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	When User waits '1000' miliseconds
	Then Topic Border is highlight blue color in 'Main3' topic on Canvas
	Then 'Cal1' callout is displayed on Canvas
	Then 'Cal1' topic is displayed with '1' opacity on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Cal1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	When User waits '1500' miliseconds
	Then Topic Border is highlight blue color in 'Main4' topic on Canvas
	Then 'Cal2' callout is displayed on Canvas
	Then 'Cal1' topic is displayed with '0.3' opacity on Canvas
	Then 'Cal2' topic is displayed with '1' opacity on Canvas

@MindManager @View_Modes @Content @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1252] @Upd_Qase
Scenario: To_verify_that_Show_Related_Topics_in_presentation_shows_related_topic_in_the_Presentation_view_mode
	Then 'Show Related Topics in presentation' checkbox is checked in the 'Content' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Start' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub1' topic on Canvas
	Then Comment icon is displayed to the 'Sub1' topic infobox
	When User clicks 'Next' button on Menu toolbar
	Then 'Test1' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Test2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main3' topic on Canvas
	Then 'Cal1' callout is displayed on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Cal1' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main4' topic on Canvas
	Then 'Cal2' callout is displayed on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Cal2' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main5' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub5' topic on Canvas
	Then 'PanelPublished' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Next' button on Menu toolbar
	Then 'Test6' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Test6' topic on Canvas
	Then '1' relationship lines are displayed on Canvas
	Then 'Relation1' topic is displayed on Canvas
	Then 'Main6' topic is displayed with '0.3' opacity on Canvas
	Then 'Sub6' topic is displayed with '0.3' opacity on Canvas

@MindManager @View_Modes @Pace @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1253] @Upd_Qase
Scenario: To_verify_that_is_Not_possible_to_expand_all_topics_in_the_branch_after_clicking_the_Next_button
	Then 'Reveal Subtopics One At a Time' checkbox is unchecked in the 'Pace' section of 'Presentation Options' screen
	When User checks 'Reveal Subtopics One At a Time' checkbox in the 'Pace' section of 'Presentation Options' screen
	Then 'Reveal Subtopics One At a Time' checkbox is checked in the 'Pace' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Main7' topic on Canvas
	Then Topic Border is highlight blue color in 'Main7' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7first' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7first' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7first' subtopic is displayed on Canvas
	Then 'Sub7first' topic is displayed with '0.3' opacity on Canvas
	Then 'Sub7second' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7second' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7first' subtopic is displayed on Canvas
	Then 'Sub7second' subtopic is displayed on Canvas
	Then 'Sub7third' subtopic is displayed on Canvas
	Then 'Sub7first' topic is displayed with '0.3' opacity on Canvas
	Then 'Sub7second' topic is displayed with '0.3' opacity on Canvas
	Then Topic Border is highlight blue color in 'Sub7third' topic on Canvas

@MindManager @View_Modes @Pace @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1253] @Upd_Qase
Scenario: To_verify_that_is_possible_to_expand_all_topics_in_the_branch_after_clicking_the_Next_button
	Then 'Reveal Subtopics One At a Time' checkbox is unchecked in the 'Pace' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Main7' topic on Canvas
	Then Topic Border is highlight blue color in 'Main7' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7first' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7first' topic on Canvas
	Then 'Sub7second' subtopic is displayed on Canvas
	Then 'Sub7third' subtopic is displayed on Canvas
	Then 'Sub7second' topic is displayed with '0.3' opacity on Canvas
	Then 'Sub7third' topic is displayed with '0.3' opacity on Canvas

@MindManager @View_Modes @Pace @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1254] @Upd_Qase
Scenario: To_verify_that_when_Next_Button_Visits_All_Topics_Even_When_They_Have_No_Subtopics_is_disable
	When User unchecks '"Start" Button Visits All Topics (Even When They Have No Subtopics)' checkbox in the 'Pace' section of 'Presentation Options' screen
	Then '"Start" Button Visits All Topics (Even When They Have No Subtopics)' checkbox is unchecked in the 'Pace' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Main7' topic on Canvas
	Then Topic Border is highlight blue color in 'Main7' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main8' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub8' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub8' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Central Topic' topic on Canvas

@MindManager @View_Modes @Pace @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1254] @Upd_Qase
Scenario: To_verify_that_when_Next_Button_Visits_All_Topics_Even_When_They_Have_No_Subtopics_is_enable
	Then '"Start" Button Visits All Topics (Even When They Have No Subtopics)' checkbox is checked in the 'Pace' section of 'Presentation Options' screen
	When User clicks 'OK' button on 'Presentation Options' screen
	Then 'Presentation Options' screen is not displayed to User
	Then Menu toolbar is displayed to Standard mode in 'top' side on page
	When User clicks menu button with 'view' name in 'ToolbarPageElement' container
	Then 'view' Menu is displayed to User
	When User clicks button with 'presentation-view' name in 'view' menu
	Then Menu toolbar is displayed to Presentation mode
	Then 'menu' button is displayed on Menu toolbar
	Then 'Start' button is displayed on Menu toolbar
	When User clicks 'Main7' topic on Canvas
	Then Topic Border is highlight blue color in 'Main7' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7first' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7first' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7second' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7second' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then 'Sub7third' subtopic is displayed on Canvas
	Then Topic Border is highlight blue color in 'Sub7third' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Main8' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Sub8' topic on Canvas
	When User clicks 'Next' button on Menu toolbar
	Then Topic Border is highlight blue color in 'Test8' topic on Canvas