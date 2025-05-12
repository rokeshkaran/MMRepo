@retry(2)
Feature: UseCases
Check functionality for templates groups in side menu

Background: Pre-condition
	Given User is logged into MindManager web app via Api
	When User clicks 'New' tab on file manager header page
	Then cloud templates page is displayed to User

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1164] @Upd_Qase
Scenario: Verify_that_use_case_is_outlined_on_hovering
	When User hovers on 'Organization' item in the template side menu
	Then 'Organization' item has border highlighted in '(62, 83, 159)' rgb color in the template side menu

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-1165] @Upd_Qase
Scenario: Verify_that_use_case_is_selected_on_clicking
	When User click on 'Flowcharts & Concept Mapping' item in the template side menu
	Then 'Flowcharts & Concept Mapping' item is selected in the template side menu
	Then 'Flowcharts & Concept Mapping' item has background highlighted in '(62, 83, 159, 1)' rgba color in the template side menu
	Then template content is displayed on cloud template page

@MindManager @Templates @Search @App_QA @App_Staging @App_Prod @Qase[WEB-2288] @Upd_Qase
Scenario: Verify_Whiteboarding_Use_Case_Description_Appears_On_Hovering_Over_The_Category
	When User hovers over 'Whiteboarding' template group card on cloud template page
	Then 'Use sticky notes to capture and organize ideas by yourself or with a team.' description is displayed in 'Whiteboarding' template card in home section
	Then learn more button is displayed in 'Whiteboarding' template group card on cloud template page