@retry(2)
Feature: Build Deployment
Check the version is displayed of the menu screen

@MindManager @Top_Menu @Menu @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1197] @Upd_Qase
Scenario: Check_that_the_build_number_is_displayed_in_the_Web_editor
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	Then custom content 'menu-version' contains 'Version' text in 'file' menu

@MindManager @Top_Menu @Menu @App_QA @App_Staging @App_Prod @Cleanup @Upd_Qase
Scenario: Сheck_build_version_with_hot_keys
	Given User is logged into MindManager web app via Api
	Then 'New' tab is active on file manager header page
	When User presses the CTRL_M combination key on the keyboard
	Then 'info' dialog is displayed to User
	Then text 'Version:' displayed in 'info' dialog
	When User clicks 'Cancel' button in 'info' dialog
	Then 'info' dialog is not displayed to User