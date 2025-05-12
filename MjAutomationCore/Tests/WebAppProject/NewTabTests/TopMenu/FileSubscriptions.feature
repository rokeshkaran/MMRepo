@retry(2)
Feature: FileSubscriptions
	Check essentials subscription from file menu

@MindManager @Top_Menu @File @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1209] @Upd_Qase
Scenario: Verify_user_with_essentials_subscription_can_navigate_to_MM_store_from_file_menu
	Given '21' User is logged into MindManager web app via Api
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName            | FilePath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User clicks button with 'Upgrade to Pro' name in 'file' menu
	When User switches to '1' tab
	Then page url is 'https://www.mindmanager.com/en/product/mindmanager/?x-source=essugb-wb&audience=wb&prod=wb&x-user_id'