@retry(2)
Feature: RecentFilesSection

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation/RuntimeDataFiles' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Cloud_Services @SharePoint @RecentFiles @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-2504] @Upd_Qase
Scenario: Check_that_Recent_Files_Section_is_not_displayed_when_Save_To_is_clicked
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	When User clicks button with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' name in 'save-to' menu
	When User clicks Back button on content navigation panel
	Then Recent Files Banner is NOT displayed on Content Manager Page