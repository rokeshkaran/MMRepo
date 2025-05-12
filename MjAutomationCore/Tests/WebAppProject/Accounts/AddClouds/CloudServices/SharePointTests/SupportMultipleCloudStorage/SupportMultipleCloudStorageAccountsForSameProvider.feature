@retry(2)
Feature: SupportMultipleCloudStorageAccountsForSameProvider

@MindManager @Cloud_Services @SharePoint @SupportMultipleCloudStorageAccountsForSameProvider @App_QA @App_Staging @App_Prod @Qase[WEB-93] @JIRA[MMCV-9843] @Upd_Qase @Not_Run
Scenario: Check_that_it_possible_to_add_multiple_sharepoint_cloud_service_account
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User login to SharePoint cloud
	Then 'SharePoint' cloud with 'auto.test@mindmanagercloudqa.com' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	When User clicks 'Add Place' content item
	When User clicks 'SharePoint' content item
	Then 'sharepoint-url' dialog is displayed to User
	Then text 'Enter a new SharePoint site address:' displayed in 'sharepoint-url' dialog
	When User enter 'https://mindmanager.sharepoint.com/sites/milan' value in the 'text' field of 'sharepoint-url' dialog
	When User clicks 'OK' button in 'sharepoint-url' dialog
	When User '2' login to SharePoint
	Then content page is displayed to User
	Then 'SharePoint' cloud with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	Then 'SharePoint' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page
	Then 'SharePoint' item with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description is displayed on content manager page
	#Verify Account Occurance
	When User clicks 'Add Place' content item
	When User clicks 'SharePoint' content item
	Then 'sharepoint-url' dialog is displayed to User
	Then text 'Enter a new SharePoint site address:' displayed in 'sharepoint-url' dialog
	When User enter 'https://mindmanager.sharepoint.com/sites/milan' value in the 'text' field of 'sharepoint-url' dialog
	When User clicks 'OK' button in 'sharepoint-url' dialog
	When User login to SharePoint with SignedIn account
	Then content page is displayed to User
	Then 'SharePoint' cloud with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' user is displayed on navigation panel
	When User clicks Back button on content navigation panel
	Then 'SharePoint' item with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description is displayed '1' times on content manager page
	#Verify Log out
	When User clicks 'SharePoint' content item with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description
	Then content page is displayed to User
	Then 'SharePoint' cloud with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' user is displayed on navigation panel
	When User clicks settings icon on content navigation panel
	Then 'File Options' title is displayed on navigation panel
	Then 'Sign Out of SharePoint' item with 'auto.test.2@mindmanagercloudqa.com' description is exist on page
	When User clicks 'Sign Out of SharePoint' content item with 'auto.test.2@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' description
	Then 'My Files' tab is active on file manager header page
	Then 'SharePoint' item with 'auto.test.2@mindmanagercloudqa.com' description is not dislayed on content manager page
	Then 'SharePoint' item with 'auto.test@mindmanagercloudqa.com' description is displayed on content manager page
