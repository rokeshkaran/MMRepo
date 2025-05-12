@retry(2)
Feature: EditMode
	Check Topic infobox on Edit Mode;

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
	Then User set zoom level to '32' via the side tool bar

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-659] @Upd_Qase
Scenario: Check_User_can_open_and_close_Topic_Info_Display_Settings_in_topic
	When User Right clicks on 'MT1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-659] @Upd_Qase
Scenario: Check_User_can_open_and_close_Topic_Info_Display_Settings_in_subtopic
	When User Right clicks on 'MT3ST1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-659] @Upd_Qase
Scenario: Check_User_can_open_and_close_Topic_Info_Display_Settings_in_callout
	When User Right clicks on 'CO1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-659] @Upd_Qase
Scenario: Check_User_can_open_and_close_Topic_Info_Display_Settings_in_relationship_label
	When User Right clicks on 'RL1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-660] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_User_can_collapse_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	Then '6/21' Start date is not displayed to the 'F1ST13ST13ST14' topic infobox
	Then '- 7/23' Due date is not displayed to the 'F1ST13ST13ST14' topic infobox
	Then ': 25 workday(s)' date info is not displayed to the 'F1ST13ST13ST14' topic infobox
	Then 'Tags_3' tag is not displayed in 'F1ST13ST13ST14' topic infobox
	Then 'Resource #1' resource is not displayed in 'F1ST13ST13ST14' topic
	Then Comment icon is not displayed to the 'F1ST13ST13ST14' topic infobox
	Then Notes icon is not displayed to the 'F1ST13ST13ST14' topic infobox
	Then Cost icon with value '$123.00' is not displayed on 'F1ST13ST13ST14' topic on Canvas
	Then 'Number_Property' property is not displayed in 'F1ST13ST13ST14' topic infobox
	Then Three dots button is displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_dates_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then '6/21' Start date is displayed to the 'F1ST13ST13ST14' topic infobox
	Then '- 7/23' Due date is displayed to the 'F1ST13ST13ST14' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13ST13ST14' topic infobox
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_tag_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then 'Tags_3' tag is displayed in 'F1ST13ST13ST14' topic infobox
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_resource_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then 'Resource #1' resource is displayed in 'F1ST13ST13ST14' topic
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_comment_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then Comment icon is displayed to the 'F1ST13ST13ST14' topic infobox
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_note_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then Notes icon is displayed to the 'F1ST13ST13ST14' topic infobox
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-10074]
Scenario: Check_that_cost_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then Cost icon with value '$123.00' is displayed on 'F1ST13ST13ST14' topic on Canvas
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-661] @Upd_Qase @JIRA[MMCV-9741]
Scenario: Check_that_property_is_displayed_when_user_expand_topic_info
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Collapse Info On Topic' name in 'topic-contextmenu' menu
	When User Right clicks on 'F1ST13ST13ST14' topic
	When User clicks button with 'Expand Info on Topic' name in 'topic-contextmenu' menu
	Then 'Number_Property' property is displayed in 'F1ST13ST13ST14' topic infobox
	Then Three dots button is not displayed in 'F1ST13ST13ST14' Topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-665] @Upd_Qase
Scenario: Check_that_User_can_view_the_number_of_comments_on_the_comments_icon
	When User clicks 'MT1' topic on Canvas
	When User clicks 'Comments' button of side Toolbox
	#Comments 1
	When User enters 'Comment_#1' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then Comment icon is displayed to the 'MT1' topic infobox
	Then '1' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 2
	When User enters 'Comment_#2' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '2' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 3
	When User enters 'Comment_#3' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '3' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 4
	When User enters 'Comment_#4' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '4' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 5
	When User enters 'Comment_#5' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '5' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 6
	When User enters 'Comment_#6' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '6' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 7
	When User enters 'Comment_#7' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '7' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 8
	When User enters 'Comment_#8' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '8' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 9
	When User enters 'Comment_#9' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then Comment icon is displayed to the 'MT1' topic infobox
	Then '9' number is displayed in the comment icon of the 'MT1' topic infobox
	#Comments 10
	When User enters 'Comment_#10' in the 'comment-input' textarea
	When User clicks Comment button on Comments panel
	Then '9+' number is displayed in the comment icon of the 'MT1' topic infobox
	When User clicks Delete button in '1' comment on Comments panel
	When User clicks Delete button in '2' comment on Comments panel
	Then '8' number is displayed in the comment icon of the 'MT1' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-662] @Upd_Qase
Scenario: Check_that_user_can_separately_show_and_hide_Start_Date
	When User Right clicks on 'F1ST13' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Start Date' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Start Date' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Start Date' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then '6/21' Start date is not displayed to the 'F1ST13' topic infobox
	Then 'Due 7/23' Due date is displayed to the 'F1ST13' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-662] @Upd_Qase
Scenario: Check_that_user_can_separately_show_and_hide_Due_Date
	When User Right clicks on 'F1ST13' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Due Date' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Due Date' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Due Date' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then '- 7/23' Due date is not displayed to the 'F1ST13' topic infobox
	Then 'Start 6/21' Start date is displayed to the 'F1ST13' topic infobox	
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-662] @Upd_Qase
Scenario: Check_that_user_can_separately_show_and_hide_Duration
	When User Right clicks on 'F1ST13' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Duration' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User unchecks 'Duration' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Duration' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then '6/21' Start date is displayed to the 'F1ST13' topic infobox
	Then '- 7/23' Due date is displayed to the 'F1ST13' topic infobox
	Then ': 25 workday(s)' date info is not displayed to the 'F1ST13' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-662] @Upd_Qase
Scenario: Check_that_user_can_separately_show_and_hide_Years_in_Dates
	When User Right clicks on 'F1ST13' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Years in Dates' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Years in Dates' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Years in Dates' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen	
	Then '6/21/2021' Start date is displayed to the 'F1ST13' topic infobox
	Then '- 7/23/2021' Due date is displayed to the 'F1ST13' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-662] @Upd_Qase
Scenario: Check_that_user_can_separately_show_and_hide_Effort
	When User clicks 'MT3ST1' topic on Canvas
	Then 'MT3ST1' is outlined with a blue circuit
	When User clicks 'Task Information' button of side Toolbox
	Then 'PanelByName' side panel with 'Task Information' header is displayed to the User
	When User checks checkbox in 'Start Date' section of 'PanelByName' side panel with 'Task Information' header
	When User checks checkbox in 'Due Date' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Effort: 2 workday(s)' effort info is displayed to the 'MT3ST1' topic infobox
	When User Right clicks on 'MT3ST1' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	When User unchecks 'Effort' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen	
	Then 'Effort: 2 workday(s)' effort info is not displayed to the 'MT3ST1' topic infobox

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-668] @Upd_Qase
Scenario: Check_Removing_Resource_by_X_button
	When User clicks Remove button to 'Resource #2' resource in 'MT3ST1ST2' topic
	Then 'Resource #2' resource is not displayed in 'MT3ST1ST2' topic

@MindManager @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-667] @Upd_Qase
Scenario: Check_Removing_Tag_by_X_button
	When User clicks Remove button to 'Done' tag in 'MT4' topic infobox
	Then 'Done' tag is not displayed in 'MT4' topic infobox

@MindManager @NewTopicInfoboxUI @Topic_Infobox @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-664] @Upd_Qase
Scenario: Check_that_User_can_show_notes_previews_in_topics
	When User clicks 'CT' topic on Canvas
	Then 'CT' is outlined with a blue circuit
	When User clicks 'Notes' button of side Toolbox
	When User enters 'Test Notes' text to input note field on Notes panel
	When User clicks by coordinates '50' and '300' on Canvas	
	Then Notes icon is displayed to the 'CT' topic infobox
	When User Right clicks on 'CT' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Notes' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Notes Preview' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Notes Preview' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Notes Preview' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'Test Notes' Note preview text is displayed to the 'CT' topic infobox

@MindManager @Topic_Infobox @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-666] @Upd_Qase
Scenario: Check_that_User_can_show_link_title_in_topics
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Attachments & Links' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown 
	Then Add Link panel is displayed to the User
	When User enters 'https://cloud.mindjet.com' in the 'url' field
	When User enters 'Mind Manager' in the 'title' field
	When User clicks 'Add' footer button on Add Link panel
	Then 'Mind Manager' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Links icon is displayed to the 'Main Topic' topic infobox
	When User Right clicks on 'Main Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Link Titles' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Link Titles' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Link Titles' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'Mind Manager' Link title is displayed to the 'Main Topic' topic infobox

@MindManager @Topic_Infobox @NewTopicInfoboxUI @EditMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-666] @Upd_Qase
Scenario: Check_that_User_can_show_attachment_Filename_in_topics
	When User clicks 'Main Topic' topic on Canvas
	Then 'Main Topic' is outlined with a blue circuit
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'PanelByName' side panel with 'Attachments & Links' header is displayed to the User
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then 'FruitImages.jpg' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Attachment icon is displayed to the 'Main Topic' topic infobox
	When User Right clicks on 'Main Topic' topic
	When User clicks button with 'topic-info-settings' name in 'topic-contextmenu' menu
	Then 'Settings' screen is displayed to User
	Then 'Filenames' checkbox is unchecked in the 'Show/Hide specific information' section of 'Settings' screen
	When User checks 'Filenames' checkbox in the 'Show/Hide specific information' section of 'Settings' screen
	Then 'Filenames' checkbox is checked in the 'Show/Hide specific information' section of 'Settings' screen
	When User clicks 'OK' button on 'Settings' screen
	Then 'Settings' screen is not displayed to User
	Then 'FruitImages.jpg' attachment filename is displayed to the 'Main Topic' topic infobox