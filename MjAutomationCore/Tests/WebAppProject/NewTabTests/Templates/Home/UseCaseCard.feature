@retry(2)
Feature: UseCaseCard
Check functionality for use caes card

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1125,WEB-1126] @Upd_Qase
Scenario: Verify_that_hovering_over_use_case_card_triggers_hover_state_information_card
	When User hovers over 'Flowcharts & Concept Mapping' template group card on cloud template page
	Then learn more button is displayed in 'Flowcharts & Concept Mapping' template group card on cloud template page
	Then use case state information is displayed in 'Flowcharts & Concept Mapping' template group card on cloud template page
	When User hovers over learn more button in 'Flowcharts & Concept Mapping' template group card on cloud template page
	Then learn more button has 'rgba(98, 116, 181, 1)' rgba background color in 'Flowcharts & Concept Mapping' template group card on cloud template page
	When User hovers over 'Flowcharts & Concept Mapping' template group card on cloud template page
	Then learn more button has 'rgba(59, 81, 163, 1)' rgba background color in 'Flowcharts & Concept Mapping' template group card on cloud template page

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1127] @Upd_Qase
Scenario: Verify_that_clicking_on_use_case_card_takes_user_to_use_case_page
	When User clicks on 'General' template group card on cloud template page
	Then 'General' item is selected in the template side menu
	Then template content is displayed on cloud template page
	Then 'General' banner is displayed on template content page

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1128] @Upd_Qase
Scenario: Verify_that_clicking_on_learn_more_button_takes_user_to_use_case_page
	When User hovers over 'Organization' template group card on cloud template page
	Then learn more button is displayed in 'Organization' template group card on cloud template page
	When User clicks on learn more button in 'Organization' template group card on cloud template page
	Then 'Organization' item is selected in the template side menu
	Then template content is displayed on cloud template page
	Then 'Organization' banner is displayed on template content page

@MindManager @Templates @App_QA @App_Staging @App_Prod @Qase[WEB-1153] @Upd_Qase
Scenario: Verify_that_vertical_scrolling_page_working_correctly
	When User remembers location of 'Organization' template group card on cloud template page
	When User scrolls the template group card area down
	Then 'Organization' template group card has changed location by Y axis on cloud template page
	When User scrolls the template group card area up
	When User remembers location of 'Flowcharts & Concept Mapping' item in the template side menu
	When User scrolls the template group card area down
	Then 'Flowcharts & Concept Mapping' item has not changed location by Y axis in the template side menu