@retry(2)
Feature: SupportMultipleCloudStorageAccountsForSameProvider

@MindManager @Cloud_Services @Box @SupportMultipleCloudStorageAccountsForSameProvider @App_QA @App_Staging @App_Prod @Qase[WEB-95] @Upd_Qase
Scenario: Check_that_it_possible_to_add_multiple_Box_cloud_service_account
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to Box cloud
	Then 'Box' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	Then content page is displayed to User
	When User clicks 'Add Place' content item
	When User clicks 'Box' content item
	When User login to Box cloud with User '2'
	Then content page is displayed to User
	Then 'Box' cloud with 'auto.test.mm2@gmail.com' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	Then content page is displayed to User
	Then 'Box' item with 'auto.test.mm2@gmail.com' description is displayed on content manager page
	Then 'Box' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page
	When User clicks 'Add Place' content item
	When User clicks 'Box' content item
	When User login to Box cloud with User '2'
	Then content page is displayed to User
	Then 'Box' cloud with 'auto.test.mm2@gmail.com' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	Then content page is displayed to User
	Then 'Box' item with 'auto.test.mm2@gmail.com' description is displayed '1' times on content manager page
	#Verify Log out
	When User clicks 'Box' content item with 'auto.test.mm2@gmail.com' description
	Then content page is displayed to User
	When User waits '1000' miliseconds
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of Box' item with 'auto.test.mm2@gmail.com' description is exist on page
	When User clicks 'Sign Out of Box' content item with 'auto.test.mm2@gmail.com' description
	When User waits '5000' miliseconds
	Then 'My Files' tab is active on file manager header page
	Then 'Box' item with 'auto.test.mm2@gmail.com' description is not dislayed on content manager page
	Then 'Box' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page