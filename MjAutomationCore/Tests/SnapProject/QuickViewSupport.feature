@retry(2)
Feature: QuickViewSupport
Map part view in snap panel

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-58] @Upd_Qase @JIRA[MMCV-9093]
Scenario: To_verify_that_the_user_can_apply_Quick_View_support_for_Snap_Share_Map_Parts
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
	When User clicks 'ImageTopic2' topic on Canvas
	Then Topic Border is highlight blue color in 'ImageTopic2' topic on Canvas
	When User drags and drops 'ImageTopic2' topic in 'My Snap Queue' queue in Snap panel
	Then Upload success dialogue window is displayed in Snap panel
	When User clicks 'OK' on upload success dialogue window is displayed in Snap panel
	When User waits '1000' miliseconds
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| ImageTopic2      |
	When User Right clicks capture item with 'ImageTopic2' title of Snap panel
	Then Snap context menu is displayed
	Then following items are displayed in Snap Context Menu:
		| ItemTitle              |
		| Quick View             |
		| Send to selected topic |
		| Share                  |
		| Send to Trash          |
	When User clicks 'Quick View' item in context menu
	Then 'ImageTopic2' title with image is displayed in Quick View
	When User click back button on 'Quick View' Title on Snap Panel
	Then 'Snap' side panel with 'Snap' header is displayed to the User
	When User clicks 'Options' button on Snap panel
	Then 'Snap' side panel with 'Options' header is displayed to the User
	When User clicks 'Trash All' button on Snap panel
	Then '1' number of 'trash' items is displayed on 'Open Trash' button in capture queue buttons dropdown
	When User clicks 'Open Trash' button on Snap panel
	Then 'Snap' side panel with 'Trash' header is displayed to the User
	Then following capture items are displayed in Snap panel:
		| captureItemTitle |
		| ImageTopic2      |
	When User clicks 'Empty Trash' button on Snap panel
	Then following capture items are deleted in Snap panel:
		| captureItemTitle |
		| ImageTopic2      |
	When User clicks 'Back' button on Snap panel
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then 'Photos, notes, and more appear here when you using Snap. Send from mobile, browser or desktop companion app.' content text is displayed on Snap panel