@retry(2)
Feature: SharingMapSectionViaContextMenu
user can share a map section via context menu

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName             | FilePath       |
		| auto_test_SRND.mmap  | SimpleMap.mmap |
		| auto_test2_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapTeamCleanup @Qase[MSNAP-62] @Upd_Qase
Scenario: To_verify_that_user_can_share_a_map_section_via_context_menu_to_the_team_snap_queue
	Given '1' User is logged into MindManager web app via Api
	When '1' User creates teams in Snap Queue via Api
		| Name                      |
		| Automation_test_team_SRND |
	When '1' User upload capture item via Api
		| Type    | Source           | Text       | Link | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND |      |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |      |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
		| Test3_SRND       |
	When User Right clicks capture item with 'Test2_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Share         |
		| Send to Trash |
	When User clicks 'Share' item in context menu
	When User clicks 'Automation_test_team_SRND' item in 'display-name' menu in 'teams-wrapper' container on Snap Panel
	Then 'Shared!' overlay is displayed on 'Test2_SRND' capture item on Snap panel
	When User clicks 'My Snap Queue' menu button on Snap panel
	When User clicks 'Automation_test_team_SRND' item in 'mm-capture-queue-popup-item' menu in 'mm-capture-queue-selector-view' container on Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @SnapUserCleanup @Qase[MSNAP-62] @Upd_Qase
Scenario: To_verify_that_user_can_share_a_map_section_via_context_menu_to_Individual_snap_queue
#Create User B
	Given '15' User is logged into MindManager web app via Api
	Then file manager header page is displayed to User
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test2_SRND.mmap' file
	Then Web Editor page is displayed to the User
 #User A
	When User openes 'chrome' browser
	When User switches to '1' browser
	Given '1' User is logged into MindManager web app via Api
	When User accepts Optanon cookies
	When '1' User upload capture item via Api
		| Type    | Source           | Text       | Link | Note | File                       |
		| mappart | MindManager Snap | Test2_SRND |      |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |      |      | Business profile info.mmap |
	When '1' User sends request for capture queue items to 'automationtestmm15@meta.ua' users via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
		| Test3_SRND       |
 #User B
	When '15' User accepts request from email 'automationtestmm1@meta.ua' for capture queue items via Api
#User A
	When User Right clicks capture item with 'Test2_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Share         |
		| Send to Trash |
	When User clicks 'Share' item in context menu
	When User clicks 'MM_Tests_15 MM_Tests_15' item in 'display-name' menu in 'recipients-wrapper' container on Snap Panel
	Then 'Shared!' overlay is displayed on 'Test2_SRND' capture item on Snap panel
 #User B
	When User switches to '0' browser
	When User switches to '0' tab
	Then Web Editor page is displayed to the User
	When User clicks by coordinates '100' and '100' on Canvas
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |
	When User clicks 'Empty Trash' button on Snap panel
	Then following capture items are deleted in Snap panel:
		| captureItemTitle |
		| Test2_SRND       |