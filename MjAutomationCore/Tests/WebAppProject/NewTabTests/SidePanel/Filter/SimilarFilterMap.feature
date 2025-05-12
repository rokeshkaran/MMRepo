@retry(2)
Feature: SimilarFilterMap
Check the functionality of Filter saved

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath              |
		| auto_test_SRND.mmap | SimilarFilterMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-697] @JIRA[MMCV-8878] @Upd_Qase
Scenario: To_verify_the_exported_filters_UI
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	And 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	And radio button 'all' is checked on Filter popup
	And Saved Filter toggle is set to 'On' State
	When User click on radio button 'any' on Filter popup
	Then radio button 'any' is checked on Filter popup
	And Saved Filter toggle is set to 'Off' State
	And 'FTCO' topic is displayed on Canvas
	And 'Callout' topic is displayed on Canvas
	And 'MTCO' topic is displayed on Canvas
	And 'MTSTCO' topic is displayed on Canvas
	When User clicks switcher on the Saved Filter
	Then Saved Filter toggle is set to 'On' State
	And 'FTCO' topic is not displayed on Canvas
	And 'Callout' topic is not displayed on Canvas
	And 'MTCO' topic is not displayed on Canvas
	And 'MTSTCO' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-698] @Upd_Qase
Scenario: To_verify_preset_section
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	And 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	And radio button 'all' is checked on Filter popup
	And Saved Filter toggle is set to 'On' State
	And 'Apply Filter1' item is displayed in Preset section on Filter panel
	When User clicks 'Preset' section header of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Preset' section is displayed as collapsed of 'PanelWithMenuButton' side panel with 'Filter' header