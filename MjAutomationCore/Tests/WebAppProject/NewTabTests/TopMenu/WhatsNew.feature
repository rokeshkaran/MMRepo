@retry(2)
Feature: WhatsNew
Check What's New functionality in Toolbar Menu

Background: Pre-condition
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath       |
		| auto_test_SRND.mmap | SimpleMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User

@MindManager @Top_Menu @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase @Qase[WEB-1294]
Scenario: Check_Whats_New_button_on_Menu_toolbar
	When User clicks menu button with 'help' name in 'ToolbarPageElement' container
	Then 'help' Menu is displayed to User
	When User clicks button with 'whats-new' name in 'help' menu
	When User switches to '1' tab
	Then Menu toolbar is displayed to Standard mode in 'bottom' side on page