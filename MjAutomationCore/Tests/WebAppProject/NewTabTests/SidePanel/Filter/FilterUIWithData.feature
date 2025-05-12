@retry(2)
Feature: FilterUIWithData
Check filter panel functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	And User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	And User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-694] @Upd_Qase
Scenario: Check_the_tool_tips
	When User clicks 'Filter' button of side Toolbox
	Then 'PanelWithMenuButton' side panel with 'Filter' header is displayed to the User
	When User mouse over on 'Show' button of Filter panel
	Then 'ShowWhen "Show" is active, checked content or presets content below are shown and unchecked content or preset is faded.' tooltip is displayed to the User
	When User mouse over on 'Fade' button of Filter panel
	Then 'FadeWhen "Fade" is active, checked content or presets content below are faded and unchecked content or preset is shown.' tooltip is displayed to the User
	When User mouse over on 'Hide' button of Filter panel
	Then 'HideWhen "Hide" is active, checked content or presets content below are hidden and unchecked content or preset is shown.' tooltip is displayed to the User

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-695] @Upd_Qase
Scenario: Check_show_and_hide_header_section
	When User clicks 'MT2' topic on Canvas
	Then 'MT2' is outlined with a blue circuit
	When User clicks 'Filter' button of side Toolbox
	Then 'General' section is displayed as expanded of 'PanelWithMenuButton' side panel with 'Filter' header
	When User clicks 'General' section header of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'General' section is displayed as collapsed of 'PanelWithMenuButton' side panel with 'Filter' header
	When User clicks 'General' section header of 'PanelWithMenuButton' side panel with 'Filter' header
	Then 'General' section is displayed as expanded of 'PanelWithMenuButton' side panel with 'Filter' header

@MindManager @Side_Panel @Filter_Panel @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-696] @Upd_Qase
Scenario: Check_the_filter_UI_with_properties
	When User clicks 'MT2' topic on Canvas
	And User clicks 'Filter' button of side Toolbox
	Then radio button 'all' is checked on Filter popup
	And following properties are displayed in 'Priority' group in 'General' section on Filter panel
		| items      |
		| Priority 2 |
		| Priority 3 |
		| Priority 4 |
		| Priority 5 |
	And following properties are displayed in 'Progress' group in 'General' section on Filter panel
		| items             |
		| Complete (%): 0%  |
		| Complete (%): 25% |
		| Complete (%): 50% |
		| Complete (%): 75% |
	And following properties are displayed in 'Arrows' group in 'General' section on Filter panel
		| items |
		| Down  |
		| Up    |
	And following properties are displayed in 'Smileys' group in 'General' section on Filter panel
		| items |
		| Happy |
		| Sad   |