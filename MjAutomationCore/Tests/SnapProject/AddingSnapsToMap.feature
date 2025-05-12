@retry(2)
Feature: AddSnapsToMap
	Check the functionality of Adding Snaps To Map

Background: Pre-condition
	Given '1' User uploads following files to '/' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type       | Source           | Text                       | Link | Note | Item | File                               |
		| attachment | MindManager Snap | text_file_attachment_SRND  |      |      |      | Automatic License Provisioning.txt |
		| attachment | MindManager Snap | image_file_attachment_SRND |      |      |      | FruitImages.jpg                    |
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-51] @Upd_Qase @JIRA[MMCV-6321]
Scenario: To_verify_that_loading_icon_is_displayed_on_adding_attachment_to_map
	Then following capture items are displayed in Snap panel:
		| captureItemTitle          |
		| text_file_attachment_SRND |
	When User drags and drops 'text_file_attachment_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then Queue loading icon is displayed on Snap Panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-52] @Upd_Qase @JIRA[MMCV-6321]
Scenario: To_verify_that_loading_icon_is_displayed_on_adding_image_to_map
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| image_file_attachment_SRND |
	When User drags and drops 'image_file_attachment_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then Queue loading icon is displayed on Snap Panel