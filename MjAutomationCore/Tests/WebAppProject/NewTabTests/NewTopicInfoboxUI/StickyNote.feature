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
	