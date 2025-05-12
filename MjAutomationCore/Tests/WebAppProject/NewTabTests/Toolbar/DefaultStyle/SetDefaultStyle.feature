@retry(2)
Feature: SetDefaultStyle
Check the User can Define/Set Defaults

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

@MindManager @Toolbar @SetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1361] @Upd_Qase
Scenario: Check_that_Set_default_style_button_is_not_active_when_no_element_is_selected
	Then 'Set Default Style' button is displayed as disabled on the Tools panel

@MindManager @Toolbar @SetDefaultStyle @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1362] @Upd_Qase
Scenario: Check_that_Set_default_style_button_is_active_after_any_element_is_selected
	When User clicks 'MT' topic on Canvas
	Then 'Set Default Style' button is displayed as enabled on the Tools panel