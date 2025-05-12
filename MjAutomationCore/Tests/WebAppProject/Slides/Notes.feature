@retry(2)
Feature: Notes
Check Notes functionality

@MindManager @MyPublishedFiles @Slides @Notes @App_QA @App_Staging @App_Prod @Qase[WEB-974] @Upd_Qase
Scenario Outline: Check_that_the_side_panel_with_notes_is_displayed_after_clicking_on_Notes_icon
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath   |
		| auto_test_SRND.mmap | Notes.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then './images/modern/topic_info_icon_notes.svg' Notes icon is displayed in '<topicType>' topic infobox
	When User clicks Notes icon in '<topicType>' topic infobox
	Then 'PanelByName' side panel with 'Notes' header is displayed to the User
	When User clicks Close button of 'PanelByName' side panel with 'Notes' header
	Then 'PanelByName' side panel with 'Notes' header is not displayed to the User

Examples:
	| topicType      |
	| Central Topic  |
	| Main Topic     |
	| Subtopic       |
	| Floating Topic |
	| Callout        |

@MindManager @MyPublishedFiles @Slides @App_QA @App_Staging @App_Prod @Qase[WEB-975] @Cleanup @Upd_Qase @JIRA[MMCV-4986]
Scenario Outline: Check_the_notes_tooltip
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath   |
		| auto_test_SRND.mmap | Notes.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User mouses over Notes icon in '<topicType>' topic infobox
	Then 'Notes' tooltip is displayed to the User
Examples:
	| topicType      |
	| Central Topic  |
	| Main Topic     |
	| Subtopic       |
	| Floating Topic |
	| Callout        |