@retry(2)
Feature: AccountUI
Verification that Web App Users have additional capabilities

Background: Pre-condition
	Given User is logged into MindManager web app via Api

@MindManager @Accounts @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-45] @Upd_Qase
Scenario: Check_the_UI_of_the_web_application
	Then 'New' tab is displayed on file manager header page
	Then 'My Files' tab is displayed on file manager header page
	Then 'Published Files' tab is displayed on file manager header page
	Then 'New' tab is active on file manager header page

@MindManager @Accounts @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-46] @Health_Check @Upd_Qase
Scenario: Check_the_My_Files_tab_UI
	When User clicks 'My Files' tab on file manager header page
	When User waits '1500' miliseconds
	Then 'My Files' tab is active on file manager header page
	Then content page is displayed to User
	Then on the page exist 'Add Place' content item with 'Tap to Select Storage Provider' description
	When User select 'Add Place' content item with 'Tap to Select Storage Provider' description
	Then following cloud items are displayed to the User:
		| items      |
		| Box        |
		| Dropbox    |
		| Google     |
		| OneDrive   |
		| SharePoint |
	Then 'Back' button is displayed on content manager page

@MindManager @Accounts @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-47] @Upd_Qase
Scenario: Check_the_New_tab_UI
	Then 'New' tab is active on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Accounts @AccountUI @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1297] @Upd_Qase
Scenario: Check_the_Published_files_screen_in_users_account
	Then 'New' tab is displayed on file manager header page
	Then 'My Files' tab is displayed on file manager header page
	Then 'Published Files' tab is displayed on file manager header page
	When User clicks 'Published Files' tab on file manager header page
	Then 'Published Files' tab is active on file manager header page
	Then file manager header page is displayed to User