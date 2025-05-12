@retry(2)
Feature: CardMode
Check Card mode functionality 

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath                     |
		| auto_test_SRND.mmap | CardModeDefaultBehavior.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2097] @Upd_Qase
Scenario: Verify_that_Topics_in_Card_mode_is_displayed_correctly
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	And 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox
	And 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	And 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	And 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	And Only topic name is displayed in 'Floating Topic' topic on Canvas
	
@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2104] @Upd_Qase
Scenario: Verify_that_image_is_not_added_inside_Card_mode_topic
	When User clicks 'Property Topic' topic on Canvas
	Then 'Property Topic' is outlined with a blue circuit
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Property Topic' Topic infobox
	And Only topic name is displayed in 'Property Topic' topic on Canvas
	When User clicks Image icon in 'Property Topic' topic infobox
	Then image is displayed on 'lightbox' dialog with approximate '1129' width and approximate '1129' height

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2136] @Upd_Qase
Scenario: Verify_that_image_is_displayed_in_correct_format_when_it_is_dropped_between_different_modes_of_topics
	When User clicks 'Add floating topic' button on Tools panel
	And User add floating topic by coordinates '100', '50' to the Canvas
	And User presses the 'A' key on the keyboard
	And User presses the 'Enter' key on the keyboard
	And User drag image icon from 'Floating Topic' topic infobox on 'A' topic
	Then Image is selected on 'A' topic
	And 'A' is outlined with a blue circuit
	And User set zoom level to '45' via the side tool bar
	And 'topic_info_icon_image.svg' Image Icon is not displayed to the 'Floating Topic' Topic infobox
	When User drags image in 'Normal Topic' topic and drop onto 'Main Topic 1' topic
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Main Topic 1' Topic infobox
	And Only topic name is displayed in 'Main Topic 1' topic on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2105] @Upd_Qase
Scenario: Verify_that_it_is_possible_to_add_icons_to_card_mode_topic_and_it_is_displayed_in_topic_info_box
	When User clicks 'Main Topic 1' topic on Canvas
	And User clicks 'Icons' button of side Toolbox
	And User clicks 'Priority 5' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 5' Icon is displayed to the 'Main Topic 1' Topic infobox
	When User drags '25% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header on 'Main Topic 1' topic of Canvas
	Then '25% done' Icon is displayed to the 'Main Topic 1' Topic infobox
	When User drags 'Neutral' Icon from 'Normal Topic' topic on 'Main Topic 1' topic
	Then 'Neutral' Icon is displayed to the 'Main Topic 1' Topic infobox
	When User clicks 'Move' item in 'Flags' section of 'PanelByName' side panel with 'Icons' header
	Then 'Move' Icon is displayed to the 'Main Topic 1' Topic infobox
	When User clicks 'Question' item in 'Single Icons' section of 'PanelByName' side panel with 'Icons' header
	Then 'Question' Icon is displayed to the 'Main Topic 1' Topic infobox

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2137] @Upd_Qase
Scenario: Verify_that_Icon_is_displayed_in_correct_format_when_it_is_dropped_between_different_modes_of_topics
	When User clicks 'Add floating topic' button on Tools panel
	And User add floating topic by coordinates '100', '50' to the Canvas
	And User presses the 'A' key on the keyboard
	And User presses the 'Enter' key on the keyboard
	And User drags 'Priority 2' Icon from 'Floating Topic' topic on 'A' topic
	Then 'Priority 2' Icon is displayed to the 'A' Topic
	And 'Priority 2' Icon is not displayed to the 'A' Topic infobox
	When User drags 'Priority 2' Icon from 'A' topic on 'Property Topic' topic
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Property Topic' Topic infobox
	And Only topic name is displayed in 'Property Topic' topic on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2110,WEB-2111] @Upd_Qase
Scenario: Verify_that_Auto_value_is_available_for_topics_in_Card_mode
	When User clicks 'Floating Topic' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container
	When User clicks font size section in text editor and selects '26' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	And User clicks font size section in text editor and selects 'auto' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2106] @Upd_Qase
Scenario: Verify_changing_stacking_order_on_Card_behavior_topics
	Then 'Stacked Topic 1' Topic Center is not overlapped on Canvas
	When User Right clicks on 'Stacked Topic 1' topic
	And User clicks button with 'topic-backward-stacking' name in 'topic-contextmenu' menu
	Then 'Stacked Topic 2' Topic Center is not overlapped on Canvas
	When User Right clicks on 'Stacked Topic 1' topic
	And User clicks button with 'topic-forward-stacking' name in 'topic-contextmenu' menu
	Then 'Stacked Topic 1' Topic Center is not overlapped on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2114] @Upd_Qase
Scenario: Verify_that_topic_and_text_sizes_do_not_change_if_text_fits_to_topic_size
	When User remembers 'Floating Topic' topic width size
	And User clicks 'Floating Topic' topic on Canvas
	And User clicks 'Floating Topic' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	And User enters 'Topic' text to the topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then 'Topic' topic width not changed on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2117] @Upd_Qase
Scenario: Verify_that_topic_and_text_sizes_is_explicitly_changed
	When User clicks 'Main Topic 2' topic on Canvas
	Then Floating Toolbar is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size '10' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2118] @Upd_Qase
Scenario: Verify_that_text_is_truncated_after_increasing_topic_text_size_by_Smart_rule
	When User remembers 'Main Topic 1' topic width size
	And User clicks 'Main Topic 1' topic on Canvas
	And User clicks 'Main Topic 1' topic on Canvas
	And User presses the Ctrl_A combination key on the keyboard
	And User enters 'IncreaseTextSize' text to the topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis 'IncreaseTex…' is displayed in Topic
	When User clicks 'IncreaseTex…' topic on Canvas
	Then font size '14' is displayed in font style section of text editor in 'TextEditorPopup' container
	And 'IncreaseTextSize' topic width not changed on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2119] @Upd_Qase
Scenario: Verify_that_text_is_truncated_after_increasing_topic_text_size
	When User remembers 'Main Topic 1' topic width size
	And User clicks 'Main Topic 1' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis 'Main T…' is displayed in Topic
	When User clicks 'Main T…' topic on Canvas
	Then font size '14' is displayed in font style section of text editor in 'TextEditorPopup' container
	And 'Main Topic 1' topic width not changed on Canvas

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2120] @Upd_Qase
Scenario: Verify_that_behaviour_card_mode_topic_with_small_text
	When User clicks 'Main Topic 1' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks font size section in text editor and selects '8' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then Floating Toolbar is displayed on Canvas
	And 'Main Topic 1' topic text container width is '55'

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2121] @Upd_Qase
Scenario: Verify_that_hovering_on_truncated_topic_text_shows_a_tooltip_with_full_text
	When User remembers 'Main Topic 1' topic width size
	And User clicks 'Main Topic 1' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks font size section in text editor and selects '14' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis 'Main T…' is displayed in Topic
	When User hovers cursor the 'Main T…' topic
	Then 'Main Topic 1' topic is displayed in tooltip
	
@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2122] @Upd_Qase
Scenario: Verify_that_hovering_on_ellipse_after_truncated_topic_text_shows_a_tooltip_with_full_text
	When User remembers 'Main Topic 1' topic width size
	And User clicks 'Main Topic 1' topic on Canvas
	And User clicks on 'Font format' option in Floating Toolbar Popup
	And User clicks font size section in text editor and selects '18' option in 'text-style-size' selectbox in 'TextEditorPopup' container
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis '…' is displayed in Topic
	When User hovers cursor the '…' topic
	Then 'Main Topic 1' topic is displayed in tooltip

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2125] @Upd_Qase
Scenario: Verify_topic_info_of_card_mode_topic_when_images_are_hidden_in_map_settings
	When User clicks 'Floating Topic' topic on Canvas
	And User clicks 'Floating Topic' topic on Canvas
	And User enters 'IncreaseTextSize' text to the topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis 'IncreaseT…' is displayed in Topic
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	And User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Images' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Images' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	And 'topic_info_icon_image.svg' Image Icon is not displayed to the 'IncreaseT…' Topic infobox
	And Three dots button is displayed in 'IncreaseT…' Topic infobox
	When User clicks Three dots button in 'IncreaseT…' Topic infobox
	Then 'IncreaseTextSize' topic is displayed in 'topic-card' dialog
	And 'topic_info_icon_image.svg' Image Icon is displayed to the 'IncreaseTextSize' Topic infobox in 'topic-card' Dialog

@MindManager @EditingCapabilities @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2123] @Upd_Qase
Scenario: Verify_topic_info_of_card_mode_topic_when_icons_are_hidden_in_map_settings
	When User clicks 'Floating Topic' topic on Canvas
	And User clicks 'Floating Topic' topic on Canvas
	And User enters 'IncreaseTextSize' text to the topic on Canvas
	And User presses the 'Enter' key on the keyboard
	Then Floating Toolbar is displayed on Canvas
	And text is truncated and ellipsis 'IncreaseT…' is displayed in Topic
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	And User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	When User unchecks 'Icons' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Icons' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	And 'Priority 2' Icon is not displayed to the 'IncreaseTextSize' Topic infobox
	And Three dots button is displayed in 'IncreaseT…' Topic infobox
	When User clicks Three dots button in 'IncreaseT…' Topic infobox
	Then 'IncreaseTextSize' topic is displayed in 'topic-card' dialog
	And 'Priority 2' Icon is displayed to the 'IncreaseTextSize' Topic infobox in 'topic-card' dialog