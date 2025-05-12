@retry(2)
Feature: CardMode
Check Card mode functionality 

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath      |
		| auto_test_SRND.mmap | CardMode.mmap |
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
	When User clicks button with 'general-settings' name in 'settings' menu
	Then 'Settings' screen is displayed to User

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2341] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_apply_Show_separators_between_information_types_setting_to_Card_mode_topics
	Then 'Show topic info separators' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Property Topic' topic on Canvas
	Then 'Property Topic' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Property Topic' topic on Canvas
	When User clicks 'Properties' button of side Toolbox
	Then 'PanelByName' side panel with 'Properties' header is displayed to the User
	When User enters 'Test' value in 'Property' property input field of 'PanelByName' side panel with 'Properties' header
	Then 'Test' value is displayed in 'Property' property input field of 'PanelByName' side panel with 'Properties' header
	Then value 'Test' is displayed for 'Property' property in 'Property Topic' topic infobox
	When User clicks 'Notes' button of side Toolbox
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User clicks Notes input field
	When User enters '20' characters to input note field on Notes panel
	Then User checks text to note field on Notes panel
	When User clicks 'Notes' button of side Toolbox
	Then Notes icon is displayed to the 'Property Topic' topic infobox
	When User Right clicks on 'Property Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show topic info separators' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show topic info separators' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show topic info separators' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then '1' separator is displayed in 'Property Topic' topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2345] @Upd_Qase
Scenario: To_verify_that_Card_mode_topics_always_have_topic_info_on_one_line
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_image.svg' Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_property.svg' Icon with value 'Property' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	When User Right clicks on 'Floating Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'topic_info_icon_image.svg' Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_image' Image Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Floating Topic' Topic infobox with Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Floating Topic' Topic infobox with transform value X '0'

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2345] @Upd_Qase
Scenario: To_verify_that_Normal_topics_always_have_topic_info_on_one_line
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Normal Topic' topic on Canvas
	Then 'Normal Topic' topic is displayed on Canvas
	Then Boundary outerline is highlighted blue color on the 'Normal Topic' topic on Canvas
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,2)'
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,2)'
	Then 'To Do' tag is displayed in 'Normal Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,2)'
	Then Notes icon is displayed to the 'Normal Topic' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Normal Topic' Topic with X value '42' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Normal Topic' Topic with X value '84' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Normal Topic' Topic with X value '63' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Normal Topic' Topic with X value '21' and Y value '0'
	Then image is displayed in 'Normal Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,0)'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Normal Topic' Topic with X value '105' and Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,3)'
	When User Right clicks on 'Normal Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Allow different Topic Info types to be displayed on the same line (always enabled for Card topics)' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,61)'
	Then 'To Do' tag is displayed in 'Normal Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,41)'
	Then Notes icon is displayed to the 'Normal Topic' topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Normal Topic' Topic with X value '42' and Y value '0'
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Normal Topic' Topic with X value '84' and Y value '0'
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Normal Topic' Topic with X value '63' and Y value '0'
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Normal Topic' Topic with X value '21' and Y value '0'
	Then image is displayed in 'Normal Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,20)'
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Normal Topic' Topic with X value '105' and Y value '0'
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Normal Topic' Topic infobox with transform value 'translate(0,81)'

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2346] @Upd_Qase
Scenario: To_verify_that_Card_mode_topics_always_have_icons_and_images_in_the_info_box
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Floating Topic' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Floating Topic' topic on Canvas
	Then 'To Do' tag is displayed in 'Floating Topic' topic infobox
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Floating Topic' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Floating Topic' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Floating Topic' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Floating Topic' Topic infobox
	When User Right clicks on 'Floating Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'To Do' tag is displayed in 'Floating Topic' topic infobox
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Floating Topic' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Floating Topic' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Floating Topic' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Floating Topic' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Floating Topic' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Floating Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Floating Topic' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Floating Topic' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Floating Topic' Topic infobox

@MindManager @NewTopicInfoboxUI @OneLineTopicInfo @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2346] @Upd_Qase
Scenario: To_verify_that_Normal_topics_always_have_icons_and_images_in_the_info_box
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User checks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	When User clicks 'Normal Topic' topic on Canvas
	Then Boundary outerline is highlighted blue color on the 'Normal Topic' topic on Canvas
	Then 'To Do' tag is displayed in 'Floating Topic' topic infobox
	Then image is displayed in 'Normal Topic' topiс on Canvas
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_comment.svg' Icon with value '1' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Normal Topic' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Normal Topic' Topic infobox
	Then 'percentageDone05.svg' Icon with value '50% done' is displayed to the 'Normal Topic' Topic infobox
	Then 'arrow-right.svg' Icon with value 'Right' is displayed to the 'Normal Topic' Topic infobox
	Then 'smiley-neutral.svg' Icon with value 'Neutral' is displayed to the 'Normal Topic' Topic infobox
	Then 'priority02.svg' Icon with value 'Priority 2' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Normal Topic' Topic infobox
	Then 'emergency.svg' Icon with value 'Alarm' is displayed to the 'Normal Topic' Topic infobox
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Normal Topic' Topic infobox
	When User Right clicks on 'Normal Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Show icons in topic info' checkbox is checked in the 'Topic info display style' section of 'Settings' screen
	When User unchecks 'Show icons in topic info' checkbox in the 'Topic info display style' section of 'Settings' screen
	Then 'Show icons in topic info' checkbox is unchecked in the 'Topic info display style' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'topic_info_icon_cost.svg' Icon with value '$1,600.00' is displayed to the 'Normal Topic' Topic infobox
	Then 'To Do' tag is displayed in 'Normal Topic' topic infobox
	Then 'icon_resource.svg' Icon with value 'Resource #1' is displayed to the 'Normal Topic' Topic infobox
	Then 'topic_info_icon_notes.svg' Icon is displayed to the 'Normal Topic' Topic infobox
	Then '50% done' Icon is displayed to the 'Normal Topic' Topic
	Then 'Right' Icon is displayed to the 'Normal Topic' Topic
	Then 'Neutral' Icon is displayed to the 'Normal Topic' Topic
	Then 'Priority 2' Icon is displayed to the 'Normal Topic' Topic
	Then image is displayed in 'Normal Topic' topiс on Canvas
	Then 'icon_date.svg' Icon with value '3/1' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '- 3/29' is displayed to the 'Normal Topic' Topic infobox
	Then 'icon_date.svg' Icon with value '21 workday(s)' is displayed to the 'Normal Topic' Topic infobox
	Then 'Alarm' Icon is displayed to the 'Normal Topic' Topic
	Then 'www.facebook.com' Icon with value 'Facebook' is displayed to the 'Normal Topic' Topic infobox