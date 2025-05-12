@retry(2)
Feature: TestCasesWithoutSuite
Test case without suite

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |

@Snap @App_QA @App_Staging @App_Prod @Cleanup @Snap_Cleanup @Qase[MSNAP-166] @Upd_Qase
Scenario: To_verify_the_view_more_buttons_available_in_Snap_side_panel
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
	When User moves Side panel resizable handle by '20' '0' coordinates
	Then 'Show Buttons' button is displayed on Snap panel
	When User clicks 'Show Buttons' button on Snap panel
	Then 'Open Search' button is displayed on Snap panel
	Then 'Refresh' button is displayed on Snap panel
	Then 'Options' button is displayed on Snap panel