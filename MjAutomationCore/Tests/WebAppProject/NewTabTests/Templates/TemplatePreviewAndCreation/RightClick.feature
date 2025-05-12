@retry(2)
Feature: RightClick
Check functionality for template right click options

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1168] @Cleanup @Upd_Qase @JIRA[MMCV-9472]
Scenario: Verify_that_User_can_create_blank_map_via_context_menu
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Timeline' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then '8' topics are displayed on Canvas

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1168] @Cleanup @Upd_Qase @JIRA[MMCV-9472]
Scenario: Verify_that_User_can_create_blank_map_via_context_menu_for_Org_Chart
	When User clicks on 'General' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Organizational Chart' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'blank' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	Then 'Central Topic' topic is displayed on Canvas
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then '1' topics are displayed on Canvas

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1169] @Health_Check @Cleanup @Upd_Qase @Build_24.0.110
Scenario: Verify_that_User_can_create_prefilled_map_via_context_menu
	When User clicks on 'Organization' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Organizational Chart' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'prefilled' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then '39' topics are displayed on Canvas

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1170] @Health_Check @Cleanup @Upd_Qase @JIRA[MMCV-9472]
Scenario: Verify_that_User_can_open_preview_map_via_context_menu
	When User clicks on 'Organization' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Organizational Chart' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'preview' name in 'cloud-templates-context-menu' menu
	When User waits for data loading
	Then Web Editor page is displayed to the User
	Then 'cloud-template-preview' dialog is displayed to User
	When User clicks 'Start from Blank' button in 'cloud-template-preview' dialog
	Then 'cloud-template-preview' dialog is not displayed to User
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then '1' topics are displayed on Canvas

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1171] @Cleanup @Upd_Qase
Scenario: Verify_that_User_can_create_map_with_instructions_via_context_menu
	When User clicks on 'Flowcharts & Concept Mapping' template group card on cloud template page
	Then template content is displayed on cloud template page
	When User right clicks on 'Basic Flowchart' template card on cloud template page
	Then 'cloud-templates-context-menu' Menu is displayed to User
	When User clicks button with 'prefilled' name in 'cloud-templates-context-menu' menu
	Then Web Editor page is displayed to the User
	When User remembers mindmanager cloud template map details from '/' directory via API
	Then '25' topics are displayed on Canvas