@retry(2)
Feature: Rebranding of MindManager
	Verify MindManager brand colors

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2066] @Upd_Qase
Scenario: To_Check_color_of_MM_wordmark_on_Publish_complete_screen
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Share' button on Tools panel
	Then following buttons are displayed in 'share-contextmenu' menu
		| items            |
		| Copy Link        |
		| Publish          |
		| About Publishing |
	When User clicks button with 'publish' name in 'share-contextmenu' menu
	Then header 'Publish Complete!' is displayed on page
	When User clicks 'Done' button
	When User clicks 'CT' topic on Canvas
	When User presses the Ctrl_Enter combination key on the keyboard
	When User clicks 'Share' button on Tools panel
	When User clicks button with 'publish-update' name in 'share-contextmenu' menu
	Then header 'Update Complete!' is displayed on page
	When User switches to iframe
	Then MindManager 'MindManager' brand image is displayed on page in 'black' color

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2067] @Upd_Qase
Scenario: To_Check_color_of_Snap_icon
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	Then 'Snap' Side panel Icon image is displayed in color
		| color   |
		| #4EB0B3 |

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2068] @Upd_Qase
Scenario: To_Check_color_of_Snap_header
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks 'Snap' button of side Toolbox
	Then Snap side panel 'mindmanager' header is displayed in 'black' color
	
@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2069] @Upd_Qase
Scenario: To_check_color_of_MM_wordmark_on_Get_Snap_for_mobile_and_more_button_on_snap_panel
	Given '6' User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
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
	Then 'There's nothing here yet' message title is displayed on Snap panel
	Then MindManager 'Download Snap' brand image is displayed on page in '#4EB0B3' color

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2086] @Upd_Qase
Scenario: To_Check_color_of_wordmark_on_Loading_map_screen
	Given User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then MindManager 'logo-img' wordmark logo is displayed on the loading map progress bar in folow colors
		| color   |
		| black   |
		| #84DDDA |

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2266] @Upd_Qase
Scenario: To_Check_color_of_wordmark_on_the_home_page_screen
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then Home page wordmark header is displayed in 'black' color

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2267] @Upd_Qase
Scenario: To_Check_color_of_wordmark_on_Published_Files_screen
	Given User is logged into MindManager web app via Api
	When User clicks 'Published Files' tab on file manager header page
	Then Home page wordmark header is displayed in 'black' color

@MindManager @RebrandingOfMindManager @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2269] @Upd_Qase
Scenario: To_check_color_of_MM_wordmark_on_Account_Details_page
	Given User is logged into MindManager web app via Api
	When User clicks arrow down on 'fileManagerHeader' user panel
	When User clicks 'Account Details' item in 'user-panel' dropdown menu
	Then header 'Account Details' is displayed on page
	When User switches to iframe
	Then MindManager 'MindManager' brand image is displayed on page in 'black' color