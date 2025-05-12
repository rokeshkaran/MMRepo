@retry(2)
Feature: LoginLogout

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User

@MindManager @Cloud_Services @SharePoint @LoginLogout @App_QA @App_Staging @App_Prod @Qase[WEB-54,WEB-84] @Upd_Qase
Scenario: Check_that_it_possible_to_add_sharepoint_cloud_service_account
	When User clicks 'Add Place' content item
	When User clicks 'SharePoint' content item
	Then 'sharepoint-url' dialog is displayed to User
	Then text 'Enter a new SharePoint site address:' displayed in 'sharepoint-url' dialog
	When User enter 'https://mindmanager.sharepoint.com/sites/milan' value in the 'text' field of 'sharepoint-url' dialog
	When User clicks 'OK' button in 'sharepoint-url' dialog
	When User login to SharePoint
	Then content page is displayed to User
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	Then 'Documents' folder with 'drive' description is exist on page
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of SharePoint' item with 'auto.test@mindmanagercloudqa.com' description is exist on page
	When User clicks 'Sign Out of SharePoint' content item with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description
	When User waits '5000' miliseconds
	Then 'My Files' tab is active on file manager header page
	Then 'SharePoint' item with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description is not dislayed on content manager page