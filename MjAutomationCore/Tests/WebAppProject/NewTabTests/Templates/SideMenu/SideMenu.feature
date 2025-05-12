@retry(2)
Feature: SideMenu
Check functionality for templates side menu

	Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1154] @Upd_Qase
Scenario: Verify_that_all_templates_are_shown_after_clicking_search_use_case
	When User clicks on 'search' button in the template side menu on cloud template page
	Then search bar is displayed on the cloud template page
	Then all templates are displayed on the cloud template page