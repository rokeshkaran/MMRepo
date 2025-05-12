@retry(2)
Feature: CardMode
	Check Card Mode default behaviour

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath                     |
		| auto_test_SRND.mmap | CardModeDefaultBehavior.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Toolbar @SetDefaultStyle @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2107] @Upd_Qase
Scenario: Verify_that_user_can_set_card_mode_as_default_topic_behavior_for_floating_topics
	When User clicks 'Floating Topic' topic on Canvas
	Then 'Floating Topic' is outlined with a blue circuit
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'Add floating topic' button on Tools panel
	When User add floating topic by coordinates '-80', '-80' to the Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'Image' button of side Toolbox
	Then 'PanelByName' side panel with 'Image' header is displayed to the User
	When User adds 'FruitsOutlineIcon.png' image via 'PanelByName' side panel with 'Image' header
	Then 'topic_info_icon_image.svg' Image Icon is displayed to the 'Floating Topic' Topic infobox

@MindManager @Toolbar @SetDefaultStyle @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2138] @Upd_Qase
Scenario: Verify_that_user_can_set_card_mode_as_default_topic_behavior_for_main_topic
	When User clicks 'Main Topic 1' topic on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size '10' is displayed in font style section of text editor in 'TextEditorPopup' container
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'Add topic' button on Tools panel
	When User clicks on 'Font format' option in Floating Toolbar Popup
	Then font size 'auto' is displayed in font style section of text editor in 'TextEditorPopup' container

@MindManager @Toolbar @SetDefaultStyle @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2139] @Upd_Qase
Scenario: Verify_that_user_can_set_card_mode_as_default_topic_behavior_for_subtopics
	When User clicks 'Subtopic 1' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'Add subtopic' button on Tools panel
	Then 'Subtopic' subtopic is displayed on Canvas
	When User clicks on 'Font format' option in Floating Toolbar Popup
	When User clicks 'up' arrow in font size section of text editor in 'TextEditorPopup' container
	Then text is truncated and ellipsis '…' is displayed in Topic 

@MindManager @Toolbar @SetDefaultStyle @CardMode @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2140] @Upd_Qase
Scenario: Verify_that_user_can_set_card_mode_as_default_topic_behavior_for_callout
	When User clicks 'Callout 1' topic on Canvas
	When User clicks 'Set Default Style' button on Tools panel
	When User clicks on the 'Set Default Style' button in Share context menu
	When User clicks 'Main Topic 1' topic on Canvas
	Then 'Main Topic 2' is outlined with a blue circuit
	When User clicks 'Add callout' button on Tools panel
	When User clicks 'Task Information' button of side Toolbox
	When User clicks 'Priority 1' item in 'Priority' section of 'PanelByName' side panel with 'Task Information' header
	Then 'Priority 1' Icon is displayed to the 'Callout' Topic
