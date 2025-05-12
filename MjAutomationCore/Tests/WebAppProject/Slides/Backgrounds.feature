@retry(2)
Feature: Backgrounds
	Check the functionality of Backgrounds

@MindManager @Slides @Backgrounds @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1017] @Upd_Qase
Scenario: Check_that_smart_shapes_are_rendered_correctly_new
	Given User uploads following files to 'Shared Documents/For QA automation' folder of SharePoint cloud via Api
		| fileName             | FilePath          |
		| auto_test_SRND.mdeck | SmartShapes.mdeck |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'auto_test_SRND.mdeck' file
	Then Web Editor page is displayed to the User
	Then map is displayed in 'Slide' view mode
	Then Menu toolbar is displayed to the Slide mode
	Then 'StaticSwimLanes' Static Smart shape is displayed on Canvas
	When User clicks 'next' button on the Slide toolbar
	Then 'StaticFunnel' Static Smart shape is displayed on Canvas
	When User clicks 'next' button on the Slide toolbar
	Then 'StaticTable' Static Smart shape is displayed on Canvas