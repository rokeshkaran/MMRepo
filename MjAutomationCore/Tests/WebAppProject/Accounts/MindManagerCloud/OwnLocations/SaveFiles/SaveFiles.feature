@retry(2)
Feature: SaveFiles
Check that files can be saved on MM Cloud

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @MindManagerCloud @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-1900] @Health_Check @Upd_Qase @JIRA[MMCV-9472]
Scenario: Verify_that_unsaved_mapp_is_saved_to_MindManager_cloud
	When User hovers over 'General' template group card on cloud template page
	Then learn more button is displayed in 'General' template group card on cloud template page
	When User clicks on learn more button in 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	Then menu button with 'save' name is displayed in 'saved' state on Overlay panel
	When User remembers mindmanager cloud template map details from '/' directory via API
	When User clicks on the toolbar logo of Tools panel
	When User clicks 'My Files' tab on file manager header page
	Then content page is displayed to User
	When User clicks 'MindManager Files' content item
	When User waits '1000' miliseconds
	Then mindmanager cloud map is displayed on content page