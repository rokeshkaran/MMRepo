@retry(2)
Feature: Design
Check Design panel functionality

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then 'Text' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as expanded of 'PanelByName' side panel with 'Design' header

@MindManager @SidePanel @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-831] @Upd_Qase @JIRA[MMCV-7656,MMCV-10030]
Scenario: Check_Design_button_on_the_side_panel
	Then following items is displayed in 'Layout' section of 'PanelByName' side panel with 'Design' header:
		| Items     |
		| Radial    |
		| Right     |
		| Org-Chart |
		| Timeline  |
		| Tree      |
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then '26' Theme icons is displayed in 'Theme' section of 'PanelByName' side panel with 'Design' header
	Then '01-professional' Theme icon is displayed as selected in 'Theme' section of 'PanelByName' side panel with 'Design' header
	Then 'Background' section is displayed as expanded of 'PanelByName' side panel with 'Design' header

@MindManager @SidePanel @Design @App_QA @App_Staging @App_Prod @Cleanup @Qase[WEB-832] @Upd_Qase
Scenario: Check_that_it_is_possible_to_expand_or_collapse_sections
	When User clicks 'Text' section header of 'PanelByName' side panel with 'Design' header
	Then 'Text' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks 'Text' section header of 'PanelByName' side panel with 'Design' header
	Then 'Text' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Align' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks 'Align' section header of 'PanelByName' side panel with 'Design' header
	Then 'Align' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Align' section header of 'PanelByName' side panel with 'Design' header
	Then 'Align' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Layout' section header of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks 'Layout' section header of 'PanelByName' side panel with 'Design' header
	Then 'Layout' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Theme' section header of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks 'Theme' section header of 'PanelByName' side panel with 'Design' header
	Then 'Theme' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	Then 'Background' section is displayed as expanded of 'PanelByName' side panel with 'Design' header
	When User clicks 'Background' section header of 'PanelByName' side panel with 'Design' header
	Then 'Background' section is displayed as collapsed of 'PanelByName' side panel with 'Design' header
	When User clicks 'Background' section header of 'PanelByName' side panel with 'Design' header
	Then 'Background' section is displayed as expanded of 'PanelByName' side panel with 'Design' header