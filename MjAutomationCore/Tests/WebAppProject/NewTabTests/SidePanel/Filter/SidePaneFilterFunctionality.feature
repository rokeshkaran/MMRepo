@retry(2)
Feature: SidePaneFilterFunctionality
Check side pane filter functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-714] @Upd_Qase
Scenario: Check_context_filter_menu_UI
	When User clicks 'Filter' button of side Toolbox
	When User clicks Menu button of Filter panel
	Then following items is displayed in 'power-filter' dropdown menu
		| items     |
		| Check All |
		| Clear All |
		| Reset     |
	When User clicks 'Check All' item in 'power-filter' dropdown menu
	Then all checkboxes are checked on Filter panel
	When User clicks Menu button of Filter panel
	When User clicks 'Clear All' item in 'power-filter' dropdown menu
	Then all checkboxes are unchecked on Filter panel

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-715] @Upd_Qase
Scenario: Check_that_User_can_reset_all_the_filters_applied_to_map_from_the_side_panel_by_clicking_Reset_button
	When User clicks 'Filter' button of side Toolbox
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Fade' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	Then 'MT2' is displayed with at 50 percent opacity on Canvas
	When User clicks Menu button of Filter panel
	Then following items is displayed in 'power-filter' dropdown menu
		| items     |
		| Check All |
		| Clear All |
		| Reset     |
	When User clicks 'Reset' item in 'power-filter' dropdown menu
	Then '0' checkboxes are checked on the Filter Pop-up

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-716] @Upd_Qase
Scenario: Check_that_User_can_reset_all_the_filters_applied_to_map_from_context_menu_by_clicking_Reset_button
	When User clicks 'Filter' button of side Toolbox
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'Show' behavior button is displayed as selected of 'PanelWithMenuButton' side panel with 'Filter' header
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	Then 'Priority 2' checkbox is checked to 'Priority' group in 'General' section on Filter panel
	Then 'MT2' topic is displayed with '1' opacity on Canvas
	When User clicks Menu button of Filter panel
	Then following items is displayed in 'power-filter' dropdown menu
		| items     |
		| Check All |
		| Clear All |
		| Reset     |
	When User clicks 'Reset' item in 'power-filter' dropdown menu
	Then '0' checkboxes are checked on the Filter Pop-up

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-717] @Upd_Qase
Scenario: Verify_that_fade_option_works_with_the_combination_of_filters
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Filter' button of side Toolbox
	Then radio button 'all' is checked on Filter popup
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Complete (%): 50%' checkbox to 'Progress' group in 'General' section on Filter panel
	When User checks 'Up' checkbox to 'Arrows' group in 'General' section on Filter panel
	When User checks 'Happy' checkbox to 'Smileys' group in 'General' section on Filter panel
	When User clicks 'Fade' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'MT2' is displayed with at 50 percent opacity on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-718] @Upd_Qase
Scenario: Verify_that_show_option_works_with_the_combination_of_filters
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Filter' button of side Toolbox
	Then radio button 'all' is checked on Filter popup
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Complete (%): 50%' checkbox to 'Progress' group in 'General' section on Filter panel
	When User checks 'Up' checkbox to 'Arrows' group in 'General' section on Filter panel
	When User checks 'Happy' checkbox to 'Smileys' group in 'General' section on Filter panel
	When User clicks 'Show' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'MT2' topic is displayed with '1' opacity on Canvas
	Then 'MT3' topic is not displayed on Canvas

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-719] @Upd_Qase
Scenario: Verify_that_hide_option_works_with_the_combination_of_filters
	When User clicks 'MT2' topic on Canvas
	When User clicks 'Filter' button of side Toolbox
	Then radio button 'all' is checked on Filter popup
	When User checks 'Priority 2' checkbox to 'Priority' group in 'General' section on Filter panel
	When User checks 'Complete (%): 50%' checkbox to 'Progress' group in 'General' section on Filter panel
	When User checks 'Up' checkbox to 'Arrows' group in 'General' section on Filter panel
	When User checks 'Happy' checkbox to 'Smileys' group in 'General' section on Filter panel
	When User clicks 'Hide' behavior button of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'MT3' topic is displayed with '1' opacity on Canvas
	Then 'MT2' topic is not displayed on Canvas