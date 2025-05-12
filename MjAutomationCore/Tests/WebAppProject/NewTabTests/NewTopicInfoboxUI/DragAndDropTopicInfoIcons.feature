@retry(2)
Feature: DragAndDropTopicInfoIcons
Check the functionality of drag and drop icons from topic infobox

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-671] @Upd_Qase
Scenario: Drag_and_drop_Start_date
	Then '7/20' Start date is displayed to the 'F1ST4' topic infobox
	When User drag '7/20' Start date from 'F1ST4' topic on 'MT2ST1ST' topic
	Then '7/20' Start date is displayed to the 'F1ST4' topic infobox
	Then '7/20' Start date is displayed to the 'MT2ST1ST' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-671] @Upd_Qase
Scenario: Drag_and_drop_Due_date
	Then '- 7/25' Due date is displayed to the 'F1ST4ST4' topic infobox
	When User drag '- 7/25' Due date from 'F1ST4ST4' topic on 'MT2ST1ST' topic
	Then '- 7/25' Due date is displayed to the 'F1ST4ST4' topic infobox
	Then '- 7/25' Due date is displayed to the 'MT2ST1ST' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-671] @Upd_Qase
Scenario: Drag_and_drop_task_info
	Then '6/21' Start date is displayed to the 'F1ST13' topic infobox
	Then '- 7/23' Due date is displayed to the 'F1ST13' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13' topic infobox
	When User drag date icon from 'F1ST13' topic on 'FT1ST1ST1' topic
	Then '6/21' Start date is displayed to the 'F1ST13' topic infobox
	Then '- 7/23' Due date is displayed to the 'F1ST13' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'F1ST13' topic infobox
	Then '6/21' Start date is displayed to the 'FT1ST1ST1' topic infobox
	Then '- 7/23' Due date is displayed to the 'FT1ST1ST1' topic infobox
	Then ': 25 workday(s)' date info is displayed to the 'FT1ST1ST1' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-672] @Upd_Qase
Scenario: Drag_and_drop_resource
	Then 'Resource #2' resource is displayed in 'MT3ST1ST2' topic
	When User drag 'Resource #2' resource icon from 'MT3ST1ST2' topic on 'FT1' topic
	Then 'Resource #2' resource is displayed in 'MT3ST1ST2' topic
	Then 'Resource #2' resource is displayed in 'FT1' topic

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-673] @Upd_Qase
Scenario: Drag_and_drop_notes
	Then Notes icon is displayed to the 'MT4ST1ST3' topic infobox
	When User drag Notes icon from 'MT4ST1ST3' topic on 'FT1' topic
	Then Notes icon is displayed to the 'MT4ST1ST3' topic infobox
	Then Notes icon is displayed to the 'FT1' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-674] @Upd_Qase
Scenario: Drag_and_drop_link
	Then Links icon is displayed to the 'MT5' topic infobox
	When User drag Hyperlink icon from 'MT5' topic on 'FT1' topic
	Then Links icon is displayed to the 'MT5' topic infobox
	Then Links icon is displayed to the 'FT1' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-675] @Upd_Qase
Scenario: Drag_and_drop_attachment
	Then Attachment icon is displayed to the 'MT6' topic infobox
	When User drag Attachment icon from 'MT6' topic on 'FT1' topic
	Then Attachment icon is displayed to the 'MT6' topic infobox
	Then Attachment icon is displayed to the 'FT1' topic infobox

@MindManager @NewTopicInfoboxUI @DragAndDropTopicInfoIcons @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-677] @Upd_Qase
Scenario: Drag_and_drop_tag
	Then 'Done' tag is displayed in 'MT4' topic infobox
	When User drag 'Done' tag icon from 'MT4' topic on 'FT1' topic
	Then 'Done' tag is displayed in 'MT4' topic infobox
	Then 'Done' tag is displayed in 'FT1' topic infobox