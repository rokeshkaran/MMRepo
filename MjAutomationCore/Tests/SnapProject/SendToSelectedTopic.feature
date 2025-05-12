@retry(2)
Feature: SendToSelectedTopic
Send snap to topic

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-44] @Upd_Qase
Scenario: To_verify_that_you_can_send_a_snap_to_the_selected_topic
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type | Source           | Text                    | Link                    | Note | Item |
		| link | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |      |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks 'ImageTopic2' topic on Canvas
	Then Topic Border is highlight blue color in 'ImageTopic2' topic on Canvas
	When User Right clicks capture item with 'automation_test_#1_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Send to selected topic' item in context menu
	Then 'automation_test_#1_SRND' subtopic is displayed on Canvas

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-45] @Upd_Qase
Scenario: To_verify_that_you_can_send_a_snap_to_the_selected_topic_Team_snap_queue
	Given '1' User is logged into MindManager web app via Api
	When '1' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When '1' User upload capture item to 'Automation_test_team_SRND' team via Api
		| Type | Source           | Text                    | Link                    | Note | Item |
		| link | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |      |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-46] @Upd_Qase
Scenario: To_verify_that_the_Send_to_selected_topic_is_not_available_for_selection_in_the_snap_context_menu_if_no_topic_is_selected_in_the_map
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type | Source           | Text                    | Link                    | Note | Item |
		| link | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |      |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User Right clicks capture item with 'automation_test_#1_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Share         |
		| Send to Trash |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-47] @Upd_Qase @JIRA[MMCV-10118,MMCV-10356]
Scenario: To_verify_that_it_is_possible_to_send_a_snap_with_an_Image_to_a_selected_topic
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type       | Source           | Text                       | Link | Note | File            |
		| attachment | MindManager Snap | image_file_attachment_SRND |      |      | FruitImages.jpg |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle           |
		| image_file_attachment_SRND |
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User Right clicks capture item with 'image_file_attachment_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Send to selected topic' item in context menu
	Then 'image_file_attachment_SRND' subtopic is displayed on Canvas
	Then image is displayed in 'image_file_attachment_SRND' topiс on Canvas

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-48] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_send_a_snap_with_a_bookmark_to_a_selected_topic
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type | Source           | Text                     | Link                    | Note | Item |
		| link | MindManager Snap | automation_bookmark_SRND | https://www.google.com/ |      |      |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle         |
		| automation_bookmark_SRND |
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User Right clicks capture item with 'automation_bookmark_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Send to selected topic' item in context menu
	Then 'automation_bookmark_SRND' subtopic is displayed on Canvas
	Then 'automation_bookmark_SRND' Link title is displayed to the 'automation_bookmark_SRND' topic infobox

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-49] @Upd_Qase @JIRA[MMCV-6322]
Scenario: To_verify_that_it_is_possible_to_send_a_snap_with_an_attachment_to_a_selected_topic
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type       | Source           | Text                      | Link | Note | File                               |
		| attachment | MindManager Snap | text_file_attachment_SRND |      |      | Automatic License Provisioning.txt |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle          |
		| text_file_attachment_SRND |
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User Right clicks capture item with 'text_file_attachment_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Send to selected topic' item in context menu
	Then 'text_file_attachment_SRND' subtopic is displayed on Canvas
	Then 'Automatic License Provisioning.txt' attachment filename is displayed to the 'text_file_attachment_SRND' topic infobox

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-50] @Upd_Qase
Scenario: To_verify_that_it_is_possible_to_send_a_snap_with_a_map_part_to_a_selected_topic
	Given '1' User is logged into MindManager web app via Api
	When '1' User upload capture item via Api
		| Type    | Source           | Text                 | Link | Note | File                       |
		| mappart | MindManager Snap | automation_test_SRND |      |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle     |
		| automation_test_SRND |
	When User clicks 'CT' topic on Canvas
	Then Topic Border is highlight blue color in 'CT' topic on Canvas
	When User clicks 'Add topic' button on Tools panel
	Then 'Main Topic' topic is displayed on Canvas
	When User Right clicks capture item with 'automation_test_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Send to selected topic' item in context menu
	Then 'profile info' subtopic is displayed on Canvas
	Then 'Appropriate standards' subtopic is displayed on Canvas
	Then 'Benchmark' subtopic is displayed on Canvas