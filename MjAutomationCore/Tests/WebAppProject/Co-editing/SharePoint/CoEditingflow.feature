@retry(2)
Feature: CoEditingflow
Check co editing session for Sharepoint

@MindManager @WebEditor @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-202] @Upd_Qase
Scenario: Check_user_can_open_map_from_sharepoint_cloud
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

@MindManager @WebEditor @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-203] @Upd_Qase
Scenario: Check_user_can_open_recent_map_from_sharepoint_cloud
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
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'My Files' tab on file manager header page
	Then 'auto_test_SRND.mmap' item is displayed on content manager page
	When User clicks 'auto_test_SRND.mmap' file
	Then Web Editor page is displayed to the User