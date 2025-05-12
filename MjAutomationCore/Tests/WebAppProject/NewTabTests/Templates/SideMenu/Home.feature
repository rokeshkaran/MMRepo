@retry(2)
Feature: Home
Check functionality for templates Home Button

	Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1155] @Upd_Qase
Scenario: Verify_that_home_button_is_working_correctly_on_home_page
	When User scrolls the template group card area down
	When User remembers location of 'Organization' template group card on cloud template page
	When User hovers over on 'home' button in the template side menu on cloud template page
	Then 'Organization' template group card has not changed location by Y axis on cloud template page
	When User clicks on 'home' button in the template side menu on cloud template page
	Then 'Organization' template group card has changed location by Y axis on cloud template page
	
@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1156,WEB-1157] @Upd_Qase
Scenario: Verify_that_home_button_is_working_correctly_when_not_on_home_page
	When User clicks on 'search' button in the template side menu on cloud template page
	Then all templates are displayed on the cloud template page
	When User hovers over on 'home' button in the template side menu on cloud template page
	Then 'home' button has border highlighted in 'rgb(62, 83, 159)' rgb in the template side menu on cloud template page
	When User clicks on 'home' button in the template side menu on cloud template page
	Then all templates group cards are displayed on the cloud template page