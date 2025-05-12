@retry(2)
Feature: SaveNewMapToStorage

@MindManager @Cloud_Services @SharePoint @SaveNewMap @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1520] @Upd_Qase @JIRA[MMCV-9836]
Scenario: To_verify_that_new_map_can_be_saved_to_SharePoint
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User login to SharePoint cloud
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	When User clicks menu button with 'file' name in 'ToolbarPageElement' container
	When User mouse hovers menu button with 'save-to' name in 'file' menu
	When User clicks button with 'auto.test@mindmanagercloudqa.com (https://mindmanager.sharepoint.com/sites/milan)' name in 'save-to' menu
	When User clicks 'Documents' folder
	When User clicks 'For QA automation' folder
	When User clicks 'RuntimeDataFiles' folder
	When User clicks on Save In This Folder button on content manager cloud
	Then 'choose-name-dialog' dialog is displayed to User
	When User enters 'new_map_SRND' value in the 'text' field in 'choose-name-dialog' dialog
	When User clicks 'Save' button in 'choose-name-dialog' dialog
	Then Web Editor page is displayed to the User
	Then 'new_map_SRND.mmap' file name with path 'Shared Documents/For QA automation/RuntimeDataFiles' exist on Sharepoint cloud storage via Api