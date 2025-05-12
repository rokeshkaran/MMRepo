@retry(2)
Feature: AttachmentsAndLinks

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-810] @Upd_Qase
Scenario: Check_ADD_dropdown_menu_on_AttachmentsANDLinks_side_panel
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header
	Then 'attachments-add-popup' dropdown menu is displayed to User
	Then following items is displayed in 'attachments-add-popup' dropdown menu
		| items          |
		| Add Attachment |
		| Add Link       |

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-810] @Upd_Qase
Scenario: Check_Add_Link
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User clicks 'Add' action button on 'PanelByName' side panel with 'Attachments & Links' header  and select 'Add Link' item in 'attachments-add-popup' dropdown
	When User enters 'https://www.facebook.com/' in the 'url' field
	When User enters 'Facebook' in the 'title' field
	When User clicks 'Add' footer button on Add Link panel
	Then 'Facebook' item is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Links icon is displayed to the 'CT' topic infobox

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-810] @Upd_Qase
Scenario: Check_link_tooltip_in_Side_panel
	When User clicks 'MT5' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User mouses over 'Facebook' item in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then 'https://www.facebook.com/' tooltip is displayed to the User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-811] @Upd_Qase
Scenario: Check_Drag_and_Drop_link
	When User drag Hyperlink icon from 'MT5' topic on 'CT' topic
	Then Links icon is displayed to the 'CT' topic infobox
	Then Links icon is displayed to the 'MT5' topic infobox

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-812] @Upd_Qase
Scenario: Check_Delete_Link
	When User clicks 'MT5' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User mouses over 'Facebook' item in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header and clicks Remove button
	Then 'No links' text of empty content is displayed in 'Links' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Links icon is not displayed to the 'CT' topic infobox

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-813] @Upd_Qase
Scenario: Check_Add_attachment
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User uploads 'FruitImages.jpg' file through 'add-attachment-input' input
	Then 'FruitImages.jpg' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Attachment icon is displayed to the 'CT' topic infobox

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-813] @Upd_Qase
Scenario: Check_attachment_tooltip_in_Side_panel
	When User clicks 'MT6' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User mouses over 'MM_Attach.mmap' item in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then 'MM_Attach.mmapCreated: 08/03/2022 06:52:43 PMModified: 08/03/2022 06:52:43 PMSize: 31 KB' tooltip is displayed to the User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-814] @Upd_Qase @JIRA[MMCV-5479]
Scenario: Add_attachment_more_than_10mb
	When User clicks 'Attachments & Links' button of side Toolbox
	#File larger than 10 MB
	When User uploads 'ice_video_20190806-124540.webm' file through 'add-attachment-input' input
	Then text 'The maximum attachment size is 10MB, please try again with a smaller attachment.' displayed in 'info max-attachment-size-exceeded' dialog
	When User waits '1' minutes
	Then 'info max-attachment-size-exceeded' dialog is not displayed to User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-815] @Upd_Qase
Scenario: Add_attachment_more_than_10mb_and_close_overlay_manually
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	#File larger than 10 MB
	When User uploads 'ice_video_20190806-124540.webm' file through 'add-attachment-input' input
	Then text 'The maximum attachment size is 10MB, please try again with a smaller attachment.' displayed in 'info max-attachment-size-exceeded' dialog
	When User clicks close button in 'info max-attachment-size-exceeded' dialog
	Then 'info max-attachment-size-exceeded' dialog is not displayed to User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-816] @Upd_Qase
Scenario: Check_Drag_and_Drop_Attachment
	When User drag Attachment icon from 'MT6' topic on 'CT' topic
	Then Attachment icon is displayed to the 'CT' topic infobox
	Then Attachment icon is displayed to the 'MT6' topic infobox
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'MM_Attach.mmap' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-817] @Upd_Qase
Scenario: Check_Delete_attachment
	When User clicks 'MT6' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User mouses over 'MM_Attach.mmap' item in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header and clicks Remove button
	Then 'No attachments' text of empty content is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Attachment icon is not displayed to the 'MT6' topic infobox

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-818] @Upd_Qase @JIRA[MMCV-10100]
Scenario: Open_attached_map
	When User clicks attachment icon in 'MT6' topic
	When User clicks 'Central Topic' topic on Canvas
	Then 'Central Topic' topic border is highlighted 'rgb(62, 158, 255)' color with no quick add buttons on Canvas
	When User clicks button with 'back-button-placeholder' name in 'OverlayPanelPageElement' container
	Then Web Editor page is displayed to the User

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-819] @Upd_Qase @JIRA[MMCV-4111]
Scenario: Open_attached_image
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	When User uploads 'FruitsOutlineIcon.png' file through 'add-attachment-input' input
	Then 'FruitsOutlineIcon.png' item is displayed in 'Attachments' section of 'PanelByName' side panel with 'Attachments & Links' header
	Then Attachment icon is displayed to the 'CT' topic infobox
	When User clicks attachment icon in 'CT' topic
	Then Image is displayed for User
	When User clicks 'btn-download' button in 'lightbox' dialog
	Then User checks that file 'FruitsOutlineIcon.png' was downloaded

@MindManager @Attachments_Links @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-820] @Upd_Qase
Scenario: Related_topics
	When User clicks 'CT' topic on Canvas
	When User clicks Add relationship button on the Toolbar
	When User clicks 'MT4' topic on Canvas
	When User clicks 'CT' topic on Canvas
	When User clicks 'Attachments & Links' button of side Toolbox
	Then 'MT4' item is displayed in 'Related Topics' section of 'PanelByName' side panel with 'Attachments & Links' header