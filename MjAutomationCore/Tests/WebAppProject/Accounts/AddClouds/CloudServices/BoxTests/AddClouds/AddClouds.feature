@retry(2)
Feature: AddClouds
Check functionality of adding cloud services

@MindManager @Box @AddClouds @App_QA @App_Staging @App_Prod @Qase[WEB-49] @Upd_Qase
Scenario: Verify_User_can_add_new_cloud
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	Then on the page exist 'Add Place' content item with 'Tap to Select Storage Provider' description
	When User login to Box cloud
	Then 'For QA automation' folder with 'Folder' description is exist on page
	When User clicks Back button on content navigation panel
	Then on the page exist 'Box' content item with 'auto.test@mindmanagercloudqa.com' description