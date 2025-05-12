@retry(2)
Feature: SidePanel
	Verification Snap in web app

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-35] @Upd_Qase
Scenario: To_verify_the_UI_of_the_Snap_Queue_button_no_snap
	Given '6' User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	Then 'Filter' button is displayed on Snap panel
	Then 'Open Search' button is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	Then 'Options' button is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel
	Then 'Get Snap for mobile and more' footer message is displayed on Snap panel
	Then 'Learn the basics of Snap' footer message is displayed on Snap panel

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-35] @Upd_Qase
Scenario: To_verify_the_UI_of_the_Snap_Queue_button_with_snap
	Given '7' User is logged into MindManager web app via Api
	When '7' User upload capture item via Api
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
	Then 'Filter' button is displayed on Snap panel
	Then 'Open Search' button is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	Then 'Options' button is displayed on Snap panel
	Then 'My Snap Queue' menu button is displayed in Snap Panel
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| Test3_SRND       |
		| Test2_SRND       |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-37] @Upd_Qase
Scenario: To_verify_the_Options_in_Snap_side_panel
	Given '8' User is logged into MindManager web app via Api
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
	Then 'Send to trash after dropping into a map' option item with toggle button 'ON' is displayed on Snap Panel
	Then 'Send Map Parts to trash after dropping into a map' option item with toggle button 'OFF' is displayed on Snap Panel
	Then 'Trash All' button is displayed on Snap panel