@retry(2)
Feature: Layout
Check Layout functionality of Design panel

Background: Pre-condition
	Given User uploads following files to 'For QA Automation/RuntimeData File' folder of Mind Manager cloud via Api
		| ItemName            | ItemPath         |
		| auto_test_SRND.mmap | CommonATMap.mmap |
	Given User is logged into MindManager web app via Api
	When User clicks 'My Files' tab on file manager header page
	When User opens 'auto_test_SRND.mmap' Mind Manager File in browser
	Then Web Editor page is displayed to the User

@MindManager @Side_Panel @Design @Layout @App_QA @App_Staging @App_Prod @Cleanup @Qase[ @WEB-841] @JIRA[MMCV-10030] @Upd_Qase
Scenario: Check_that_it_is_possible_to_change_layout_after_the_map_creation
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then following items is displayed in 'Layout' section of 'PanelByName' side panel with 'Design' header:
		| Items     |
		| Radial    |
		| Right     |
		| Org-Chart |
		| Timeline  |
		| Tree      |
	When User remembers location of 'MT1' topic on Canvas
	Then 'Radial' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'Right' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'MT1' topic has changed location by Y axis on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User clicks 'Org-Chart' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'MT1' topic has changed location by X axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User clicks 'Timeline' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'MT1' topic has changed location by X axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas
	When User remembers location of 'MT1' topic on Canvas
	When User clicks 'Tree' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'MT1' topic has changed location by X axis on Canvas
	Then 'MT1' topic has changed location by Y axis on Canvas

@MindManager @Side_Panel @Design @Layout @App_QA @App_Staging @App_Prod @Cleanup @Qase[ @WEB-842] @Upd_Qase
Scenario: Check_that_floating_topic_has_additional_layout_option
	When User clicks 'FT2' topic on Canvas
	When User clicks 'Design' button of side Toolbox
	Then 'PanelByName' side panel with 'Design' header is displayed to the User
	Then following items is displayed in 'Layout' section of 'PanelByName' side panel with 'Design' header:
		| Items     |
		| Radial    |
		| Right     |
		| Org-Chart |
		| Timeline  |
		| Tree      |
		| Flowchart |
	When User clicks 'Flowchart' item in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks on the Body on Canvas
	When User clicks 'FT2' topic on Canvas
	Then 'Flowchart' item is displayed as selected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	When User clicks 'FT3' topic on Canvas
	Then 'Radial' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Right' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Org-Chart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Timeline' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Tree' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header
	Then 'Flowchart' item is displayed as unselected in 'Layout' section of 'PanelByName' side panel with 'Design' header