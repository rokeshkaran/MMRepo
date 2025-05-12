@retry(2)
Feature: StickyNote
Check Sticky Note functionality 

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | StickyNotes.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2186] @Upd_Qase
Scenario: Verify_User_Can_View_Number_Of_Comments_On_The_Comments_Icon_For_Sticky_Note
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	When User enters 'Automation comment-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment1-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment2-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment3-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment4-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment5-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment6-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment7-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	When User enters 'Automation comment8-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '9' number is displayed in the comment icon of the 'Sticky note' topic infobox
	When User enters 'Automation comment9-SRND' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '9+' number is displayed in the comment icon of the 'Sticky note' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2187] @Upd_Qase
Scenario: Verify_User_Can_Remove_Tag_After_Clicking_On_X_Button_On_Sticky_Note
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Tags' button of side Toolbox
	When User clicks 'To Do' item in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' item is displayed as selected in 'Kanban' section of 'PanelByName' side panel with 'Tags' header
	Then 'To Do' tag is displayed in 'Sticky note' topic infobox
	When User clicks Remove button to 'To Do' tag in 'Sticky note' topic infobox
	Then 'To Do' tag is not displayed in 'Sticky note' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2188] @Upd_Qase
Scenario: Verify_User_Can_Remove_Resource_After_Clicking_On_X_Button_On_Sticky_Note
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'Resource #1' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'Resource #1' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Resource #1' resource is displayed in 'Sticky note' topic
	When User clicks Remove button to 'Resource #1' resource in 'Sticky note' topic
	Then 'Resource #1' resource is not displayed in 'Sticky note' topic

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2347] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_Sticky_note_topics_always_have_icons_and_images_in_the_info_box
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Sticky Note 2' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 2' topic on Canvas
	Then 'To Do' tag is displayed in 'Sticky Note 2' topic infobox
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'To Do' tag is displayed in 'Sticky Note 2' topic infobox
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2347] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_topics_have_icons_and_images_in_the_info_box
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	When User clicks 'Topic' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic' topic on Canvas
	Then 'To Do' tag is displayed in 'Sticky Note 2' topic infobox
	Then image is displayed in 'Topic' topiс on Canvas
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox
	When User Right clicks on 'Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'To Do' tag is displayed in 'Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then '50% done' Icon is displayed to the 'Topic' Topic
	Then 'Right' Icon is displayed to the 'Topic' Topic
	Then 'Neutral' Icon is displayed to the 'Topic' Topic
	Then 'Priority 2' Icon is displayed to the 'Topic' Topic
	Then image is displayed in 'Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2336] @JIRA[MMCV-9759] @Upd_Qase @Build_24.1.106
Scenario: To_verify_that_Sticky_notes_always_have_topic_info_on_one_line
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Sticky Note 2' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 2' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,62)'
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,82)'
	Then 'To Do' tag is displayed in 'Sticky Note 2' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,41)'
	Then Notes icon is displayed to the 'Sticky Note 2' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Sticky Note 2' Topic with X value '21' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Sticky Note 2' Topic with X value '63' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Sticky Note 2' Topic with X value '42' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Sticky Note 2' Topic with X value '0' and Y value '0'
	Then 'topic_info_icon_image' Image Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic with X value '84' and Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,82.5)'
	When User Right clicks on 'Sticky Note 2' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,62)'
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,82)'
	Then 'To Do' tag is displayed in 'Sticky Note 2' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,41)'
	Then Notes icon is displayed to the 'Sticky Note 2' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Sticky Note 2' Topic with X value '21' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Sticky Note 2' Topic with X value '63' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Sticky Note 2' Topic with X value '42' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Sticky Note 2' Topic with X value '0' and Y value '0'
	Then 'topic_info_icon_image' Image Icon is displayed to the 'Sticky Note 2' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,20)'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Sticky Note 2' Topic with X value '84' and Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Sticky Note 2' Topic infobox with transform value 'translate(0,82)'

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2336] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_topics_have_icons_and_images_topic_info_on_one_line
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Topic' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Topic' topic on Canvas
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,2)'
	Then 'To Do' tag is displayed in 'Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,2)'
	Then Notes icon is displayed to the 'Topic' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Topic' Topic with X value '21' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Topic' Topic with X value '63' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Topic' Topic with X value '42' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Topic' Topic with X value '0' and Y value '0'
	Then image is displayed in 'Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'Alarm' Icon is displayed to the 'Topic' Topic
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,3)'
	When User Right clicks on 'Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,61)'
	Then 'To Do' tag is displayed in 'Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,41)'
	Then Notes icon is displayed to the 'Topic' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Topic' Topic with X value '21' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Topic' Topic with X value '63' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Topic' Topic with X value '42' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Topic' Topic with X value '0' and Y value '0'
	Then image is displayed in 'Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'Alarm' Icon is displayed to the 'Topic' Topic
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Topic' Topic infobox with transform value 'translate(0,81)'

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2343] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_apply_Show_separators_between_information_types_setting_to_Sticky_notes
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Show topic info separators' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Sticky Note 1' topic on Canvas
	Then 'Sticky Note 1' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky Note 1' topic on Canvas
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	When User enters 'Test' value in 'Property' property input field of 'PanelByName' side panel with 'Properties' header
	Then 'Test' value is displayed in 'Property' property input field of 'PanelByName' side panel with 'Properties' header
	Then value 'Test' is displayed for 'Property' property in 'Sticky Note 1' topic infobox
	When User clicks 'Notes' button of side Toolbox
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User clicks Notes input field
	When User enters '20' characters to input note field on Notes panel
	Then User checks text to note field on Notes panel
	When User clicks 'Notes' button of side Toolbox
	Then Notes icon is displayed to the 'Sticky Note 1' topic infobox
	When User Right clicks on 'Sticky Note 1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show topic info separators' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show topic info separators' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show topic info separators' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then '1' separator is displayed in 'Sticky Note 1' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2184] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_user_can_collapse_one_line_topic_info_on_a_Sticky_Note
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/01/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/1' Start date is displayed to the 'Sticky note' topic infobox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/29/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/29' Due date is displayed to the 'Sticky note' topic infobox
	Then '21 workday(s)' date info is displayed to the 'Sticky note' topic infobox
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 2' Icon is displayed to the 'Sticky note' Topic infobox
	When User Right clicks on 'Sticky note' topic
	When User clicks button with 'topic-info-collapse-state' name in 'topic-contextmenu' menu
	Then '3/1' Start date is not displayed to the 'Sticky note' topic infobox
	Then '3/29' Due date is not displayed to the 'Sticky note' topic infobox
	Then '21 workday(s)' date info is not displayed to the 'Sticky note' topic infobox
	Then 'Priority 2' Icon is not displayed to the 'Sticky note' Topic infobox
	Then Three dots button is displayed in 'Sticky note' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2181] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_long_topic_items_like_tags_should_be_trimmed_if_they_are_longer_than_the_topic_info_width
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Tags' button of side Toolbox
	Then 'PanelByName' side panel with 'Tags' header is displayed to the User
	When User clicks 'This is a test to determine if the three dots appear' item in 'Custom Group 1' section of 'PanelByName' side panel with 'Tags' header
	Then '…' tag is displayed in 'Sticky note' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2181] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_long_topic_items_like_resources_should_be_trimmed_if_they_are_longer_than_the_topic_info_width
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User enter 'This is a test to determine if the three dots appear' value in the 'Resources' field of 'Task Information' panel
	When User presses the 'Enter' key on the keyboard
	Then 'This is a test to determine if the three dots appear' resource is displayed in 'Resources' section of 'PanelByName' side panel with 'Task Information' header
	Then '…' resource is displayed in 'Sticky note' topic

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2181] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_long_topic_items_like_hyperlinks_should_be_trimmed_if_they_are_longer_than_the_topic_info_width
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	When User enters 'https://www.Thisisatesttodetermineifthethreedotsappear.com' in the 'Link address' field
	When User clicks 'Add' footer button on Add Link panel
	Then '…' Link title is displayed to the 'Sticky note' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2181] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_long_topic_items_like_attachments_should_be_trimmed_if_they_are_longer_than_the_topic_info_width
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User uploads 'This_is_a_test_to_determine_if_the_three_dots_appear.pdf' file through 'add-attachment-input' input
	Then 'This_is_a_test_to_determine_if_the_three_dots_appear.pdf' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Attachment icon is displayed to the 'Sticky note' topic infobox
	Then '…' attachment filename is displayed to the 'Sticky note' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2185] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_user_can_expand_one_line_topic_info_on_Sticky_Note
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Task Information' button of side Toolbox
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/01/2023' date in input filed in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/1' Start date is displayed to the 'Sticky note' topic infobox
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then checkbox is checked in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	When User enters '03/29/2023' date in input filed in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then '3/29' Due date is displayed to the 'Sticky note' topic infobox
	Then '21 workday(s)' date info is displayed to the 'Sticky note' topic infobox
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 2' Icon is displayed to the 'Sticky note' Topic
	When User Right clicks on 'Sticky note' topic
	When User clicks button with 'topic-info-collapse-state' name in 'topic-contextmenu' menu
	Then '3/1' Start date is not displayed to the 'Sticky note' topic infobox
	Then '3/29' Due date is not displayed to the 'Sticky note' topic infobox
	Then '21 workday(s)' date info is not displayed to the 'Sticky note' topic infobox
	Then 'Priority 2' Icon is not displayed to the 'Sticky note' Topic infobox
	Then Three dots button is displayed in 'Sticky note' Topic infobox
	When User Right clicks on three dots button in 'Sticky note' topic infobox
	When User clicks button with 'topic-info-collapse-state' name in 'topic-contextmenu' menu
	Then '3/1' Start date is displayed to the 'Sticky note' topic infobox
	Then '3/29' Due date is displayed to the 'Sticky note' topic infobox
	Then '21 workday(s)' date info is displayed to the 'Sticky note' topic infobox
	Then 'Priority 2' Icon is displayed to the 'Sticky note' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2194] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_user_can_hide_specific_info_in_sticky_note_via_context_menu
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Icons' button of side Toolbox
	Then 'PanelByName' side panel with 'Icons' header is displayed to the User
	When User clicks 'Right' item in 'Arrows' section of 'PanelByName' side panel with 'Icons' header
	Then 'Right' Icon is displayed to the 'Sticky note' Topic infobox
	When User clicks 'Neutral' item in 'Smileys' section of 'PanelByName' side panel with 'Icons' header
	Then 'Neutral' Icon is displayed to the 'Sticky note' Topic infobox
	When User clicks 'Priority 2' item in 'Priority' section of 'PanelByName' side panel with 'Icons' header
	Then 'Priority 2' Icon is displayed to the 'Sticky note' Topic infobox
	When User clicks '50% done' item in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' item is displayed as selected in 'Progress' section of 'PanelByName' side panel with 'Icons' header
	Then '50% done' Icon is displayed to the 'Sticky note' Topic infobox
	When User Right clicks 'Priority 2' icon in 'Sticky note' topic
	When User clicks button with 'icon-hide' name in 'topic-contextmenu' menu
	Then 'Right' Icon is not displayed to the 'Sticky note' Topic infobox
	Then 'Neutral' Icon is not displayed to the 'Sticky note' Topic infobox
	Then 'Priority 2' Icon is not displayed to the 'Sticky note' Topic infobox
	Then '50% done' Icon is not displayed to the 'Sticky note' Topic infobox
	Then Three dots button is displayed in 'Sticky note' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @StickyNotes @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2195] @JIRA[MMCV-9759] @Upd_Qase
Scenario: To_verify_that_user_can_show_notes_previews_in_sticky_note
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then 'file' Menu is displayed to User
	When User mouse hovers menu button with 'settings' name in 'file' menu
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Add sticky note' button on Tools panel
	When User add sticky note by coordinates '210', '90' to the Canvas
	Then 'Sticky note' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Sticky note' topic on Canvas
	When User clicks 'Notes' button of side Toolbox
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User clicks Notes input field
	When User enters 'Test Notes' text to input note field on Notes panel
	When User clicks 'Notes' button of side Toolbox
	Then Notes icon is displayed to the 'Sticky note' topic infobox
	When User Right clicks on 'Sticky note' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Notes Preview' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Notes Preview' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Notes Preview' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'Test Notes' Notes text is displayed in 'Sticky note' topic infobox