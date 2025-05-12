@retry(2)
Feature: Options
	Check the functionality of Options

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-36]
Scenario: To_verify_that_user_can_refresh_the_content_in_the_Snap_queue
	Given '1' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	When User waits '500' miliseconds
	When User clicks 'Refresh' button on Snap panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-40,MSNAP-68,MSNAP-71] @Upd_Qase
Scenario: To_verify_snaps_are_sent_to_trash_according_to_the_settings
	Given '2' User is logged into MindManager web app via Api
	When '2' User upload capture item via Api
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
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	Then 'Send to trash after dropping into a map' option item with toggle button 'ON' is displayed on Snap Panel
	When User clicks 'Back' button on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User drags and drops 'automation_test_#1_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'automation_test_#1_SRND' subtopic is displayed on Canvas
	Then 'Open Trash' button is displayed on Snap panel
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks on restore icon of 'automation_test_#1_SRND' title on Snap panel
	Then following capture items are not displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks 'Back' button on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-41,MSNAP-69] @Upd_Qase
Scenario: To_verify_snaps_are_not_sent_to_trash_according_to_the_settings
	Given '3' User is logged into MindManager web app via Api
	When '3' User upload capture item via Api
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
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	Then 'Send to trash after dropping into a map' option item with toggle button 'ON' is displayed on Snap Panel
	When User clicks on toggle button 'ON' of 'Send to trash after dropping into a map' option item on Snap panel
	When User clicks 'Back' button on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	When User drags and drops 'automation_test_#1_SRND' capture item from Snap panel in 'ImageTopic2' topic
	Then 'automation_test_#1_SRND' subtopic is displayed on Canvas
	Then 'Open Trash' button is not displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-42,MSNAP-43]
Scenario: To_verify_it_is_possible_to_trash_all_items_in_the_queue_at_a_time
	Given '5' User is logged into MindManager web app via Api
	When '5' User upload capture item via Api
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
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks capture item with 'automation_test_#1_SRND' title on Snap panel
	When User clicks 'Back' button on Snap panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |
	When User clicks 'Empty Trash' button on Snap panel
	Then following capture items are deleted in Snap panel:
		| captureItemTitle        |
		| automation_test_#1_SRND |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-164]
Scenario: To_verify_that_user_can_exit_from_the_trash_menu_via_the_Back_button
	Given '3' User is logged into MindManager web app via Api
	When '3' User upload capture item via Api
		| Type    | Source           | Text       | Link      | Note | Item                       |
		| mappart | MindManager Snap | Test2_SRND | TestNotes |      | Business profile info.mmap |
		| mappart | MindManager Snap | Test3_SRND |           |      | Business profile info.mmap |
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
		| captureItemTitle |
		| Test3_SRND       |
		| Test2_SRND       |
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then '2' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test3_SRND       |
		| Test2_SRND       |
	When User clicks 'Empty Trash' button on Snap panel
	Then following capture items are deleted in Snap panel:
		| captureItemTitle |
		| Test3_SRND       |
		| Test2_SRND       |
	When User clicks 'Back' button on Snap panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-165,MSNAP-70]
Scenario: To_verify_that_user_can_permanently_delete_all_trashed_items
	Given '4' User is logged into MindManager web app via Api
	When '4' User upload capture item via Api
		| Type    | Source           | Text                    | Link                    | Note | Item                       |
		| link    | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |                            |
		| text    | MindManager Snap | automation_test_#2_SRND |                         |      |                            |
		| mappart | MindManager Snap | automation_test_#3_SRND |                         |      | Business profile info.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then '3' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle        |
		| automation_test_#3_SRND |
		| automation_test_#2_SRND |
		| automation_test_#1_SRND |
	When User clicks 'Empty Trash' button on Snap panel
	Then following capture items are deleted in Snap panel:
		| captureItemTitle        |
		| automation_test_#3_SRND |
		| automation_test_#2_SRND |
		| automation_test_#1_SRND |
	When User clicks 'Back' button on Snap panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup
Scenario: To_test_snap_side_panel_right_click
	Given '4' User is logged into MindManager web app via Api
	When '4' User upload capture item via Api
		| Type    | Source           | Text                    | Link                    | Note | Item                       |
		| link    | MindManager Snap | automation_test_#1_SRND | https://www.google.com/ |      |                            |
		| text    | MindManager Snap | automation_test_#2_SRND |                         |      |                            |
		| mappart | MindManager Snap | automation_test_#3_SRND |                         |      | Business profile info.mmap |
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
		| automation_test_#3_SRND |
		| automation_test_#2_SRND |
		| automation_test_#1_SRND |
	Then Snap context menu is not displayed
	When User Right clicks capture item with 'automation_test_#1_SRND' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle     |
		| Quick View    |
		| Share         |
		| Send to Trash |
	When User clicks 'Share' item in context menu